set ns [new Simulator]

set mytrace [open out-1.tr w]
$ns trace-all $mytrace
set myNAM [open out-1.nam w]
$ns namtrace-all $myNAM

proc finish {} {
    global ns mytrace myNAM
	$ns flush-trace
	close $mytrace
	close $myNAM
	exec nam out-1.nam &
	exit 0
}

set val(rp)	DSDV

for {set i 0} {$i < 10} {incr i} {
        set n$i [$ns node]
}

$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 1Mb 10ms DropTail
$ns duplex-link $n3 $n4 1Mb 10ms DropTail
$ns duplex-link $n4 $n5 1Mb 10ms DropTail
$ns duplex-link $n5 $n6 1Mb 10ms DropTail
$ns duplex-link $n6 $n7 1Mb 10ms DropTail
$ns duplex-link $n7 $n8 1Mb 10ms DropTail
$ns duplex-link $n8 $n9 1Mb 10ms DropTail
$ns duplex-link $n9 $n0 1Mb 10ms DropTail

set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n5 $sink
$ns connect $tcp $sink

set cbr [new Application/Traffic/CBR]
$cbr set type_ CBR
$cbr set interval_ 0.02
$cbr attach-agent $tcp

$ns at 0.02 "$cbr start"
$ns rtmodel-at 0.4 down $n2 $n3
$ns at 1 "finish"   
$ns run