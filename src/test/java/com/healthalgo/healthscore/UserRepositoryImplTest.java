package com.healthalgo.healthscore;

import com.healthalgo.healthscore.repositories.UserRepository;
import com.healthalgo.healthscore.repositories.UserRepositoryImpl;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

// Import necessary dependencies and annotations for testing

public class UserRepositoryImplTest {

    // Create an instance of UserRepositoryImpl or use dependency injection

    @Test
    public void testCreate() {
        // Arrange
        UserRepository userRepository = new UserRepositoryImpl();

        String firstName = "John";
        String lastName = "Doe";
        String email = "johndoe@example.com";
        String password = "test123";

        // Act
        Integer userId = userRepository.create(firstName, lastName, email, password);

        // Assert
        Assertions.assertNotNull(userId, "User ID should not be null");
        // Additional assertions as per your requirements
    }
}

