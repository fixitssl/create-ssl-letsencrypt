#Run the command with th name of the domain for SSL cert renewal --- example "workspace-certbot.sh google.com"
#This will fail unless you have run the commands to add docker to the  workspace (takes 1 minute)
#You will need access to your DNS to add TXT records provided by this script from Let's Encrypt
#You can use acme-TXT-status.sh to watch when the TXT records have hit the main DNS server
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker run -it --rm --name letsencrypt \
    -v "${DIR}/etc/letsencrypt:/etc/letsencrypt" \
    -v "${DIR}/var/lib/letsencrypt:/var/lib/letsencrypt" \
    certbot/certbot:latest \
        certonly \
        -d $1 \
        -d *.$1 \
        --manual \
        --preferred-challenges dns \
        --server https://acme-v02.api.letsencrypt.org/directory
