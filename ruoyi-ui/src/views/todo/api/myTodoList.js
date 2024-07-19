import request from '@/utils/request'
import commonUtil from "@/utils/common";

// 获取我的待办
export const getMyTodoList = data => {
  console.log("aaaaaaaaaaaaaaaaaaaaaaa1");
  const queryString = commonUtil.objectToQueryStr(data);
  console.log("aaaaaaaaaaaaaaaaaaaaaaa2", queryString);
  return request({
    url: '/task/manage/mylist',
    method: 'post',
    data: queryString,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  });
}

//

export const getProcessByTaskid = taskId => {
  return request({
    url: `/task/manage/history/${taskId}`,
    method: 'get'
  });
}

// 处理待办
export const processTask = data => {
  const {taskId} = data;
  delete data.taskId;
  return request({
    url: `/task/manage/completeTask/${taskId}`,
    method: 'post',
    data
  });
}

// 填写会议纪要
export const fillMeetingRecord = data => {
  const queryString = commonUtil.objectToQueryStr(data);
  return request({
    url: '/meeting/edit',
    method: 'post',
    data: queryString,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  });
}

// 销假
export const checkoutLeave = data => {
  const queryString = commonUtil.objectToQueryStr(data, true);
  return request({
    url: '/leaveapply/update',
    method: 'post',
    data: queryString,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  });
}


// 更新采购
export const updatePurchase = data => {
  const queryString = commonUtil.objectToQueryStr(data, true);
  return request({
    url: '/purchase/edit',
    method: 'post',
    data: queryString,
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
  });
}


// 撤销请假申请
export const forceEnd = taskId => {
  return request({
    url: `/dynamic/flow/forceEnd/${taskId}`,
    method: 'get',
  });
}

// 请假驳回
export const rejectLeave = taskId => {
  return request({
    url: `/dynamic/flow/jump/${taskId}/applyleave`,
    method: 'get',
  });
}


// 获取待办业务数据
export const getInfoByTaskId = (url, taksId) => {
  alert(url + `?taskid=${taksId}`);
  return request({
    url: url + `?taskid=${taksId}`,
    method: 'get',
  });
}
