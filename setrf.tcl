#  TCL command to set randy_factor (max events per output buffer)
#  in the coda_roc
#
#  You must include the following arguments
#     val      - value to set randy_factor to
#
#
#  To include this function in the coda_roc at boot
#
#     coda_roc -i -n ROC1 -t ROC -f setrf.tcl
#

proc setrf {val}
{
    global env

    set rocname [info objects]
    $rocname configure -randy_factor $val

    set myvar [$rocname cget -randy_factor]

    puts "setrf -> $myvar"

    return $myvar
}


setrf 50
