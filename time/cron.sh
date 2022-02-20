export TIME=`date +%s`
envsubst '\$TIME' < /time/template.html > /time/index.html
MINUTE=`date +%M`
SECOND=`date +%S`
while [ $((MINUTE/15)) -lt 3 ] 
do
    echo $MINUTE:$SECOND
    remaining_minutes=$((14-((MINUTE%15))))
    remaining_seconds=$((remaining_minutes*60))
    remaining_seconds=$(((60-SECOND)+remaining_seconds))
    echo "-------------------Setting Time $TIME on Index HTML-------------------------"
    echo $remaining_seconds
    sleep $remaining_seconds
    export TIME=$((TIME+remaining_seconds))
    envsubst '\$TIME' < /time/template.html > /time/index.html
    MINUTE=$((MINUTE+remaining_minutes+1))
    SECOND=0
    echo $MINUTE:$SECOND
done
echo "---------------------------------------------------------------------"
