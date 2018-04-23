#------------------------------------------------------- 
# This ns script has been created by the nam editor.
# If you edit it manually, the nam editor might not
# be able to open it properly in the future.
#
# EDITING BY HAND IS AT YOUR OWN RISK!
#------------------------------------------------------- 
# Create a new simulator object.
set ns [new Simulator]
# Create a nam trace datafile.
set namfile [open /home/avi/Downloads/sim.nam w]
$ns namtrace-all $namfile

# Create wired nodes.
set node(7) [$ns node]
## node(7) at 617.843750,510.249969
$node(7) set X_ 617.843750
$node(7) set Y_ 510.249969
$node(7) set Z_ 0.0
$node(7) color "black"

set node(6) [$ns node]
## node(6) at 541.531250,507.843719
$node(6) set X_ 541.531250
$node(6) set Y_ 507.843719
$node(6) set Z_ 0.0
$node(6) color "black"

set node(5) [$ns node]
## node(5) at 601.000000,620.250000
$node(5) set X_ 601.000000
$node(5) set Y_ 620.250000
$node(5) set Z_ 0.0
$node(5) color "black"

set node(4) [$ns node]
## node(4) at 538.437500,617.500000
$node(4) set X_ 538.437500
$node(4) set Y_ 617.500000
$node(4) set Z_ 0.0
$node(4) color "black"

set node(3) [$ns node]
## node(3) at 606.843750,566.968750
$node(3) set X_ 606.843750
$node(3) set Y_ 566.968750
$node(3) set Z_ 0.0
$node(3) color "black"

set node(2) [$ns node]
## node(2) at 537.750000,564.218750
$node(2) set X_ 537.750000
$node(2) set Y_ 564.218750
$node(2) set Z_ 0.0
$node(2) color "black"

set node(1) [$ns node]
## node(1) at 466.593719,560.781250
$node(1) set X_ 466.593719
$node(1) set Y_ 560.781250
$node(1) set Z_ 0.0
$node(1) color "black"


# ----- Setup wireless environment. ----
set wireless_tracefile [open /home/avi/Downloads/sim.trace w]
set topography [new Topography]
$ns trace-all $wireless_tracefile
$ns namtrace-all-wireless $namfile 674.968750 640.250000
$topography load_flatgrid 674.968750 640.250000
#
# Create God
#
set god_ [create-god 2]
#global node setting
$ns node-config -adhocRouting DSR \
                 -llType LL \
                 -macType Mac/802_11 \
                 -ifqType Queue/DropTail/PriQueue \
                 -ifqLen 50 \
                 -antType Antenna/OmniAntenna \
                 -propType Propagation/TwoRayGround \
                 -phyType Phy/WirelessPhy \
                 -channel [new Channel/WirelessChannel] \
                 -topoInstance $topography \
                 -agentTrace ON \
                 -routerTrace OFF \
                 -macTrace ON

# Create wireless nodes.
set node(9) [$ns node]
## node(9) at 654.968750,574.875000
$node(9) set X_ 654.968750
$node(9) set Y_ 574.875000
$node(9) set Z_ 0.0
$node(9) color "black"
$ns initial_node_pos $node(9) 10.000000
set node(8) [$ns node]
## node(8) at 468.312469,597.562500
$node(8) set X_ 468.312469
$node(8) set Y_ 597.562500
$node(8) set Z_ 0.0
$node(8) color "black"
$ns initial_node_pos $node(8) 10.000000

# Create links between nodes.
$ns simplex-link $node(7) $node(3) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(7) $node(3) queuePos 0.5
$ns simplex-link-op $node(7) $node(3) color black
$ns simplex-link-op $node(7) $node(3) orient 101.0deg
# Set Queue Properties for link 7->3
[[$ns link $node(7) $node(3)] queue] set limit_ 20

$ns simplex-link $node(6) $node(2) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(6) $node(2) queuePos 0.5
$ns simplex-link-op $node(6) $node(2) color black
$ns simplex-link-op $node(6) $node(2) orient 93.8deg
# Set Queue Properties for link 6->2
[[$ns link $node(6) $node(2)] queue] set limit_ 20

$ns simplex-link $node(5) $node(3) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(5) $node(3) queuePos 0.5
$ns simplex-link-op $node(5) $node(3) color black
$ns simplex-link-op $node(5) $node(3) orient 276.3deg
# Set Queue Properties for link 5->3
[[$ns link $node(5) $node(3)] queue] set limit_ 20

$ns simplex-link $node(4) $node(2) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(4) $node(2) queuePos 0.5
$ns simplex-link-op $node(4) $node(2) color black
$ns simplex-link-op $node(4) $node(2) orient 269.3deg
# Set Queue Properties for link 4->2
[[$ns link $node(4) $node(2)] queue] set limit_ 20

$ns simplex-link $node(3) $node(7) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(3) $node(7) queuePos 0.5
$ns simplex-link-op $node(3) $node(7) color black
$ns simplex-link-op $node(3) $node(7) orient 281.0deg
# Set Queue Properties for link 3->7
[[$ns link $node(3) $node(7)] queue] set limit_ 20

$ns simplex-link $node(3) $node(5) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(3) $node(5) queuePos 0.5
$ns simplex-link-op $node(3) $node(5) color black
$ns simplex-link-op $node(3) $node(5) orient 96.3deg
# Set Queue Properties for link 3->5
[[$ns link $node(3) $node(5)] queue] set limit_ 20

$ns simplex-link $node(3) $node(2) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(3) $node(2) queuePos 0.5
$ns simplex-link-op $node(3) $node(2) color black
$ns simplex-link-op $node(3) $node(2) orient 182.3deg
# Set Queue Properties for link 3->2
[[$ns link $node(3) $node(2)] queue] set limit_ 20

$ns simplex-link $node(2) $node(6) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(2) $node(6) queuePos 0.5
$ns simplex-link-op $node(2) $node(6) color black
$ns simplex-link-op $node(2) $node(6) orient 273.8deg
# Set Queue Properties for link 2->6
[[$ns link $node(2) $node(6)] queue] set limit_ 20

$ns simplex-link $node(2) $node(3) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(2) $node(3) queuePos 0.5
$ns simplex-link-op $node(2) $node(3) color black
$ns simplex-link-op $node(2) $node(3) orient 2.3deg
# Set Queue Properties for link 2->3
[[$ns link $node(2) $node(3)] queue] set limit_ 20

$ns simplex-link $node(2) $node(4) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(2) $node(4) queuePos 0.5
$ns simplex-link-op $node(2) $node(4) color black
$ns simplex-link-op $node(2) $node(4) orient 89.3deg
# Set Queue Properties for link 2->4
[[$ns link $node(2) $node(4)] queue] set limit_ 20

$ns simplex-link $node(2) $node(1) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(2) $node(1) queuePos 0.5
$ns simplex-link-op $node(2) $node(1) color black
$ns simplex-link-op $node(2) $node(1) orient 182.8deg
# Set Queue Properties for link 2->1
[[$ns link $node(2) $node(1)] queue] set limit_ 20

$ns simplex-link $node(1) $node(2) 1.000000Mb 20.000000ms DropTail
$ns simplex-link-op $node(1) $node(2) queuePos 0.5
$ns simplex-link-op $node(1) $node(2) color black
$ns simplex-link-op $node(1) $node(2) orient 2.8deg
# Set Queue Properties for link 1->2
[[$ns link $node(1) $node(2)] queue] set limit_ 20

# Add Link Loss Models

# Create agents.
set agent(2) [new Agent/TCP]
$ns attach-agent $node(8) $agent(2)
set agent(1) [new Agent/TCP]
$ns attach-agent $node(8) $agent(1)

# Connect agents.
# Run the simulation
proc finish {} {
	global ns namfile
	$ns flush-trace
	close $namfile
	exec nam -r 2000.000000us /home/avi/Downloads/sim.nam &	
	exit 0
	}
$ns at 60.000000 "finish"
$ns run
