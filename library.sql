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