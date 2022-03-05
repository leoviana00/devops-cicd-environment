#!/bin/bash
cd vagrant/jenkins && vagrant destroy 
cd ../gitlab && vagrant destroy 
cd ../registry && vagrant destroy 
cd ../sonar && vagrant destroy 