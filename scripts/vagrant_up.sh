#!/bin/bash
cd vagrant/jenkins && vagrant up 
cd ../gitlab && vagrant up
cd ../registry && vagrant up