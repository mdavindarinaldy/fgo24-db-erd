# Perpustakan - ERD

This project was made by Muhammad Davinda Rinaldy in Training Program held by Kodacademy to make a ERD of library using mermaid tool.

## Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    direction LR
    BUKU {
        string id_buku PK
        string judul
        int halaman
        string isbn
        string sinopsis
        string penulis
        string penerbit
        date tgl_rilis
        int cetakan
        string id_petugas FK
        string id_kategori FK
        string id_rak_buku FK
    }
    KATEGORI {
        string id_kategori PK
        string nama
    }
    RAK_BUKU {
        string id_rak_buku PK
        int kapasitas
        string no_rak
    }
    PETUGAS {
        string id_petugas PK
        string nama
    }
    PEMINJAM {
        string id_peminjam PK
        string nama
        string alamat
        string no_hp
    }
    TRANSAKSI {
        string id_transaksi PK
        string id_buku FK
        string id_peminjam FK
        date tgl_transaksi
        date deadline
        bool dikembalikan
    }
    KATEGORI ||--o{ BUKU: dimiliki
    RAK_BUKU }o--|| BUKU: menyimpan
    BUKU ||--o{ PETUGAS: dikelola
    BUKU ||--o{ TRANSAKSI: memiliki
    PEMINJAM ||--o{ TRANSAKSI: melakukan
```
