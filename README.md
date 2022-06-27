# Workflow dev tools

## Quick debug session with workflow name

Run:
```
source ./start_debug_session.sh [PLATFORM_URL] [WORKFLOW_NAME]
```

You can then continue directly to 'Run Container as platform POD' section.

## Manual setup

Init your environment for debug by running in order the following sections.
### Common

[PLATFORM_URL] is mandatory.
```
. ./set_restish.sh [PLATFORM_URL] [RESTISH_PLATFORM] [ORGANIZATION] [SCENARIO_RUN]
```

example:
```
. ./set_restish.sh https://staging.api.cosmotech.com staging O-vnRqz3dlLd sr-158yzp8jednj
```

### From a scenario run

```
. ./get_scenariorun.sh
. ./get_workflow_name.sh
```

### From a workflow

```
. ./set_workflow_name.sh [WORKFLOW_NAME]
```

### Common

```
. ./create_data_dir.sh
. ./get_workflow_pods.sh
. ./get_workflow_steps.sh
```
Other tools:
```
. ./get_env_vars [POD_NAME]
```

## Run Container as platform POD

For each pod you want to run:
```
./run_workflow_step.sh [POD_NAME]
```

Data are in $DATA_DIR and $PARAM_DIR.

You will want to run in order:
* Fetch dataset containers
* Fetch parameters containers
* Apply parameters
* Validator
* Pre-run
* Run
* Post-Run

## Local debug from sources

Run:
```
. ./get_and_load_env_var_local.sh [POD_NAME]
```

Go into your source code directory.
```
pipenv --python 3.9
```
pip install all needed requirements.txt.

cd in step directory.
```
python3 main.py
```
