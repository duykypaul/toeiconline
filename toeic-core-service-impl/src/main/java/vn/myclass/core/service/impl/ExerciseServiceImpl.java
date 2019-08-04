package vn.myclass.core.service.impl;

import vn.myclass.core.dto.ExerciseDTO;
import vn.myclass.core.persistence.entity.ExerciseEntity;
import vn.myclass.core.service.ExerciseService;
import vn.myclass.core.service.utils.SingletonDaoUtil;
import vn.myclass.core.utils.ExerciseBeanUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ExerciseServiceImpl implements ExerciseService {
    public Object[] findExerciseByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        List<ExerciseDTO> result = new ArrayList<ExerciseDTO>();
        Object[] objects = SingletonDaoUtil.getExerciseDaoInstance().findByProperty(property, sortExpression, sortDirection, offset, limit, null);
        for(ExerciseEntity item: (List<ExerciseEntity>)objects[1]){
            result.add(ExerciseBeanUtil.entity2Dto(item));
        }
        objects[1] = result;
        return objects;
    }
}
