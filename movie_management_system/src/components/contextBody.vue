<template>
  <div>
    <template>
      <el-carousel :interval="4000" type="card" height="350px" id="carousel">
        <el-carousel-item v-for="(item,index) in srcList" :key="index">
          <el-image style="height: 350px;margin: auto;width: 800px;background-color: rgba(255,255,255,0.2)" :src="item" fit="contain"></el-image>
        </el-carousel-item>
      </el-carousel>
    </template>
    <div style="display: flex;margin-top: 10px">
      <el-card class="box-card" id="video">
        <div class="text">
          <h3>海量电影</h3>
          <h3>精品推荐</h3>
          <h3>等你来看</h3>
        </div>
      </el-card>
      <el-card class="box-card" id="cinema">
        <div class="text">
          <h3>精品影院</h3>
          <h3>海量资源</h3>
          <h3>等你前来</h3>
        </div>
      </el-card>
      <el-card class="box-card" id="rankings">
        <div class="text">
          <h3>影片排行</h3>
          <h3>最新榜单</h3>
          <h3>等你观阅</h3>
        </div>
      </el-card>
    </div>
  </div>

</template>

<script>
export default {
  name: "contextBody",
  data(){
    return{
      cinemaImage:[],
      srcList:["https://img.zcool.cn/community/011d3855685d790000012716399ff2.jpg@1280w_1l_2o_100sh.jpg",
      "https://n.sinaimg.cn/front20220816ac/56/w690h966/20220816/ab7c-430f07dbc58cba079a8d3a3ed6257b1d.jpg",
      "https://ts1.cn.mm.bing.net/th/id/R-C.c62b380cbec2812bc4ddbc0aeb89e0fa?rik=1qJbmuIA4dEgdQ&riu=http%3a%2f%2fwww.kulemi.com%2fdl%2fproject%2flogo%2f62332.png&ehk=6BC4gRb6RGJygp1re9N225SropbQXjDyC8OAIh9HQSA%3d&risl=&pid=ImgRaw&r=0"],
    }
  }
}
</script>

<style scoped>
.box-card{
  width: 250px;
  height: 250px;
  margin-left: 13%;
  /*background-image: url("../assets/video.png");*/
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  position: relative;
}
#video{
  background-image: url("../assets/video.png");
  background-position: unset;
}
#cinema{
  background-image: url("../assets/cinema.png");
}
#rankings{
  background-image: url("../assets/rankings.png");
}

.text{
  display: none;
}
.box-card:hover .text{
  background-color: rgba(0,0,0,0.5);
  background-position: center;
  /*background-size: contain;*/
  color: white;
  text-align: center;
  display: flex;
  -webkit-align-items: center;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
}
#carousel{
  /*background-image: url("../assets/background.jpg");*/
  background-color: rgba(155,174,255,0.9);
}
</style>