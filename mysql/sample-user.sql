# Password matches username.
# This should be changed in a production environment

GRANT USAGE ON *.* TO 'user'@'localhost' IDENTIFIED BY PASSWORD '*B4F7EAD1B3C284EDA2B9D943A7DA4C6DA61A2B44';
GRANT ALTER ROUTINE, CREATE ROUTINE, EXECUTE, INSERT, UPDATE PRIVILEGES ON `database`.* TO 'user'@'localhost';
