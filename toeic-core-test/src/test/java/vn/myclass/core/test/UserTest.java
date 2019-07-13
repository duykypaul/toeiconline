package vn.myclass.core.test;

import org.apache.log4j.Logger;
import org.junit.Test;
import vn.myclass.core.dao.UserDao;
import vn.myclass.core.daoimpl.UserDaoImpl;
import vn.myclass.core.persistence.entity.UserEntity;

public class UserTest {
    private transient final Logger log = Logger.getLogger(this.getClass());
    @Test
    public void checkIsUserExist(){
        UserDao userDao = new UserDaoImpl();
        UserEntity entity = userDao.findUserByUsernameAndPassword("duykypaul", "123456");
        if(entity != null){
            log.error("success");
        } else {
            log.error("fail");
        }
    }

    @Test
    public void checkFindRoleByUser(){
        UserDao userDao = new UserDaoImpl();
        UserEntity entity = userDao.findUserByUsernameAndPassword("duykypaul", "123456");
        log.error(entity.getRoleEntity().getRoleId() + "-" + entity.getRoleEntity().getName());
    }
}
