<template>
<div>
  <el-card class="card" v-for="(item,index) in movieData" :key="index">
    <div class="cardDiv">
      <div style="flex: 1;text-align: center;margin-left: -20px">
        <el-image style=" width:85%; height:270px;" :src="item.src" fit="fit">
          <div slot="placeholder" class="image-slot" style="text-align: center;height: 230px;line-height: 230px">
            加载中<span class="dot">...</span>
          </div>
        </el-image>
      </div>
      <div style="flex: 2;text-align: center;margin-left: 15px;margin-top: -30px">
        <el-descriptions title="电影信息">
          <el-descriptions-item label="电影名称">{{item.movieName}}</el-descriptions-item>
          <el-descriptions-item label="导演">{{item.director}}</el-descriptions-item>
          <el-descriptions-item label="主演">{{ item.starring }}</el-descriptions-item>
          <el-descriptions-item label="类型">{{ item.type }}</el-descriptions-item>
          <el-descriptions-item label="时长">{{ item.movieTime+"分钟" }}</el-descriptions-item>
          <el-descriptions-item label="上映时间">{{ item.showTime }}</el-descriptions-item>
          <el-descriptions-item label="评分">
            <el-rate
                v-model="item.rate"
                disabled
                show-score
                text-color="#ff9900"
                :score-template="item.rate+''">
            </el-rate>
          </el-descriptions-item>
          <el-descriptions-item label="电影院">
            <template>
              <el-select
                  v-model="item.selectValue"
                  clearable
                  filterable
                  remote
                  size="small"
                  placeholder="请输入关键词"
                  @focus="belongToCinema(item.belongToCinemaList)"
                  @change="selectCinema(item)"
                  :remote-method="remoteMethod"
                  :loading="loading">
                <el-option
                    v-for="item in options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  <span style="float: left">{{ item.label }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ item.value }}</span>
                </el-option>
              </el-select>
            </template>
          </el-descriptions-item>
          <el-descriptions-item label="票价">{{item.ticketValue}}￥
            <el-button type="primary" plain style="margin-left: 30px;" size="mini" @click="chooseSeat(item)">开始订票</el-button>
          </el-descriptions-item>
        </el-descriptions>
        <el-divider style="margin: -8px 0;height: 10px"></el-divider>
        <el-descriptions style="margin-top: 10px">
          <el-descriptions-item label="电影详情">{{item.movieDetails}}</el-descriptions-item>
        </el-descriptions>
      </div>
    </div>
  </el-card>
</div>
</template>

<script>

import request from "@/utils/request";

export default {
  name: "movieDetail",
  props:["movieType","movieDate"],
  data(){
    return{
      movieData: [{
        src:'',
        movieName:"",
        director:'',
        starring:'',
        type:'',
        movieTime:'',
        showTime:'',
        rate:0,
        ticketValue:'',
        movieDetails:"",
        selectValue:'',
        cinema:'',
        belongToCinemaList:[],
        dateList:[],
      }],
      tempData:[],
      typeList:[],
      options: [],
      list: [],
      loading: false,
    }
  },
  mounted() {
    this.selectValue=this.$route.query.cinema;
    if (this.$store.state.address!==null)
    request.post("/api/movie/movieData",{address:"山东省济宁市嘉祥县"}).then(res=>{
      this.tempData=this.typeList=this.movieData=res.data;
    })
  },
  watch:{
    movieType(newValue){
      this.movieData=this.typeList=this.tempData.filter(item=>{
        if (item.type.includes(newValue)|| newValue==="全部") return item
      })
    },
    movieDate(newValue){
      this.movieData=this.typeList.filter(item=>{
        for (let i = 0; i < item.dateList.length; i++) {
          if (newValue===item.dateList[i]){
            return item
          }
        }
      })
    }
  },
  methods: {
    selectCinema(item){
      item.ticketValue=item.belongToCinemaList.filter(a=>item.selectValue===a.address)[0].value
      item.cinema=item.belongToCinemaList.filter(a=>item.selectValue===a.address)[0].cinema
    },

    belongToCinema(cinema){
      this.options=this.list = cinema.map(item => {
        return { value: `${item.address}`, label: `${item.cinema}` };
      });

    },
    remoteMethod(query) {
      if (query !== '') {
        this.loading = true;
        setTimeout(() => {
          this.loading = false;
          this.options = this.list.filter(item => {
            return item.label.toLowerCase()
                .indexOf(query.toLowerCase()) > -1;
          });
        }, 200);
      } else if (query===""){
        this.options = this.list;
      }
    },
    chooseSeat(movieData){
      this.$router.push({
        path:"/chooseSeatBody",
        query:{
          cinema: movieData.cinema,
          address:movieData.selectValue,
          movieName:movieData.movieName,
          ticketValue:movieData.ticketValue,
          movieDate:this.movieDate,
        }
      });
    }
  }
}
</script>

<style scoped>
.card{
  width: 65%;
  height: 300px;
  margin-left: 20%;
  margin-top: 5px;
  padding: 0;
}
.cardDiv{
  display: flex;
  justify-content: center;
  align-items: center;
}
.el-divider--horizontal{
  margin-top: -8px;
  margin-bottom: -2px;
}
a{
  text-decoration: none;
}
.router-link-active{
  text-decoration: none;
}
</style>