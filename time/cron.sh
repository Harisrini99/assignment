while true 
do
export HOUR=`date +%H`
export MINUTE=`date +%M`
export SECOND=`date +%S`
echo "----"
envsubst '\$HOUR' < /time/template.html > /time/index.html
echo "Current Time --> $HOUR:$MINUTE:$SECOND"
balance_time=$((59 - MINUTE))
balance_time=$((balance_time*60))
remaining_seconds=$((60-SECOND))
remaining_seconds=$((remaining_seconds + balance_time))
get_new_after=$((3600-remaining_seconds))
echo "Sleep For $remaining_seconds"
sleep ${remaining_seconds}
export HOUR=$(((HOUR+1)%24))
echo "Time Calculated  $HOUR"
d=`date`
echo "Time in System $d"
envsubst '\$HOUR' < /time/template.html > /time/index.html
echo "Again Sleep for $get_new_after"
sleep ${get_new_after}
echo "-----------------------------------------------------------------------"
done
