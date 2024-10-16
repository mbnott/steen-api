DROP DATABASE IF EXISTS Steen;
CREATE DATABASE Steen;
USE Steen;

-- INSERT DEDICATED DB USER
DROP USER IF EXISTS steenapi@localhost;
FLUSH PRIVILEGES;
CREATE USER steenapi@localhost IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON Steen.* TO steenapi@localhost;
FLUSH PRIVILEGES;
