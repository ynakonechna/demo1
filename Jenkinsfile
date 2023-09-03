pipeline {
    agent any

     parameters {
        choice(name: 'choice', choices: ['','build','deploy','destroy'], description: 'choose a value')
    }

    environment {
        SSH_CREDENTIALS = credentials('key')
        ECR_REPO = '404405619113.dkr.ecr.eu-north-1.amazonaws.com'
    }

    stages {

        stage('Build') {
            when {
                expression {
                    params.choice == 'build'
                }
            }
            steps {
                sh "aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin $ECR_REPO"
                dir('db') {
                    sh "docker build -t $ECR_REPO/db:latest ." 
                    sh "docker push $ECR_REPO/db:latest"
                    sh "docker rmi $ECR_REPO/db:latest"
                }
                dir('app') {
                    sh "docker build -t $ECR_REPO/app:latest ." 
                    sh "docker push $ECR_REPO/app:latest"
                    sh "docker rmi $ECR_REPO/app:latest"
                }
            }
        }

        stage('Deploy') {
            when {
                expression {
                    params.choice == 'deploy'
                }
            }
            // \$(base64 -w 0 jenkins/userdata)
            steps { 
                script {
                 withAWS(role:"jenkins", roleSessionName: "role", useNode: true){
                    INSTANCE_ID   = sh(script: """aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=demo-server" --query "Reservations[].Instances[].InstanceId" --output text""", returnStdout: true).trim()
                     if (INSTANCE_ID == '') {
                        sh """
                    aws ec2 run-instances \
    --image-id ami-08766f81ab52792ce \
    --count 1 \
    --instance-type t3.micro \
    --key-name j_key \
    --security-group-ids sg-05e0eaab7ba23bf57 \
    --subnet-id subnet-071874fe08c34005a \
    --block-device-mappings '[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":30,\"DeleteOnTermination\":true}}]' \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=demo-server}]' 'ResourceType=volume,Tags=[{Key=Name,Value=demo-server-disk}]'
                    """
                    }
                    
                }
                }
               
            }
            
        }

        stage('SSH to Remote Server') {
            when {
                expression {
                    params.choice == 'deploy'
                }
            }
            steps {
                sleep(10)
                script {
                    INSTANCE_ID   = sh(script: """aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=demo-server" --query "Reservations[].Instances[].InstanceId" --output text""", returnStdout: true).trim()
                    INSTANCE_IP   = sh(script: """aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=demo-server" --query "Reservations[].Instances[].PublicIpAddress" --output text""", returnStdout: true).trim()
                    echo INSTANCE_ID
                    sh "aws ec2 wait instance-running --instance-ids ${INSTANCE_ID}"
                    sh """
                        ssh -i ${env.SSH_CREDENTIALS} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
                        ubuntu@${INSTANCE_IP} 'sudo apt-get update && sudo apt-get install nginx -y'
                    """
                }
            }
        } 
        
        stage('Destroy') {
            when {
                expression {
                    params.choice =='destroy'
                }
            }
            steps {
                script {
                    withAWS(role:"jenkins", roleSessionName: "role", useNode: true){
                        INSTANCE_ID   = sh(script: """aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=demo-server" --query "Reservations[].Instances[].InstanceId" --output text""", returnStdout: true).trim()
                        echo INSTANCE_ID
                        sh "aws ec2 terminate-instances --instance-ids $INSTANCE_ID"
                    }
                    
                }
            }
        }
    }
    post {
        always {
          cleanWs()
        }
}
}
