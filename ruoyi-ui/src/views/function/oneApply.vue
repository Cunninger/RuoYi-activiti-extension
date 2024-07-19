<template>
  <div>
    <div class="search-bar">
      <div>
        <label>请假类型</label>
        <el-select v-model="searchParams.leaveType" size="small">
          <el-option :key="99" label="所有" value=""></el-option>
          <el-option v-for="(leaveType, i) in leaveTypeList" :key="i" :label="leaveType" :value="leaveType"></el-option>
        </el-select>
      </div>
      <div>
        <label>申请时间</label>
        <el-date-picker
          v-model="searchParams.range"
          end-placeholder="结束日期"
          range-separator="至"
          size="small"
          start-placeholder="开始日期"
          type="datetimerange"
          value-format="yyyy-MM-dd HH:mm:ss">
        </el-date-picker>
      </div>
      <div>
        <el-button icon="el-icon-search" size="mini" type="primary" @click="search">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" type="default" @click="reset">重置</el-button>
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
        <el-button icon="el-icon-plus" plain size="mini" type="primary" @click="dialogVisible = true">添加</el-button>
        <el-button :disabled="currentSelection.length === 0" icon="el-icon-delete" plain size="mini"
                   type="danger" @click="handleMultipleDelete">删除
        </el-button>
      </template>
      <template #columns>
        <el-table-column
          label="请假人"
          prop="userId">
        </el-table-column>
        <el-table-column
          label="起始时间"
          prop="startTime">
        </el-table-column>
        <el-table-column
          label="结束时间"
          prop="endTime">
        </el-table-column>
        <el-table-column
          label="类型"
          prop="leaveType">
        </el-table-column>
        <el-table-column
          label="申请时间"
          prop="applyTime">
        </el-table-column>
        <el-table-column
          label="实际起始时间"
          prop="startTime">
        </el-table-column>
        <el-table-column
          label="实际结束时间"
          prop="endTime">
        </el-table-column>
        <el-table-column
          label="操作"
          prop="operation">
          <template slot-scope="scope">
            <el-button
              icon="el-icon-delete"
              size="mini"
              type="text"
              @click="handleDelete(scope.$index, scope.row)">删除
            </el-button>
          </template>
        </el-table-column>
      </template>
    </table-template>
    <!--    oneApply增加弹窗！ -->
    <el-dialog :visible.sync="dialogVisible" width="600px">
      <el-form ref="form" :model="form" label-width="110px">
        <el-form-item label="请假人">
          <el-input v-model="form.userId" disabled></el-input>
        </el-form-item>
        <el-form-item label="类型">
          <el-select v-model="form.leaveType">
            <el-option v-for="(leaveType, i) in leaveTypeList" :key="i" :label="leaveType"
                       :value="leaveType"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="起始时间">
          <el-date-picker v-model="form.startTime" placeholder="选择日期" style="width: 100%;"
                          type="datetime" value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
        </el-form-item>
        <el-form-item label="结束时间">
          <el-date-picker v-model="form.endTime" placeholder="选择日期" style="width: 100%;"
                          type="datetime" value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
        </el-form-item>
        <el-form-item label="原因">
          <el-input v-model="form.reason" type="textarea"></el-input>
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
import {getOneApplyList, addOne, deleteOne, exportOne} from "./api/oneApply";
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
        exportOne(params)
      });
    },
    handleSelectionChange(selection) {
      this.currentSelection = selection;
    },
    getLeaveApplyListAndRender(params) {
      const {leaveType, range, pageSize = 10, pageNum = 1} = params;
      getOneApplyList({
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
      addOne(this.form).then(res => {
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
      deleteOne({
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

.search-bar > * {
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
