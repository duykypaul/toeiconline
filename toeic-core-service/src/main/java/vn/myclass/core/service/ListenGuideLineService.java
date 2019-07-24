package vn.myclass.core.service;

import vn.myclass.core.dto.ListenGuideLineDTO;

import java.util.Map;

public interface ListenGuideLineService {
    Object[] findListenGuideLineByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit);
    ListenGuideLineDTO findListenGuideLineById(String property, Integer listenGuideLineId);
}
