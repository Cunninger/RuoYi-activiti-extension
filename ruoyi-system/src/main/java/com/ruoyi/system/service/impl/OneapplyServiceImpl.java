package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.system.domain.Oneapply;
import com.ruoyi.system.mapper.MeetingMapper;
import com.ruoyi.system.mapper.OneapplyMapper;
import com.ruoyi.system.mapper.PurchaseMapper;
import com.ruoyi.system.service.IOneapplyService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.availability.ApplicationAvailabilityAutoConfiguration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * 功能：
 * 日期：2024/7/16 下午10:51
 */
@Service
@Transactional
public class OneapplyServiceImpl implements IOneapplyService {
    @Autowired
    private OneapplyMapper oneapplyMapper;

    @Autowired
    private PurchaseMapper purchaseMapper;

    /**
     * 用于管理正在运行的流程实例、流程变量等。
     * 可以启动新的流程实例,删除流程实例,设置和获取流程变量等。
     * 在代码中,通过runtimeService启动了一个新的请假流程实例,并设置了流程变量。
     */
    @Resource
    private RuntimeService runtimeService;
    /**
     * 用于管理和操作用户任务。
     * 可以查询任务、认领任务、完成任务等。
     * 在代码中,通过taskService查询了第一个任务,并自动完成了该任务。
     */
    @Resource
    private TaskService taskService;

    /**
     * 用于管理用户和用户组。
     * 可以创建、删除、查询用户和用户组,以及用户与用户组的关系。
     * 在代码中,通过identityService设置了当前认证的用户ID,用于流程的发起人。
     */
    @Resource
    IdentityService identityService;

    /**
     * 用于查询历史数据,如已完成的流程实例、任务、活动等。
     * 在代码中,通过historyService查询了已完成的历史流程实例,
     * 并在删除请假数据时删除了对应的历史流程实例。
     */
    @Resource
    HistoryService historyService;
    private ApplicationAvailabilityAutoConfiguration applicationAvailabilityAutoConfiguration;


    @Override
    public Oneapply selectOneapplyById(Long id) {
        return oneapplyMapper.selectOneapplyById(id);

    }

    @Override
    public List<Oneapply> selectOneapplyList(Oneapply oneapply) {
        return oneapplyMapper.selectOneapplyList(oneapply);
    }

    /**
     * 新增请假
     *
     * @param oneapply 请假
     * @return
     */
    @Override
    public int insertOneapply(Oneapply oneapply) {
        int rows = oneapplyMapper.insertOneapply(oneapply);
        identityService.setAuthenticatedUserId(oneapply.getUserId());
        HashMap<String, Object> variables = new HashMap<>();
        variables.put("applyuserid", oneapply.getUserId());
        variables.put("deptleader", oneapply.getDeptleader());
        runtimeService.startProcessInstanceByKey("test", String.valueOf(oneapply.getId()), variables);
        // 第一个参数是流程定义的key,第二个参数是业务主键,第三个参数是流程变量。
//        Task antoTask = taskService.createTaskQuery().processDefinitionKey("test").processInstanceBusinessKey(String.valueOf(oneapply.getId())).singleResult();
        List<Task> tasks = taskService.createTaskQuery()
                .processDefinitionKey("test")
                .processInstanceBusinessKey(String.valueOf(oneapply.getId()))
                .list();

        if (!tasks.isEmpty()) {
            Task antoTask = tasks.get(0);
            taskService.complete(antoTask.getId());
        }
//        taskService.complete(antoTask.getId());
        return rows;


    }

    @Override
    public int updateOneapply(Oneapply oneapply) {
        return oneapplyMapper.updateOneapply(oneapply);
    }

    /**
     * 批量删除请假
     *
     * @param ids 需要删除的请假主键
     * @return
     */

    @Override
    public int deleteOneapplyByIds(String ids) {
        String[] keys = Convert.toStrArray(ids);
        for (String key : keys) {
            ProcessInstance process = runtimeService
                    .createProcessInstanceQuery()
                    .processDefinitionKey("test")
                    .processInstanceBusinessKey(key)
                    .singleResult();
            if (process != null) {
                runtimeService.deleteProcessInstance(process.getId(), "删除");
            }
            // 删除历史数据
            HistoricActivityInstance history = historyService.createHistoricActivityInstanceQuery()
                    .processDefinitionId("test")
                    .processInstanceId(key)
                    .singleResult();
            if (history != null) {
                historyService.deleteHistoricProcessInstance(history.getId());
            }
            oneapplyMapper.deleteOneapplyById(Long.parseLong(key));

        }
        return keys.length;

    }

    @Override
    public int deleteOneapplyById(Long id) {
        return oneapplyMapper.deleteOneapplyById(id);
    }
}