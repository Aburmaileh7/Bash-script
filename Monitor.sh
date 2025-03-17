#!/bin/bash

#varibales

cpu_threshold=1
mem_threshold=1
disk_threshold=1

# function to check cpu usage 

check_cpu () {
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
        if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l ) )) ;
        then
                echo "High CPU usage : $cpu_usage%"
        fi
}



#function to check  memory usage
check_mem() {
        mem_usage=$(free |grep Mem | awk '{print $3/$2 * 100.0}')
        if (( $(echo "$mem_usage > $mem_threshold" |bc -l ) ));
        then
                echo "High Memory usage : $mem_usage%"
        fi
}

#function check disk usage 
check_disk() {
        disk_usage=$(df / | tail -1 |awk '{print $5}' | sed 's/%//')
        if [ "$disk_usage" -gt "$disk_threshold" ];
        then
                echo "Higt Disk usge: $disk_usage%"
        fi
}

#run function

check_cpu
check_mem
check_disk




~         

