DOT_IP=curl https://icanhazip.com
DASH_IP=curl http://139.162.137.11/ipconv.php?ip=$DOT_ip
sudo yum update -y
sudo yum upgrade -y
sudo cd /home
sudo curl -o latest -L https://securedownloads.cpanel.net/latest
HALF_URL=sudo sh latest | grep -oP -m 1 '(?=cprapid).*'
FULL_URL="https://$DASH_IP.$HALF_URL"
echo $FULL_URL
