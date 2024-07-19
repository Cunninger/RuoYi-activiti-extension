import request from '@/utils/request'
import commonUtil from "@/utils/common";

// 获取测试列表

export const getFourApplyList = data => {
  console.log("aaaaaaaaaaaaaaaaaaaaaaa1");
  const queryString = commonUtil.objectToQueryStr(data);
  console.log("aaaaaaaaaaaaaaaaaaaaaaa2", queryString);
  return request({
    url: '/fourapply/list',
    method: 'post',
    data: queryString,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  });
}

// 添加测试
// http://101.43.32.218:8020/fourapply/add
export const addFour = data => {
  const fd = commonUtil.objectToFormData(data)
  alert("fourapply/add");
  return request({
    url: '/fourapply/add',
    method: 'post',
    data: fd
  });
}
// 导出
export const exportFour = data => {
  const fd = commonUtil.objectToQueryStr(data)
  return request({
    url: '/fourapply/export',
    method: 'post',
    data: fd,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
    },
  });
}
// 删除
export const deleteFour = data => {
  const fd = commonUtil.objectToFormData(data)
  return request({
    url: '/fourapply/remove',
    method: 'post',
    data: fd
  });
}
