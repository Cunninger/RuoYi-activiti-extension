<template>
    <div>
        <div class="search-bar">
            <div>
                <label>申请时间:</label>
                <el-date-picker
                    v-model="searchParams.range"
                    value-format="yyyy-MM-dd HH:mm:ss"
                    type="datetimerange"
                    range-separator="至"
                    start-placeholder="开始日期"
                    end-placeholder="结束日期">
                </el-date-picker>
            </div>
            <div>
                <label>申请人:</label>
                <el-input type="text" v-model="searchParams.applier" />
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
                    prop="itemlist"
                    label="采购清单">
                </el-table-column>
                <el-table-column
                    prop="total"
                    label="总价">
                </el-table-column>
                <el-table-column
                    prop="applytime"
                    label="申请时间">
                </el-table-column>
                <el-table-column
                    prop="applyer"
                    label="申请人">
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
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="采购清单">
                    <el-input type="textarea" v-model="form.itemlist"></el-input>
                </el-form-item>
                <el-form-item label="总价">
                    <el-input type="text" v-model="form.total"></el-input>
                </el-form-item>
                <el-form-item label="申请人">
                    <el-input type="text" v-model="form.applyer" disabled></el-input>
                </el-form-item>
                <el-form-item label="采购经理">
                    <el-select v-model="form.purchasemanager">
                        <el-option
                            v-for="(user, i) in userList"
                            :key="i"
                            :label="user.userName"
                            :value="user.userName"
                        ></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="财务">
                    <el-select v-model="form.financeName">
                        <el-option
                            v-for="(user, i) in userList"
                            :key="i"
                            :label="user.userName"
                            :value="user.userName"
                        ></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="出纳">
                    <el-select v-model="form.pay">
                        <el-option
                            v-for="(user, i) in userList"
                            :key="i"
                            :label="user.userName"
                            :value="user.userName"
                        ></el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="总经理">
                    <el-select v-model="form.managerName">
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
                <el-button type="primary" @click="handleAdd">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
import TableTemplate from "@/components/TableTemplate";
import {getPurchaseApplyList, addPurchase, deletePurchase, exportPurchase} from "./api/purchase.js";
import {listUser} from "@/api/system/user.js"
// itemlist: 笔
// total: 100
// applyer: admin
// purchasemanager: admin
// finance: admin
// pay: admin
// manager: admin
export default {
    name: "leaveApply",
    components: {
        TableTemplate
    },
    data() {
        return {
            responseData: {},
            dialogVisible: false,
            form: {
                itemlist: "",
                total: "",
                applyer: this.$store.state.user.name,
                purchasemanager: "admin",
                financeName: "admin",
                pay: "admin",
                managerName: "admin",
            },
            searchParams: {
                range: [],
                applier: "",
                pageSize: 10,
                pageNum: 1
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
        this.getPurchaseApplyListAndRender(this.searchParams);
         listUser().then(res => {
            console.log("获取用户", res);
            this.userList = res.rows;
        });
    },
    methods: {
        handleSelectionChange(selection) {
            console.log(selection);
            this.currentSelection = selection;
        },
        getPurchaseApplyListAndRender(params) {
            const {range = [], pageSize = 10, pageNum = 1, applier = ""} = params;
            getPurchaseApplyList({
                pageSize,
                pageNum,
                isAsc: "asc",
                "params[beginApplyTime]": (range && range[0]) || "",
                "params[endApplyTime]": (range && range[1]) || "",
                applyer: applier
            }).then(res => {
                this.responseData = res;
            });
        },
        handleAdd() {
            addPurchase(this.form).then(res => {
                this.$message.success("添加成功!");
                this.dialogVisible = false;
                this.getPurchaseApplyListAndRender(this.searchParams);
            });
        },
        search() {
            this.getPurchaseApplyListAndRender(this.searchParams);
        },
        reset() {
            this.searchParams.applier = "";
            this.searchParams.range = [];
            this.getPurchaseApplyListAndRender(this.searchParams);
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
        handleMultipleDelete() {
            this.$confirm(`确定删除选中的${this.currentSelection.length}条数据吗？`, {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const ids = this.selectionIds.join(",");
                this.deleteByIdsAndRender(ids)
            });
        },
        handleExport() {
            this.$confirm('确定导出所有数据吗？', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const {applier, range} = this.searchParams;
                const params = {
                    applyer: applier,
                    "params[beginApplyTime]": (range && range[0]) || "",
                    "params[endApplyTime]": (range && range[1]) || "",
                    isAsc: "asc"
                };
                exportPurchase(params)
            });
        },
        deleteByIdsAndRender(ids) {
            deletePurchase({
                ids
            }).then(() => {
                this.$message.error("删除成功!")
                this.getPurchaseApplyListAndRender(this.searchParams);
            })
        },
        handlePageChange({pageNum, pageSize}) {
            console.log(pageNum, pageSize);
            this.searchParams.pageNum = pageNum;
            this.searchParams.pageSize = pageSize;
            this.getPurchaseApplyListAndRender(this.searchParams);
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
