export WORKFLOW_STEPS_FILE=/tmp/workflow_steps
jq '.|map({pod:.metadata.name,step:.metadata.annotations."workflows.argoproj.io/node-name",image:(.spec.containers[].image|select(.!="argoproj/argoexec:v2.12.5")),command:(.spec.containers[].command[0]|select(.!="argoexec"))})' $WORKFLOW_PODS_FILE > $WORKFLOW_STEPS_FILE
echo steps written in $WORKFLOW_STEPS_FILE
jq '.' $WORKFLOW_STEPS_FILE
echo Run ./run_workflow_step.sh [POD_NAME] for each pod you wan to run locally.
echo Run source ./get_and_load_env_var_local.sh [POD_NAME] to prepare a debug environment
echo Dataset: $DATA_DIR - Parameters: $PARAM_DIR
