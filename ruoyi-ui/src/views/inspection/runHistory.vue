<template>
    <div>
        <div class="search-bar">
            <div>
                <label>流程名称:</label>
                <el-input type="text" v-model="searchParams.name" size="small"/>
            </div>
            <div>
                <label>业务号:</label>
                <el-input type="text" v-model="searchParams.bussinesskey" size="small"/>
            </div>
            <div>
                <el-button type="primary" @click="search" size="mini" icon="el-icon-search">搜索</el-button>
                <el-button type="default" @click="reset" size="mini" icon="el-icon-refresh">重置</el-button>
            </div>
        </div>
        <table-template :data="tableData" :total="total" @page-change="handlePageChange">
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
                    prop="ended"
                    label="是否结束"
                    :formatter="handleEnded"
                >
                </el-table-column>
                <el-table-column
                    prop="startTime"
                    label="开始时间">
                </el-table-column>
                <el-table-column
                    prop="endTime"
                    label="结束时间">
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
                        @click="showHistory(scope.$index, scope.row)">查看历史</el-button>
                        <el-button
                        v-if="!scope.row.suspended"
                        size="mini"
                        type="text"
                        @click="showVariable(scope.$index, scope.row)">查看变量</el-button>
                    </template>
                </el-table-column>
            </template>
        </table-template>
        <el-dialog
            title="执行记录"
            :visible.sync="showHistoryDialog"
        >
            <el-table :data="historyList" height="500">
                <el-table-column
                    prop="taskName"
                    label="活动名称">
                </el-table-column>
                <el-table-column
                    prop="assignee"
                    label="办理人">
                </el-table-column>
                <el-table-column
                    prop="comment"
                    label="审批意见">
                </el-table-column>
                <el-table-column
                    prop="startTime"
                    label="开始时间">
                </el-table-column>
                <el-table-column
                    prop="endTime"
                    label="结束时间">
                </el-table-column>
            </el-table>
            <span slot="footer" class="dialog-footer">
                <el-button @click="showHistoryDialog = false">取 消</el-button>
                <el-button type="primary" @click="showHistoryDialog = false">确 定</el-button>
            </span>
        </el-dialog>
        <el-dialog
            :visible.sync="showVariableDialog"
        >
            <el-table :data="variablesList" height="500">
                <el-table-column
                    prop="variableName"
                    label="变量名">
                </el-table-column>
                <el-table-column
                    prop="variableTypeName"
                    label="变量类型">
                </el-table-column>
                <el-table-column
                    prop="value"
                    label="变量值">
                </el-table-column>
                <el-table-column
                    prop="createTime"
                    label="创建时间">
                </el-table-column>
                <el-table-column
                    prop="lastUpdatedTime"
                    label="最后修改时间">
                </el-table-column>
            </el-table>
            <span slot="footer" class="dialog-footer">
                <el-button @click="showVariableDialog = false">取 消</el-button>
                <el-button type="primary" @click="showVariableDialog = false">确 定</el-button>
            </span>
        </el-dialog>

    </div>
</template>

<script>
import TableTemplate from "@/components/TableTemplate";
import {getListHistoryProcess, getListByTypeAndId} from "./api";

export default {
    name: "RunHistory",
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
            },
            showHistoryDialog: false,
            showVariableDialog: false,
            historyList: [],
            variablesList: []
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
        this.getListHistoryProcessByParamsAndRender(this.searchParams);
    },
    methods: {
        handleEnded(row) {
            return row.ended ? "是" : "否";
        },
        getListHistoryProcessByParamsAndRender(params) {
            const {pageNum = 1, pageSize = 10, name = "", bussinesskey = ""} = params;
            getListHistoryProcess({
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
            console.log("this.searchParams", this.searchParams)
            this.getListHistoryProcessByParamsAndRender(this.searchParams);
        },
        reset() {
            this.searchParams.name = "";
            this.searchParams.bussinesskey = "";
            this.getListHistoryProcessByParamsAndRender(this.searchParams);
        },
        handlePageChange({pageNum, pageSize}) {
            console.log(pageNum, pageSize);
            this.searchParams.pageNum = pageNum;
            this.searchParams.pageSize = pageSize;
            this.getListHistoryProcessByParamsAndRender(this.searchParams);
        },
        showHistory(index, row) {
            const {processInstanceId} = row;
            this.showHistoryDialog = true;
            getListByTypeAndId("history", processInstanceId).then(res => {
                console.log("获取到历史", res);
                this.historyList = res.rows;
            });
        },
        showVariable(index, row) {
            const {processInstanceId} = row;
            this.showVariableDialog = true;
            getListByTypeAndId("variables", processInstanceId).then(res => {
                console.log("获取到变量", res);
                this.variablesList = res.rows;
            });
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