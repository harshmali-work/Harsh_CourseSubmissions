///AB
pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '2'))
        timeout(time: 30, unit: 'MINUTES')
    }
    environment {
        PATH = "${WORKSPACE}/flutter/bin:${PATH}"
        ANDROID_HOME = "/opt/android-sdk"
    }
    stages {
        stage('Checkout Code') {
            steps { checkout scm }
        }
        stage('Install Flutter SDK') {
            steps {
                sh '''
                if [ ! -d "flutter" ]; then
                    git clone --depth 1 https://github.com/flutter/flutter.git -b stable flutter
                fi
                flutter --version
                flutter config --android-sdk /opt/android-sdk
                '''
            }
        }
        stage('Fetch Dependencies') {
            steps { sh 'flutter pub get' }
        }
        stage('Build Artifact (AAB)') {
            steps {
                echo 'Compiling Signed Release Android App Bundle...'
                withCredentials([
    file(credentialsId: 'android-keystore-file', variable: 'KEYSTORE_FILE'),
    string(credentialsId: 'keystore-password', variable: 'KEY_PASSWORD')
]) {
                    sh '''
                        mkdir -p android/app
                        chmod -R 777 android/app
                        rm -f android/app/upload-keystore.jks
                        cp $KEYSTORE_FILE android/app/upload-keystore.jks
                        
                        # Strip any hidden newlines or carriage returns from the credential
                        CLEAN_PASSWORD=$(echo "$KEY_PASSWORD" | tr -d '\\r\\n')

                        echo "storePassword=$CLEAN_PASSWORD" > android/key.properties
                        echo "keyPassword=$CLEAN_PASSWORD" >> android/key.properties
                        echo "keyAlias=upload" >> android/key.properties
                        echo "storeFile=upload-keystore.jks" >> android/key.properties
                        
                        flutter build appbundle --release
                    '''
                }
            }
        }
    }
    post {
        success {
            echo 'AAB Build Successful! Archiving...'
            archiveArtifacts artifacts: 'build/app/outputs/bundle/release/app-release.aab', fingerprint: true
        }
        failure { echo 'Pipeline failed. Check the logs.' }
    }
}
