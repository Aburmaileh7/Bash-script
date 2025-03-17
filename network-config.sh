
#!/bin/bash 

#variables

interface="enp0s3"
static_ip="10.123.40.90"
cidr=24
gatway="10.123.40.1"
dns1="8.8.8.8"

#function to set a static IP  
configure_static_ip() {
        echo"configuring static ip ..."
        sudo nmcli con add type ethernet autoconnect yes con-name $interface ifname $interface
        sudo nmcli con mod "$interface" ipv4.addresses "$static_ip/$cidr"
        sudo nmcli con mod "$interface" ipv4.gatway "$gatway"
        sudo nmcli con mod "$interface" ipv4.dns "$dns1"
        sudo nmcli con mod "$interface" ipv4.method manual
        echo "Static IP configuration done ."
}

#function to restart the network servise
restart_network() {
        echo "REstarting network service... "
        sudo nmcli con up "$interface"
        echo "Network service restarted. "
}


#Function to display current network configuration
show_network_config () {
        echo "Current network configurtion :"
        ip addr show "$interface"
}

#function to automate the whole network configration 
automate_network_config() {
        configure_static_ip
        restart_network
        show_network_config
}

#Execute the automation function 
automate_network_config
~                                                                                                                                                                                                                  
~                                                    
