# Sistem güncellemelerini yap
sudo apt update && sudo apt upgrade -y

# Node.js 18.x sürümünü kur
sudo apt install -y nodejs docker.io docker-compose curl wget net-tools git
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

# Node.js ve npm sürümlerini kontrol et
node -v
npm -v

# Uptime Kuma projesini klonla
git clone https://github.com/louislam/uptime-kuma.git
cd uptime-kuma

# Gerekli paketleri yükle
npm install

# Projeyi derle
npm run build

# Uptime Kuma'yı başlat
#npm run start

# Web'den giriş yap ve kontrol et
# http://server-ip:3001

# Database oluşturma işlemleri:
sudo apt update
sudo apt install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb

# MariaDB için güvenlik ayarlarını yap
sudo mysql_secure_installation <<EOF

y
y
y
y
y
EOF

# MariaDB'ye giriş yap
sudo mysql -u root -p <<EOF
CREATE DATABASE uptime_kuma;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Pr0s01_kuma';
GRANT ALL PRIVILEGES ON uptime_kuma.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;
EOF

# Güvenlik duvarında MariaDB portunu aç
sudo ufw allow 3306/tcp
sudo ufw reload

# Yine MariaDB'yi kur
sudo apt update
sudo apt install mariadb-server -y

docker-compose up -d

# Daha sonra web'de giriş yap