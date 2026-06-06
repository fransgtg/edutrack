package com.doamamah.edutrack.quiz.repository;

import com.doamamah.edutrack.quiz.model.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repository untuk akses data Quiz dari database.
 */
@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {
}
