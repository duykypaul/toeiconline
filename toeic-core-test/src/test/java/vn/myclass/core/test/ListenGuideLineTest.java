package vn.myclass.core.test;

import org.junit.Test;
import vn.myclass.core.dao.ListenGuideLineDao;
import vn.myclass.core.daoimpl.ListenGuideLineDaoImpl;

public class ListenGuideLineTest {
    @Test
    public void checkRoleFindByProperty(){
        ListenGuideLineDao listenGuideLineDao = new ListenGuideLineDaoImpl();

        Object[] objects = listenGuideLineDao.findByProperty(null, null, null, null, 4, 2);
    }
}
