package com.doamamah.edutrack.quiz.service;

import com.doamamah.edutrack.quiz.model.Quiz;
import com.doamamah.edutrack.quiz.model.QuizQuestion;
import com.doamamah.edutrack.quiz.repository.QuizRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * Service layer untuk operasi CRUD kuis.
 */
@Service
public class QuizService {

    private final QuizRepository quizRepository;

    public QuizService(QuizRepository quizRepository) {
        this.quizRepository = quizRepository;
    }

    /**
     * Mengambil semua kuis dari database.
     */
    public List<Quiz> getAllQuizzes() {
        return quizRepository.findAll();
    }

    /**
     * Mengambil kuis berdasarkan ID.
     */
    public Optional<Quiz> getQuizById(Long id) {
        return quizRepository.findById(id);
    }

    /**
     * Membuat kuis baru beserta pertanyaannya.
     */
    public Quiz createQuiz(Quiz quiz) {
        // Pastikan relasi bidirectional terjaga
        if (quiz.getQuestions() != null) {
            for (QuizQuestion q : quiz.getQuestions()) {
                q.setQuiz(quiz);
            }
        }
        return quizRepository.save(quiz);
    }

    /**
     * Memperbarui kuis yang sudah ada.
     */
    public Quiz updateQuiz(Long id, Quiz updatedData) {
        Quiz existing = quizRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Kuis dengan ID " + id + " tidak ditemukan."));

        existing.setTitle(updatedData.getTitle());
        existing.setDescription(updatedData.getDescription());
        existing.setDifficulty(updatedData.getDifficulty());

        // Hapus pertanyaan lama dan tambahkan yang baru
        existing.getQuestions().clear();
        if (updatedData.getQuestions() != null) {
            for (QuizQuestion q : updatedData.getQuestions()) {
                q.setQuiz(existing);
                existing.getQuestions().add(q);
            }
        }

        return quizRepository.save(existing);
    }

    /**
     * Menghapus kuis berdasarkan ID.
     */
    public void deleteQuiz(Long id) {
        if (!quizRepository.existsById(id)) {
            throw new RuntimeException("Kuis dengan ID " + id + " tidak ditemukan.");
        }
        quizRepository.deleteById(id);
    }
}
