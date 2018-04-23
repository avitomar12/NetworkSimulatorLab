#simple.tcl

#create scheduler
set ns [new Simulator]

#choose colors
$ns color 0 blue
$ns color 1 red
$ns color 2 green

#turn tracing on
set f [open simple.tr w]
$ns trace-all $f
set nf [open simple.nam w]
$ns namtrace-all $nf



#create topology
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n2 5Mb 2ms DropTail
$ns duplex-link $n1 $n2 5Mb 2ms DropTail
$ns duplex-link $n2 $n3 1.5Mb 10ms DropTail
#limit queue size (otherwise unlimited)
#$ns queue-limit $n2 $n3 5

#adjust nam orientation
$ns duplex-link-op $n0 $n2 orient right-up
$ns duplex-link-op $n1 $n2 orient right-down
$ns duplex-link-op $n2 $n3 orient right

#turn nam visualization for n2-n3 queue
$ns duplex-link-op $n2 $n3 queuePos 0.5

#create udp agenet
set udp0 [new Agent/UDP]
#attach agent to node
$ns attach-agent $n0 $udp0
#select packet color for nam
$udp0 set class_ 0
#create a cbr application
set cbr0 [new Application/Traffic/CBR]
#attach application to agent
$cbr0 attach-agent $udp0

#create another udp/cbr agent/application
set udp1 [new Agent/UDP]
$ns attach-agent $n3 $udp1
$udp1 set class_ 1
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1

#create and attach null agents
set null0 [new Agent/Null]
$ns attach-agent $n3 $null0

set null1 [new Agent/Null]
$ns attach-agent $n1 $null1

$ns connect $udp0 $null0
$ns connect $udp1 $null1

#schedule the start of cbr traffic
$ns at 1.0 "$cbr0 start"
$ns at 1.1 "$cbr1 start"

#create and attach a TCP agent source/sink
set tcp [new Agent/TCP]
$tcp set class_ 2
set sink [new Agent/TCPSink]
$ns attach-agent $n0 $tcp
$ns attach-agent $n3 $sink
$ns connect $tcp $sink

#attach an ftp application to the TCP agent
set ftp [new Application/FTP]
$ftp attach-agent $tcp

#schedule start of ftp application
$ns at 1.2 "$ftp start"

#schedule end of ftp application
$ns at 5.0 "$ftp stop"

#$ns at 5.0 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n3 $sink"

#print the (default) cbr values
puts [$cbr0 set packetSize_]
puts [$cbr0 set interval_]

$ns at 6.0 "finish"

proc finish {} {
	global ns f nf
	$ns flush-trace
	close $f
	close $nf

	#puts "running nam..."
	#exec nam simple.nam &
	exit 0
}

$ns run



