import request from '@/utils/request'
import commonUtil from "@/utils/common";

// 获取采购

export const getPurchaseApplyList = data => {
    const queryString = commonUtil.objectToQueryStr(data);
    console.log("aaaaaaaaaaaaaaaaaaaaaaa2", queryString);
    return request({
        url: '/purchase/list',
        method: 'post',
        data: queryString,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
    });
}

// 添加采购
// http://101.43.32.218:8020/leaveapply/add
export const addPurchase = data => {
    const fd = commonUtil.objectToFormData(data)
    return request({
        url: '/purchase/add',
        method: 'post',
        data: fd
    });
}

// 导出
export const exportPurchase = data => {
    const fd = commonUtil.objectToQueryStr(data)
    return request({
        url: '/purchase/export',
        method: 'post',
        data: fd,
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
        },
    });
}
// 删除
export const deletePurchase = data => {
    const fd = commonUtil.objectToFormData(data)
    return request({
        url: '/purchase/remove',
        method: 'post',
        data: fd
    });
}
