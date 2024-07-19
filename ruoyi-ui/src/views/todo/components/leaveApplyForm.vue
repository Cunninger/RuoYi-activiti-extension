<template>
    <div class="c-leaveapply-form">
        <el-form  ref="form" :model="form" label-width="120px">
            <el-form-item label="请假人">
                <el-input v-model="form.userId" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="类型">
                <el-input v-if="step !== 'modifyapply' && step !== 'addleave'" v-model="form.leaveType" :disabled="canNotEdit"></el-input>
                <el-select v-else v-model="form.leaveType">
                    <el-option v-for="(leaveType, i) in leaveTypeList" :label="leaveType" :value="leaveType" :key="i"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="起始时间">
                <el-input v-if="step !== 'modifyapply' && step !== 'addleave'" v-model="form.startTime" :disabled="canNotEdit"></el-input>
                <el-date-picker v-else type="datetime" value-format="yyyy-MM-dd HH:mm:ss" placeholder="选择日期" v-model="form.startTime" style="width: 100%;"></el-date-picker>
            </el-form-item>
            <el-form-item label="结束时间">
                <el-input v-if="step !== 'modifyapply' && step !== 'addleave'" v-model="form.endTime" :disabled="canNotEdit"></el-input>
                <el-date-picker v-else type="datetime" value-format="yyyy-MM-dd HH:mm:ss" placeholder="选择日期" v-model="form.endTime" style="width: 100%;"></el-date-picker>
            </el-form-item>
            <el-form-item label="原因">
                <el-input v-model="form.reason" :disabled="canNotEdit"></el-input>
            </el-form-item>
            <el-form-item label="人事" v-if="step==='deptleadercheck'">
                <el-select v-model="form.hr">
                    <el-option
                        v-for="(user, i) in userList"
                        :key="i"
                        :label="user.userName"
                        :value="user.userName"
                    ></el-option>
                </el-select>
            </el-form-item>
            <template v-if="step==='deptleadercheck' || step==='hrcheck'">
                <el-form-item label="审批结果" >
                    <el-radio-group v-model="form.resource">
                        <el-radio label="true">同意</el-radio>
                        <el-radio label="false">拒绝</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="审批意见">
                    <el-input type="textarea" v-model="form.comment"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="onSubmit">提交</el-button>
                    <el-button type="danger" @click="cancel" v-if="step!=='destroyapply'">撤销</el-button>
                    <el-button type="warning" @click="reject" v-if="step!=='destroyapply'">驳回</el-button>
                </el-form-item>
            </template>
            <template v-if="step==='destroyapply'">
                <el-form-item label="实际起始时间">
                    <el-date-picker
                        v-model="form.realityStartTime"
                        value-format="yyyy-MM-dd HH:mm:ss"
                        type="datetime"
                        :placeholder="`选择${type === 'hang' ? '挂起' : '激活'}时间`">
                    </el-date-picker>
                </el-form-item>
                <el-form-item label="实际结束时间">
                    <el-date-picker
                        v-model="form.realityEndTime"
                        value-format="yyyy-MM-dd HH:mm:ss"
                        type="datetime"
                        :placeholder="`选择${type === 'hang' ? '挂起' : '激活'}时间`">
                    </el-date-picker>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="onSubmit">提交</el-button>
                </el-form-item>
            </template>
            <template v-if="step==='addleave'">
                <el-form-item>
                    <el-button type="primary" @click="onSubmit">提交</el-button>
                    <el-button type="danger" @click="cancel">撤销</el-button>
                </el-form-item>
            </template>
            <template v-if="step==='modifyapply'">
                <el-form-item label="是否重新申请" >
                    <el-radio-group v-model="form.reapply">
                        <el-radio label="true">是</el-radio>
                        <el-radio label="false">否</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="onSubmit">提交</el-button>
                </el-form-item>
            </template>
        </el-form>
    </div>
</template>

<script>

// comment: "1"
// deptleaderapprove: "true"
// hr: "admin"

const stepMap = {
    // 发起请假申请,此处为驳回后返回的位置
    addleave: "addleave",
    // 请假流程中拒绝过程,回到申请人进行修改
    modifyapply: "modifyapply",
    // 部门领导审批
    deptleadercheck: "deptleaderapprove",
    // 人事审批
    hrcheck: "hrapprove",
    // 销假
    destroyapply: "destroyapply"
};

import {listUser} from "@/api/system/user.js"
export default {
    props: {
        step: {
            type: String,
            default: ""
        },
        formInfo: {
            type: Object,
            default: () => ({})
        }
    },
    data() {
        return {
            form: {
                reapply: "true",
                resource: "true",
                realityStartTime: "",
                realityEndTime: "",
                userId: "",
                endTime: "",
                startTime: "",
                reason: "",
                leaveType: "",
                comment: ""
            },
            leaveTypeList: [" 事假", "病假", "年假", "丧假", "年假"],
            userList: []
        };
    },
    computed: {
        canNotEdit() {
            return this.step !== "addleave" && this.step !== "modifyapply";
        }
    },
    watch: {
        formInfo(newFormData) {
            this.form.userId = newFormData.userId;
            this.form.endTime = newFormData.endTime;
            this.form.startTime = newFormData.startTime;
            this.form.reason = newFormData.reason;
            this.form.comment = newFormData.comment;
            this.form.leaveType = newFormData.leaveType;
            this.form.realityEndTime = newFormData.realityEndTime;
            this.form.realityStartTime = newFormData.realityStartTime;
        }
    },
    mounted() {
        listUser().then(res => {
            console.log("获取用户", res);
            this.userList = res.rows;
            this.form.hr = this.userList[0] && this.userList[0].userName;
        });
    },
    methods: {
        onSubmit() {
            this.$emit("submit", {
                ...this.form,
                [stepMap[this.step]]: this.form.resource,
            });
        },
        reject() {
            this.$emit("reject")
        },
        cancel() {
            this.$emit("cancel")
        }
    }
};
</script>
