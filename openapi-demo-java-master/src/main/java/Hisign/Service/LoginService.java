package Hisign.Service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface LoginService {
    
    public String searchUser();
    public List<Map<String, String>> managerSearch(String loginName,String password);
    
}
