Bagian 2
========

### 1. Querying data
- Select
Digunakan untuk mengambil data dari satu atau lebih kolom pada table.

SELECT
  column_1, 
  column_2, 
  ...
FROM
  table_name;

Select statement:
	- Pertama, Menentukan nama table mana yang akan di query datanya.
	- Kedua, Menunjukan kolom mana yang akan ditampilkan datanya. Jika lebih dari satu kolom, pisahkan dengan koma (,).

Contoh:
select
    name,
    credit_limit,
    address
FROM
    customers;


### 2. Sorting data
- Order By Clause
Digunakan untuk query secara ascending atau descending dari kolom.

SELECT
    column_1,
    column_2,
    column_3,
    ...
FROM
    table_name
ORDER BY
    column_1 [ASC | DESC] [NULLS FIRST | NULLS LAST],
    column_1 [ASC | DESC] [NULLS FIRST | NULLS LAST],
    ... 

Catatan:
	- ASC mengurutkan dari atas ke bawah
	- DESC mengurutkan dari bawah ke atas
	- Standarnya pengurutan dilakukan secara ASC walaupun tanpa dituliskan.
	- NULLS FIRST adalah kolom yang isinya kosong sebelum yang tidak kosong.
	- NULLS LAST adalah adalah kolom yang isinya kosong setelah yang tidak kosong.
	- ORDER BY membolehkan kita untuk mengurutkan beberapa kolom walaupun berbeda pengurutan.
	- ORDER BY clause selalu diketikan di akhir query statement SELECT.

Contoh:
1. Mengurutkan baris dari kolom 
SELECT
    name,
    address,
    credit_limit
FROM
    customers
ORDER BY
    name DESC;

2. Mengurutkan baris dari beberapa kolom
Kode di bawah ini, pertama Oracle akan mengurutkan baris menurut kolom name secara Ascending. Kemudian Oracle mengurutkan baris menurut kolom address secara Descending.
SELECT
    customer_id,
    name,
    address
FROM
    customers
ORDER BY
    name,
    address DESC;
/* Output
6	Adam	Cendrawasih 91
5	Ahmad	Pondok Kopi 21
3	Anissa	Pondok Kelapa 55
8	Anissa	Bunga Rampai Raya 13
*/

3. Mengurutkan baris sesuai posisi kolom
Kita juga bisa mengurutkan sesuai nomor posisi kolom. Pada kasus ini posisi kolom name adalah 1 dan kolom credit_limit adalah 2.
SELECT
    name,
    credit_limit
FROM
    customers
ORDER BY
    2 DESC,
    1;

4. Mengurutkan baris dengan nilai NULL
SELECT
    customer_id,
    name,
    website
FROM
    customers
ORDER BY
    website ASC NULLS FIRST;--NULLS LAST--

5. Mengurutkan baris menurut Fungsi
ORDER BY dapat mengurutkan Fungsi String dan Fungsi Matematika.
SELECT
	customer_id,
	name
FROM
	customers
ORDER BY
	UPPER( name ); --Urutkan Nama dan angka--

6. Mengurutkan Tanggal
SELECT 
    customer_id,
    name,
    join_date
FROM 
   customers
ORDER BY 
   join_date DESC;

### 3. Filtering data
- DISTINCT
DISTINCT digunakan pada saat SELECT Statement untuk menseleksi baris yang duplikat. Hal ini memastikan bahwa row yang diminta adalah unique.

SELECT DISTINCT
	column_1
FROM
	table;

pada kode di atas, nilai pada column_1 akan dibandingkan untuk menentukan duplikasi. Untuk mengambil unique data dari beberapa columns:
SELECT
    DISTINCT column_1,
    column_2,
        ...
FROM
    table_name;

Pada kode di atas, Kombinasi nilai dari column_1 dan column2 digunakan untuk menentukan keunikan data.

Note: DISTINCT adalah sinonim dara unique yang bukan standar SQL. dalam hal ini bagus lebih baik gunakan DISTINCT daripada UNIQUE.

Contoh:
1. DISTINCT satu kolom
Menampilkan nama, jika terdapat nama yang sama maka hanya ditampilkan satu kali.
SELECT DISTINCT
    name
FROM
    customers
ORDER BY
    name;

2. DISTINCT Dua Kolom atau lebih
Pada contoh ini nilai dari kolom name dan credit_limit digunakan untuk mengevaluasi keunikan baris. Jadi jika nilai dari kolom name dan credit_limit sama maka hanya ditampilkan satu kali.
SELECT DISTINCT 
    name,
    credit_limit
FROM
    customers
ORDER BY
    name;

3. DISTINCT and NULL
DISTINCT memperlakukan nilai NULL dapat terjadi duplikasi. Jika kita melakukan query data yang kolom yang banyak nilai NULL maka hanya ditampilkan satu saja.
SELECT DISTINCT
    website
FROM
    customers
ORDER BY
    website NULLS FIRST;

- WHERE
Klausa WHERE digunakan untuk menentukan kondisi pencarian baris/rows dengan pernyataan SELECT.
ELECT
    column_1,
    column_2,
    ...
FROM
    table_name
WHERE
    search_condition
ORDER BY
    column_1,
    column_2;

Disamping Select Statement, WHERE digunakan pada DELETE atau UPDATE Statement.

Contoh:
1. Memilih baris dengan persamaan Operator
SELECT
    name,
    address,
    website
FROM
    customers
WHERE
    name = 'Anissa';

2. Memilih baris dengan operator perbandingan

operator		Description
=				Equality
!=,<>			Inequality
>				Greater than
<				Less than
>=				Greater than or equal to
<=				Less than or equal to
IN				Equal to any value in a list						of values
ANY/ SOME / ALL	Compare a value to a list or 						subquery. It must be preceded by 					another operator such as =, >, <.
NOT IN	Not 	equal to any value in a list of 					values
[NOT] BETWEEN n and m	Equivalent to [Not] >= n 							and <= y.
[NOT] EXISTS	Return true if subquery returns at 					least one row
IS [NOT] NULL	NULL test

SELECT
    name,
    address,
    credit_limit
FROM
    customers
WHERE
    credit_limit <= 1000;

3. Memilih baris dengan beberapa kondisi

SELECT
    name,
    address,
    credit_limit
FROM
    customers
WHERE
    credit_limit <= 1000
    AND website IS NOT NULL;

4. Memilih baris yang nilainya diantara dua nilai
SELECT
    name,
    credit_limit
FROM
    customers
WHERE
    credit_limit BETWEEN 500 AND 1000
ORDER BY
    credit_limit;

5. Memilih baris yang berada di dalam nilai list
SELECT
    name,
    credit_limit
FROM
    customers
WHERE
    credit_limit IN (500, 700)
ORDER BY
    credit_limit;

6. Memilih baris yang nilainya bagian dari String
SELECT
    name,
    address,
    credit_limit
FROM
    customers
WHERE
    address LIKE 'Pondok%'
ORDER BY
    name;

- AND Operator
AND Operator adalah operator logika yang mengkombinasi Boolean Expressions dan hasilnya true jika expressionsnya true. Jika salah satunya False atau null maka False atau null.
Kita menggunakan AND saat di WHERE pada SELECT, UPDATE dan DELETE serta sebagai predikat di JOIN.
Contoh:
--1. AND kombinasi dengan dua bolean
SELECT
    name,
    address,
    credit_limit,
    join_date
FROM
    customers
WHERE
    Kota = 'Surabaya'
    AND credit_limit <=1000;

--2. AND kombinasi dengan lebih dari dua bolean
SELECT
    name,
    address,
    credit_limit,
    join_date
FROM
    customers
WHERE
    Kota = 'Surabaya'
    AND credit_limit <=1000
    AND EXTRACT(MONTH FROM join_date) = 07;

--3. AND kombinasi dengan OR operator
SELECT
    name,
    address,
    status,
    join_date
FROM
    customers
WHERE
   (
        status = 'active'
        OR status = 'not active'
   )
    AND kota = 'Bekasi';

- OR Operator
OR Operator adalah operator logika yang mengkombinasi Boolean Expressions dan hasilnya true jika salah satu expressionsnya true.
Contoh:
1. OR kombinasi dua boolean
SELECT
    customer_id,
    status,
    join_date
FROM
    customers
WHERE
    status = 'active'
    OR status = 'not active'
ORDER BY
    join_date DESC;

2. OR kombinasi lebih dari dua boolean
Lebih baik pakai IN kalau banyak OR
SELECT
    customer_id,
    status,
    join_date
FROM
    customers
WHERE
    EXTRACT(MONTH FROM join_date) = 07
    OR EXTRACT(MONTH FROM join_date) = 05
    OR EXTRACT(MONTH FROM join_date) = 11
ORDER BY
    join_date DESC;

3. OR kombinasi dengan and
SELECT
    name,
    address,
    status,
    join_date
FROM
    customers
WHERE
   (
        status = 'active'
        OR status = 'not active'
   )
    AND kota = 'Bekasi';
