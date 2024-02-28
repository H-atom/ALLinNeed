<template>
<div style="display: flex">
  <el-card style="flex: 1;width: fit-content;position: fixed;left: -10px;">
    <el-radio-group v-model="movieDate" style="width: 60px;height: 100%;text-align: center;">
      <el-radio-button :label=setTime(0,0) class="time-button">&nbsp;今天</el-radio-button>
      <el-radio-button :label=setTime(0,1) class="time-button">&nbsp;明天</el-radio-button>
      <el-radio-button :label=setTime(0,2) class="time-button">&nbsp;后天</el-radio-button>
      <el-radio-button :label=setTime(0,3) class="time-button">{{setTime(1,3)}}</el-radio-button>
      <el-radio-button :label=setTime(0,4) class="time-button">{{setTime(1,4)}}</el-radio-button>
    </el-radio-group>
  </el-card>
  <movie-detail style="flex: 14" :movieType="movieType" :movieDate="movieDate"></movie-detail>
  <el-card style="flex: 1;width: fit-content;position: fixed;right: 0;">
    <el-radio-group v-model="movieType" style="width: 55px;height: 100%">
      <el-radio-button label="全部"></el-radio-button>
      <el-radio-button label="悬疑"></el-radio-button>
      <el-radio-button label="动作"></el-radio-button>
      <el-radio-button label="爱情"></el-radio-button>
      <el-radio-button label="冒险"></el-radio-button>
      <el-radio-button label="喜剧"></el-radio-button>
      <el-radio-button label="历史"></el-radio-button>
      <el-radio-button label="科幻"></el-radio-button>
      <el-radio-button label="战争"></el-radio-button>
      <el-radio-button label="动画"></el-radio-button>
    </el-radio-group>
  </el-card>
</div>
</template>

<script>
import MovieDetail from "@/components/movieDetail";
export default {
  name: "cinemaBody",
  components: {MovieDetail},
  data(){
    return{
      movieType:"全部",
      movieDate:this.setTime(0,0),
    }
  },
  methods:{
    setTime(index,n) {
      var tempDate = new Date() // 获取今天的日期
      tempDate.setDate(tempDate.getDate() + n) // 今天的后N天的日期，N自定义
      if (index===0){
        let month,day;
        if ((tempDate.getMonth() + 1)<10){
          month="0"+(tempDate.getMonth() + 1)
        }else {
          month=(tempDate.getMonth() + 1)
        }
        if (tempDate.getDate()<10){
          day="0"+tempDate.getDate()
        }else {
          day=tempDate.getDate()
        }
        return tempDate.getFullYear() +"-"+ month + "-" + day;
      }else if (index===1){
        return (tempDate.getMonth() + 1) + "-" + tempDate.getDate();
      }
    }
  }
}
</script>

<style scoped>

</style>