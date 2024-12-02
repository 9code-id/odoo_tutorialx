# Bagaimana saya menginstall ODOO
- Bisa lihat dari dokumentasinya langsung di situsnya atau
- Mencoba quickstart dari situs resminya (Trial 14 hari)

# Apa database yang kita gunakan?
- Login ke ODOO
- Klik icon profile di kanan atas
- Pilih My databases
- Disana sharusnya muncul nama database yang kita butuhkan

# Apa yang diperlukan untuk menjalankan project ini?
- Mengatur host, database, username dan password di env.dart
* username dan password sama dengan yang kita gunakan untuk login ke Odoo

# Mengaktif debug mode pada Web ODOO
- Tambahkan parameter debug=1
- Contoh: https://denyocr.odoo.com/odoo/contacts/1?debug=1

# Methods yang tersedia di ODOO
https://www.odoo.com/documentation/18.0/developer/reference/external_api.html#calling-methods
- search_read
- search_count
- create
- write (update)
- unlink (delete)

# Materi
- Setup ODOO Trial di https://www.odoo.com/
- Verifikasi akun Odoo
- Mendapatkan url, database, username dan password

- Setup ODOO di Flutter
dart pub add odoo_rpc intl
setup host, database, username dan password di env.dart
- basic auth, login dan logout
- Membuat Service untuk READ, CREATE, UPDATE dan DELETE Operation
- Menguji Service di Terminal

- Mengimplementasikan Service di UI Flutter (READ, CREATE, UPDATE dan DELETE)
- QA