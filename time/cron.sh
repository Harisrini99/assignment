export TIME=`date +%s`
envsubst '\$TIME' < /time/template.html > /time/index.html
MINUTE=`date +%M`
SECOND=`date +%S`
MINUTE=$((29-(MINUTE%30)))
balance_time=$((MINUTE*60))
remaining_seconds=$((60-SECOND))
remaining_seconds=$((remaining_seconds + balance_time))
echo "-------------------Setting Time $TIME on Index HTML-------------------------"
echo $remaining_seconds
sleep $remaining_seconds
export TIME=$((TIME+remaining_seconds))
envsubst '\$TIME' < /time/template.html > /time/index.html
echo "---------------------------------------------------------------------"