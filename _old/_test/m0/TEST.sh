#!/bin/sh
echo : a

curfunc=""
nextfunc=""
tmpfunc=""
a=0

#[SYN-G-GEN OUTPUT START] $/./$
#  psggConverterLib.dll converted from TEST.xlsx. 
    #   S_BRANCH_BY_X
    S_BRANCH_BY_X()
    {
        if [ $1 -eq 1 ]; then
            echo : S_BRANCH_BY_X init
        fi
        x=2
        # branch
        if [ $x -eq 1 ]; then
            #    SetNextState
                tmpfunc="S_X_1"
        elif [ $x -eq 2 ]; then
            #    SetNextState
                tmpfunc="S_X_2"
        else
            #    SetNextState
                tmpfunc="S_X_3"
        fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_END
    S_END()
    {
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_NEXT
    S_NEXT()
    {
        #    SetNextStateIf
            if [ "$tmpfunc"="" ]; then
                tmpfunc="S_X_4"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_NO
    S_NO()
    {
        if [ $1 -eq 1 ]; then
            echo : S_NO init
        fi
        #    SetNextStateIf
            if [ "$tmpfunc"="" ]; then
                tmpfunc="S_END"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_NOTABOVE
    S_NOTABOVE()
    {
        if [ $1 -eq 1 ]; then
            echo : S_NOTABOVE init
        fi
        #    SetNextStateIf
            if [ "$tmpfunc"="" ]; then
                tmpfunc="S_END"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_START
    S_START()
    {
        #    SetNextStateIf
            if [ "$tmpfunc"="" ]; then
                tmpfunc="S_BRANCH_BY_X"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_X_1
    S_X_1()
    {
        if [ $1 -eq 1 ]; then
            echo : S_X_1 init
        fi
        #    SetNextStateIf
            if [ "$tmpfunc"="" ]; then
                tmpfunc="S_NEXT"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_X_2
    S_X_2()
    {
        if [ $1 -eq 1 ]; then
            echo : S_X_2 init
        fi
        #    SetNextStateIf
            if [ "$tmpfunc"="" ]; then
                tmpfunc="S_NEXT"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_X_3
    S_X_3()
    {
        if [ $1 -eq 1 ]; then
            echo : S_X_3 init
        fi
        #    SetNextStateIf
            if [ "$tmpfunc"="" ]; then
                tmpfunc="S_NEXT"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_X_4  new state
    S_X_4()
    {
        if [ $1 -eq 1 ]; then
            yesno="yesv"
        fi
        # branch
        if [ "$yesno" = "yes" ]; then
                tmpfunc="S_YES"
            fi
        if [ "$yesno" = "no" ]; then
                tmpfunc="S_NO"
            fi
        if [ "$tmpfunc" = "" ]; then
                tmpfunc="S_NOTABOVE"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_YES
    S_YES()
    {
        if [ $1 -eq 1 ]; then
            echo : S_YES init
        fi
        #    SetNextStateIf
            if [ "$tmpfunc"="" ]; then
                tmpfunc="S_END"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }


#[SYN-G-GEN OUTPUT END]

nextfunc="S_START"

echo : $nextfunc

i=0
max=1000
while  [ $i -le $max ]; do
    #echo :  w $nextfunc
    echo :  w $curfunc
    bFirst=0
    if [ "$nextfunc"!="" ]; then
        curfunc=$nextfunc
        nextfunc=""
        bFirst=1
    fi

    #[SYN-G-GEN OUTPUT START] $/./->#callfunc$
#  psggConverterLib.dll converted from TEST.xlsx. 
    if [ "$curfunc" = "S_BRANCH_BY_X" ]; then
        S_BRANCH_BY_X $bFirst
    fi
    if [ "$curfunc" = "S_END" ]; then
        S_END $bFirst
    fi
    if [ "$curfunc" = "S_NEXT" ]; then
        S_NEXT $bFirst
    fi
    if [ "$curfunc" = "S_NO" ]; then
        S_NO $bFirst
    fi
    if [ "$curfunc" = "S_NOTABOVE" ]; then
        S_NOTABOVE $bFirst
    fi
    if [ "$curfunc" = "S_START" ]; then
        S_START $bFirst
    fi
    if [ "$curfunc" = "S_X_1" ]; then
        S_X_1 $bFirst
    fi
    if [ "$curfunc" = "S_X_2" ]; then
        S_X_2 $bFirst
    fi
    if [ "$curfunc" = "S_X_3" ]; then
        S_X_3 $bFirst
    fi
    if [ "$curfunc" = "S_X_4" ]; then
        S_X_4 $bFirst
    fi
    if [ "$curfunc" = "S_YES" ]; then
        S_YES $bFirst
    fi


    #[SYN-G-GEN OUTPUT END]

    if [ "$curfunc" = "S_END" ]; then
        break
    fi
    #echo : loop
    #read a
done

