package vn.myclass.command;

import vn.myclass.core.dto.ExaminationQuestionDTO;
import vn.myclass.core.web.command.AbstractCommand;

public class ExaminationQuestionCommand extends AbstractCommand<ExaminationQuestionDTO> {

    public ExaminationQuestionCommand(){
        this.pojo = new ExaminationQuestionDTO();
    }

}
