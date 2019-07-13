package vn.myclass.command;

import vn.myclass.core.dto.ListenguideLineDTO;
import vn.myclass.core.web.command.AbstractCommand;

public class ListenGuideLineCommand extends AbstractCommand<ListenguideLineDTO> {
    public ListenGuideLineCommand(){
        this.pojo = new ListenguideLineDTO();
    }
}
