<template>
<div>
  <el-card class="card" v-for="item in src" :key="item">
    <div class="cardDiv">
      <div style="flex: 1;text-align: center;">
        <el-image style=" width:100%; height:230px;" :src="item" fit="fit">
          <div slot="placeholder" class="image-slot" style="text-align: center;height: 230px;line-height: 230px">
            加载中<span class="dot">...</span>
          </div>
        </el-image>
      </div>
      <div style="flex: 2;text-align: center;margin-left: 20px;margin-top: -10px">
        <el-descriptions title="影院信息">
          <el-descriptions-item label="名称">{{cinemaName}}</el-descriptions-item>
          <el-descriptions-item label="电话">18100000000</el-descriptions-item>
          <el-descriptions-item label="地址">苏州市</el-descriptions-item>
          <el-descriptions-item label="评分">
            <el-rate
                v-model="value"
                disabled
                show-score
                text-color="#ff9900"
                score-template="{value}">
            </el-rate>
            <el-button type="primary" plain style="margin-left: 120px" size="small"><router-link :to="{path:'movieBody',query:{cinema:cinemaName}}">立即观影</router-link></el-button>
          </el-descriptions-item>
        </el-descriptions>
        <el-divider></el-divider>
        <el-descriptions>
          <el-descriptions-item label="影院详情"></el-descriptions-item>
        </el-descriptions>
      </div>
    </div>
  </el-card>
</div>
</template>

<script>
export default {
  name: "cinemaBody",
  data(){
    return{
      value:4.5,
      cinemaName:"123",
      src:["https://img.zcool.cn/community/011d3855685d790000012716399ff2.jpg@1280w_1l_2o_100sh.jpg",
        "https://ts1.cn.mm.bing.net/th/id/R-C.2a7fb295529959ad541201426348e1ae?rik=DSkbpOIVj3%2f1KA&riu=http%3a%2f%2fwww.haitaoit.com%2fupload%2f201803%2f07%2f201803071057160043.jpg&ehk=pBq43X4wtCixtp6PwRLxIQwMkS4h59gRc6HGbGRTN9w%3d&risl=&pid=ImgRaw&r=0"],
    }
  }
}
</script>

<style scoped>
.card{
  width: 60%;
  height: 250px;
  margin-left: 18%;
  margin-top: 5px;
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
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
  background-color: #d3dce6;
}

</style>