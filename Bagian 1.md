Database 
========

A database is an organized collection of structured data stored electronically in a computer system.

Sebelum database ditemukan, informasi disimpan dalam bentuk CSV yang dipisahkan dengan koma seperti contoh dibawah ini:

first name, last name, phone
John, Doe, (408)-245-2345
Jane, Doe, (503)-234-2355
...

Sebuah entity bisa berupa orang, tempat atau suatu benda dan atribut menggambarkan tentang orang, tempat atau suatu benda tersebut. Sebagai contoh kita dapat membuat Relational Model dari informasi employee entity dengan attribute (first name, last name dan phone):

Employee-Part1.png

Setiap Employee mempunyai satu atau lebih Contacts. Kita dapat membuat Contact entity dan menghubungkan dengan Employee entity melalui relationship yang dinamakan one-to-many:

EmpAttribute-Part1.png

Entity bisa merujuk pada tables, records merujuk pada row/baris dan fields merujuk pada columns/kolom.

The Relational Database Management System (RDBMS) mengatur relational data. Disamping Oracle Database, terdapat RDBMS produk lain yaitu: 
- Db2 from IBM.
- SQL Server from Microsoft.
- MySQL – the most popular open-source database, also from Oracle.
- PostgreSQL – the most advanced open source database.


### Download Oracle Sample database

Oracle-Sample-Database.png

After downloading the file, you should extract it. The zip file contains the following *.sql files:
-  ot_create_user.sql is for creating OT user and grant privileges
-  ot_schema.sql is for creating database objects such as tables, constraints, etc.
-  ot_data.sql is for loading data into the tables.
-  ot_drop.sql is for removing all objects in the sample database.

