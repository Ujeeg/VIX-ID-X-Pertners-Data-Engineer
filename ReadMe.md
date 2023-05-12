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

Isi nama project sesuai dengan referansi sendiri, untuk purpose optional atau sesuai kebutuhan. Lalu klik Next, akan muncul pop up seperti di samping.

![img.png](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/83dbaecfb04ae8b74723b2603c22d939fa77219b/DWH%20connect%202.png)

Pilih penggunaan SQL Server dan isi connection sesuai dengan user yang di gunakan pada sql server, lalu test connection, jika succesful maka bisa dilanjutkan dengan mengklik finish. Talend akan otomatis terhubung dengan SQL server yang digunakan.
