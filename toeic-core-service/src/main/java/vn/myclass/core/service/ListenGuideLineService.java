package vn.myclass.core.service;

public interface ListenGuideLineService {
    Object[] findListenGuideLineByProperties(String property, Object value, String sortExpression, String sortDirection, Integer offset, Integer limit);
}
