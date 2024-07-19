<template>
    <div>
        <div class="search-bar">
            <div>
                <label>流程名称</label>
                <el-input type="text" v-model="searchParams.name" size="small"/>
            </div>
            <div>
                <label>业务号</label>
                <el-input type="text" v-model="searchParams.bussinesskey" size="small"/>
            </div>
            <div>
                <el-button type="primary" @click="search" size="mini" icon="el-icon-search">搜索</el-button>
                <el-button type="default" @click="reset" size="mini" icon="el-icon-refresh">重置</el-button>
            </div>
        </div>
        <table-template
            :data="tableData"
            :total="total"
            selection
            @page-change="handlePageChange">
            <template #columns>
                <el-table-column
                    prop="processInstanceId"
                    label="流程实例编号">
                </el-table-column>
                <el-table-column
                    prop="businessKey"
                    label="业务号">
                </el-table-column>
                <el-table-column
                    prop="name"
                    label="流程名称">
                </el-table-column>
                <el-table-column
                    prop="currentTask"
                    label="当前节点">
                </el-table-column>
                <el-table-column
                    prop="assignee"
                    label="当前处理人">
                </el-table-column>
                <el-table-column
                    prop="suspended"
                    label="是否挂起"
                    :formatter="handleSuspend"
                >
                </el-table-column>
                <el-table-column
                    prop="startTime"
                    label="开始时间">
                </el-table-column>
                <el-table-column
                    prop="startUserId"
                    label="发起人">
                </el-table-column>
                <el-table-column
                    prop="operation"
                    label="操作">
                    <template slot-scope="scope">
                        <el-button
                        size="mini"
                        type="text"
                        @click="showProcess(scope.$index, scope.row)">流程进度</el-button>
                        <el-button
                        v-if="!scope.row.suspended"
                        size="mini"
                        type="text"
                        @click="handleEnable(false, scope.row)">挂起</el-button>
                        <el-button
                        v-else
                        size="mini"
                        type="text"
                        @click="handleEnable(true, scope.row)">唤醒</el-button>
                    </template>
                </el-table-column>
            </template>
        </table-template>
    </div>
</template>

<script>
import TableTemplate from "@/components/TableTemplate";
import {getListProcess, enableProcess} from "./api";
import commonHelper from "@/utils/common.js"

export default {
    name: "ProcessInstance",
    components: {
        TableTemplate
    },
    data() {
        return {
            responseData: {},
            searchParams: {
                name: "",
                bussinesskey: "",
                pageSize: 10,
                pageNum: 1
            }
        };
    },
    computed: {
        tableData() {
            return this.responseData.rows || []
        },
        total() {
            return this.responseData.total || 0
        }
    },
    mounted() {
        this.getListProcessByParamsAndRender(this.searchParams);
    },
    methods: {
        handleSuspend(row) {
            return row.suspended ? "是" : "否"
        },
        getListProcessByParamsAndRender(params) {
            const {name = "", bussinesskey = "", pageSize = 10, pageNum = 1} = params;
            return getListProcess({
                pageSize,
                pageNum,
                isAsc: "asc",
                name,
                bussinesskey
            }).then(res => {
                this.responseData = res;
            });
        },
        search() {
            console.log("搜索得参数", this.searchParams);
            this.getListProcessByParamsAndRender(this.searchParams);
        },
        reset() {
            this.searchParams.name = "";
            this.searchParams.bussinesskey = "";
            this.getListProcessByParamsAndRender(this.searchParams);
        },
        handlePageChange({pageNum, pageSize}) {
            console.log(pageNum, pageSize);
            this.searchParams.pageNum = pageNum;
            this.searchParams.pageSize = pageSize;
            this.getListProcessByParamsAndRender(this.searchParams);
        },
        handleEnable(enable, row) {
            const {processInstanceId} = row;
            enableProcess(processInstanceId, enable).then(res => {
                this.$message.success("操作成功！")
                this.getListProcessByParamsAndRender(this.searchParams);
            });
        },
        showProcess(index, row) {
            const {processInstanceId} = row;
            const url = `/flow/monitor/traceProcess/${processInstanceId}`;
            commonHelper.openWindow(url);
        }
    }
};
</script>

<style scoped>
.search-bar {
    display: flex;
    margin-top: 8px;
    margin-left: 8px;
}
.search-bar > *{
    margin-right: 8px;
}
.search-bar .el-input {
    display: inline-block;
    width: 300px;
    margin-right: 10px;
}
.search-bar label {
    font-size: 14px;
    color: #606266;
    margin-right: 8px;
}
</style>