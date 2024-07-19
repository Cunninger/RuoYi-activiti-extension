<template>
    <div class="c-work-management" style="margin: 0px 8px 8px;">
        <el-tabs v-model="activeName" @tab-click="handleTabClick" type="border-card">
            <el-tab-pane label="定时作业" name="1"></el-tab-pane>
            <el-tab-pane label="异步作业" name="2"></el-tab-pane>
            <el-tab-pane label="挂起作业" name="3"></el-tab-pane>
            <el-tab-pane label="死亡作业" name="4"></el-tab-pane>
        </el-tabs>
        <div class="search-bar">
            <div>
                <label>流程定义ID:</label>
                <el-input type="text" v-model="searchParams.processDefinitionId" size="small"/>
            </div>
            <div v-if="activeName !== '3'">
                <label>计划执行时间:</label>
                <el-date-picker
                    v-model="searchParams.range"
                    value-format="yyyy-MM-dd HH:mm:ss"
                    type="datetimerange"
                    range-separator="至"
                    start-placeholder="开始日期"
                    end-placeholder="结束日期"
                    size="small"
                >
                </el-date-picker>
            </div>
            <div class="btns">
                <el-button type="primary" @click="search" size="mini" icon="el-icon-search">搜索</el-button>
                <el-button type="default" @click="reset" size="mini" icon="el-icon-refresh">重置</el-button>
            </div>
        </div>
        <table-template :data="tableData" :total="total">
            <template #columns>
                <el-table-column
                    v-for="(column, i) in currentColumns"
                    :key="i"
                    :prop="column.key"
                    :label="column.label"
                ></el-table-column>
            </template>
        </table-template>
    </div>
</template>

<script>
import TableTemplate from "@/components/TableTemplate";
import {getListJobs} from "./api";
import commonUtil from "@/utils/common"

export default {
    name: "RunHistory",
    components: {
        TableTemplate
    },
    data() {
        return {
            responseData: {},
            activeName: "1",
            searchParams: {
                processDefinitionId: "",
                range: null,
                pageNum: 1,
                pageSize: 10
            },
            columns: {
                1: [
                    {
                        key: "processDefinitionId",
                        label: "流程定义编号"
                    },
                    {
                        key: "jobHandlerType",
                        label: "作业类型"
                    },
                    {
                        key: "duedate",
                        label: "计划执行时间"
                    },
                    {
                        key: "processInstanceId",
                        label: "流程实例编号"
                    },
                    {
                        key: "retries",
                        label: "剩余重试次数"
                    }
                ],
                2: [
                    {
                        key: "processDefinitionId",
                        label: "流程定义编号"
                    },
                    {
                        key: "jobHandlerType",
                        label: "作业类型"
                    },
                    {
                        key: "duedate",
                        label: "计划执行时间"
                    },
                    {
                        key: "processInstanceId",
                        label: "流程实例编号"
                    },
                    {
                        key: "retries",
                        label: "剩余重试次数"
                    }
                ],
                3: [
                    {
                        key: "processDefinitionId",
                        label: "流程定义编号"
                    },
                    {
                        key: "jobHandlerType",
                        label: "作业类型"
                    },
                    {
                        key: "duedate",
                        label: "计划执行时间"
                    },
                    {
                        key: "processInstanceId",
                        label: "流程实例编号"
                    },
                    {
                        key: "retries",
                        label: "剩余重试次数"
                    }
                ],
                4: [
                    {
                        key: "processDefId",
                        label: "流程定义编号"
                    },
                    {
                        key: "jobHandlerType",
                        label: "作业类型"
                    },
                    {
                        key: "dueDate",
                        label: "计划执行时间"
                    },
                    {
                        key: "processInstanceId",
                        label: "流程实例编号"
                    },
                    {
                        key: "exceptionMessage",
                        label: "异常信息"
                    }
                ]
            }
        };
    },
    computed: {
        tableData() {
            return this.responseData.rows || []
        },
        total() {
            return this.responseData.total || 0
        },
        currentColumns() {
            return this.columns[this.activeName];
        },
        transferedSearchParams() {
            return {
                processDefinitionId: this.searchParams.processDefinitionId,
                pageNum: this.searchParams.pageNum,
                pageSize: this.searchParams.pageSize,
                startDate: (this.searchParams.range && this.searchParams.range[0]) || "",
                endDate: (this.searchParams.range && this.searchParams.range[1]) || "",
                isAsc: "asc",
                type: this.activeName
            };
        }
    },
    mounted() {
        this.getListJobByParamsAndRender(this.transferedSearchParams);
    },
    methods: {
        search() {
            this.getListJobByParamsAndRender(this.transferedSearchParams);
        },
        reset() {
            this.searchParams.processDefinitionId = "";
            this.searchParams.range = null;
            this.getListJobByParamsAndRender(this.transferedSearchParams);

        },
        getListJobByParamsAndRender(params) {
            const {
                processDefinitionId = "",
                pageNum = 1,
                pageSize = 10,
                endDate = "",
                startDate = "",
                isAsc,
                type = "1"
            } = params;
            getListJobs(type, {
                pageSize,
                pageNum,
                isAsc,
                processDefinitionId,
                startDate,
                endDate
            }).then(res => {
                // 转化一下时间
                console.log("this.activeName", this.activeName);
                if (
                    this.activeName === "1"
                    || this.activeName === "2"
                    || this.activeName === "3"
                ) {
                    res.rows.map(item => {
                        item.duedate = commonUtil.normalizeDateTimeString(item.duedate);
                    });
                }
                if (this.activeName === "4") {
                    res.rows.map(item => {
                        item.dueDate = commonUtil.normalizeDateTimeString(item.dueDate);
                    });
                }
               this.responseData = res;
            });
        },
        handleTabClick(tab) {
            this.getListJobByParamsAndRender(this.transferedSearchParams);
        }
    },
};
</script>
<style scoped>
.c-work-management {
    background: #FFFFFF;
    border: 1px solid #DCDFE6;
    -webkit-box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.12), 0 0 6px 0 rgba(0, 0, 0, 0.04);
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.12), 0 0 6px 0 rgba(0, 0, 0, 0.04);
}
.search-bar {
    display: flex;
    margin-top: 8px;
    margin-left: 8px;
}
.el-tabs--border-card {
    border: none;
    box-shadow: none;
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
.el-button {
    height: 32px;
}
</style>

<style>

</style>