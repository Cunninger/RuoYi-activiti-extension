<template>
    <div class="c-model">
        <div class="search-bar">
            <div>
                <label>模型标识</label>
                <el-input v-model="searchParams.key" size="small"></el-input>
            </div>
            <div>
                <label>模型名称</label>
                 <el-input v-model="searchParams.name" size="small"></el-input>
            </div>
            <div>
                <el-button type="primary" @click="search" size="mini" icon="el-icon-search">搜索</el-button>
                <el-button type="default" @click="reset" size="mini" icon="el-icon-refresh">重置</el-button>
            </div>
        </div>
        <div class="c-model__content">
            <table-template
                :data="tableData"
                :total="total"
                @page-change="handlePageChange"
            >
                <template #toolbar>
                    <el-button type="primary" @click="showAddDialog = true" size="mini" plain icon="el-icon-plus">新建模型</el-button>
                </template>
                <template #columns>
                    <el-table-column
                    prop="key"
                    label="模型标识"
                    width="180">
                </el-table-column>
                <el-table-column
                    prop="name"
                    label="模型名称"
                    width="180">
                </el-table-column>
                <el-table-column
                    prop="category"
                    label="分类">
                </el-table-column>
                <el-table-column
                    prop="version"
                    label="版本">
                </el-table-column>
                <el-table-column
                    width="320"
                    prop="lastUpdateTime"
                    :formatter="handleDateTime"
                    label="创建时间">
                </el-table-column>
                <el-table-column
                    prop="address"
                    width="320"
                    label="操作">
                    <template slot-scope="scope">
                        <!--primary / success / warning / danger / info / text-->
                        <el-button
                        size="mini"
                        type="text"
                        @click="handleDesign(scope.$index, scope.row)">设计</el-button>
                        <el-button
                        v-if="!scope.row.deploymentId"
                        size="mini"
                        type="text"
                        @click="handlePublish(scope.$index, scope.row)">发布</el-button>
                        <el-button
                        size="mini"
                        type="text"
                        @click="handleExport(scope.$index, scope.row)">导出</el-button>
                        <el-button
                        size="mini"
                        type="text"
                        @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                    </template>
                </el-table-column>
                </template>
            </table-template>
        </div>
        <el-dialog
            title="新建模型"
            :visible.sync="showAddDialog"
        >
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="模型标识">
                    <el-input v-model="form.key"></el-input>
                </el-form-item>
                <el-form-item label="模型名称">
                    <el-input v-model="form.name"></el-input>
                </el-form-item>
                <el-form-item label="分类">
                    <el-input v-model="form.category"></el-input>
                </el-form-item>
                <el-form-item label="描述">
                    <el-input type="textarea" v-model="form.description"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="showAddDialog = false">取 消</el-button>
                <el-button type="primary" @click="handleAddModel">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {getModelLists, addModel, publishModelById, deleteModelById} from "./api/model.js";
import commonHelper from "@/utils/common.js"
import TableTemplate from "@/components/TableTemplate";
export default {
    name: "ModelManagement",
    components: {
        TableTemplate
    },
    data() {
        return {
            responseData: {},
            showAddDialog: false,
            form: {
                key: "",
                name: "",
                category: "",
                description: "",
            },
            searchParams: {
                name: "",
                key: "",
                pageSize: 10,
                pageNum: 1,
                orderByColumn: "modelSort",
                isAsc: "asc",
            },
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
    created() {
        this.getModelByParams(this.searchParams);
    },
    methods: {
        getModelByParams(params) {
            getModelLists(params).then(res => {
                this.responseData = res;
            });
        },
        handleAddModel() {
            const formData = commonHelper.objectToFormData(this.form);
            addModel(formData).then(res => {
                console.log(res);
                this.showAddDialog = false;
                this.getModelByParams(this.searchParams)
                this.$message.success("添加成功!");
                ["key", "name", "category", "description"].forEach(key => {
                    this.form[key] = "";
                });
            });
        },
        handleDateTime(row) {
            const {createTime} = row;
            return commonHelper.normalizeDateTimeString(createTime);
        },
        handleDesign(index, row) {
            const path = "/editor?modelId=" + row.id;
            commonHelper.openWindow(path);
        },
        handlePublish(index, row) {
            const id = row.id;
            publishModelById(id).then(res => {
                this.$message.success("部署成功!");
                this.getModelByParams(this.searchParams);
            });
        },
        handleExport(index, row) {
            const {key ,id} = row;
            const a = document.createElement("a");
            const url = process.env.VUE_APP_TAB_URL_PREFIX + "/model/manage/export/" + id;
            a.href = url;
            a.click();
        },
        handleDelete(index, row) {

            this.$confirm('确定删除该条模型信息吗？', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const id = row.id;
                deleteModelById(id).then(res => {
                    this.$message.success("删除成功!");
                    this.getModelByParams(this.searchParams);
                 });
            });

        },
        search() {
            this.getModelByParams(this.searchParams);
        },
        reset() {
            this.searchParams.name = "";
            this.searchParams.key = "";
            this.getModelByParams(this.searchParams);
        },
        handlePageChange({pageNum, pageSize}) {
            this.searchParams.pageNum = pageNum;
            this.searchParams.pageSize = pageSize;
            this.getModelByParams(this.searchParams);
        },
    }
};
</script>

<style>
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
.el-textarea {
    width: 300px;
}
</style>
