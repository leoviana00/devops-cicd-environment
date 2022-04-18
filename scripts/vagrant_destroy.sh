#!/bin/bash
cd vagrant/jenkins && vagrant destroy -f
cd ../gitlab && vagrant destroy -f
cd ../registry && vagrant destroy -f
cd ../sonar && vagrant destroy -f