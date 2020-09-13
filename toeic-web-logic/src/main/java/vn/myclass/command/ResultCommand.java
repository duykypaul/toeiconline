package vn.myclass.command;

import vn.myclass.core.dto.ResultDTO;
import vn.myclass.core.dto.RoleDTO;
import vn.myclass.core.dto.UserDTO;
import vn.myclass.core.dto.UserImportDTO;
import vn.myclass.core.web.command.AbstractCommand;

import java.util.List;

public class ResultCommand extends AbstractCommand<ResultDTO> {

    public ResultCommand() {
        this.pojo = new ResultDTO();
    }

}
