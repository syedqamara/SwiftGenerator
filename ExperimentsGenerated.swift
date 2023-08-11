extension ExperimentKey {
    static var firstExperimentStaticVariableNameKey: ExperimentKey { ExperimentKey(key: "test_experiment1") }
    static var secondExperimentStaticVariableNameKey: ExperimentKey { ExperimentKey(key: "test_experiment2") }
}

extension ExperimentValue {
    static var firstExperimentStaticVariableName: ExperimentValue<Bool>{ ExperimentValue<Bool>(id: .firstExperimentStaticVariableNameKey, type: .bool, defaultValue: true, info: "test_experiment1 This feature is used to test the Experimentations.") }
    static var secondExperimentStaticVariableName: ExperimentValue<String>{ ExperimentValue<String>(id: .secondExperimentStaticVariableNameKey, type: .string, defaultValue: "some_data_in_experiment", info: "test_experiment1 This feature is used to test the Experimentations.") }
}

