set ns [new Simulator]

set trace [open out-2.tr w]
$ns trace-all $trace
set nam [open out-2.nam w]
$ns namtrace-all $nam

proc finish {} {
    global ns trace nam
    $ns flush-trace
    close $trace
    close $nam
    exec nam out-2.nam &
    exit 0
}

set val(rp) DSDV
set val(mac) Mac/802_11

for {set i 0} {$i < 7} {incr i} {
        set n$i [$ns node]
}

$ns duplex-link $n0 $n1 1Mb 5ms DropTail
$ns duplex-link $n1 $n4 1Mb 5ms DropTail
$ns duplex-link $n1 $n3 1Mb 5ms DropTail
$ns duplex-link $n1 $n2 1Mb 5ms DropTail
$ns duplex-link $n4 $n5 1Mb 5ms DropTail
$ns duplex-link $n3 $n6 1Mb 5ms DropTail

set udp [new Agent/UDP]
$ns attach-agent $n1 $udp
$ns attach-agent $n4 $udp
$ns attach-agent $n3 $udp

$ns at 1 "finish"   
$ns run