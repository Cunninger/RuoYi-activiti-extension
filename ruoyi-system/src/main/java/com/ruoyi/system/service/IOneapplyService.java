package com.ruoyi.system.service;

import com.ruoyi.system.domain.Oneapply;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IOneapplyService {
    /**
     * 查询请假
     *
     * @param id 请假主键
     * @return 请假
     */
    public Oneapply selectOneapplyById(Long id);

    /**
     * 查询请假列表
     *
     * @param oneapply 请假
     * @return 请假集合
     */
    public List<Oneapply> selectOneapplyList(Oneapply oneapply);

    /**
     * 新增请假
     *
     * @param oneapply 请假
     * @return 结果
     */
    public int insertOneapply(Oneapply oneapply);

    /**
     * 修改请假
     *
     * @param oneapply 请假
     * @return 结果
     */
    public int updateOneapply(Oneapply oneapply);

    /**
     * 批量删除请假
     *
     * @param ids 需要删除的请假主键
     * @return 结果
     */
    public int deleteOneapplyByIds(String ids);

    /**
     * 删除请假信息
     *
     * @param id 请假主键
     * @return 结果
     */
    public int deleteOneapplyById(Long id);
}
