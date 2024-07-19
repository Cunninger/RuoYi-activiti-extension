<template>
    <div>
        <div class="search-bar">
            <div>
                <label>请假类型</label>
                <el-select v-model="searchParams.leaveType" size="small">
                    <el-option label="所有" value="" :key="99"></el-option>
                    <el-option v-for="(leaveType, i) in leaveTypeList" :label="leaveType" :value="leaveType" :key="i"></el-option>
                </el-select>
            </div>
            <div>
                <label>申请时间</label  >
                <el-date-picker
                    size="small"
                    v-model="searchParams.range"
                    value-format="yyyy-MM-dd HH:mm:ss"
                    type="datetimerange"
                    range-separator="至"
                    start-placeholder="开始日期"
                    end-placeholder="结束日期">
                </el-date-picker>
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
            @selection-change="handleSelectionChange"
            @page-change="handlePageChange"
        >
            <template #toolbar>
                <el-button type="primary" @click="dialogVisible = true" plain icon="el-icon-plus" size="mini">添加</el-button>
                <el-button type="danger" :disabled="currentSelection.length === 0" @click="handleMultipleDelete" plain icon="el-icon-delete" size="mini">删除</el-button>
            </template>
            <template #columns>
                <el-table-column
                    prop="userId"
                    label="请假人">
                </el-table-column>
                <el-table-column
                    prop="startTime"
                    label="起始时间">
                </el-table-column>
                <el-table-column
                    prop="endTime"
                    label="结束时间">
                </el-table-column>
                <el-table-column
                    prop="leaveType"
                    label="类型">
                </el-table-column>
                <el-table-column
                    prop="applyTime"
                    label="申请时间">
                </el-table-column>
                <el-table-column
                    prop="startTime"
                    label="实际起始时间">
                </el-table-column>
                <el-table-column
                    prop="endTime"
                    label="实际结束时间">
                </el-table-column>
                <el-table-column
                    prop="operation"
                    label="操作">
                    <template slot-scope="scope">
                        <el-button
                        size="mini"
                        type="text"
                        icon="el-icon-delete"
                        @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </template>
        </table-template>
        <el-dialog :visible.sync="dialogVisible" width="600px">
            <el-form ref="form" :model="form" label-width="110px">
                <el-form-item label="请假人">
                    <el-input v-model="form.userId" disabled></el-input>
                </el-form-item>
                <el-form-item label="类型">
                    <el-select v-model="form.leaveType">
                        <el-option v-for="(leaveType, i) in leaveTypeList" :label="leaveType" :value="leaveType" :key="i"></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="起始时间">
                    <el-date-picker type="datetime" value-format="yyyy-MM-dd HH:mm:ss" placeholder="选择日期" v-model="form.startTime" style="width: 100%;"></el-date-picker>
                </el-form-item>
                <el-form-item label="结束时间">
                    <el-date-picker type="datetime" value-format="yyyy-MM-dd HH:mm:ss" placeholder="选择日期" v-model="form.endTime" style="width: 100%;"></el-date-picker>
                </el-form-item>
                <el-form-item label="原因">
                    <el-input type="textarea" v-model="form.reason"></el-input>
                </el-form-item>
                <el-form-item label="部门领导">
                    <el-select v-model="form.deptleader">
                        <el-option
                            v-for="(user, i) in userList"
                            :key="i"
                            :label="user.userName"
                            :value="user.userName"
                        ></el-option>
                    </el-select>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="handleAddLeave">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>

// userId: admin
// leaveType: 事假
// startTime: 1899-11-27 06:30:00
// endTime: 2024-04-11 23:25:44
// reason: 123
// deptleader: admin
import TableTemplate from "@/components/TableTemplate";
import {getLeaveApplyList, addLeave, deleteLeave, exportLeave} from "./api/leaveApply";
import {listUser} from "@/api/system/user.js"

export default {
    name: "leaveApply",
    components: {
        TableTemplate
    },
    data() {
        return {
            responseData: {},
            searchParams: {
                leaveType: "",
                searchParams: [],
                pageNum: 1,
                pageSize: 10
            },
            leaveTypeList: [" 事假", "病假", "年假", "丧假", "年假"],
            dialogVisible: false,
            form: {
                userId: this.$store.state.user.name,
                leaveType: "事假",
                startTime: "",
                endTime: "",
                reason: "",
                deptleader: "admin"
            },
            currentSelection: [],
            userList: []
        };
    },
    computed: {
        tableData() {
            return this.responseData.rows || []
        },
        total() {
            return this.responseData.total || 0
        },
        selectionIds() {
            return this.currentSelection.map(item => item.id)
        },
    },
    mounted() {
        this.getLeaveApplyListAndRender(this.searchParams)
        listUser().then(res => {
            console.log("获取用户", res);
            this.userList = res.rows;
        });
    },
    methods: {
        handleMultipleDelete() {
            this.$confirm(`确定删除选中的${this.currentSelection.length}条数据吗？`, {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const ids = this.selectionIds.join(",");
                this.deleteByIdsAndRender(ids);
            });

        },
        handleExport() {
            this.$confirm('确定导出所有数据吗？', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const {leaveType, range} = this.searchParams;
                const params = {
                    leaveType,
                    "params[beginApplyTime]": (range && range[0]) || "",
                    "params[endApplyTime]": (range && range[1]) || "",
                    isAsc: "asc"
                };
                exportLeave(params)
            });
        },
        handleSelectionChange(selection) {
            this.currentSelection = selection;
        },
        getLeaveApplyListAndRender(params) {
            const {leaveType, range, pageSize = 10, pageNum = 1} = params;
            getLeaveApplyList({
                pageSize,
                pageNum,
                isAsc: "asc",
                leaveType,
                "params[beginApplyTime]": (range && range[0]) || "",
                "params[endApplyTime]": (range && range[1]) || ""
            }).then(res => {
                this.responseData = res;
            });
        },
        handleAddLeave() {
            addLeave(this.form).then(res => {
                this.$message.success("添加成功!");
                this.dialogVisible = false;
                this.getLeaveApplyListAndRender(this.searchParams);
            });
        },
        search() {
            this.getLeaveApplyListAndRender(this.searchParams);
        },
        reset() {
            this.searchParams.leaveType = "";
            this.searchParams.range = [];
            this.getLeaveApplyListAndRender(this.searchParams);
        },
        handleDelete(index, row) {
            this.$confirm('确定删除吗？', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const {id} = row;
                this.deleteByIdsAndRender(id)
            });
        },
        deleteByIdsAndRender(ids) {
            deleteLeave({
                ids
            }).then(() => {
                this.$message.error("删除成功!")
                this.getLeaveApplyListAndRender(this.searchParams);
            })
        },
        handlePageChange({pageNum, pageSize}) {
            this.searchParams.pageNum = pageNum;
            this.searchParams.pageSize = pageSize;
            this.getLeaveApplyListAndRender(this.searchParams);
        },
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
