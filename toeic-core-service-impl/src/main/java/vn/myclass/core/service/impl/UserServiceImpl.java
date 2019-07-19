package vn.myclass.core.service.impl;

import vn.myclass.core.dao.UserDao;
import vn.myclass.core.daoimpl.UserDaoImpl;
import vn.myclass.core.dto.UserDTO;
import vn.myclass.core.persistence.entity.UserEntity;
import vn.myclass.core.service.UserService;
import vn.myclass.core.utils.UserBeanUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();
    public UserDTO isUserExist(UserDTO dto) {
        UserEntity entity = userDao.findUserByUsernameAndPassword(dto.getName(), dto.getPassword());
        return UserBeanUtil.entity2Dto(entity);
    }

    public UserDTO findRoleByUser(UserDTO dto) {
        UserEntity entity = userDao.findUserByUsernameAndPassword(dto.getName(), dto.getPassword());
        return UserBeanUtil.entity2Dto(entity);
    }

    public UserDTO findUserById(Integer userId) {
        UserEntity entity = userDao.findById(userId);
        UserDTO dto = UserBeanUtil.entity2Dto(entity);
        return dto;

    }

    public Object[] findUserByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        List<UserDTO> result = new ArrayList<UserDTO>();
        Object[] objects = userDao.findByProperty( property, sortExpression, sortDirection, offset, limit);
        for(UserEntity item: (List<UserEntity>)objects[1]){
            result.add(UserBeanUtil.entity2Dto(item));
        }
        objects[1] = result;
        return objects;
    }

    public void saveUser(UserDTO dto) {
        UserEntity entity = UserBeanUtil.dto2Entity(dto);
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        userDao.save(entity);
    }

    public UserDTO updateUser(UserDTO dto) {
        UserEntity entity = UserBeanUtil.dto2Entity(dto);
        entity = userDao.update(entity);
        dto = UserBeanUtil.entity2Dto(entity);
        return dto;
    }
}
