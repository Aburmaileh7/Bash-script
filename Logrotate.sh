#! /bin/bash

#variabiles
log_dir="/var/log/"
max_log_size=50  #5 MB
max_log_age=30 # 30 day


#function to rotate logs 
rotate_log () 
{
 for log_file in "$log_dir"/*.log ;
 do
         if
                 [ $(stat -c%s "$log_file") -gt $max_log_size ]
         then
                 mv "$log_file" "$log_file.$(date +'%Y%m%d')"
                 gzip "$log_file.$(date +'%Y%m%d')"

                 echo "log rotate: $log_file"
         fi
 done

}

#function to clean up 

clean_old_log () 
{
        find "$log_dir" -name "*.gz" -mtime +$max_log_age -exec rm {} \;
}

#Run 

rotate_log
clean_old_log

~                                                                                                                                                                                                                  
~                                                                                                                                                                                                                  
~                                                                                                                                                                                                                  
~                     





