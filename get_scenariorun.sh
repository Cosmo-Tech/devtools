export SCENARIO_RUN_FILE=/tmp/scenario_run
restish $RESTISH_PLATFORM findscenariorunbyid $ORGANIZATION $SCENARIO_RUN -r > $SCENARIO_RUN_FILE
echo Scenario run written in $SCENARIO_RUN_FILE
