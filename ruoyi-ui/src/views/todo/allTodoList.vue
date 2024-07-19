<template>
    <div>
        <div class="search-bar">
            <div>
                <label>流程名称</label>
                <el-input v-model="searchParams.processName" size="small"></el-input>
            </div>
            <div>
                <label>任务名称</label>
                 <el-input v-model="searchParams.taskName" size="small"></el-input>
            </div>
            <div>
                <el-button type="primary" @click="search" size="mini" icon="el-icon-search">搜索</el-button>
                <el-button type="default" @click="reset" size="mini" icon="el-icon-refresh">重置</el-button>
            </div>
        </div>
        <table-template
            :data="tableData"
            :total="total"
            @page-change="handlePageChange"
        >
            <template #columns>
                <el-table-column
                    prop="taskName"
                    label="任务名称">
                </el-table-column>
                <el-table-column
                    prop="processInstanceId"
                    label="流程实例编号">
                </el-table-column>
                <el-table-column
                    prop="executionId"
                    label="执行实例编号">
                </el-table-column>
                <el-table-column
                    prop="businessKey"
                    label="业务号">
                </el-table-column>
                <el-table-column
                    prop="processName"
                    label="流程名称">
                </el-table-column>
                <el-table-column
                    prop="starter"
                    label="发起人">
                </el-table-column>
                <el-table-column
                    prop="assignee"
                    label="办理人">
                </el-table-column>
                <el-table-column
                    prop="createTime"
                    label="任务创建时间">
                </el-table-column>
                <el-table-column
                    prop="startTime"
                    label="流程启动时间">
                </el-table-column>
                <el-table-column
                    prop="operation"
                    label="操作">
                    <template slot-scope="scope">
                        <el-button
                        size="mini"
                        type="text"
                        @click="handleTodo(scope.$index, scope.row)">办理</el-button>
                    </template>
                </el-table-column>
            </template>
        </table-template>
    </div>
</template>

<script>
import TableTemplate from "@/components/TableTemplate";
import {getAllTodoList} from "./api/allTodoList";

export default {
    name: "AllTodoList",
    components: {
        TableTemplate
    },
    data() {
        return {
            responseData: {},
            searchParams: {
                taskName: "",
                processName: "",
                pageNum: 1,
                pageSize: 10
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
       this.getAllTodoListByParamsAndRender(this.searchParams);
    },
    methods: {
        getAllTodoListByParamsAndRender(params) {
            const {pageSize = 1, pageNum = 10, processName = "", taskName = ""} = params;
            getAllTodoList({
                pageSize,
                pageNum,
                isAsc: "asc",
                processName,
                taskName
            }).then(res => {
                this.responseData = res;
            });
        },
        search() {
            this.getAllTodoListByParamsAndRender(this.searchParams);
        },
        reset() {
            this.searchParams.processName = "";
            this.searchParams.taskName = "";
            this.getAllTodoListByParamsAndRender(this.searchParams);
        },
        handlePageChange() {},
        handleTodo(index, row) {
            console.log("todo", row);
            const {formKey, taskId, businessKey} = row;
            this.$router.push({
                path: `/process/${formKey}/${taskId}?id=${businessKey}`,
                meta: { title: "测试" },
                params: {row}
            })
        }
    },
};
</script>

<style scoped>
label {
    font-size: 14px;
    color: #606266;
    margin-right: 8px;
}
.search-bar {
    display: flex;
    margin-top: 8px;
    margin-left: 8px;
}
.el-input {
    display: inline-block;
    width: 300px;
    margin-right: 10px;
}
</style>