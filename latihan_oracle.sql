
-- Bagian 1--
-------------
-------------

DROP TABLE customers;

CREATE TABLE HELMIORACLE.CUSTOMERS(
    CUSTOMER_ID     NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    NAME            VARCHAR2(255) NOT NULL,
    ADDRESS         VARCHAR2(255),
    WEBSITE         VARCHAR2(255),
    CREDIT_LIMIT    NUMBER(8,2),
    JOIN_DATE       DATE,
    KOTA            VARCHAR2(50),
    STATUS          VARCHAR2(20)
);

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, JOIN_DATE, kota, status)
VALUES('Sara', 'Harapan Jaya 21', 'sarajaya.com', 1500, DATE '2019-05-03', 'Bekasi', 'active');

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, join_date, kota, status)
VALUES('Anissa', 'Pondok Kelapa 55', 'nissanis.id', 700, DATE '2019-05-03', 'Semarang', 'not active');

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, join_date, kota, status)
VALUES('Sandra', 'Pondok Gede Raya 77', 'sandra95.blog', 500, DATE '2019-07-21','Surabaya', 'active');

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, join_date, kota, status)
VALUES('Ahmad', 'Pondok Kopi 21', 'ahmadin.com', 2500, DATE '2019-07-27', 'Batam', 'active');

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, join_date, kota, status)
VALUES('Adam', 'Cendrawasih 91', 'adama.blog', 700, DATE '2019-08-23', 'Jakarta Timur', 'not active');

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, join_date, kota, status)
VALUES('Idris', 'Jalan Kenangan 1', 'drisi.com', 2700, DATE '2019-10-13', 'Semarang', 'not active');

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, join_date, kota, status)
VALUES('Anissa', 'Bunga Rampai Raya 13', '', 700, DATE '2019-10-13', 'Surabaya', 'active');

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, JOIN_DATE, kota, status)
VALUES('Sara', 'Harapan Indah 1', 'sara9.blog', 900, DATE '2019-11-21', 'Bekasi', 'not active');

INSERT INTO customers(NAME, ADDRESS, WEBSITE, CREDIT_LIMIT, join_date, kota, status)
VALUES('Zaky', 'Pisang Raya 3', '', 500, DATE '2019-11-27', 'Malang', 'active');

-- SELECT--
-----------
select * from customers;

select
    name,
    credit_limit,
    address
FROM
    customers;
    

--ORDER BY--
------------
--1. Mengurutkan baris dari kolom 
SELECT
    customer_id,
    name,
    credit_limit
FROM
    customers
ORDER BY
    name DESC;

--2. Mengurutkan baris dari beberapa kolom
SELECT
    customer_id,
    name,
    address
FROM
    customers
ORDER BY
    name,
    address DESC;

--3. Mengurutkan baris sesuai posisi kolom
SELECT
    name,
    credit_limit
FROM
    customers
ORDER BY
    2 DESC,
    1;
    
--4. Mengurutkan baris dengan nilai NULL
SELECT
    customer_id,
    name,
    website
FROM
    customers
ORDER BY
    website ASC NULLS FIRST;--NULLS LAST--

--5. Mengurutkan baris menurut Fungsi
SELECT
    customer_id,
    name
FROM
    customers
ORDER BY
    UPPER(name); --Urutkan Nama dan angka
    
--6. Mengurutkan Tanggal
SELECT 
    customer_id,
    name,
    join_date
FROM 
   customers
ORDER BY 
   join_date DESC;

--DISTINCT--
------------
--1. DISTINCT Satu Kolom
SELECT DISTINCT
    name
FROM
    customers
ORDER BY
    name;

--2. DISTINCT Dua Kolom atau lebih
SELECT DISTINCT 
    name,
    credit_limit
FROM
    customers
ORDER BY
    name;

--3. DISTINCT and NULL
SELECT DISTINCT
    website
FROM
    customers
ORDER BY
    website NULLS FIRST;


--WHERE--
---------
--1. Memilih baris dengan persamaan Operator
SELECT
    name,
    address,
    website
FROM
    customers
WHERE
    name = 'Anissa';

--2. Memilih baris dengan operator perbandingan
SELECT
    name,
    address,
    credit_limit
FROM
    customers
WHERE
    credit_limit <= 1000;

--3. Memilih baris dengan beberapa kondisi
SELECT
    name,
    address,
    credit_limit
FROM
    customers
WHERE
    credit_limit <= 1000
    AND website IS NOT NULL;

--4. Memilih baris yang nilainya diantara dua nilai
SELECT
    name,
    credit_limit
FROM
    customers
WHERE
    credit_limit BETWEEN 500 AND 1000
ORDER BY
    credit_limit;

SELECT
    name,
    address,
    credit_limit,
    join_date
FROM
    customers
WHERE
    join_date BETWEEN DATE '2019-10-01' AND DATE '2019-12-30';

--5. Memilih baris yang berada di dalam nilai list
SELECT
    name,
    credit_limit
FROM
    customers
WHERE
    credit_limit IN (500, 700)
ORDER BY
    credit_limit;

--6. Memilih baris yang nilainya bagian dari String
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


--AND--
-------
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

--OR--
------
--1. OR kombinasi dua boolean
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

--2. OR kombinasi lebih dari dua boolean
--Lebih baik pakai IN kalau banyak OR
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

--3. OR kombinasi dengan and
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
    
    
--FETCH--
---------

--IN--
------

--BETWEEN--
-----------

--LIKE--
--------

--IS NULL--
-----------

SELECT * FROM customers;