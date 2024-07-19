

import request from '@/utils/request';
import commonUtil from "@/utils/common"

// 获取模型数据
export const getModelLists = (data) => {
    return request({
      url: '/model/manage/modelLists',
      method: 'post',
      data: commonUtil.objectToFormData(data)
    })
}

// 添加模型数据

export const addModel = (data) => {
    return request({
      url: '/model/manage/add',
      method: 'post',
      data
    })
}

// 发布

export const publishModelById = id => {
  return request({
    url: `/model/manage/deploy/${id}`,
    method: 'post',
  });
}

// 删除

export const deleteModelById = id => {
  return request({
    url: `/model/manage/remove/${id}`,
    method: 'post',
  });
}