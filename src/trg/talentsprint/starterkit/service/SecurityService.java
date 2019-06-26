package trg.talentsprint.starterkit.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
