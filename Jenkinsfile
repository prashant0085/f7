pipeline {
    agent any
        stages {
            stage ('plan') {
                when {
                    // Only terraform plan in this stage
                    expression { params.option == 'plan' }
                }
                steps {
                    sh 'ansible-playbook tf.yml --tags "plan"'
                }
            }
            stage ('execute') {
                when {
                    // Only terraform plan in this stage
                    expression { params.option == 'execute' }
                }
                steps {
                    sh 'ansible-playbook tf.yml --tags "plan,execute"'
                }
            }
            stage ('tfplan') {
                when {
                    // Only when applying .tfplan
                    expression { params.option == 'tfplan' }
                }
                steps {
                    sh 'ansible-playbook tf.yml --tags "tfplan"'
                }
            }
        }
    }
