# Simple REST API

Project ini berisi aplikasi sederhana yang memiliki tiga endpoint:

1. `/info` : menampilkan informasi hostname dan ip address
2. `/produk/` : menampilkan data produk dari database
3. `/health` : health check endpoint

## Tech Stack ##

* ExpressJS
* PostgreSQL 18
* UUID sebagai Primary Key

## Persiapan Environment

### Prasyarat
- Node.js (versi 18 atau lebih tinggi)
- PostgreSQL (versi 18 atau lebih tinggi)
- npm

### Langkah-langkah Setup

1. **Clone repository**
   ```bash
   git clone <repository-url>
   cd simple-rest-api
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Setup database**
   - Buat database baru di PostgreSQL:
   ```sql
   CREATE DATABASE produkdb;
   ```

   - Import schema dan sample data:
   ```bash
   psql -h localhost -U postgres -d produkdb -f setup.sql
   ```

4. **Konfigurasi environment variables**
   - Copy file environment example:
   ```bash
   cp .env.example .env
   ```

   - Edit file `.env` sesuai konfigurasi database Anda:
   ```env
   # Database Configuration
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=produkdb
   DB_USER=postgres
   DB_PASSWORD=password_anda

   # Server Configuration
   PORT=3000
   ```

## Menjalankan Aplikasi

### Mode Development
```bash
npm run dev
```

### Mode Production
```bash
npm start
```

Aplikasi akan berjalan di http://localhost:3000

## Endpoint API

### GET /info
Menampilkan informasi sistem seperti hostname, IP address, platform, arsitektur, dan uptime.

**Response:**
```json
{
  "hostname": "localhost",
  "ip_address": "192.168.1.100",
  "platform": "darwin",
  "arch": "x64",
  "uptime": 1234.567
}
```

### GET /produk/
Menampilkan semua data produk dari database.

**Response:**
```json
{
  "status": "success",
  "data": [
    {
      "id": "550e8400-e29b-41d4-a716-446655440001",
      "nama": "Laptop ASUS ROG",
      "deskripsi": "Gaming laptop dengan RTX 4060",
      "harga": 15999000.00,
      "stok": 10,
      "kategori": "Elektronik",
      "created_at": "2024-01-01T00:00:00.000Z",
      "updated_at": "2024-01-01T00:00:00.000Z"
    }
  ],
  "count": 1
}
```

### GET /health
Health check endpoint untuk monitoring.

**Response:**
```json
{
  "status": "OK",
  "timestamp": "2024-01-01T00:00:00.000Z"
}
```

## Struktur Database

### Tabel Produk
- **id**: UUID (Primary Key, auto-generated)
- **nama**: VARCHAR(255) - Nama produk
- **deskripsi**: TEXT - Deskripsi produk
- **harga**: DECIMAL(10,2) - Harga produk
- **stok**: INTEGER - Jumlah stok
- **kategori**: VARCHAR(100) - Kategori produk
- **created_at**: TIMESTAMP - Waktu pembuatan record
- **updated_at**: TIMESTAMP - Waktu update record

## Troubleshooting

### Error: Database connection failed
Pastikan:
- PostgreSQL server sedang berjalan
- Database `produkdb` sudah dibuat
- Credential di file `.env` sudah benar
- User memiliki akses ke database

### Error: Missing required database environment variables
Aplikasi akan menampilkan error jika environment variables berikut tidak di-set:
- `DB_HOST`
- `DB_NAME`
- `DB_USER`
- `DB_PASSWORD`

### Sample data tidak muncul
Pastikan sudah menjalankan `setup.sql` untuk membuat tabel dan mengisi sample data.

## Build Docker Image ##

1. Melakukan build untuk `Dockerfile` yang sudah ada

    ```
    docker build -t nama-image .
    ```

    **Jangan lupa titik di akhir command, itu maksudnya untuk menyatakan bahwa build context adalah folder ini (dinyatakan dengan . )**

2. Menjalankan docker image

    ```
    docker run -p 3003:3000 -e DB_HOST=10.99.18.100 -e DB_PORT=12345 -e DB_NAME=cobadb -e DB_USER=coba -e DB_PASSWORD=test1234  aplikasi-produk
    ```

    Karena kita tidak memasukkan file `.env` ke dalam docker image, maka kita harus menyebutkan value yang dibutuhkan sebagai environment variable