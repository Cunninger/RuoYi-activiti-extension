<template>
    <div class="index-page">
        <div class="card-list">
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <span>流程</span>
                    <el-tag style="float: right;" size="mini" effect="dark">月</el-tag>
                </div>
                <h2>3</h2>
                <span>总流程数</span>
                <span style="color: #1890ff;float:right;">
                    <span>98%</span>
                    <span class="el-icon-top"></span>
                </span>
            </el-card>
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <span>运行</span>
                    <el-tag style="float: right;" type="success" size="mini" effect="dark">全年</el-tag>
                </div>
                <h2>89</h2>
                <span>流程实例数</span>
                <span style="color: #13ce66;float:right;">
                    <span>20%</span>
                    <span class="el-icon-top"></span>
                </span>
            </el-card>
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <span>执行</span>
                    <el-tag style="float: right;" type="success" size="mini" effect="dark">今天</el-tag>
                </div>
                <h2>105</h2>
                <span>执行实例数</span>
                <span style="color: #13ce66;float:right;">
                    <span>44%</span>
                    <span class="el-icon-top"></span>
                </span>
            </el-card>
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <span>待办任务数</span>
                    <el-tag style="float: right;" type="danger" size="mini" effect="dark">历史记录</el-tag>
                </div>
                <h2>451</h2>
                <span>12月</span>
                <span style="color:red;float:right;">
                    <span>38%</span>
                    <span class="el-icon-bottom"></span>
                </span>
            </el-card>
        </div>
        <div class="chart">
            <el-card>
                <div slot="header" class="clearfix">
                    <span>请假数</span>
                    <span style="float:right;">
                        <el-radio-group v-model="radio4" size="mini">
                            <el-radio-button label="天"></el-radio-button>
                            <el-radio-button label="月"></el-radio-button>
                            <el-radio-button label="年"></el-radio-button>
                        </el-radio-group>
                    </span>
                </div>
                <div style="display: flex;">
                    <div style="width: 70%">
                        <bar-chart></bar-chart>
                    </div>
                    <div style="width: 30%;">
                        <h2>59</h2>
                        <div>
                            <span>请假总数</span>
                            <span style="color:#13ce66;float: right;">
                                48%
                                <span class="el-icon-top"></span>
                            </span>
                        </div>
                        <el-progress :percentage="48" color="#1ab394" :show-text="false"></el-progress>
                        <h2>15</h2>
                        <div>
                            <span>最近一个月请假数</span>
                            <span style="color:#13ce66;float: right;">60%
                                <span class="el-icon-top"></span>
                            </span>
                        </div>
                        <el-progress :percentage="60" color="#1ab394" :show-text="false"></el-progress>
                        <h2>24</h2>
                        <div>
                            <span>最近一个月审批数</span>
                            <span style="color:#13ce66;float: right;">22%
                                <span class="el-icon-top"></span>
                            </span>
                        </div>
                        <el-progress :percentage="22" color="#1ab394" :show-text="false"></el-progress>
                    </div>
                    
                </div>
            
            </el-card>
   
        </div>
        <div class="table">
            <el-card>
                <div slot="header" class="clearfix">
                    <span>最近流程申请列表</span>
                    <span style="float:right;">
                        <span class="el-icon-arrow-up"></span>
                        <span class="el-icon-close"></span>
                    </span>
                </div>
                <el-table :data="tableData">
                    <el-table-column
                        prop="a"
                        label="审批状态"
                        width="180">
                        <template slot-scope="scope">
                            <span v-if="scope.row.a === '已完成'">
                                <el-tag type="success" size="mini" effect="dark">已完成</el-tag>
                            </span>
                            <span v-else-if="scope.row.a === '已取消'">
                                <el-tag type="warning" size="mini" effect="dark">已取消</el-tag>
                            </span>
                            <span v-else>{{scope.row.a}}</span>
                        </template>
                    </el-table-column>
                    <el-table-column
                        prop="b"
                        label="日期"
                        width="180">
                        <template slot-scope="scope">
                            <span>
                                <span class="el-icon-alarm-clock"></span>
                                <span>{{scope.row.b}}</span>
                            </span>
                        </template>
                    </el-table-column>
                    <el-table-column
                        prop="c"
                        label="用户"
                        width="180">
                    </el-table-column>
                    <el-table-column
                        prop="d"
                        label="值"
                        width="180">
                        <template slot-scope="scope">
                            <span style="color:#13ce66;">
                                <span class="el-icon-top"></span>
                                <span>{{scope.row.d + "%"}}</span>
                            </span>
                        </template>
                    </el-table-column>
                </el-table>
            </el-card>
        </div>

    </div>
</template>

<script>
import BarChart from './indexBar.vue';
export default {
    components: {
        BarChart
    },
    data() {
        return {
            radio4: "天",
            tableData: [
                {
                    a: "审批中...",
                    b: "11:20",
                    c: "青衣5858",
                    d: "24"
                },
                {
                    a: "已取消",
                    b: "10:40",
                    c: "徐子崴",
                    d: "66"
                },
                {
                    a: "审批中...",
                    b: "11:20",
                    c: "姜岚昕",
                    d: "54"
                },
                {
                    a: "审批中...",
                    b: "11:20",
                    c: "武汉大兵哥",
                    d: "12"
                },
                {
                    a: "审批中...",
                    b: "11:20",
                    c: "荆莹儿",
                    d: "22"
                },
                {
                    a: "已完成",
                    b: "11:20",
                    c: "栾某某",
                    d: "66"
                },
                {
                    a: "审批中...",
                    b: "11:20",
                    c: "范范范二妮",
                    d: "23"
                },
            ]
        };
    },
};
</script>


<style>
.index-page {
    background-color: #f3f3f4;
    height: 100%;
    padding: 20px;
}
.card-list {
    font-size: 14px;
    display: flex;
    justify-content: space-between;
  
  
}
.card-list > * {
    width: 20%;
}
.chart, .table {
    margin-top: 20px;
}
.index-page table {
    width: 100%!important;
}
</style>