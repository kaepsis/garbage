echo "#########################"
echo "# Retrieving machine IP #"
echo "#########################"
DOT_IP=$(curl https://icanhazip.com)
DASH_IP=$(curl http://139.162.137.11/ipconv.php?ip=$DOT_IP)
clear
echo "##########################"
echo "#   Installing updates   #"
echo "##########################"
sudo yum update -y
clear
echo "###########################"
echo "#   Installing upgrades   #"
echo "###########################"
sudo yum upgrade -y
clear
echo "#########################"
echo "#   Installing CPanel   #"
echo "#########################"
sudo cd /home
sudo curl -o latest -L https://securedownloads.cpanel.net/latest
HALF_URL=sudo sh latest | grep -oP -m 1 '(?=cprapid).*'
FULL_URL="https://$DASH_IP.$HALF_URL"
clear
echo "############################"
echo "#   Link to CPanel Setup   #"
echo "############################"
echo $FULL_URL
