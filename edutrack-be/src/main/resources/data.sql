-- =====================================================================
-- EduTrack - Data Awal (Seed Data)
-- File ini dieksekusi otomatis oleh Spring Boot saat aplikasi pertama kali dijalankan.
-- =====================================================================

-- ===== SEED USERS =====
-- Password: 123 (plain text, sesuai kebutuhan tugas)
-- Kolom dipisah per-role agar tidak bentrok dengan H2 check constraint

MERGE INTO users (id, role, username, password, full_name, email, student_id, enrolled_courses)
KEY(username) VALUES
(1, 'STUDENT', 'siswa', '123', 'Budi Santoso', 'budi@demo.com', 'STD001', 4);

MERGE INTO users (id, role, username, password, full_name, email, teacher_id, specialization, total_courses)
KEY(username) VALUES
(2, 'TEACHER', 'guru', '123', 'Ibu Sari Dewi', 'sari@demo.com', 'TCH001', 'Pemrograman Java', 4);

-- ===== SEED COURSE MATERIALS =====

MERGE INTO course_materials (id, title, description, type, video_url, duration_minutes, text_content)
KEY(id) VALUES
(1, 'Pengantar Pemrograman Berorientasi Objek',
 'Pengantar konsep-konsep dasar OOP: kelas, objek, enkapsulasi, dan lebih banyak lagi.',
 'VIDEO', 'https://www.youtube.com/watch?v=grEKMHGYyns', 45, NULL);

MERGE INTO course_materials (id, title, description, type, video_url, duration_minutes, text_content)
KEY(id) VALUES
(2, 'Konsep Inheritance dalam Java',
 'Penjelasan lengkap tentang pewarisan (inheritance) di Java dengan contoh nyata.',
 'TEXT', NULL, 0,
 'Inheritance (Pewarisan) adalah salah satu pilar utama OOP.

Dalam Java, kelas dapat mewarisi properti dan metode dari kelas lain menggunakan kata kunci ''extends''.

Contoh:
public class Hewan {
    private String nama;
    public void bersuara() { System.out.println("..."); }
}

public class Anjing extends Hewan {
    @Override
    public void bersuara() { System.out.println("Guk!"); }
}

Dengan inheritance, kelas Anjing mewarisi semua anggota dari Hewan dan dapat meng-override perilaku yang perlu diubah.

Keuntungan Inheritance:
1. Reusability - kode dapat digunakan kembali
2. Extendability - mudah dikembangkan
3. Polymorphism - mendukung polimorfisme');

MERGE INTO course_materials (id, title, description, type, video_url, duration_minutes, text_content)
KEY(id) VALUES
(3, 'Polymorphism dan Dynamic Dispatch',
 'Memahami polimorfisme di Java melalui method overriding dan dynamic dispatch.',
 'VIDEO', 'https://www.youtube.com/watch?v=U8yjyEs40gI', 60, NULL);

MERGE INTO course_materials (id, title, description, type, video_url, duration_minutes, text_content)
KEY(id) VALUES
(4, 'Abstraksi dengan Abstract Class & Interface',
 'Pelajari cara menggunakan abstract class dan interface untuk menerapkan abstraksi.',
 'TEXT', NULL, 0,
 'Abstraksi adalah konsep menyembunyikan detail implementasi dan hanya menampilkan fungsionalitas yang relevan kepada pengguna.

Di Java, abstraksi dapat dicapai dengan:
1. Abstract Class
2. Interface

Abstract Class:
- Tidak dapat diinstansiasi langsung
- Dapat memiliki metode abstrak dan non-abstrak
- Gunakan kata kunci ''abstract''

Interface:
- Semua metode secara default adalah abstrak (sebelum Java 8)
- Dapat memiliki default methods (Java 8+)
- Satu kelas dapat mengimplementasikan banyak interface');

-- ===== SEED QUIZZES =====

MERGE INTO quizzes (id, title, description, difficulty)
KEY(id) VALUES
(1, 'Kuis: Dasar OOP', '3 soal pilihan ganda tentang konsep OOP dasar.', 'Mudah');

MERGE INTO quizzes (id, title, description, difficulty)
KEY(id) VALUES
(2, 'Kuis: Inheritance & Polymorphism', '3 soal pilihan ganda tentang pewarisan dan polimorfisme di Java.', 'Sedang');

-- ===== SEED QUIZ QUESTIONS (Kuis 1: Dasar OOP) =====

MERGE INTO quiz_questions (id, quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option_index)
KEY(id) VALUES
(1, 1,
 'Manakah yang merupakan pilar utama dalam Object-Oriented Programming (OOP)?',
 'Inheritance, Polymorphism, Encapsulation, Abstraction',
 'Compilation, Interpretation, Execution',
 'Variables, Loops, Conditions',
 'HTML, CSS, JavaScript',
 0);

MERGE INTO quiz_questions (id, quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option_index)
KEY(id) VALUES
(2, 1,
 'Apakah fungsi utama dari Encapsulation (Pewadahan) dalam OOP?',
 'Membuat variabel global di seluruh program',
 'Menyembunyikan detail implementasi kelas dan membatasi akses langsung ke data',
 'Menghubungkan database eksternal dengan sistem lokal',
 'Mempercepat waktu eksekusi program Java',
 1);

MERGE INTO quiz_questions (id, quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option_index)
KEY(id) VALUES
(3, 1,
 'Pilar OOP yang memungkinkan objek baru mewarisi sifat dari objek induknya adalah...',
 'Polymorphism',
 'Abstraction',
 'Inheritance',
 'Encapsulation',
 2);

-- ===== SEED QUIZ QUESTIONS (Kuis 2: Inheritance & Polymorphism) =====

MERGE INTO quiz_questions (id, quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option_index)
KEY(id) VALUES
(4, 2,
 'Kata kunci (keyword) yang digunakan di Java untuk menerapkan pewarisan kelas (inheritance) adalah...',
 'implements',
 'extends',
 'inherits',
 'super',
 1);

MERGE INTO quiz_questions (id, quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option_index)
KEY(id) VALUES
(5, 2,
 'Apa yang dimaksud dengan Polymorphism (Polimorfisme) dalam OOP?',
 'Kemampuan suatu objek memiliki banyak bentuk/implementasi metode yang berbeda',
 'Membagi kode menjadi beberapa modul terpisah',
 'Membuat banyak class dalam satu file',
 'Proses mengamankan program dari serangan hacker',
 0);

MERGE INTO quiz_questions (id, quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option_index)
KEY(id) VALUES
(6, 2,
 'Keyword ''super'' di Java digunakan untuk...',
 'Membuat objek baru dari kelas induk',
 'Mengakses konstruktor, metode, atau variabel dari parent class',
 'Mengakhiri eksekusi program secara paksa',
 'Mendeklarasikan konstanta global',
 1);
