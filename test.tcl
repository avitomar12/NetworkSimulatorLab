# A 3-node example for ad-hoc simulation with AODV 

# Define options_
set val(chan)           Channel/WirelessChannel    ;# channel type
set val(prop)           Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)          Phy/WirelessPhy            ;# network interface type
set val(mac)            Mac/802_11                 ;# MAC type
set val(ifq)            Queue/DropTail    ;# interface queue type
set val(ll)             LL                         ;# link layer type
set val(ant)            Antenna/OmniAntenna        ;# antenna model
set val(ifqlen)         50                         ;# max packet in ifq
set val(nn)             10                          ;# number of mobilenodes
set val(rp)             M_AODV                      ;# routing protocol
set val(x)              500   			   ;# X dimension of topography
set val(y)              500   			   ;# Y dimension of topography  
set val(stop)		    100			   ;# time of simulation end

set ns_		      [new Simulator]
set tracefd       [open simple-dsdv.tr w]
set windowVsTime2 [open win.tr w] 
set namtrace      [open simwrls1.nam w]    

$ns_ trace-all $tracefd
$ns_ use-newtrace 
$ns_ namtrace-all-wireless $namtrace $val(x) $val(y)

# set up topography object
set topo       [new Topography]

$topo load_flatgrid $val(x) $val(y)

create-god $val(nn)

#
#  Create nn mobilenodes [$val(nn)] and attach them to the channel. 
#

# configure the nodes
        $ns_ node-config -adhocRouting $val(rp) \
			 -llType $val(ll) \
			 -macType $val(mac) \
			 -ifqType $val(ifq) \
			 -ifqLen $val(ifqlen) \
			 -antType $val(ant) \
			 -propType $val(prop) \
			 -phyType $val(netif) \
			 -channelType $val(chan) \
			 -topoInstance $topo \
			 -agentTrace ON \
			 -routerTrace ON \
			 -macTrace OFF \
			 -movementTrace ON \
			 
	for {set i 0} {$i < $val(nn) } { incr i } {
		set node_($i) [$ns_ node]	
	}

# Provide initial location of mobilenodes
$node_(0) set X_ 5.0
$node_(0) set Y_ 5.0
$node_(0) set Z_ 0.0
$node_(1) set X_ 490.0
$node_(1) set Y_ 285.0
$node_(1) set Z_ 0.0
$node_(2) set X_ 150.0
$node_(2) set Y_ 240.0
$node_(2) set Z_ 0.0
$node_(3) set X_ 150.0
$node_(3) set Y_ 240.0
$node_(3) set Z_ 0.0
$node_(4) set X_ 150.0
$node_(4) set Y_ 240.0
$node_(4) set Z_ 0.0
$node_(5) set X_ 150.0
$node_(5) set Y_ 240.0
$node_(5) set Z_ 0.0
$node_(6) set X_ 150.0
$node_(6) set Y_ 240.0
$node_(6) set Z_ 0.0
$node_(7) set X_ 150.0
$node_(7) set Y_ 240.0
$node_(7) set Z_ 0.0
$node_(8) set X_ 150.0
$node_(8) set Y_ 240.0
$node_(8) set Z_ 0.0
$node_(9) set X_ 150.0
$node_(9) set Y_ 240.0
$node_(9) set Z_ 0.0
# Generation of movements
#$ns at 1.0 "$node_(0) setdest 250.0 250.0 3.0"
#$ns at 2.0 "$node_(1) setdest 45.0 285.0 5.0"
#$ns at 1.5 "$node_(0) setdest 480.0 300.0 5.0" 
source "./setdest.tcl"

# Set a TCP connection between node_(0) and node_(1)
set tcp [new Agent/TCP/Newreno]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns_ attach-agent $node_(0) $tcp
$ns_ attach-agent $node_(1) $sink
$ns_ connect $tcp $sink
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ns_ at 1.0 "$ftp start" 

 

# Define node initial position in nam
for {set i 0} {$i < $val(nn)} { incr i } {
# 30 defines the node size for nam
$ns_ initial_node_pos $node_($i) 30
}

# Telling nodes when the simulation ends
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns_ at $val(stop) "$node_($i) reset";
}

# ending nam and the simulation 
$ns_ at $val(stop) "$ns_ nam-end-wireless $val(stop)"
$ns_ at $val(stop) "stop"
$ns_ at 100.01 "puts \"end simulation\" ; $ns_ halt"
proc stop {} {
    global ns_ tracefd namtrace
    $ns_ flush-trace
    close $tracefd
    close $namtrace
    exec nam simwrls1.nam &
}

$ns_ run

