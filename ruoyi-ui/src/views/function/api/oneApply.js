import request from '@/utils/request'
import commonUtil from "@/utils/common";

// 获取测试列表

export const getOneApplyList = data => {
  console.log("aaaaaaaaaaaaaaaaaaaaaaa1");
  const queryString = commonUtil.objectToQueryStr(data);
  console.log("aaaaaaaaaaaaaaaaaaaaaaa2", queryString);
  return request({
    url: '/oneapply/list',
    method: 'post',
    data: queryString,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  });
}

// 添加测试
// http://101.43.32.218:8020/oneapply/add
export const addOne = data => {
  const fd = commonUtil.objectToFormData(data)
  return request({
    url: '/oneapply/add',
    method: 'post',
    data: fd
  });
}
// 导出
export const exportOne = data => {
  const fd = commonUtil.objectToQueryStr(data)
  return request({
    url: '/oneapply/export',
    method: 'post',
    data: fd,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
    },
  });
}
// 删除
export const deleteOne = data => {
  const fd = commonUtil.objectToFormData(data)
  return request({
    url: '/oneapply/remove',
    method: 'post',
    data: fd
  });
}
