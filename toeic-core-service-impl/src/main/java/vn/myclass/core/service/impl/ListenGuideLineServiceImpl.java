package vn.myclass.core.service.impl;

import vn.myclass.core.dao.ListenGuideLineDao;
import vn.myclass.core.daoimpl.ListenGuideLineDaoImpl;
import vn.myclass.core.dto.ListenGuideLineDTO;
import vn.myclass.core.persistence.entity.ListenGuideLineEntity;
import vn.myclass.core.service.ListenGuideLineService;
import vn.myclass.core.utils.ListenGuideLineBeanUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ListenGuideLineServiceImpl implements ListenGuideLineService {
    private ListenGuideLineDao listenGuideLineDao = new ListenGuideLineDaoImpl();
    public Object[] findListenGuideLineByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        List<ListenGuideLineDTO> result = new ArrayList<ListenGuideLineDTO>();
        Object[] objects = listenGuideLineDao.findByProperty( property, sortExpression, sortDirection, offset, limit);
        for(ListenGuideLineEntity item: (List<ListenGuideLineEntity>)objects[1]){
            result.add(ListenGuideLineBeanUtil.entity2Dto(item));
        }
        objects[1] = result;
        return objects;
    }
}
