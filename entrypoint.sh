#!/bin/bash
jmeter -n -t ./tests/Demo_Test_Plan.jmx -l ./csvreport/reports.csv  -e -o ./htmlreport

echo "reports.csv generated in csvreport"
ls -lrt ./csvreport

echo "html report generated in htmlreport"
ls -lrt ./htmlreport

echo "Execution Completed"