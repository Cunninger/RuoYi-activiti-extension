package com.ruoyi.web.controller.activiti;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.service.ISysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Leaveapply;
import com.ruoyi.system.service.ILeaveapplyService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.annotation.Resource;

/**
 * 请假Controller
 * 
 * @author shenzhanwang
 * @date 2022-04-02
 */
@Api(value = "请假接口")
@Controller
@RequestMapping("/leaveapply")
public class LeaveapplyController extends BaseController
{

    @Autowired
    private ILeaveapplyService leaveapplyService;

    @Autowired
    private ISysUserService userService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;


    /**
     * 部门领导审批
     * @return
     */
    @ApiOperation("部门领导审批")
    @GetMapping("/deptleadercheck")
    @ResponseBody
    public AjaxResult deptleadercheck(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 人事审批
     * @return
     */
    @ApiOperation("人事审批")
    @GetMapping("/hrcheck")
    @ResponseBody
    public AjaxResult hrcheck(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            System.out.println(apply);
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 销假
     * @return
     */
    @ApiOperation("销假")
    @GetMapping("/destroyapply")
    @ResponseBody
    public AjaxResult destroyapply(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }


    /**
     * 调整申请
     * @return
     */
    @ApiOperation("调整申请")
    @GetMapping("/modifyapply")
    @ResponseBody
    public AjaxResult modifyapply(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 发起请假申请
     * 驳回后使用
     * @return
     */
    @ApiOperation("发起请假申请-驳回后使用")
    @GetMapping("/addleave")
    @ResponseBody
    public AjaxResult addLeave(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Leaveapply apply = leaveapplyService.selectLeaveapplyById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 查询请假列表
     */
    @ApiOperation("查询请假列表")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Leaveapply leaveapply)
    {
        String username = getUsername();
        leaveapply.setUserId(username);
        startPage();
        List<Leaveapply> list = leaveapplyService.selectLeaveapplyList(leaveapply);
        return getDataTable(list);
    }

    /**
     * 导出请假列表
     */
    @ApiOperation("导出请假列表")
    @Log(title = "请假", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Leaveapply leaveapply)
    {
        String username = getUsername();
        leaveapply.setUserId(username);
        List<Leaveapply> list = leaveapplyService.selectLeaveapplyList(leaveapply);
        ExcelUtil<Leaveapply> util = new ExcelUtil<Leaveapply>(Leaveapply.class);
        return util.exportExcel(list, "请假数据");
    }


    /**
     * 当前登录用户
     */
    @ApiOperation("当前登录用户")
    @GetMapping("/cuurentUser")
    @ResponseBody
    public AjaxResult cuurentUser()
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        return AjaxResult.success(user);
    }

    /**
     * 发起请假流程
     */
    @ApiOperation("发起请假流程")
    @Log(title = "请假", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Leaveapply leaveapply)
    {
        leaveapply.setApplyTime(new Date());
        return toAjax(leaveapplyService.insertLeaveapply(leaveapply));
    }

    @ApiOperation("修改请假")
    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(Leaveapply leaveapply)
    {
        return toAjax(leaveapplyService.updateLeaveapply(leaveapply));
    }

    /**
     * 删除请假
     */
    @ApiOperation("删除请假")
    @Log(title = "请假", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(leaveapplyService.deleteLeaveapplyByIds(ids));
    }



}
