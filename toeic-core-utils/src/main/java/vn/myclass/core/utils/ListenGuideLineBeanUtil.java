package vn.myclass.core.utils;

import vn.myclass.core.dto.ListenGuideLineDTO;
import vn.myclass.core.persistence.entity.ListenGuideLineEntity;

public class ListenGuideLineBeanUtil {
    public static ListenGuideLineDTO entity2Dto(ListenGuideLineEntity entity){
        ListenGuideLineDTO dto = new ListenGuideLineDTO();
        dto.setListenGuideLineId(entity.getListenGuideLineId());
        dto.setTitle(entity.getTitle());
        dto.setContent(entity.getContent());
        dto.setImage(entity.getImage());
        dto.setCreatedDate(entity.getCreatedDate());
        dto.setModifiedDate(entity.getModifiedDate());
        return dto;
    }

    public static ListenGuideLineEntity dto2Entity(ListenGuideLineDTO dto){
        ListenGuideLineEntity entity = new ListenGuideLineEntity();
        entity.setListenGuideLineId(dto.getListenGuideLineId());
        entity.setTitle(dto.getTitle());
        entity.setContent(dto.getContent());
        entity.setImage(dto.getImage());
        entity.setCreatedDate(dto.getCreatedDate());
        entity.setModifiedDate(dto.getModifiedDate());
        return entity;
    }

}
