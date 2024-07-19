<template>
    <div class="c-time-line">
        <el-timeline>
            <el-timeline-item
                v-for="(activity, index) in activities"
                :key="index"
            >
                <el-card>
                    <div class="c-time-line__card">
                        <div class="c-time-line__paragraph">开始: <span>{{activity.startTime}}</span></div>
                        <div class="c-time-line__paragraph2">{{activity.assignee}}: {{activity.taskName}}</div>
                        <div class="c-time-line__paragraph2">{{activity.comment}}</div>
                        <div class="c-time-line__paragraph">结束: <span>{{activity.endTime}}</span></div>
                    </div>

                </el-card>
            </el-timeline-item>
        </el-timeline>
    </div>
</template>

<script>


// taskName: "采购经理审批"
// assignee: "admin"
// startTime: "2024-04-28 23:51:04"
// processInstanceId: "7529"
export default {
    name: "TimeLine",
    props: {
        activities: {
            type: Array,
            default: () => ([])
        }
    }
};
</script>

<style>

.c-time-line__card {
    width: 330px;
    padding-top: 8px;
    padding-bottom: 8px;
    margin: -15px -20px -20px 0px;
}
.el-timeline-item {
    padding-bottom: 0px;
}
.c-time-line__paragraph {
    margin-bottom: 4px;
    line-height: 1.5em;
}
.c-time-line__paragraph span {
    color: #1ab394;
}
.c-time-line__paragraph2 {
    font-size: 18px;
    line-height: 1.5em;
}
.el-timeline-item__node--normal {
    background-color: #1ab394;
    width:16px;
    height: 16px;
    left: -3px;
}
.el-timeline-item__tail {
    top: 8px;
}
</style>
