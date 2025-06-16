CREATE TABLE kategori (
    id_kategori VARCHAR(255) PRIMARY KEY,
    nama_kategori VARCHAR(255)
);

CREATE TABLE rak_buku (
    id_rak_buku VARCHAR(255) PRIMARY KEY,
    kapasitas INT,
    no_rak VARCHAR(255)
);

CREATE TABLE petugas (
    id_petugas VARCHAR(255) PRIMARY KEY,
    nama_petugas VARCHAR(255)
);

CREATE TABLE peminjam (
    id_peminjam VARCHAR(255) PRIMARY KEY,
    nama_peminjam VARCHAR(255),
    alamat_peminjam VARCHAR(255),
    no_hp VARCHAR(255)
);

CREATE TABLE buku (
    id_buku VARCHAR(255) PRIMARY KEY,
    judul_buku VARCHAR(255),
    halaman INT,
    isbn VARCHAR(255),
    sinopsis VARCHAR(255),
    penulis VARCHAR(255),
    penerbit VARCHAR(255),
    tgl_rilis DATE,
    cetakan INT,
    id_petugas VARCHAR(255) REFERENCES petugas(id_petugas),
    id_kategori VARCHAR(255) REFERENCES kategori(id_kategori),
    id_rak_buku VARCHAR(255) REFERENCES rak_buku(id_rak_buku)
);

CREATE TABLE transaksi (
    id_transaksi VARCHAR(255) PRIMARY KEY,
    id_buku VARCHAR(255) REFERENCES buku(id_buku),
    id_peminjam VARCHAR(255) REFERENCES peminjam(id_peminjam),
    tgl_transaksi DATE,
    deadline DATE,
    dikembalikan BOOLEAN
);

INSERT INTO kategori(id_kategori, nama_kategori)
VALUES ('K1','Fiksi'), ('K2','Non-Fiksi'), ('K3','Komputer'), ('K4','Matematika'), ('K5','Biografi'),
('K6','Bisnis'), ('K7','Pengembangan Diri'), ('K8','Psikologi'), ('K9','Hukum'), ('K10','Sejarah');
SELECT * FROM kategori;

INSERT INTO rak_buku(id_rak_buku, kapasitas, no_rak)
VALUES ('RB1',100,'1'), ('RB2',100,'2'), ('RB3',100,'3'), ('RB4',100,'4'), ('RB5',100,'5'),
('RB6',100,'6'), ('RB7',100,'7'), ('RB8',100,'8'), ('RB9',100,'9'), ('RB10',100,'10');
SELECT * FROM rak_buku;

INSERT INTO petugas(id_petugas, nama_petugas)
VALUES ('PT1','Yusuf'), ('PT2','Faisal'), ('PT3','Yassir'), ('PT4','Nanda'), ('PT5','Naldy'),
('PT6','Dwi'), ('PT7','Hosea'), ('PT8','Denis'), ('PT9','Rizqo'), ('PT10','Galih');
SELECT * FROM petugas;

INSERT INTO peminjam(id_peminjam, nama_peminjam, alamat_peminjam, no_hp)
VALUES ('PM1','Bahtiar','Depok','082242429988'), ('PM2','Ilham','Bekasi','082242429987'), 
('PM3','Max','Bogor','082242429985'), ('PM4','Satria','Depok','082242429986'), 
('PM5','Davinda','Depok','082242429989'),('PM6','Setya','Bekasi','082242429981'), 
('PM7','Hosi','Jakarta','082242429912'), ('PM8','Rahmadan','Tangerang','082242429982'), 
('PM9','Rana','Tangerang','082242429942'), ('PM10','Naufal','Bogor','082242429983');
SELECT * FROM peminjam;

INSERT INTO buku(id_buku, judul_buku, halaman, isbn, sinopsis, penulis, penerbit, tgl_rilis, cetakan, id_petugas, id_kategori, id_rak_buku) VALUES
('B1','Sepatu Berkucing',32,'9786230423222','Moza si kucing kecil suka sekali bermain','Djoko Lelono', 'Bhuana Ilmu Populer','2025-03-17',1,'PT1','K1','RB1'),
('B2','The Magic Library',290,'9786024413743','Sebuah perpustakaan ajaib dan konspirasi dunia perbukuan','Jostein Gaarder', 'Mizan','2025-03-26',4,'PT1','K1','RB1'),
('B3','Warisan Dua Dunia',232,'9786231100696','Warisan Dua Dunia mengangkat tema budaya Tiongkok Indonesia, yakni Cap Go Meh','Shienny M S', 'Elex Media Komputindo','2025-02-03',1,'PT1','K1','RB1'),
('B4','Halte Alam Baka',280,'9786020682389','Jika kamu melihat seorang nenek di halte berwarna merah, mampirlah.','Kai Elian', 'Gramedia Pustaka Utama','2025-04-28',1,'PT1','K1','RB1'),
('B5','Ternyata Bukan Kamu Rumahnya',180,'9786234933314','Cerita tentang kehilangan, luka, dan akhirnya menemukan diri sendiri.','Sein Don', 'Gagas Media','2025-05-20',3,'PT5','K7','RB5'),
('B6','Ayah, Bolehkah Aku Membencimu?',146,'9786237191582','Setiap anak selalu punya cerita bersama orang tuanya. Ada yang bahagia, tapi ada juga yang penuh dengan luka.','Safi Sahri', 'Moka Media','2025-05-10',2,'PT5','K7','RB5'),
('B7','Menemukan Tenang Lewat Hilang',164,'9786022083931','Bagaimana caramu berhenti berharap pada manusia dan mulai merasa utuh dengan diri sendiri.','Finias Sanad', 'Gradien Mediatama','2025-02-21',1,'PT5','K7','RB5'),
('B8','Psikologi Hidup Kacau',148,'9786236042397','Kamu pasti pernah mengalami fase ketika pikiranmu terasa kacau hingga membuat hatimu menjadi galau.','Davin Davanka', 'Second Hope','2024-12-18',1,'PT5','K7','RB5'),
('B9','Melintasi Khatulistiwa',108,'9786238108930','Narasi perjalanan yang ditulis pada awal abad ke-20','Thomas H Reid', 'Ircisod','2025-05-03',5,'PT4','K10','RB3'),
('B10','Kaum Berber di Andalusia',456,'9786232202092','Kejayaan dan keagungan peradaban Islam di Andalusia pada era Daulah Umayyah yang sangat memengaruhi peradaban Eropa','Dr Muhammad Haqqi', 'Alvabet','2025-04-22',3,'PT4','K10','RB3');
SELECT * FROM buku;

INSERT INTO transaksi(id_transaksi, id_buku, id_peminjam, tgl_transaksi, deadline, dikembalikan)
VALUES
('T1','B1','PM1','2025-05-12','2025-05-19',TRUE),
('T2','B2','PM1','2025-05-12','2025-05-19',TRUE),
('T3','B3','PM1','2025-05-12','2025-05-19',TRUE),
('T4','B1','PM3','2025-05-20','2025-05-27',TRUE),
('T5','B2','PM3','2025-05-20','2025-05-27',TRUE),
('T6','B6','PM5','2025-05-21','2025-05-28',TRUE),
('T7','B7','PM5','2025-05-21','2025-05-28',TRUE),
('T8','B9','PM7','2025-05-23','2025-05-30',TRUE),
('T9','B10','PM7','2025-05-23','2025-05-30',TRUE),
('T10','B4','PM1','2025-05-24','2025-05-31',TRUE);
SELECT * FROM transaksi;

