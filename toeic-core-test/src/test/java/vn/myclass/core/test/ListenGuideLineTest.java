package vn.myclass.core.test;

import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;
import vn.myclass.core.dao.ListenGuideLineDao;
import vn.myclass.core.daoimpl.ListenGuideLineDaoImpl;

import java.util.HashMap;
import java.util.Map;

public class ListenGuideLineTest {
    ListenGuideLineDao listenGuideLineDao;

    @BeforeTest
    public void initData() {
        listenGuideLineDao = new ListenGuideLineDaoImpl();
    }

    @Test
    public void checkRoleFindByProperty() {
//        ListenGuideLineDao listenGuideLineDao = new ListenGuideLineDaoImpl();
//        Object[] objects = listenGuideLineDao.findByProperty(null, null, null, null, 4, 2);
    }

    @Test
    public void checkApiFindBuProperty() {
        Map<String, Object> property = new HashMap<String, Object>();
        property.put("title", "Bai hd 8");
        property.put("content", "Noij dung bai hd 8");
        Object[] objects = listenGuideLineDao.findByProperty(property, null, null, null, null, null);
    }
}
