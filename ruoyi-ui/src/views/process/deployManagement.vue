<template>
    <div>
        <div class="search-bar">
            <div>
                <label>流程标识</label>
                <el-input v-model="searchParams.key" size="small"></el-input>
            </div>
            <div>
                <label>流程名称</label>
                <el-input v-model="searchParams.name" size="small"></el-input>
            </div>
            <div>
                <label>版本</label>
                <el-select v-model="searchParams.latest" size="small">
                    <el-option label="只看新版本" value="true"></el-option>
                    <el-option label="全部版本" value="false"></el-option>
                </el-select>
            </div>
            <div>
                <el-button type="primary" @click="search" size="mini" icon="el-icon-search">搜索</el-button>
                <el-button type="default" @click="reset" size="mini" icon="el-icon-refresh">重置</el-button>
            </div>
        </div>
        <table-template :data="tableData" :total="total" @page-change="handlePageChange">
            <template #toolbar>
                <el-button type="primary" @click="showAddDialog = true" plain size="mini">部署</el-button>
            </template>
            <template #columns>
                <el-table-column
                    prop="id"
                    label="流程定义ID">
                </el-table-column>
                <el-table-column
                    prop="deploymentId"
                    label="流程部署ID">
                </el-table-column>
                <el-table-column
                    prop="key"
                    label="流程定义key">
                </el-table-column>
                <el-table-column
                    prop="name"
                    label="流程名称">
                </el-table-column>
                <el-table-column
                    prop="resourceName"
                    label="流程资源定义">
                </el-table-column>
                <el-table-column
                    prop="version"
                    label="版本号">
                </el-table-column>
                <el-table-column
                    prop="version"
                    width="200"
                    label="详情">
                    <template slot-scope="scope">
                        <el-button
                        size="mini"
                        type="text"
                        @click="handleDefinition(scope.$index, scope.row)">查看定义</el-button>
                        <el-button
                        size="mini"
                        type="text"
                        @click="handleProcess(scope.$index, scope.row)">流程图</el-button>
                    </template>
                </el-table-column>
                <el-table-column
                    prop="version"
                    label="操作"
                    width="240"
                >
                    <template slot-scope="scope">
                        <el-button
                        v-if="scope.row.suspended"
                        size="mini"
                        type="text"
                        @click="handleActive(scope.$index, scope.row)">激活</el-button>
                        <el-button
                        v-if="!scope.row.suspended"
                        size="mini"
                        type="text"
                        @click="handleHangOff(scope.$index, scope.row)">挂起</el-button>
                        <el-button
                        size="mini"
                        type="text"
                        @click="handleExchange(scope.$index, scope.row)">转为模型</el-button>
                        <el-button
                        size="mini"
                        type="text"
                        @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                    </template>
                </el-table-column>
            </template>
        </table-template>
        <el-dialog
             title="上传部署文件"
            :visible.sync="showAddDialog"
            width="30%"
        >
            <input id="deployFile" type="file" />
            <div>提示：仅允许导入“bpmn”、“xml”或“zip”格式文件！</div>
            <span slot="footer" class="dialog-footer">
                <el-button @click="showAddDialog = false">取 消</el-button>
                <el-button type="primary" @click="handleUpload">确 定</el-button>
            </span>
        </el-dialog>
        <el-dialog
             :title="`${type === 'hang' ? '挂起' : '激活'}流程定义`"
            :visible.sync="showHangOffDialog"
            width="30%"
        >
            <el-switch
                v-model="suspend.value1"
                :active-text="`${type === 'hang' ? '挂起' : '激活'}关联流程实例`"
            >
            </el-switch>
            <br/>
            <el-switch
                v-model="suspend.value2"
                :active-text="`定时${type === 'hang' ? '挂起' : '激活'}`"
            >
            </el-switch>
            <br/>
            <el-date-picker
                :disabled="!suspend.value2"
                v-model="suspend.date"
                value-format="yyyy-MM-dd HH:mm:ss"
                type="datetime"
                :placeholder="`选择${type === 'hang' ? '挂起' : '激活'}时间`">
            </el-date-picker>
            <span slot="footer" class="dialog-footer">
                <el-button @click="showHangOffDialog = false">取 消</el-button>
                <el-button type="primary" @click="handleSuspendRequest">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
import TableTemplate from "@/components/TableTemplate";
import {getProcesslists, exchangeById, deleteProcessByDeployId, uploadProcess, suspendProcess, activateProcess} from "./api/deployService";
import commonHelper from "@/utils/common.js"

export default {
    name: "deployManagement",
    components: {
        TableTemplate
    },
    data() {
        return {
            responseData: {},
            searchParams: {
                key: "",
                name: "",
                latest: "true",
                orderByColumn: "processSort",
                isAsc: "asc",
                pageNum: 1,
                pageSize: 10
            },
            showAddDialog: false,
            showHangOffDialog: false,
            suspend: {
                value1: true,
                value2: false,
                date: ""
            },
            currentRow: null,
            type: ""
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
        this.getListAndRenderByParams(this.searchParams)
    },
    methods: {
        handlePageChange({pageNum, pageSize}) {
            this.searchParams.pageNum = pageNum;
            this.searchParams.pageSize = pageSize;
            this.getListAndRenderByParams(this.searchParams);
        },
        getListAndRenderByParams(params) {
            getProcesslists(params).then(res => {
                console.log("拿到processList", res);
                this.responseData = res;
            });
        },
        search() {
            this.getListAndRenderByParams(this.searchParams)
        },
        reset() {
            this.searchParams.key = "";
            this.searchParams.name = "";
            this.searchParams.latest = "true";
            this.getListAndRenderByParams(this.searchParams)
        },
        handleDefinition(index, row) {
            const {deploymentId, resourceName} = row;
            const path = `/flow/manage/showProcessDefinition/${deploymentId}/${resourceName}`
            commonHelper.openWindow(path);
        },
        handleProcess(index, row) {
            const {id} = row;
            console.log("id是多少", id);
            const path = `/flow/manage/showresource?pdid=${id}`;
            commonHelper.openWindow(path);
        },
        handleExchange(index, row) {
            const {id} = row;
            exchangeById(id).then(res => {
                this.$message.success("转化成功!")
            });
        },
        handleHangOff(index, row) {
            this.showHangOffDialog = true;
            this.type = "hang";
            this.currentRow = row;
        },
        handleActive(index, row) {
            this.showHangOffDialog = true;
            this.type = "active";
            this.currentRow = row;
        },
        handleSuspendRequest() {
            const {id} = this.currentRow;
            const params = {
                flag: true,
                pdid: id,
            };
            if (this.suspend.date) {
                params.date = this.suspend.date;
            }
            this.type === "hang" && suspendProcess(params).then(() => {
                this.$message.success("挂起成功!");
                this.showHangOffDialog = false;
                this.getListAndRenderByParams(this.searchParams)
            });

            this.type === "active" && activateProcess(params).then(() => {
                this.$message.success("激活成功!");
                this.showHangOffDialog = false;
                this.getListAndRenderByParams(this.searchParams)
            });
        },
        handleDelete(index, row) {
            this.$confirm('确定删除该条流程信息吗？', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const {deploymentId} = row;
                deleteProcessByDeployId(deploymentId).then(res => {
                    this.$message.success("删除成功!");
                    this.getListAndRenderByParams(this.searchParams)
                 });
            });
        },
        handleUpload() {
            const deploy = document.querySelector("#deployFile");
            const uploadfile = deploy.files[0];
            uploadProcess({
                uploadfile
            }).then(() => {
                this.showAddDialog = false;
                console.log("file-name");
                this.getListAndRenderByParams(this.searchParams)
            });
        },
    },
};
</script>

<style>
.search-bar {
    display: flex;
    margin-top: 8px;
    margin-left: 8px;
}
label {
    font-size: 14px;
    color: #606266;
    margin-right: 8px;
}
.el-input {
    display: inline-block;
    width: 300px;
    margin-right: 10px;
}
.el-switch {
    margin-bottom: 16px;
}
</style>
