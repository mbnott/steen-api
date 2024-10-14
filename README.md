# steen-api
The RESTful API of Steen, a midpoint between Steen's database and user interfaces. Allows Fetching, Creating, Modifying and Deleting data.

## Links
Steen Desktop app (discontinued): [steen-desktop](https://github.com/mbnott/steen-desktop)  
Steen Web App: [steen-web](https://github.com/mbnott/steen-web)

## Usage
You can find the documentation [Here](https://github.com/mbnott/steen-api/blob/main/documentation.md). It contains all the data on where and how to do HTTP requests to steen-api endpoints.

# Deployment
This is a small guide on how to setup steen-api on a local ubuntu machine/WSL. Must have admin rights.
1. Download Apache, PHP and MariaDB:
```sh
sudo apt install apache2 apache2-doc php8.2 php8.2-cli mariadb-client mariadb-server
```  
2. Start and configure your MariaDB server
```sh
sudo service mariadb start
```  
```sh
sudo mariadb-secure-installation
```  
3. Move to the apache dir with `cd /var/www/html` and clone this repo:
```sh
git clone https://github.com/mbnott/steen-api.git
```  
4. Move to the steen-api sql folder with `cd ./steen-api/sql` and execute each sql script in this order (don't forget to change the `[your user]` value):
   - `mysql -u [your user] -p < db.sql`
   - `mysql -u [your user] -p < tables.sql`
   - `mysql -u [your user] -p < view.sql`
   - `mysql -u [your user] -p < data.sql`

5. Copy the apache config file to sites-available:
```sh
sudo cp ./steen-api/apache/steen.api.conf /etc/apache2/sites-available/
```
6. Enable the apache rewrite module with `sudo a2enmod rewrite` and activate the website with `sudo a2ensite steen.api`
7. Restart apache:
```sh
sudo service apache2 start
```
Your website should now be accessible from requests to your server with the `steen.api` url. You can set up a virtual host on windows with the guide below.
## Windows Virtual Host
To add `steen.web` to your virtual hosts, you can either download [PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/) and use the built in Host files editor, or follow the steps below:  
1. Open `C:\Windows\System32\drivers\etc\hosts` with your favorite text editor (like notepad) with Administrator rights  
2. Add the following to the end of the file:
```
  127.0.0.1 steen.api
  ::1       steen.api
```
