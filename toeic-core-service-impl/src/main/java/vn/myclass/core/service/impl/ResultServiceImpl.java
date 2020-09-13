package vn.myclass.core.service.impl;

import vn.myclass.core.dto.ExaminationQuestionDTO;
import vn.myclass.core.dto.ResultDTO;
import vn.myclass.core.persistence.entity.ExaminationEntity;
import vn.myclass.core.persistence.entity.ResultEntity;
import vn.myclass.core.persistence.entity.UserEntity;
import vn.myclass.core.service.ResultService;
import vn.myclass.core.service.utils.SingletonDaoUtil;
import vn.myclass.core.utils.ResultBeanUtil;

import java.sql.Timestamp;
import java.util.List;

public class ResultServiceImpl implements ResultService {
    public ResultDTO saveResult(String userName, Integer examinationId, List<ExaminationQuestionDTO> examinationQuestions) {
        ResultDTO result = new ResultDTO();
        if (userName != null && examinationId != null && examinationQuestions != null) {
            UserEntity userEntity = SingletonDaoUtil.getUserDaoInstance().findEqualsUnique("name", userName);
            ExaminationEntity examinationEntity = SingletonDaoUtil.getExaminationDaoInstance().findById(examinationId);
            ResultEntity resultEntity = new ResultEntity();
            calculateScores(resultEntity, examinationQuestions);
            initDataToResultEntity(resultEntity, userEntity, examinationEntity);
            resultEntity = SingletonDaoUtil.getResultDaoInstance().save(resultEntity);
            result = ResultBeanUtil.entity2Dto(resultEntity);
        }
        return result;
    }

    private void initDataToResultEntity(ResultEntity resultEntity, UserEntity userEntity, ExaminationEntity examinationEntity) {
        resultEntity.setUserEntity(userEntity);
        resultEntity.setExaminationEntity(examinationEntity);
        resultEntity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
    }

    private void calculateScores(ResultEntity resultEntity, List<ExaminationQuestionDTO> examinationQuestions) {
        Integer listenScore = 0;
        Integer readingScore = 0;
        for (ExaminationQuestionDTO item : examinationQuestions) {
            if (item.getAnswerUser() != null) {
                if (item.getAnswerUser().equals(item.getCorrectAnswer())) {
                    if (item.getNumber() <= 4) {
                        listenScore++;
                    } else {
                        readingScore++;
                    }
                }
            }
        }
        resultEntity.setListenScore(listenScore);
        resultEntity.setReadingScore(readingScore);
    }
}
