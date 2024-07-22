<template>
  <div class="c-process-task">
    <div class="c-process-task__form">
      <leave-apply-form
        v-if="taskType === 'leaveapply'"
        :form-info="formInfo"
        :step="step"
        @cancel="handleCancel"
        @reject="handleReject"
        @submit="handleSubmit"
      ></leave-apply-form>
      <purchase-form
        v-if="taskType === 'purchase'"
        :form-info="formInfo"
        :step="step"
        @submit="handleSubmit"
      ></purchase-form>
      <meeting-form
        v-if="taskType === 'meeting'"
        :form-info="formInfo"
        :step="step"
        @submit="handleSubmit"
      ></meeting-form>

      <!-- 添加oneapply的组件渲染 -->
      <one-apply-form
        v-if="taskType === 'oneapply'"
        :form-info="formInfo"
        :step="step"
        @submit="handleSubmit"
      ></one-apply-form>



    </div>
    <div>
      <time-line :activities="activities"></time-line>
    </div>
  </div>
</template>

<script>
import {
  getProcessByTaskid,
  processTask,
  fillMeetingRecord,
  checkoutLeave,
  forceEnd,
  rejectLeave,
  updatePurchase,
  getInfoByTaskId
} from "./api/myTodoList";
import TimeLine from './components/TimeLine.vue';

import leaveApplyForm from './components/leaveApplyForm.vue';
import meetingForm from './components/meetingForm.vue';
import purchaseForm from './components/purchaseForm.vue';
import LeaveApply from '../function/leaveApply.vue';
import OneApply from '../function/oneApply.vue';
import oneApplyForm from './components/oneApplyForm.vue';
import FourApply from "@/views/function/fourApply.vue";
import fourApplyForm from "@/views/todo/components/fourApplyForm.vue";


const urlMap = {
  // 部门领导审批
  "deptleadercheck": "/leaveapply/deptleadercheck",
  // 人事审批
  "hrcheck": "/leaveapply/hrcheck",
  // 销假
  "destroyapply": "/leaveapply/destroyapply",
  // 请假流程中拒绝过程,回到申请人进行修改
  "modifyapply": "/leaveapply/modifyapply",
  // 发起请假申请,此处为驳回后返回的位置
  "addleave": "/leaveapply/addleave",

  // test 测试申请
  // 测试部门领导审批
  "testdeptleadercheck": "/oneapply/testdeptleadercheck",
  "testhrcheck": "/oneapply/testhrcheck",
  "testceocheck": "/oneapply/testceocheck",
  "testmodifyapply": "/oneapply/modifyapply",
  // 发起请假申请,此处为驳回后返回的位置
  "testaddleave": "/oneapply/addapply",



  // // 人事审批
  "fourhrcheck": "/leaveapply/fourhrcheck",
  // // ceo审批
  "fourceocheck": "/leaveapply/fourceocheck",
  //
  // // test4 四级审批测试
  "fourdeptleadercheck": "/fourapply/fourdeptleadercheck",

  purchasemanager: "/purchase/purchasemanager",
  finance: "/purchase/finance",
  pay: "/purchase/pay",
  receiveitem: "/purchase/receiveitem",
  manager: "/purchase/manager",
  // 拒绝后，申请人重新申请
  updateapply: "/purchase/updateapply",

  input: "/meeting/input",
  signate: "/meeting/signate"
}
export default {
  components: {
    TimeLine,
    leaveApplyForm,
    meetingForm,
    purchaseForm,
    LeaveApply,
    OneApply,
    oneApplyForm,
    FourApply,
    fourApplyForm
  },
  data() {
    return {
      activities: [],
      taskType: "",
      step: "",
      taskId: "",
      formInfo: {}
    };
  },
  mounted() {
    console.log("待办", this.$route.params)
    const {taskId, taskType, step} = this.$route.params;
    this.taskId = taskId;
    this.taskType = taskType;
    this.step = step;
    getProcessByTaskid(taskId).then(res => {
      console.log("拿到流程信息", res);
      this.activities = res;
    });
    console.log("step", "taskId", step, urlMap[step], taskId);
    getInfoByTaskId(urlMap[step], taskId).then(res => {
      console.log(res)
      // console.log("step", "taskId", res);
      debugger
      if (res.data) {
        this.formInfo = res.data;
      }
    });
  },
  methods: {
    handleSubmit(data) {
      if (this.taskType === "meeting") {
        if (this.step === "input") {
          const id = this.$route.query.id;
          const {content} = data;
          console.log(id);
          fillMeetingRecord({
            id,
            content
          }).then(res => {
            console.log("审批通过!");
          });
        }
      }

      if (this.taskType === "oneapply") {
        alert(this.taskType)
        if (
          this.step === "destroyapply"
          || this.step === "addLeave"
          || this.step === "testmodifyapply"
        ) {
          const {realityStartTime, realityEndTime, reapply} = data;
          const id = this.$route.query.id;
          const taskId = this.taskId;
          checkoutLeave({
            ...data,
            id,
            taskId
          }).then(res => {
            console.log("销假成功！");
          });
        }
      }

      if (this.taskType === "leaveapply") {
        if (
          this.step === "destroyapply"
          || this.step === "addLeave"
          || this.step === "modifyapply"
        ) {
          const {realityStartTime, realityEndTime, reapply} = data;
          const id = this.$route.query.id;
          const taskId = this.taskId;
          checkoutLeave({
            ...data,
            id,
            taskId
          }).then(res => {
            console.log("销假成功！");
          });
        }
      }

      if (this.taskType === "purchase") {
        const id = this.$route.query.id;
        const taskId = this.taskId;
        if (this.step === "updateapply") {
          updatePurchase({
            ...data,
            id,
            taskId
          }).then(res => {
            console.log("更新成功!");
          });
        }
      }
      processTask({
        taskId: this.taskId,
        ...data
      }).then(res => {
        this.$message.success("处理成功!");
        this.$tab.closePage(this.$route).then(({visitedViews}) => {
          this.toLastView(visitedViews, this.$route)
        });
      });
    },
    toLastView(visitedViews, view) {
      const latestView = visitedViews.slice(-1)[0]
      if (latestView) {
        this.$router.push(latestView.fullPath)
      } else {
        if (view.name === 'Dashboard') {
          // to reload home page
          this.$router.replace({path: '/redirect' + view.fullPath})
        } else {
          this.$router.push('/')
        }
      }
    },
    handleCancel() {
      forceEnd(this.taskId).then(res => {
        console.log("撤销成功");
        this.$tab.closePage(this.$route).then(({visitedViews}) => {
          this.toLastView(visitedViews, this.$route)
        });
      });
    },
    handleReject() {
      rejectLeave(this.taskId).then(res => {
        console.log("驳回成功!");
        this.$tab.closePage(this.$route).then(({visitedViews}) => {
          this.toLastView(visitedViews, this.$route)
        });
      })
    },
  }
};
</script>

<style>
.c-process-task {
  padding: 16px;
  display: flex;
  justify-content: center;
}

.c-process-task__form {
  width: 500px;
}
</style>
