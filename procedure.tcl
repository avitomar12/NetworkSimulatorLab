#create a procedure
proc test{}{
    set a 43
    set b 27
    set c [expr $a+ $b]
    set d  [expr [expr $a -$b]* $c]

}
test