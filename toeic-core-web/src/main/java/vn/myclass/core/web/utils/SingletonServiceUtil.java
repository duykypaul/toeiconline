package vn.myclass.core.web.utils;

import vn.myclass.core.service.impl.ListenGuideLineServiceImpl;
import vn.myclass.core.service.impl.RoleServiceImpl;
import vn.myclass.core.service.impl.UserServiceImpl;

public class SingletonServiceUtil {
    private static UserServiceImpl userServiceImpl = null;
    private static RoleServiceImpl roleServiceImpl = null;
    private static ListenGuideLineServiceImpl listenGuideLineServiceImpl = null;


    public static UserServiceImpl getUserServiceInstance() {
        if (userServiceImpl == null) {
            userServiceImpl = new UserServiceImpl();
        }
        return userServiceImpl;
    }

    public static RoleServiceImpl getRoleServiceInstance() {
        if (roleServiceImpl == null) {
            roleServiceImpl = new RoleServiceImpl();
        }
        return roleServiceImpl;
    }

    public static ListenGuideLineServiceImpl getListenGuidelineServiceInstance() {
        if (listenGuideLineServiceImpl == null) {
            listenGuideLineServiceImpl = new ListenGuideLineServiceImpl();
        }
        return listenGuideLineServiceImpl;
    }

}
