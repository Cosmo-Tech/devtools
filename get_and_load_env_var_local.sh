source get_env_vars.sh $1
source change_env_file.sh
export $(cat $TEMP_WORKFLOW_ENV_FILE | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}')
