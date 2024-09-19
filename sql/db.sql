DROP DATABASE IF EXISTS Steen;
CREATE DATABASE Steen;
USE Steen;

-- INSERT DEDICATED DB USER
DROP USER IF EXISTS ***REMOVED***@localhost;
FLUSH PRIVILEGES;
CREATE USER ***REMOVED***@localhost IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON Steen.* TO ***REMOVED***@localhost;
FLUSH PRIVILEGES;
