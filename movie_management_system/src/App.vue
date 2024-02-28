<template>
  <div id="app">
   <AllHeader></AllHeader>
<!--    <context-body></context-body>-->
<!--    <cinema-body></cinema-body>-->
<!--    <choose-seat-body></choose-seat-body>-->
<!--    <movie-body></movie-body>-->
  </div>
</template>

<script>

import AllHeader from "@/components/allHeader";
// import ChooseSeatBody from "@/components/chooseSeatBody";
// import ContextBody from "@/components/contextBody";
// import CinemaBody from "@/components/cinemaBody";
// import MovieBody from "@/components/movieBody"
export default {
  name: 'App',
  components: {
    // ChooseSeatBody,
    // CinemaBody,
    // ContextBody,
    // MovieBody,
    AllHeader
  },
  // created() {
  //   if (this.$router.path !== "/"){
  //     this.$router.replace("/")
  //   }
  // },

}
</script>

<style>
a{
  text-decoration: none;
  color:#606266;
}
.router-link-active{
  text-decoration: none;
}
/*滚动条高宽度*/
ul::-webkit-scrollbar{
  width: 8px;
  height: 4px;
}
/*滚动条滑块*/
ul::-webkit-scrollbar-thumb{
  border-radius: 3px;
  box-shadow: inset 0 0 5px rgba(0, 0, 1, 0.2);
  background: #c7c4c4;
}
/*滚动条里面轨道*/
ul ::-webkit-scrollbar-track {
  box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2) inset;

}
/*滚动条的小边角*/
ul::-webkit-scrollbar-corner {
  background: transparent;
}
</style>
