

import request from '@/utils/request'
import commonUtil from "@/utils/common";

// 获取模型数据
export const getProcesslists = (data) => {
    const fd = commonUtil.objectToFormData(data);
    return request({
      url: '/flow/manage/getprocesslists?pageNum=1&pageSize=10',
      method: 'post',
      data: fd
    })
}

// 上传
export const uploadProcess = (data) => {
  const fd = commonUtil.objectToFormData(data);
  return request({
    url: '/flow/manage/uploadworkflow',
    method: 'post',
    data: fd
  })
}

// 转换模型
export const exchangeById = id => {
  return request({
    url: `/flow/manage/exchangeProcessToModel/${id}`,
    method: 'get'
  });
}

// 删除流程信息

export const deleteProcessByDeployId = deployId => {
  const data = {
    ids: deployId
  };
  return request({
    url: `/flow/manage/remove/${deployId}`,
    method: 'post',
    data: commonUtil.objectToFormData(data)
  });
}

// 挂起流程
export const suspendProcess = params => {
  return request({
    url: `/flow/manage/suspendProcessDefinition`,
    method: 'get',
    params
  });
}

// 激活
export const activateProcess = params => {
  return request({
    url: `/flow/manage/activateProcessDefinition`,
    method: 'get',
    params
  });
}