package vn.myclass.core.service.impl;

import vn.myclass.core.dao.RoleDao;
import vn.myclass.core.daoimpl.RoleDaoImpl;
import vn.myclass.core.dto.RoleDTO;
import vn.myclass.core.persistence.entity.RoleEntity;
import vn.myclass.core.service.RoleService;
import vn.myclass.core.utils.RoleBeanUtil;

import java.util.ArrayList;
import java.util.List;

public class RoleServiceImpl implements RoleService {
    RoleDao roleDao = new RoleDaoImpl();
    public List<RoleDTO> findAll() {
        List<RoleEntity> roleEntities = roleDao.findAll();
        List<RoleDTO> dtos = new ArrayList<RoleDTO>();
        for(RoleEntity item : roleEntities) {
            dtos.add(RoleBeanUtil.entity2Dto(item));
        }
        return dtos;
    }
}
