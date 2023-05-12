# VIX IDX Partners Data Engineer

## Case Study
1. Merestore Database dalam bentuk bk ke sql server
2. Membuat Database baru dengan Format yang sudah ditentukan dalam tugas
3. Implementasi ETL menggunakan talend 
4. Membuat Sample Procedure sesuai dengan format dan ketentuan dalam tugas

### Melakukan Restore database
Pada tahap ini dilakukan restore database staging.bak yang telah diberikan dari system Rakamin Academy. Hasil dari restore ini didapat 4 tabel yang terdiri dari tabel customer, product, sales order, status order. untuk lebih detailnya terdapat pada gambar dibawah :

![alt text](https://github.com/Ujeeg/VIX-ID-X-Pertners-Data-Engineer/blob/2b53d6edd1747bb07542c10588ab9610d2a25d2c/DWH%20database.png)

Terdapat 4 tabel dengan 3 dimensinal table (customer, product, dan status_order) dan 1 fact table(sales_order). Pada masing -masing dimensional table terdapat Primary Key dan tabel fact memiliki Primary Key dan Foreign Key :
1. Pada table customer 'customer_id' menjadi Primary Key
2. Pada table product 'product_id' menjadi Primary Key
3. Pada table status_order 'status_id' menjadi Primary Key
4. Pada table sales_order 'order_id' menjadi Primary Key

### Membuat Database baru
Pada tahap ini dilakukan pembuatan data base baru dengan nama 'DWH_Project' degan melakukan Query sebagai berikut :

gambar

### MEMbuat Tabel Baru
Pada tahap ini dilakukan pembuatan table baru dengan format menyesuaikan dengan table pada database staging, dengan hint nama tabel dimension di ubah dengan nama DimCustomer, DimProduct, DimStatusOrder dan tabel Fact dengan nama FactSalesOrder. Pada nama column dihilangkan '_' dan penggunaan Pascal_Case, contoh customer_id = CustomerID. Ditambah database staging tabel customer akan ada penggabungan column first_name dan last_nama menjadi CustomerName,  Query sebagai berikut :

Gambar

### Implementasi ETL pada talend
