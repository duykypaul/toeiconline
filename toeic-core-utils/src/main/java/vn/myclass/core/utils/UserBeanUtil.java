package vn.myclass.core.utils;

import vn.myclass.core.dto.UserDTO;
import vn.myclass.core.persistence.entity.UserEntity;

public class UserBeanUtil {
    public static UserDTO entity2Dto(UserEntity entity) {
        UserDTO dto = new UserDTO();
        dto.setUserId(entity.getUserId());
        dto.setName(entity.getName());
        dto.setFullName(entity.getFullName());
        dto.setPassword(entity.getPassword());
        dto.setRoleDTO(RoleBeanUtil.entity2Dto(entity.getRoleEntity()));
        dto.setCreatedDate(entity.getCreatedDate());
        return dto;
    }

    public static UserEntity dto2Entity(UserDTO dto) {
        UserEntity entity = new UserEntity();
        entity.setUserId(dto.getUserId());
        entity.setName(dto.getName());
        entity.setFullName(dto.getFullName());
        entity.setPassword(dto.getPassword());
        entity.setRoleEntity(RoleBeanUtil.dto2Entity(dto.getRoleDTO()));
        entity.setCreatedDate(dto.getCreatedDate());
        return entity;
    }

}
