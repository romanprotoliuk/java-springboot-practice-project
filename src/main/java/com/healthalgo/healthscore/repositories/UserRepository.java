package com.healthalgo.healthscore.repositories;

import com.healthalgo.healthscore.domain.User;
import com.healthalgo.healthscore.exceptions.EtAuthException;

public interface UserRepository {

    Integer create(String firstName, String lastName, String email, String password) throws EtAuthException;

    User findByEmailAndPassword(String email, String password) throws EtAuthException;

    Integer getCountByEmail(String email);

    User findById(Integer userId);
}
