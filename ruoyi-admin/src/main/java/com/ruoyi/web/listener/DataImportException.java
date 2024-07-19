package com.ruoyi.web.listener;

import com.ruoyi.common.utils.spring.SpringUtils;
import com.ruoyi.system.domain.Leaveapply;
import com.ruoyi.system.mapper.LeaveapplyMapper;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

import java.util.List;

public class DataImportException implements JavaDelegate {

    @Override
    public void execute(DelegateExecution execution) {
        LeaveapplyMapper leaveapplyMapper = SpringUtils.getBean(LeaveapplyMapper.class);
        List<Leaveapply> applys = leaveapplyMapper.selectLeaveapplyList(new Leaveapply());
        for (Leaveapply apply : applys) {
            System.out.println("请假信息" + apply.toString());
        }
        throw new IllegalAccessError("no auth!");
    }
}
