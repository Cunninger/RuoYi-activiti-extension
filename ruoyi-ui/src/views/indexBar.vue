<template>
    <div :class="className" :style="{height:height,width:width}" />
  </template>
  
  <script>
  import * as echarts from 'echarts'
  require('echarts/theme/macarons') // echarts theme
  import resize from './dashboard/mixins/resize'
  
  const animationDuration = 6000
  
  export default {
    mixins: [resize],
    props: {
      className: {
        type: String,
        default: 'chart'
      },
      width: {
        type: String,
        default: '100%'
      },
      height: {
        type: String,
        default: '300px'
      }
    },
    data() {
      return {
        chart: null
      }
    },
    mounted() {
      this.$nextTick(() => {
        this.initChart()
      })
    },
    beforeDestroy() {
      if (!this.chart) {
        return
      }
      this.chart.dispose()
      this.chart = null
    },
    methods: {
      initChart() {
        this.chart = echarts.init(this.$el, 'macarons')
  
        this.chart.setOption({
          tooltip: {
            trigger: 'axis',
            axisPointer: { // 坐标轴指示器，坐标轴触发有效
              type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            }
          },
          legend: {
            data: ["请假数", "销假数"]
          },
          grid: {
            top: 10,
            left: '2%',
            right: '2%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: [{
            type: 'category',
            data: new Array(31).fill("1月").map((item, i) => {
                return item + "" + (i + 1);
            }),
            axisTick: {
              alignWithLabel: true
            }
          }],
          yAxis: [{
            type: 'value',
            name: "请假数",
          },
          {
            type: 'value',
            name: "销假数",
            yAxisIndex: 1,
            min: 0,
            max: 30,
          }],
          series: [
            {
                name: '请假数',
                type: 'bar',
                barWidth: '60%',
                data: [
                    123,
                    452,
                    123,
                    666,
                    344,
                    800,
                    980,
                    134,
                    321,
                    678,
                    198,
                    459,
                    390,
                    890,
                    967,
                    222,
                    777,
                    222,
                    123,
                    452,
                    123,
                    666,
                    344,
                    800,
                    980,
                    134,
                    321,
                    678,
                    777,
                    222,
                    123,
                    452
                ],
                animationDuration: 1000
            },
            {
                name: "销假数",
                type: 'line',
                smooth: false,
                yAxisIndex: 1,
                areaStyle: {},
                data: [
                    1,
                    12,
                    15,
                    11,
                    7,
                    9,
                    3,
                    12,
                    8,
                    9,
                    10,
                    12,
                    11,
                    15,
                    12,
                    12,
                    11,
                    14,
                    11,
                    5,
                    12,
                    5,
                    5,
                    11,
                    9,
                    12,
                    9,
                    9,
                    2,
                    9,
                    2
                ]
            }
          ]
        })
      }
    }
  }
  </script>
  