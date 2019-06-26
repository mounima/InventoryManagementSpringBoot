package trg.talentsprint.starterkit.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import trg.talentsprint.starterkit.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
