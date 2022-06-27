echo First parameters is pod name
export WORKFLOW_ENV_FILE=/tmp/workflowenv.list
export ORIG_WORKFLOW_ENV_FILE=/tmp/workflowenv.orig.list
jq -r "map(select(.metadata.name==\"$1\"))|.[]|.spec.containers[]|.env[]|(.name) + \"=\" + (.value)" $WORKFLOW_PODS_FILE > $ORIG_WORKFLOW_ENV_FILE
echo Orginal Workflow Env file written in $ORIG_WORKFLOW_ENV_FILE
echo chaning platform URL to external URL $PLATFORM_URL
cp $ORIG_WORKFLOW_ENV_FILE $WORKFLOW_ENV_FILE
sed -i s-CSM_API_URL=.*-CSM_API_URL=${PLATFORM_URL}-g $WORKFLOW_ENV_FILE
echo New reference env file in $WORKFLOW_ENV_FILE
