name=$(jq '.workflowName' -r $SCENARIO_RUN_FILE)
echo $name
export WORKFLOW_NAME=$name
