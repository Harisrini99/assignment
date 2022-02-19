export HOUR=`date +%H`
envsubst '\$HOUR' < template.html > index.html