package vn.myclass.core.service.impl;

import vn.myclass.core.dto.ListenGuideLineDTO;
import vn.myclass.core.persistence.entity.ListenGuideLineEntity;
import vn.myclass.core.service.ListenGuideLineService;
import vn.myclass.core.service.utils.SingletonDaoUtil;
import vn.myclass.core.utils.ListenGuideLineBeanUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ListenGuideLineServiceImpl implements ListenGuideLineService {
    public Object[] findListenGuideLineByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        List<ListenGuideLineDTO> result = new ArrayList<ListenGuideLineDTO>();
        Object[] objects = SingletonDaoUtil.getListenGuideLineDaoInstance().findByProperty(property, sortExpression, sortDirection, offset, limit);
        for(ListenGuideLineEntity item: (List<ListenGuideLineEntity>)objects[1]){
            result.add(ListenGuideLineBeanUtil.entity2Dto(item));
        }
        objects[1] = result;
        return objects;
    }

    public ListenGuideLineDTO findListenGuideLineById(String property, Integer listenGuideLineId) {
        ListenGuideLineEntity listenGuideLineEntity = SingletonDaoUtil.getListenGuideLineDaoInstance().findEqualsUnique(property, listenGuideLineId);
        return ListenGuideLineBeanUtil.entity2Dto(listenGuideLineEntity);
    }

    public void saveListenGuideLineDTO(ListenGuideLineDTO dto) {
        dto.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        SingletonDaoUtil.getListenGuideLineDaoInstance().save(ListenGuideLineBeanUtil.dto2Entity(dto));
    }
}
