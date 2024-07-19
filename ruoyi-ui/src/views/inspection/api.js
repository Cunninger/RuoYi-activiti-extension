import request from '@/utils/request'
import commonUtil from "@/utils/common";


// 流程实例
export const getListProcess = data => {
    const queryString = commonUtil.objectToQueryStr(data);
    return request({
        url: '/flow/monitor/listProcess',
        method: 'post',
        data: queryString,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
    });
};

// 挂起/唤醒流程实例
export const enableProcess = (processInstanceId, enable) => {
    const url = (
        enable
        ? `/flow/monitor/run/${processInstanceId}`
        : `/flow/monitor/suspend/${processInstanceId}`
    );
    return request({
        url,
        method: 'get',
    });
}




// 执行实例
export const getListExecutions = data => {
    const queryString = data && commonUtil.objectToQueryStr(data);
    return request({
        url: '/flow/monitor/listExecutions',
        method: 'post',
        data: queryString,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
    });
}


// 运行历史
export const getListHistoryProcess = data => {
    const queryString = commonUtil.objectToQueryStr(data);
    return request({
        url: '/flow/monitor/listHistoryProcess',
        method: 'post',
        data: queryString,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
    });
}

// 获取某个历史或者变量
export const getListByTypeAndId = (type, processInstanceId) => {
    const url = type === "history" ? `/flow/monitor/history/${processInstanceId}` : `/flow/monitor/variables/${processInstanceId}`
    const queryString = commonUtil.objectToQueryStr({
        pageSize: 100,
        pageNum: 1,
        isAsc: "asc"
    });
    return request({
        url,
        method: 'post',
        data: queryString,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
    });
}



// 作业管理
export const getListJobs = (type, data) => {
    const queryString = commonUtil.objectToQueryStr(data);
    return request({
        url: `/flow/monitor/listJobs?type=${type}`,
        method: 'post',
        data: queryString,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
    });
}

