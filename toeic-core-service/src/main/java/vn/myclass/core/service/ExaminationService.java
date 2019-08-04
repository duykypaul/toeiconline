package vn.myclass.core.service;

import java.util.Map;

public interface ExaminationService {
    Object[] findExaminationByProperties(Map<String, Object> property, String sortExpression, String sortDirection, int firstItem, int maxPageItems);
}
