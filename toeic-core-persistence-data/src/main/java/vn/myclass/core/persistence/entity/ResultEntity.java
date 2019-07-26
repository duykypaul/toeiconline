package vn.myclass.core.persistence.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "result")
public class ResultEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer resultId;

    @Column(name = "listenscore")
    private String listenScore;

    @Column(name = "readingscore")
    private String readingScore;

    @Column(name = "createddate")
    private Timestamp createdDate;

    @Column(name = "modifieddate")
    private Timestamp modifiedDate;

    @ManyToOne
    @JoinColumn(name = "examinationid")
    private ExaminationEntity examinationEntity;

    @ManyToOne
    @JoinColumn(name = "userid")
    private UserEntity userEntity;

    public Integer getResultId() {
        return resultId;
    }

    public void setResultId(Integer resultId) {
        this.resultId = resultId;
    }

    public String getListenScore() {
        return listenScore;
    }

    public void setListenScore(String listenScore) {
        this.listenScore = listenScore;
    }

    public String getReadingScore() {
        return readingScore;
    }

    public void setReadingScore(String readingScore) {
        this.readingScore = readingScore;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public Timestamp getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Timestamp modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public ExaminationEntity getExaminationEntity() {
        return examinationEntity;
    }

    public void setExaminationEntity(ExaminationEntity examinationEntity) {
        this.examinationEntity = examinationEntity;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }
}
