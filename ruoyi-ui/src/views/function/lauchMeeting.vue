<template>
  <div>
    <div class="search-bar">
      <div>
        <label>会议主题</label>
        <el-input v-model="searchParams.topic" size="small" type="text"/>
      </div>
      <div>
        <label>主持人</label>
        <el-input v-model="searchParams.host" size="small" type="text"/>
      </div>
      <div>
        <label>会议地址</label>
        <el-input v-model="searchParams.place" size="small" type="text"/>
      </div>
      <div>
        <label>参会人员</label>
        <el-input v-model="searchParams.peoplelist" size="small" type="text"/>
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
                   type="danger" @click="handleDelelteMultiple">删除
        </el-button>
      </template>
      <template #columns>
        <el-table-column
          label="会议主题"
          prop="topic">
        </el-table-column>
        <el-table-column
          label="主持人"
          prop="host">
        </el-table-column>
        <el-table-column
          label="会议地址"
          prop="place">

        </el-table-column>
        <el-table-column
          label="参会人员"
          prop="peoplelist">
        </el-table-column>
        <el-table-column
          label="开始时间"
          prop="startTime">
        </el-table-column>
        <el-table-column
          label="结束时间"
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
    <el-dialog :visible.sync="dialogVisible" width="600px">
      <el-form ref="form" :model="form" label-width="110px">
        <el-form-item label="会议主题">
          <el-input v-model="form.topic"></el-input>
        </el-form-item>
        <el-form-item label="主持人">
          <el-input v-model="form.host" disabled></el-input>
        </el-form-item>
        <el-form-item label="会议地址">
          <el-input v-model="form.place"></el-input>
        </el-form-item>
        <el-form-item label="参会人员">
          <el-select v-model="form.peoplelist" multiple>
            <el-option
              v-for="(user, i) in userList"
              :key="i"
              :label="user.userName"
              :value="user.userName"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="开始时间">
          <el-date-picker v-model="form.startTime" placeholder="选择日期" style="width: 100%;"
                          type="datetime" value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
        </el-form-item>
        <el-form-item label="结束时间">
          <el-date-picker v-model="form.endTime" placeholder="选择日期" style="width: 100%;"
                          type="datetime" value-format="yyyy-MM-dd HH:mm:ss"></el-date-picker>
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
import {getMeetingList, addMeeting, deleteMeeting, exportMeeting} from "./api/meeting";
import {listUser} from "@/api/system/user.js"

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
        topic: "",
        host: this.$store.state.user.name,
        place: "",
        peoplelist: [],
        startTime: "",
        endTime: ""
      },
      searchParams: {
        pageNum: 1,
        pageSize: 10,
        topic: "",
        host: "",
        place: "",
        peoplelist: "",
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
    }
  },
  mounted() {
    this.getMeetingListAndRender(this.searchParams);
    listUser().then(res => {
      console.log("获取用户", res);
      this.userList = res.rows;
    });
  },
  methods: {
    getMeetingListAndRender(params) {
      const {pageNum = 1, pageSize = 10, topic, host, place, peoplelist} = params;
      getMeetingList({
        pageNum,
        pageSize,
        topic,
        host,
        place,
        peoplelist,
        isAsc: "asc"
      }).then(res => {
        this.responseData = res;
      });
    },
    handleAdd() {
      console.log("填写的form值是", this.form);
      const params = Object.assign({}, this.form, {
        peoplelist: this.form.peoplelist.join()
      });
      addMeeting(params).then(res => {
        this.dialogVisible = false;
        this.$message.success("添加成功");
        this.getMeetingListAndRender(this.searchParams);
      });
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
    handleDelelteMultiple() {
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
        exportMeeting(this.searchParams)
      });
    },
    search() {
      this.getMeetingListAndRender(this.searchParams);
    },
    reset() {
      this.searchParams.topic = "";
      this.searchParams.host = "";
      this.searchParams.place = "";
      this.searchParams.peoplelist = "";
      this.getMeetingListAndRender(this.searchParams);
    },
    deleteByIdsAndRender(ids) {
      deleteMeeting({
        ids
      }).then(() => {
        this.$message.error("删除成功!")
        this.getMeetingListAndRender(this.searchParams);
      })
    },
    handleSelectionChange(selection) {
      this.currentSelection = selection;
    },
    handlePageChange({pageNum, pageSize}) {
      this.searchParams.pageNum = pageNum;
      this.searchParams.pageSize = pageSize;
      this.getMeetingListAndRender(this.searchParams);
    }
  }
};
</script>

<style scoped>
.search-bar label {
  font-size: 14px;
  color: #606266;
  margin-right: 8px;
}

.search-bar {
  display: flex;
  margin-top: 8px;
  margin-left: 8px;
}

.search-bar .el-input {
  display: inline-block;
  width: 200px;
  margin-right: 10px;
}
</style>
