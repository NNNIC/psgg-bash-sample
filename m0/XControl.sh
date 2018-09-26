#!/bin/sh
echo : shell start !!

curfunc=""
nextfunc=""
tmpfunc=""
a=0

#[SYN-G-GEN OUTPUT START] $/./$
#  psggConverterLib.dll converted from XControl.xlsx. 
    #   I_0001
    echo :
    echo : This is TEST!
    echo :
    #   S_END
    S_END()
    {
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_INPUT_ID
    S_INPUT_ID()
    {
        if [ $1 -eq 1 ]; then
            echo : input your id
        fi
        read id
        if [ "$id" == "" ]; then
            return 0
        fi
        #    SetNextStateIf
            if [ "$tmpfunc" = "" ]; then
                tmpfunc="S_PRINT"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_PRINT
    S_PRINT()
    {
        if [ $1 -eq 1 ]; then
            echo :
            echo : your id is $id
            echo :
        fi
        #    SetNextStateIf
            if [ "$tmpfunc" = "" ]; then
                tmpfunc="S_SELECT"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_ROOMA
    S_ROOMA()
    {
        if [ $1 -eq 1 ]; then
            echo : S_ROOMA
            echo : $id can enter $s room.
            echo :
        fi
        #    SetNextStateIf
            if [ "$tmpfunc" = "" ]; then
                tmpfunc="S_END"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_ROOMB
    S_ROOMB()
    {
        if [ $1 -eq 1 ]; then
            echo : S_ROOMB
            echo : $id can not enter $s room.
            echo :
        fi
        #    SetNextStateIf
            if [ "$tmpfunc" = "" ]; then
                tmpfunc="S_END"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_SELECT
    S_SELECT()
    {
        if [ $1 -eq 1 ]; then
            echo : ** WHICH ROOM WILL YOU ENTER? **
            echo : A -- room A
            echo : B -- room B
            echo : X -- room X
        fi
        read s
        if [ "$s" == "" ]; then
            return 0
        fi
        # branch
        if [ "$s" = "A" ]; then
            #    SetNextState
                tmpfunc="S_ROOMA"
        else
            #    SetNextState
                tmpfunc="S_ROOMB"
        fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }
    #   S_START
    S_START()
    {
        #    SetNextStateIf
            if [ "$tmpfunc" = "" ]; then
                tmpfunc="S_INPUT_ID"
            fi
        #   GoNextState
            nextfunc=$tmpfunc
            tmpfunc=""
    }


#[SYN-G-GEN OUTPUT END]

nextfunc="S_START"

echo : request $nextfunc

i=0
max=1000
while  [ $i -le $max ]; do
    #echo :  w $nextfunc
    echo : running $curfunc
    bFirst=0
    if [ "$nextfunc" != "" ]; then
        curfunc=$nextfunc
        nextfunc=""
        bFirst=1
    fi

    #[SYN-G-GEN OUTPUT START] $/^S/->#callfunc$
#  psggConverterLib.dll converted from XControl.xlsx. 
    if [ "$curfunc" = "S_END" ]; then
        S_END $bFirst
    fi
    if [ "$curfunc" = "S_INPUT_ID" ]; then
        S_INPUT_ID $bFirst
    fi
    if [ "$curfunc" = "S_PRINT" ]; then
        S_PRINT $bFirst
    fi
    if [ "$curfunc" = "S_ROOMA" ]; then
        S_ROOMA $bFirst
    fi
    if [ "$curfunc" = "S_ROOMB" ]; then
        S_ROOMB $bFirst
    fi
    if [ "$curfunc" = "S_SELECT" ]; then
        S_SELECT $bFirst
    fi
    if [ "$curfunc" = "S_START" ]; then
        S_START $bFirst
    fi


    #[SYN-G-GEN OUTPUT END]

    if [ "$curfunc" = "S_END" ]; then
        break
    fi
    #echo : loop
    #read a
done

echo : shell end!
