#Type thename of the apex domain to run this command
#It will status the DNS every 5 seconds for a change
#If there is a change the watch command will automatically end (-g otion)
watch -n 5 -g host -t TXT _acme-challenge.$1
