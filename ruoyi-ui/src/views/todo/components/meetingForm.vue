<template>
    <div class="c-meeting-form">
        <el-form  ref="form" :model="form" label-width="80px">
            <el-form-item label="会议主题">
                <el-input v-model="form.topic" disabled></el-input>
            </el-form-item>
            <el-form-item label="主持人">
                <el-input v-model="form.host" disabled></el-input>
            </el-form-item>
            <el-form-item label="会议地址">
                <el-input v-model="form.place" disabled></el-input>
            </el-form-item>
            <el-form-item label="参会人员">
                <el-input v-model="form.peoplelist" disabled></el-input>
            </el-form-item>
            <el-form-item label="开始时间">
                <el-input v-model="form.startTime" disabled></el-input>
            </el-form-item>
            <el-form-item label="结束时间">
                <el-input v-model="form.endTime" disabled></el-input>
            </el-form-item>
            <el-form-item v-if="step === 'input'" label="会议纪要">
                <el-input type="textarea" v-model="form.content"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit">{{step === "signate" ? "签到" : "提交"}}</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>

export default {
    props: {
        step: {
            type: String,
            default: ""
        },
        formInfo: {
            type: Object,
            default: () => ({})
        }
    },
    data() {
        return {
            form: {
                place: "",
                endTime: "",
                peoplelist: "",
                startTime: "",
                topic: "",
                host: ""
            }
        };
    },
    watch: {
        formInfo(newFormValue) {
            this.form.place = newFormValue.place;
            this.form.endTime = newFormValue.endTime;
            this.form.peoplelist = newFormValue.peoplelist;
            this.form.startTime = newFormValue.startTime;
            this.form.topic = newFormValue.topic;
            this.form.host = newFormValue.host;
        }
    },
    methods: {
        onSubmit() {
            this.$emit("submit", {
                content: this.form.content
            })
        }
    }
};
</script>
