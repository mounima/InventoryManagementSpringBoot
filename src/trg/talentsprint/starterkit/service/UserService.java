package trg.talentsprint.starterkit.service;

import trg.talentsprint.starterkit.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
