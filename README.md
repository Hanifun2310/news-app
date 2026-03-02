Fitur Utama
Manajemen State GetX: Menggunakan pustaka get untuk navigasi dan kontrol state aplikasi.

Navigasi Terstruktur: Implementasi rute yang rapi melalui file app_pages.dart dan app_routes.dart.

Tema Modern: Mendukung Material 3 dengan skema warna indigo dan latar belakang yang bersih.

Interaktivitas: Kemampuan untuk membuka tautan eksternal menggunakan url_launcher.

Teknologi yang Digunakan
Framework: Flutter (SDK minimal ^3.10.7).

Manajemen State: GetX.

Ikon: Cupertino Icons.

Navigasi: GetPage Routing.

Struktur Proyek
Aplikasi ini mengikuti arsitektur modular yang umum digunakan pada pola GetX:

lib/main.dart: Titik masuk utama aplikasi dengan konfigurasi tema dan rute awal.

lib/app/routes/: Definisi navigasi aplikasi.

lib/app/modules/: Berisi folder modul (Dashboard, Home, Pencarian, Article Detail) yang masing-masing memiliki View, Controller, dan Binding sendiri.

Memulai (Getting Started)
Untuk menjalankan proyek ini secara lokal, ikuti langkah-langkah berikut:

Prasyarat: Pastikan Flutter SDK sudah terinstal di komputer Anda.

Clone Repository:

Bash
git clone [url-repository-anda]
Instal Dependensi: Jalankan perintah berikut di terminal:

Bash
flutter pub get
Jalankan Aplikasi:

Bash
flutter run
Dependensi Penting
get: ^4.7.3

url_launcher: ^6.3.2

cupertino_icons: ^1.0.8
