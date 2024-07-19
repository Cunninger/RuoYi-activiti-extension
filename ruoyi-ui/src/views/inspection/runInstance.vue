<template>
    <div>
        <div class="search-bar">
            <div>
                <label>流程名称</label>
                <el-input type="text" v-model="searchParams.name" size="small"/>
            </div>
            <div>
                <!-- <el-button type="success" @click="search">搜索</el-button>
                <el-button type="warning" @click="reset">重置</el-button> -->
                <el-button type="primary" @click="search" size="mini" icon="el-icon-search">搜索</el-button>
                <el-button type="default" @click="reset" size="mini" icon="el-icon-refresh">重置</el-button>
            </div>
        </div>
        <table-template :data="tableData" row-key="executionId" no-page>
            <template #columns>
                <el-table-column
                    prop="executionId"
                    label="执行实例编号">
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
                    prop="active"
                    label="是否激活">
                </el-table-column>
                <el-table-column
                    prop="suspended"
                    label="是否挂起">
                </el-table-column>
                <el-table-column
                    prop="startTime"
                    label="开始时间">
                </el-table-column>
                <el-table-column
                    prop="startUserId"
                    label="发起人">
                </el-table-column>
            </template>
        </table-template>
    </div>
</template>

<script>
import TableTemplate from "@/components/TableTemplate";
import {getListExecutions} from "./api";
import commonUtil from "@/utils/common"

export default {
    name: "RunInstance",
    components: {
        TableTemplate
    },
    data() {
        return {
            tableData: [],
            searchParams: {
                name: ""
            }
        };
    },
    mounted() {
       this.getListExecutionsByParamsAndRender(this.searchParams);
    },
    methods: {
        search() {
            this.getListExecutionsByParamsAndRender(this.searchParams);
        },
        reset() {
            this.searchParams.name = "";
            this.getListExecutionsByParamsAndRender(this.searchParams);
        },
        getListExecutionsByParamsAndRender(params) {
            const {
                name = "",
            } = params;
            let requestParams;
            if (name) {
                requestParams = {name};
            }
            getListExecutions(requestParams).then(res => {
                res = res.map(item => {
                    return {
                        ...item,
                        active: item.active ? "是" : "否",
                        suspended: item.suspended ? "是" : "否"
                    };
                });
                const tree = commonUtil.listToTree(res);
                this.tableData = tree;
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