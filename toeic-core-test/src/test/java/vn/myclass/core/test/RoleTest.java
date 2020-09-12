package vn.myclass.core.test;

import org.junit.Test;
import vn.myclass.core.dao.RoleDao;
import vn.myclass.core.daoimpl.RoleDaoImpl;
import vn.myclass.core.persistence.entity.RoleEntity;

import java.util.ArrayList;
import java.util.List;

public class RoleTest {
    @Test
    public void checkFindAll(){
        RoleDao roleDao = new RoleDaoImpl();
        List<RoleEntity> list = roleDao.findAll();
    }
    @Test
    public void checkUpdateRole(){
        RoleDao roleDao = new RoleDaoImpl();
        RoleEntity roleEntity = new RoleEntity();
        roleEntity.setRoleId(2);
        roleEntity.setName("USER");
        roleDao.update(roleEntity);
    }

    @Test
    public void checkSaveRole(){
        RoleDao roleDao = new RoleDaoImpl();
        RoleEntity roleEntity = new RoleEntity();
        roleEntity.setRoleId(1);
        roleEntity.setName("ADMIN");
        roleDao.save(roleEntity);
    }

    @Test
    public void checkRoleFindById(){
        RoleDao roleDao = new RoleDaoImpl();
        RoleEntity roleEntity = roleDao.findById(1);

    }

    @Test
    public void checkRoleFindByProperty(){
        RoleDao roleDao = new RoleDaoImpl();
        String property = null;
        Object value = null;
        String sortExpression = null;
        String sortDirection = null;
        Integer offset = null;
        Integer limit = null;
//        Object[] objects = roleDao.findByProperty(property, value, sortExpression, sortDirection, offset, limit);
    }

    @Test
    public void checkRoleDelete(){
        RoleDao roleDao = new RoleDaoImpl();
        List<Integer> listId = new ArrayList<Integer>();
        listId.add(1);
//        listId.add(2);
        Integer count = roleDao.delete(listId);
    }
}
