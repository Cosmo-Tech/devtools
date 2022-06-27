echo change your k8s context before using this command
export WORKFLOW_PODS_FILE=/tmp/workflow_pods
json=$(kubectl get pod -n phoenix -l "workflows.argoproj.io/workflow=${WORKFLOW_NAME}" -o json | jq -r '[.items[]]')
echo $json > $WORKFLOW_PODS_FILE
echo Workflow pods file written in $WORKFLOW_PODS_FILE
jq -r '.[].metadata.name' $WORKFLOW_PODS_FILE
