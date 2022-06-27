export TEMP_WORKFLOW_ENV_FILE=${ENV_DIR}/workflowenv.list
echo Modifying env file $WORKFLOW_ENV_FILE to $TEMP_WORKFLOW_ENV_FILE
cp $WORKFLOW_ENV_FILE $TEMP_WORKFLOW_ENV_FILE
echo replacing /mnt/scenariorun-data by $DATA_DIR
sed -i "s_/mnt/scenariorun-data_${DATA_DIR}_g" $TEMP_WORKFLOW_ENV_FILE
echo replacing /mnt/scenariorun-parameters by $PARAM_DIR
sed -i "s_/mnt/scenariorun-parameters_${PARAM_DIR}_g" $TEMP_WORKFLOW_ENV_FILE
