#!/bin/bash
exe=`dmenu_run -x 10 -y 40 -w 180 -l 5 -h 16 -i -q -fn profont-8 -nb '#EEEEEE' -nf '#474747' -sb '#868686' -sf '#FEFEFE'` && eval "exec $exe"
