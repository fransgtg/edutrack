package com.doamamah.edutrack.quiz.controller;

import com.doamamah.edutrack.quiz.model.Quiz;
import com.doamamah.edutrack.quiz.service.QuizService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * REST Controller untuk operasi CRUD kuis.
 * Menyediakan endpoint /api/quizzes.
 */
@RestController
@RequestMapping("/api/quizzes")
public class QuizController {

    private final QuizService quizService;

    public QuizController(QuizService quizService) {
        this.quizService = quizService;
    }

    /**
     * GET /api/quizzes
     * Mengambil semua kuis dari database.
     */
    @GetMapping
    public ResponseEntity<List<Quiz>> getAllQuizzes() {
        return ResponseEntity.ok(quizService.getAllQuizzes());
    }

    /**
     * GET /api/quizzes/{id}
     * Mengambil kuis berdasarkan ID beserta pertanyaannya.
     */
    @GetMapping("/{id}")
    public ResponseEntity<?> getQuizById(@PathVariable Long id) {
        return quizService.getQuizById(id)
                .map(quiz -> ResponseEntity.ok((Object) quiz))
                .orElse(ResponseEntity.status(HttpStatus.NOT_FOUND)
                        .body(Map.of("error", "Kuis dengan ID " + id + " tidak ditemukan.")));
    }

    /**
     * POST /api/quizzes
     * Membuat kuis baru beserta pertanyaannya.
     */
    @PostMapping
    public ResponseEntity<Quiz> createQuiz(@RequestBody Quiz quiz) {
        Quiz saved = quizService.createQuiz(quiz);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    /**
     * PUT /api/quizzes/{id}
     * Memperbarui kuis yang sudah ada.
     */
    @PutMapping("/{id}")
    public ResponseEntity<?> updateQuiz(@PathVariable Long id, @RequestBody Quiz quiz) {
        try {
            Quiz updated = quizService.updateQuiz(id, quiz);
            return ResponseEntity.ok(updated);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", e.getMessage()));
        }
    }

    /**
     * DELETE /api/quizzes/{id}
     * Menghapus kuis berdasarkan ID.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteQuiz(@PathVariable Long id) {
        try {
            quizService.deleteQuiz(id);
            return ResponseEntity.ok(Map.of("message", "Kuis berhasil dihapus."));
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("error", e.getMessage()));
        }
    }
}
