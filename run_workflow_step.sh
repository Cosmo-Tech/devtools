source get_env_vars.sh $1

image=$(jq -r ".[]|select(.pod==\"$1\")|.image" $WORKFLOW_STEPS_FILE)
cmd=$(jq -r ".[]|select(.pod==\"$1\")|.command" $WORKFLOW_STEPS_FILE)
if [[ $cmd == null ]]; then
  entrypoint=""
else
  entrypoint="--entrypoint $cmd"
fi;

echo Image name: $image
echo Running docker image [${image}] with entry point [${entrypoint}] and env file: $WORKFLOW_ENV_FILE
echo Data dir: $DATA_DIR - Parameters Dir: $PARAM_DIR
docker run --env-file $WORKFLOW_ENV_FILE --mount type=bind,src=${DATA_DIR},dst=/mnt/scenariorun-data --mount type=bind,src=${PARAM_DIR},dst=/mnt/scenariorun-parameters $entrypoint $image
