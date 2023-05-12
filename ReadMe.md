# **VIX IDX Partners Data Engineer**

## **Case Study**
1. Merestore Database dalam bentuk bk ke sql server
2. Membuat Database baru dengan Format yang sudah ditentukan dalam tugas
3. Implementasi ETL menggunakan talend 
4. Membuat Sample Procedure sesuai dengan format dan ketentuan dalam tugas

### **Melakukan Restore database**
Pada tahap ini dilakukan restore database staging.bak yang telah diberikan dari system Rakamin Academy. Hasil dari restore ini didapat 4 tabel yang terdiri dari tabel customer, product, sales order, status order. untuk lebih detailnya terdapat pada gambar dibawah :

##### **Table customer**

![image.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/c659daa029afca4090fbf0ad998c0f79a6289a6c/staging.customer.png) 

##### **Table product**

![image.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/c659daa029afca4090fbf0ad998c0f79a6289a6c/staging.product.png)

##### **Tabel sales_order**

![image.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/c659daa029afca4090fbf0ad998c0f79a6289a6c/staging.sales%20_order.png)

##### **Tabel Status_order**

![image.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/c659daa029afca4090fbf0ad998c0f79a6289a6c/staging.status_order.png)


Terdapat 4 tabel dengan 3 dimensinal table (customer, product, dan status_order) dan 1 fact table(sales_order). Pada masing -masing dimensional table terdapat Primary Key dan tabel fact memiliki Primary Key dan Foreign Key :
1. Pada table customer 'customer_id' menjadi Primary Key
2. Pada table product 'product_id' menjadi Primary Key
3. Pada table status_order 'status_id' menjadi Primary Key
4. Pada table sales_order 'order_id' menjadi Primary Key



### **Membuat Database baru**
Pada tahap ini dilakukan pembuatan data base baru dengan nama 'DWH_Project' degan melakukan Query sebagai berikut :
#### [Query Pembuatan Database](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/a4f9f7f675c32d827486557c8f8e7a3f6fd904b7/Create%20database.sql)


![alt text](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/2b53d6edd1747bb07542c10588ab9610d2a25d2c/DWH%20database.png)


### **Membuat Tabel Baru**
Pada tahap ini dilakukan pembuatan table baru dengan format menyesuaikan dengan table pada database staging, dengan hint nama tabel dimension di ubah dengan nama DimCustomer, DimProduct, DimStatusOrder dan tabel Fact dengan nama FactSalesOrder. Pada nama column dihilangkan '_' dan penggunaan Pascal_Case, contoh customer_id = CustomerID. Ditambah database staging tabel customer akan ada penggabungan column first_name dan last_nama menjadi CustomerName,  Query sebagai berikut :
#### [Query Pembuatan Table](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/a4f9f7f675c32d827486557c8f8e7a3f6fd904b7/Create%20Table.sql)

##### **Table Dimensional**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/a4f9f7f675c32d827486557c8f8e7a3f6fd904b7/DWH%20database%20dimensional.png) 

##### **Tabel Fact Table Dimensional**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/a4f9f7f675c32d827486557c8f8e7a3f6fd904b7/DWH%20database%20fact.png)


### **Implementasi ETL pada talend**

**1.  Menghubungkan database pada SQL Server dengan Talend**

Prosedur dilakukan dengan klik kiri pada meta data lalu klik kiri pada db Connection lalu pilih Create Connection, lalu akan muncul pop up seperti di bawah :

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/83dbaecfb04ae8b74723b2603c22d939fa77219b/DWH%20connect%201.png)

**Isi nama project sesuai dengan referensi sendiri, untuk purpose optional atau sesuai kebutuhan. Lalu klik Next, akan muncul pop up seperti di samping.**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/83dbaecfb04ae8b74723b2603c22d939fa77219b/DWH%20connect%202.png)

**Pilih penggunaan SQL Server dan isi connection sesuai dengan user yang di gunakan pada sql server, lalu test connection, jika succesful maka bisa dilanjutkan dengan mengklik finish. Talend akan otomatis terhubung dengan SQL server yang digunakan.**


**2.  Menarik atau mengambil table pada Database di SQL Server**

Pada pengambilan dilakukan dengan mengklik kanan pada conection yang telah terhubung lalu pilih Retrive Schema, akan muncul pop up sebagai berikut :

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/ambil%20scheme%20lengkap.png)

Pada pop up 1 pilih next lalu akan muncul pop up 2 lalu pilih format dbo karena format in merupakan format default dari sql server, seterlah itu klik next lalu muncul pop up 3 disini sudah bisa dilihat tabel yang akan di hubungkan kedalam taled, jika format sudah di setting dengan yang di inginkan maka klik finish. Tabel pun sudah masuk kedalam talend. Step tersebut dilakukan juga pada penghubungan database staging yang akan di transfer ke database DWH_Project.


**3.  Membuat Job Design**

Pada step ini dilakukan pembuatan design job dengan mengklik kanan pad Job Design lalu pilih Create Job. Pada Step ini job design pada tabel customer memerlukan adanya tmap karena akan ada penggabungan antara column first_name dan last_name mendjadi CustomerName. Step yang dilakukan Merubah Component pada tmap menjadi sebagai berikut :

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/etl.png)

Sebelumnya dilakukan setting pada component staging dan DWH Database, seperti berikut : 

**Staging Setting**


![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/Stagging.etl.png)

**DWH Setting**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/DWH.etl.png)

Pada tabel selain customer tidak diperlukan penggunaan tmap karena tidak ada perubahan dalam kolom, untuk tabel lain hanya di lakukan penyettingan component pada staging dan DWH database, dan penyesuaian tabel yanga akan di tranfer pada kedua database.

**4.  Job Design Yang Telah di Buat**

**A. Job Design Customer**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/job%20design.%20customer.png)

**B. Job Design Product**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/job%20design.%20product.png)

**C. Job Design Sales Order**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/job%20design.%20sales_order.png)

**D. Job Design Status Order**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/job%20design.%20status%20order.png)


**4. Hasil Dari ETL**

**DataBase**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/Proof%20Database.png)

**A. Tabel DimCustomer**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/table%20customer%20hasil.png)


**B. Tabel DimProduct**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/table%20product%20hasil.png)


**C. Tabel DimSalesOrder**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/table%20salesorder%20hasil.png)


**D. Tabel FactStatusOrder**

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/4d989de4834da9dea61206bfbb3419c376f0db4e/table%20statusorder%20hasil.png)



