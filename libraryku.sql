CREATE TABLE "petugas" (
  "id" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "rak_buku" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "petugas_id" int
);

CREATE TABLE "kategori" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "rak_buku_id" int
);

CREATE TABLE "buku" (
  "id" int PRIMARY KEY,
  "judul" varchar,
  "kategori_id" int
);

CREATE TABLE "peminjaman" (
  "id" int PRIMARY KEY,
  "nama_peminjam" varchar,
  "tanggal_pinjam" date,
  "tanggal_kembali" date,
  "status" varchar,
  "buku_id" int
);

ALTER TABLE "rak_buku" ADD FOREIGN KEY ("petugas_id") REFERENCES "petugas" ("id");

ALTER TABLE "kategori" ADD FOREIGN KEY ("rak_buku_id") REFERENCES "rak_buku" ("id");

ALTER TABLE "buku" ADD FOREIGN KEY ("kategori_id") REFERENCES "kategori" ("id");

ALTER TABLE "peminjaman" ADD FOREIGN KEY ("buku_id") REFERENCES "buku" ("id");
