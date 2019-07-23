package vn.myclass.core.service;

import vn.myclass.core.dto.CheckLoginDTO;
import vn.myclass.core.dto.UserDTO;
import vn.myclass.core.dto.UserImportDTO;

import java.util.List;
import java.util.Map;

public interface UserService {
    CheckLoginDTO checkLogin(String name, String password);
    UserDTO findUserById(Integer userId);
    Object[] findUserByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit);
    void saveUser(UserDTO dto);
    UserDTO updateUser(UserDTO dto);
    void validateImportUser(List<UserImportDTO> userImportDTOS);
}
