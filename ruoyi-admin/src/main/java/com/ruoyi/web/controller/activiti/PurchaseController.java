package com.ruoyi.web.controller.activiti;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Leaveapply;
import com.ruoyi.system.service.ISysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Purchase;
import com.ruoyi.system.service.IPurchaseService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import javax.annotation.Resource;

/**
 * 采购Controller
 * 
 * @author shenzhanwang
 * @date 2022-05-28
 */
@Api(value = "采购接口")
@Controller
@RequestMapping("/purchase")
public class PurchaseController extends BaseController
{
    private String prefix = "activiti/purchase";

    @Autowired
    private IPurchaseService purchaseService;

    @Autowired
    private ISysUserService userService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private TaskService taskService;


    /**
     * 查询采购列表
     */
    @ApiOperation("查询采购列表")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Purchase purchase)
    {
        startPage();
        List<Purchase> list = purchaseService.selectPurchaseList(purchase);
        return getDataTable(list);
    }

    /**
     * 导出采购列表
     */
    @ApiOperation("导出采购列表")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Purchase purchase)
    {
        List<Purchase> list = purchaseService.selectPurchaseList(purchase);
        ExcelUtil<Purchase> util = new ExcelUtil<Purchase>(Purchase.class);
        return util.exportExcel(list, "采购数据");
    }


    /**
     * 新增保存采购
     */
    @ApiOperation("新增保存采购")
    @Log(title = "采购", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Purchase purchase)
    {
        purchase.setApplytime(new Date());
        return toAjax(purchaseService.insertPurchase(purchase));
    }

    @ApiOperation("修改采购")
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult edit(Purchase purchase)
    {
        return toAjax(purchaseService.updatePurchase(purchase));
    }

    /**
     * 删除采购
     */
    @ApiOperation("删除采购")
    @Log(title = "采购", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(purchaseService.deletePurchaseByIds(ids));
    }

    /**
     * 采购经理审批
     */
    @ApiOperation("采购经理审批")
    @GetMapping("/purchasemanager")
    @ResponseBody
    public AjaxResult purchasemanager(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 财务审批
     */
    @ApiOperation("财务审批")
    @GetMapping("/finance")
    @ResponseBody
    public AjaxResult finance(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 总经理审批
     */
    @ApiOperation("总经理审批")
    @GetMapping("/manager")
    @ResponseBody
    public AjaxResult manager(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 出纳付款
     */
    @ApiOperation("出纳付款")
    @GetMapping("/pay")
    @ResponseBody
    public AjaxResult pay(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 收货确认
     */
    @ApiOperation("收货确认")
    @GetMapping("/receiveitem")
    @ResponseBody
    public AjaxResult receiveitem(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }

    /**
     * 调整申请
     */
    @ApiOperation("调整申请")
    @GetMapping("/updateapply")
    @ResponseBody
    public AjaxResult updateapply(String taskid)
    {
        Task t = taskService.createTaskQuery().taskId(taskid).singleResult();
        String processId = t.getProcessInstanceId();
        ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(processId).singleResult();
        if (p != null) {
            Purchase apply = purchaseService.selectPurchaseById(Long.parseLong(p.getBusinessKey()));
            return AjaxResult.success(apply);
        }
        return AjaxResult.error("流程不存在");
    }
}
