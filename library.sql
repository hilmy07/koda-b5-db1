CREATE TABLE petugas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE rak_buku (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    petugas_id INT NOT NULL,
    CONSTRAINT fk_rak_petugas
        FOREIGN KEY (petugas_id)
        REFERENCES petugas(id)
        ON DELETE CASCADE
);

CREATE TABLE kategori (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    rak_buku_id INT NOT NULL,
    CONSTRAINT fk_kategori_rak
        FOREIGN KEY (rak_buku_id)
        REFERENCES rak_buku(id)
        ON DELETE CASCADE
);

CREATE TABLE buku (
    id SERIAL PRIMARY KEY,
    judul VARCHAR(200) NOT NULL,
    kategori_id INT NOT NULL,
    CONSTRAINT fk_buku_kategori
        FOREIGN KEY (kategori_id)
        REFERENCES kategori(id)
        ON DELETE CASCADE
);

CREATE TABLE peminjaman (
    id SERIAL PRIMARY KEY,
    nama_peminjam VARCHAR(100) NOT NULL,
    buku_id INT NOT NULL,
    tanggal_pinjam DATE NOT NULL DEFAULT CURRENT_DATE,
    tanggal_kembali DATE,
    status VARCHAR(20) DEFAULT 'dipinjam',
    CONSTRAINT fk_peminjaman_buku
        FOREIGN KEY (buku_id)
        REFERENCES buku(id)
        ON DELETE CASCADE
);

INSERT INTO petugas (name) VALUES
('Hilmy'),
('Rizky'),
('Siti Aisyah'),
('Budi Santoso'),
('Dewi Lestari'),
('Ahmad Fauzi'),
('Nurul Huda'),
('Rina Anggraini'),
('Fajar Hidayat'),
('Salsa Kamila');

INSERT INTO rak_buku (name, petugas_id) VALUES
('Rak Fiksi', 1),
('Rak Non-Fiksi', 2),
('Rak Teknologi', 3),
('Rak Sejarah', 4),
('Rak Komik', 5),
('Rak Sains', 6),
('Rak Psikologi', 7),
('Rak Agama', 8),
('Rak Bahasa', 9),
('Rak Bisnis', 10);

INSERT INTO kategori (name, rak_buku_id) VALUES
('Novel', 1),
('Biografi', 2),
('Pemrograman', 3),
('Perang Dunia', 4),
('Manga', 5),
('Fisika', 6),
('Psikologi Klinis', 7),
('Hadis', 8),
('Bahasa Inggris', 9),
('Manajemen Keuangan', 10);

INSERT INTO buku (judul, kategori_id) VALUES
('Laskar Pelangi', 1),
('Steve Jobs', 2),
('Belajar Go-Lang Untuk Pemula', 3),
('Sejarah Perang Dunia II', 4),
('Naruto Vol. 1', 5),
('Fisika Modern', 6),
('Pengantar Psikologi Klinis', 7),
('Hadis Arbain Nawawi', 8),
('English Grammar in Use', 9),
('Dasar-Dasar Manajemen Keuangan', 10);

INSERT INTO peminjaman (nama_peminjam, buku_id, tanggal_pinjam, tanggal_kembali, status) VALUES
('Andi', 1, '2025-01-10', NULL, 'dipinjam'),
('Rina', 2, '2025-01-08', '2025-01-20', 'dikembalikan'),
('Hafiz', 3, '2025-01-09', NULL, 'dipinjam'),
('Salsa', 4, '2025-01-05', '2025-01-15', 'dikembalikan'),
('Kevin', 5, '2025-01-12', NULL, 'dipinjam'),
('Yusuf', 6, '2025-01-11', NULL, 'dipinjam'),
('Sari', 7, '2025-01-14', '2025-01-26', 'dikembalikan'),
('Putri', 8, '2025-01-15', NULL, 'dipinjam'),
('Dafa', 9, '2025-01-16', '2025-01-30', 'dikembalikan'),
('Bima', 10, '2025-01-10', NULL, 'dipinjam');
