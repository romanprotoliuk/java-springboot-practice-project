package com.healthalgo.healthscore.services;

import com.healthalgo.healthscore.domain.User;
import com.healthalgo.healthscore.exceptions.EtAuthException;

public interface UserService {

    User validateUser(String email, String password) throws EtAuthException;

    User registerUser(String firstName, String lastName, String email, String password) throws EtAuthException;
}
