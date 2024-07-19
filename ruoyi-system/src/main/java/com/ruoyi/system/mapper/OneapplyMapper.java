package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Oneapply;

import java.util.List;

public interface OneapplyMapper {
    public Oneapply selectOneapplyById(Long id);

    public List<Oneapply> selectOneapplyList(Oneapply oneapply);

    public int insertOneapply(Oneapply oneapply);

    public int updateOneapply(Oneapply oneapply);

    public int deleteOneapplyById(Long id);

    public int deleteOneapplyByIds(String[] ids);
}
