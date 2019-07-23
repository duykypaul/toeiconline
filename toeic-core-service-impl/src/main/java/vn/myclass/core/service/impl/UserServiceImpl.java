package vn.myclass.core.service.impl;

import org.apache.commons.lang.StringUtils;
import vn.myclass.core.dto.CheckLoginDTO;
import vn.myclass.core.dto.UserDTO;
import vn.myclass.core.dto.UserImportDTO;
import vn.myclass.core.persistence.entity.RoleEntity;
import vn.myclass.core.persistence.entity.UserEntity;
import vn.myclass.core.service.UserService;
import vn.myclass.core.service.utils.SingletonDaoUtil;
import vn.myclass.core.utils.UserBeanUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    public CheckLoginDTO checkLogin(String name, String password) {
        CheckLoginDTO checkLoginDTO = new CheckLoginDTO();
        if(name != null && password != null){
            Object[] objects = SingletonDaoUtil.getUserDaoInstance().checkLogin(name, password);
            checkLoginDTO.setUserExist((Boolean) objects[0]);
            if(checkLoginDTO.isUserExist()){
                checkLoginDTO.setRoleName(objects[1].toString());
            }
        }
        return checkLoginDTO;
    }

    public UserDTO findUserById(Integer userId) {
        UserEntity entity = SingletonDaoUtil.getUserDaoInstance().findById(userId);
        UserDTO dto = UserBeanUtil.entity2Dto(entity);
        return dto;

    }

    public Object[] findUserByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        List<UserDTO> result = new ArrayList<UserDTO>();
        Object[] objects = SingletonDaoUtil.getUserDaoInstance().findByProperty( property, sortExpression, sortDirection, offset, limit);
        for(UserEntity item: (List<UserEntity>)objects[1]){
            result.add(UserBeanUtil.entity2Dto(item));
        }
        objects[1] = result;
        return objects;
    }

    public void saveUser(UserDTO dto) {
        dto.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        UserEntity entity = UserBeanUtil.dto2Entity(dto);
        SingletonDaoUtil.getUserDaoInstance().save(entity);
    }

    public UserDTO updateUser(UserDTO dto) {
        UserEntity entity = UserBeanUtil.dto2Entity(dto);
        entity = SingletonDaoUtil.getUserDaoInstance().update(entity);
        dto = UserBeanUtil.entity2Dto(entity);
        return dto;
    }

    public void validateImportUser(List<UserImportDTO> userImportDTOS) {
        List<String> names = new ArrayList<String>();
        List<String> roles = new ArrayList<String>();

        for(UserImportDTO item : userImportDTOS){
            if(item.isValid()){
                names.add(item.getUserName());
                if(!roles.contains(item.getRoleName())){
                    roles.add(item.getRoleName());
                }
            }
        }

        Map<String, UserEntity> userEntityMap = new HashMap<String, UserEntity>();
        Map<String, RoleEntity> roleEntityMap = new HashMap<String, RoleEntity>();

        if(names.size() > 0) {
            List<UserEntity> userEntities = SingletonDaoUtil.getUserDaoInstance().findByUsers(names);
            for(UserEntity item : userEntities){
                userEntityMap.put(item.getName().toUpperCase(), item);
            }
        }
        if (roles.size() > 0) {
            List<RoleEntity> roleEntities = SingletonDaoUtil.getRoleDaoInstance().findByRoles(roles);
            for (RoleEntity item: roleEntities) {
                roleEntityMap.put(item.getName().toUpperCase(), item);
            }
        }

        for(UserImportDTO item : userImportDTOS) {
            String message = (item.getError() == null)? "" : item.getError();
            if(item.isValid()) {
                UserEntity userEntity = userEntityMap.get(item.getUserName().toUpperCase());
                if(userEntity != null){
                    if (StringUtils.isNotBlank(message)) {
                        message += "<br/>";
                    }
                    message += "Tên đăng nhập đã tồn tại";
                }

                RoleEntity roleEntity = roleEntityMap.get(item.getRoleName().toUpperCase());
                if(roleEntity == null) {
                    if (StringUtils.isNotBlank(message)) {
                        message += "<br/>";
                    }
                    message += "Vai trò không tồn tại";
                }

                if (StringUtils.isNotBlank(message)) {
                    item.setValid(false);
                    item.setError(message);
                }
            }
        }
    }

    public void saveUserImport(List<UserImportDTO> userImportDTOS) {
        for(UserImportDTO item : userImportDTOS){
            if(item.isValid()){
                UserEntity entity = new UserEntity();
                entity.setName(item.getUserName());
                entity.setPassword(item.getPassword());
                entity.setFullName(item.getFullName());
                entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
                entity.setRoleEntity(SingletonDaoUtil.getRoleDaoInstance().findEqualsUnique("name", item.getRoleName().toUpperCase()));
                SingletonDaoUtil.getUserDaoInstance().save(entity);
            }
        }
    }
}
