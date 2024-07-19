import request from '@/utils/request'

// 处理待办
export const processTask = data => {
    return request({
        url: '/task/manage/mylist',
        method: 'post',
        data
    });
}