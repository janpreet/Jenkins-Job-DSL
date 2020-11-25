#!/usr/bin/env groovy

job('First job') {
    steps {
        shell('echo "Hello. This is a test job."')
    }
}