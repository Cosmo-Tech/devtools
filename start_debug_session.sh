echo set kubectl in the proper context
echo usage: source ./start_debug_session.sh [PLATFORM_URL] [WORKFLOW_NAME]
. ./set_restish.sh $1
. ./set_workflow_name.sh $2
. ./create_data_dir.sh
. ./get_workflow_pods.sh
. ./get_workflow_steps.sh
