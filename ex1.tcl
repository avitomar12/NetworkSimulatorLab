#simple.tcl

#create scheduler
set ns [new Simulator]

#choose colors
$ns color 0 blue
$ns color 1 red
$ns color 2 green

#turn tracing on

set nf [open ex1.nam w]
$ns namtrace-all $nf
set tracefile1 [open ex1.tr w]
$ns trace-all $tracefile1

proc finish{} {
    global ns tracefile1 nf
    $ns flush-trace
    close $tracefile1
    close $nf
    exec nam ex1.nam &
    exit 0    
}

#create topology
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]
set n9 [$ns node]


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

#setup a tcp connection
set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $sink
$ns connect $tcp $sink



#setup a ftp over tcp
set ftp [new Application/FTP]
$ftp attach-agent $tcp

$ns at 0.01 "$ftp start"
$ns at 1.0 "$ftp stop"
$ns at 2.0 "finish"

$ns run