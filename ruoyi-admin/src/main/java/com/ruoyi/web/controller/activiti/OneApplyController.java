package com.ruoyi.web.controller.activiti;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Oneapply;
import com.ruoyi.system.service.IOneapplyService;
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
@RequestMapping("/oneapply")
public class OneApplyController extends BaseController {

    @Autowired
    private IOneapplyService oneapplyService;

    @Autowired
    private ISysUserService userService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;


    /**
     * 部门领导审批
     *
     * @return
     */
    @ApiOperation("二级审批")
    @GetMapping("/testdeptleadercheck")
    @ResponseBody
    public AjaxResult deptleadercheck(String taskid) {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Oneapply apply = oneapplyService.selectOneapplyById(Long.parseLong(p.getBusinessKey()));
            System.out.println(AjaxResult.success(apply));
            return AjaxResult.success(apply);
        }

        return AjaxResult.error("流程不存在");
    }
    @ApiOperation("三级审批")
    @GetMapping("/testhrcheck")
    @ResponseBody
    public AjaxResult hrcheck(String taskid) {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Oneapply apply = oneapplyService.selectOneapplyById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    @ApiOperation("四级审批")
    @GetMapping("/testceocheck")
    @ResponseBody
    public AjaxResult ceocheck(String taskid) {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Oneapply apply = oneapplyService.selectOneapplyById(Long.parseLong(p.getBusinessKey()));
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
    public TableDataInfo list(Oneapply oneapply) {
        String username = getUsername();
        oneapply.setUserId(username);
        startPage();
        List<Oneapply> list = oneapplyService.selectOneapplyList(oneapply);
        return getDataTable(list);
    }

    /**
     * 导出请假列表
     */
    @ApiOperation("导出请假列表")
    @Log(title = "请假", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Oneapply oneapply) {
        String username = getUsername();
        oneapply.setUserId(username);
        List<Oneapply> list = oneapplyService.selectOneapplyList(oneapply);
        ExcelUtil<Oneapply> util = new ExcelUtil<Oneapply>(Oneapply.class);
        return util.exportExcel(list, "请假数据");
    }


    /**
     * 当前登录用户
     */
    @ApiOperation("当前登录用户")
    @GetMapping("/cuurentUser")
    @ResponseBody
    public AjaxResult cuurentUser() {
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
    public AjaxResult addSave(Oneapply oneapply) {
        oneapply.setApplyTime(new Date());
        return toAjax(oneapplyService.insertOneapply(oneapply));
    }

    @ApiOperation("修改请假")
    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(Oneapply oneapply) {
        return toAjax(oneapplyService.updateOneapply(oneapply));
    }

    /**
     * 删除请假
     */
    @ApiOperation("删除请假")
    @Log(title = "请假", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(oneapplyService.deleteOneapplyByIds(ids));
    }





}
