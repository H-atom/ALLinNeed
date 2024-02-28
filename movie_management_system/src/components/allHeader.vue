<template>
<div>
  <div style="background-color: #545c64;">
    <el-dialog title="用户登录" :visible.sync="dialogFormVisible" style="width: 50%;margin: auto;min-width: 800px" @close="reset">
      <LoginView v-show="loginOrRegister" @login="loginSuccess" @changeRegisterView="changeViewOnLoginOrRegister" ref="resetForm"></LoginView>
      <register-view v-show="!loginOrRegister" @changeLoginView="changeViewOnLoginOrRegister" ref="resetForm"></register-view>
    </el-dialog>
    <el-menu
        :default-active="activeIndex"
        class="el-menu-demo"
        mode="horizontal"
        text-color="#fff"
        @select="chooseIndex"
        background-color="#545c64"
        active-text-color="#ffd04b">
      <el-menu-item><i class="el-icon-location-information"></i>{{address}}</el-menu-item>
      <el-menu-item index="1"><router-link to="/contextBody">首页</router-link></el-menu-item>
      <el-menu-item index="2"><router-link to="/movieBody">电影</router-link></el-menu-item>
      <el-menu-item index="3"><router-link to="/cinemaBody">影院</router-link></el-menu-item>
      <el-menu-item index="4">榜单</el-menu-item>
      <el-menu-item index="5">
        <el-autocomplete
            class="inline-input"
            v-model="state1"
            :fetch-suggestions="querySearch"
            placeholder="请输入想搜索内容"
            @select="handleSelectSearch"
            size="medium"
            clearable
        >
          <el-button slot="append" icon="el-icon-search" size="small" style="background-color: #409EFF;color: white">搜索</el-button>
        </el-autocomplete>
      </el-menu-item>
      <el-button type="text" @click="enter" class="button" v-if="!visibleEnter">登录</el-button>
      <el-dropdown @command="handleCommand" v-if="visibleEnter" style="margin-left: 10px">
        <span><el-button :icon="icon" circle size="medium" style="margin-top: 16px"></el-button><span style="color: white;margin-left: 10px">{{$store.state.user.username}}</span></span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command="个人资料">个人资料</el-dropdown-item>
          <el-dropdown-item command="订单管理">订单管理</el-dropdown-item>
          <el-dropdown-item command="消息通知">消息通知</el-dropdown-item>
          <el-dropdown-item command="放映管理" v-if="this.$store.state.user.permissions===1"><router-link to="/managerView" replace>放映管理</router-link></el-dropdown-item>
          <el-dropdown-item command="e" divided>退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-drawer
          :title="personTitle"
          :visible.sync="drawer"
          :direction="direction"
          :before-close="handleClose"
          size="40%"
          v-if="visibleEnter">
        <!--          个人资料-->
        <el-form label-position="right" label-width="80px" v-if="userMessage" style="margin: 5px" :rules="rules" ref="changeMessForm" :model="form">
          <el-button :icon="icon" circle size="large" style="margin-left: 40%"></el-button>
          <el-form-item label="昵称: " label-width="80px" style="align-items: center" prop="newName">
            <template v-if="!changeName">
              <span class="span">{{$store.state.user.username}}</span>
              <i class="el-icon-edit" style="margin-left: 5px" @click="changeMess('changeName')"></i>
            </template>
            <template v-if="changeName">
              <el-input placeholder="请输入内容" v-model="form.newName" clearable size="small" style="width: max-content"></el-input>
              <el-button type="primary" round size="small" @click="changeUsername" style="margin-left: 10px">确定</el-button>
            </template>
          </el-form-item>
          <el-form-item label="身份：" label-width="87px" style="align-items: center">
            <span class="span">{{identity}}</span>
          </el-form-item>
          <el-form-item label="密码: " label-width="80px" style="align-items: center;">
            <template v-if="!changePassword">
              <span class="span">**********</span>
              <i class="el-icon-edit" style="margin-left: 5px" @click="changeMess('changePassword')"></i>
            </template>
            <template v-if="changePassword">
              <el-form-item prop="password" class="el-form-item">
                <el-input placeholder="请输入旧密码" size="small" v-model="form.password" show-password style="width: max-content"></el-input>
              </el-form-item>
              <el-form-item prop="newPassword" class="el-form-item">
                <el-input placeholder="请输入新密码" size="small" v-model="form.newPassword" show-password style="width: max-content"></el-input>
              </el-form-item>
              <el-form-item prop="againPassword" class="el-form-item">
                <el-input placeholder="请确认密码" size="small" v-model="form.againPassword" show-password style="width: max-content"></el-input>
              </el-form-item>
              <el-form-item class="el-form-item">
                <el-button type="success" round size="small" @click="changeUserPassword">确定</el-button>
              </el-form-item>
            </template>
          </el-form-item>
        </el-form>
<!--订单管理-->
        <template v-if="userOrders">
          <el-card style="margin: 10px" v-for="(item,index) in ordersList" :key="index">
            <el-descriptions>
              <el-descriptions-item label="电影名">{{ item.movie }}</el-descriptions-item>
              <el-descriptions-item label="影院">{{ item.cinema }}</el-descriptions-item>
              <el-descriptions-item label="影院地址">{{ item.address }}</el-descriptions-item>
              <el-descriptions-item label="放映厅">{{ item.screeningRoom }}</el-descriptions-item>
              <el-descriptions-item label="放映日期">{{ item.startDate }}</el-descriptions-item>
              <el-descriptions-item label="放映时间">{{ item.startTime }}</el-descriptions-item>
              <el-descriptions-item label="购买位置" content-style="color: red">
                {{item.seat}}
              </el-descriptions-item>
              <el-descriptions-item label="单价">{{ item.ticketValue }}</el-descriptions-item>
            </el-descriptions>
            <el-button size="small" type="primary" style="float: right;margin-bottom: 10px" @click="refund(item)">我要退款</el-button>
            <el-button size="small" type="warning" style="float: right;margin-right: 10px" @click="chatToSell(item)">联系商家</el-button>
          </el-card>
        </template>
<!--        消息通知-->
        <template v-if="userInfor">
          <el-card style="margin: 10px" v-for="(item,index) in infor1List" :key="index">
            <el-descriptions>
              <el-descriptions-item label="电影名">{{ item.movie }}</el-descriptions-item>
              <el-descriptions-item label="影院">{{ item.cinema }}</el-descriptions-item>
              <el-descriptions-item label="影院地址">{{ item.address }}</el-descriptions-item>
              <el-descriptions-item label="放映厅">{{ item.screeningRoom }}</el-descriptions-item>
              <el-descriptions-item label="放映日期">{{ item.startDate }}</el-descriptions-item>
              <el-descriptions-item label="放映时间">{{ item.startTime }}</el-descriptions-item>
              <el-descriptions-item label="购买位置" content-style="color: red">
                {{item.seat}}
              </el-descriptions-item>
              <el-descriptions-item label="单价">{{ item.ticketValue }}</el-descriptions-item>
            </el-descriptions>
            <div v-if="item.state===-1">您选的该票因故被取消，已为您返还票款，对给您造成的困扰感到十分抱歉，如有需要，请选购其他</div>
            <div v-if="item.state===-2">你已成功退购该票</div>
          </el-card>
        </template>
        <template v-if="userInfor">
          <el-card style="margin: 10px" v-for="(item,index) in inforList" :key="index">
            <el-descriptions v-if="item.state!==-1">
              <el-descriptions-item label="电影名">{{ item.movie }}</el-descriptions-item>
              <el-descriptions-item label="放映厅">{{ item.screeningRoom }}</el-descriptions-item>
              <el-descriptions-item label="放映日期">{{ item.startDate }}</el-descriptions-item>
              <el-descriptions-item label="放映时间">{{ item.startTime }}</el-descriptions-item>
              <el-descriptions-item label="购买人">{{ item.buyer }}</el-descriptions-item>
              <el-descriptions-item label="购买位置" content-style="color: red">
                {{item.seat}}
              </el-descriptions-item>
              <el-descriptions-item label="单价">{{ item.ticketValue }}</el-descriptions-item>
            </el-descriptions>
            <el-descriptions v-else>
              <el-descriptions-item label="电影名">{{ item.movie }}</el-descriptions-item>
              <el-descriptions-item label="放映厅">{{ item.screeningRoom }}</el-descriptions-item>
              <el-descriptions-item label="放映日期">{{ item.startDate }}</el-descriptions-item>
              <el-descriptions-item label="放映时间">{{ item.startTime }}</el-descriptions-item>
              <el-descriptions-item label="单价">{{ item.ticketValue }}</el-descriptions-item>
            </el-descriptions>
            <div v-if="item.state===2">用户已购买该座</div>
            <div v-if="item.state===-2">用户已成功退购该票</div>
            <div v-if="item.start===-1">你已修改该场次</div>
          </el-card>
        </template>
      </el-drawer>
    </el-menu>
  </div>
  <el-dialog :visible.sync="chatViewVisible" class="chatView" @close="chatViewVisible=false">
    <chat-view v-if="chatViewVisible" :buyerPhone="this.$store.state.user.phone" :sellerPhone="sellerPhone" :cinema="cinema" :ticketDetails="ticketDetails"></chat-view>
  </el-dialog>
  <el-dialog title="退款状态" :visible.sync="stateDialogVisible" width="45%" :before-close="handleClose">
    <el-card>
      <el-steps direction="vertical" :active="active">
        <el-step title="步骤 1" :description="description1"></el-step>
        <el-step title="步骤 2" :description="description2"></el-step>
      </el-steps>
    </el-card>
  </el-dialog>
  <router-view></router-view>
</div>
</template>

<script>
import LoginView from "@/components/loginView";
import RegisterView from "@/components/registerView";
import request from "@/utils/request";
import myBMap from "@/utils/myBMap";
import ChatView from "@/components/chatView";

export default {
  name: "allHeader",
  components: {ChatView, RegisterView, LoginView},
  data() {
    var checkAgainPassword=(rule,value,callback)=>{
      if (!value){
        return callback(new Error("密码输入为空！"))
      }else if (value!==this.newPassword){
        return callback(new Error("密码输入不一致！"))
      }
      callback();
    }

    var checkPassword=(rule,value,callback)=>{
      if (!value){
        return callback(new Error("密码输入为空！"))
      }else if (value!==this.$store.state.user.password){
        return callback(new Error("密码输入错误！"))
      }
      callback();
    }
    var checkNull=(rule,value,callback)=>{
      if (!value){
        return callback(new Error("内容输入为空！"))
      }
      callback();
    }
    return {
      ordersList:[],
      inforList:[],
      infor1List:[],
      stateDialogVisible:false,
      active:1,
      description1:"",
      description2:"",
      cinema:'',
      address:'',
      sellerPhone:'',
      ticketDetails:{},
      identity:'普通用户',
      loginOrRegister:true,
      activeIndex: '1',
      dialogFormVisible:false,
      visibleEnter:false,
      chatViewVisible:false,
      restaurants: [],
      state1: '',
      icon:'el-icon-user-solid',
      title:"",
      drawer: false,
      direction: 'rtl',
      personTitle:'',
      userMessage:false,
      userOrders: false,
      userInfor:false,
      changeName:false,
      changePassword:false,
      form:{
        newName:"",
        password:"",
        newPassword:"",
        againPassword:"",
      },
      rules: {
        newName:[{validator:checkNull, trigger: 'blur' }],
        password:[{validator:checkPassword, trigger: 'blur' }],
        newPassword:[{validator:checkNull, trigger: 'blur' }],
        againPassword:[{validator:checkAgainPassword, trigger: 'blur' }],
      }
    };
  },
  methods: {
    refund(item){//退款功能
      this.stateDialogVisible=true;
      this.active=1;
      this.description1="正在准备退款环境";
      let i=0;
      let interval = setInterval(()=> {
        request.post("/api/orders/removeOrders", {
          phone: this.$store.state.user.phone,
          movieName: item.movie,
          address: item.address,
          cinema: item.cinema,
          screeningRoom: item.screeningRoom,
          startDate: item.startDate,
          startTime: item.startTime,
          seat: item.seat
        }).then(res => {
          if (res.status === 200) {
            i++;
            clearInterval(interval);
            this.active = 2;
            this.description2 = "退款成功";
            if (i===1)
            this.ordersList.splice(this.ordersList.indexOf(item),1)
            setTimeout(()=>{
              this.stateDialogVisible=false;
            },2000)
          }
        })
      },100)
    },

    chatToSell(item){
      this.chatViewVisible=true;
      this.sellerPhone=item.phone;
      this.cinema=item.cinema;
      this.ticketDetails=item;
    },

    enter(){
      this.dialogFormVisible=true;
    },
    reset(){
      this.$refs.resetForm.resetForm();
    },

    //登陆成功
    loginSuccess(){
      this.visibleEnter=true;
      this.dialogFormVisible=false;
      request.post("/api/orders/ordersInformation",{phone:this.$store.state.user.phone}).then(res=>{
        if (res.status===200){
          this.ordersList=res.data.filter(item=>item.state===2)
        }
      })
    },
    chooseIndex(key){
      if (key!==null)
      localStorage.setItem("activeIndex",key);
    },
//搜索框调用的方法
    querySearch(queryString, cb) {
      var restaurants = this.restaurants;
      var results = queryString ? restaurants.filter(this.createFilter(queryString)) : restaurants;
      // 调用 callback 返回建议列表的数据
      cb(results);
    },
    createFilter(queryString) {
      return (restaurant) => {
        return (restaurant.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
      };
    },
    loadAll(){//建议框里的内容

    },
    handleSelectSearch(item) {
      console.log(item);
    },
    handleCommand(command){
      this.personTitle=command;
      this.activeIndex="0";
      if (command==="个人资料"){
        this.drawer=true;
        this.userMessage=true;
        this.userOrders=false;
        this.userInfor=false;
      }else if (command==='订单管理'){
        this.drawer=true;
        this.userOrders=true;
        this.userMessage=false;
        this.userInfor=false;
        request.post("/api/orders/ordersInformation",{phone:this.$store.state.user.phone}).then(res=>{
          if (res.status===200){
            this.ordersList=res.data.filter(item=>item.state===2);
          }
        })
      }else if (command==="消息通知"){
        if (this.$store.state.user.permissions!==2){
          this.drawer=true;
          this.userInfor=true;
          this.userMessage=false;
          this.userOrders=false;
          if (this.$store.state.user.permissions===0){
            request.post("/api/orders/ordersInformation",{phone:this.$store.state.user.phone}).then(res=>{
              if (res.status===200){
                this.infor1List=res.data.filter(item=>item.state===-1||item.state===-2);
              }
            })
          }else {
            request.post("/api/orders/getInformation",{phone: this.$store.state.user.phone}).then(res=>{
              if (res.status===200){
                this.inforList=res.data;
                this.inforList.forEach(item=>{
                  item.buyer=item.buyer.slice(0,3)+"****"+item.buyer.slice(7,11)
                })
              }
            })
          }
        }else {
          this.drawer=false;
          this.userInfor=false;
          this.userMessage=false;
          this.userOrders=false;
          this.$router.push({
            path:"/customerView",
          })
        }
      }else if (command==='放映管理'){
        localStorage.setItem("activeIndex",'1');
      }else if (command==='e'){
        this.drawer=false;
        this.visibleEnter=false;
        this.$refs.resetForm.resetForm();
        this.$store.state.user.phone=null;

        if (this.$route.path==="/managerView"){
          this.activeIndex=localStorage.getItem("activeIndex")
          this.$router.go(-1)
        }
      }
    },

    changeViewOnLoginOrRegister(){
      this.loginOrRegister=!this.loginOrRegister;
    },
    handleClose(done) {//个人资料的关闭
      this.$confirm('确认关闭？')
          .then(()=> {
            done();
          })
          .catch(()=> {});
    },

    //修改个人信息
    changeMess(change){
      if (change==="changeName"){
        this.changeName=true;
      }else if (change==="changePassword"){
        this.changePassword=true;
      }
    },
    changeUsername(){
      request.post("/api/game/changeUsername",{username:this.username,newName:this.newName}).then(res=>{
        if (res.code===202){
          this.username=res.object;
        }
      });
    },
    changeUserPassword(){
      this.$refs.changeMessForm.validate((valid)=>{
        if (valid){

          // request.post("/api/game/changePassword",{newPassword:this.form.againPassword,username:this.username}).then(res=>{
          //   if (res.code===200){
          //     this.userPassword=res.object;
          //   }
          // })
        }else {
          return false;
        }
      })
    },
    getLocation() {
      myBMap.init().then(() => {
        // const map = new BMap.Map("allMap");
        // const point = new BMap.Point(101.77,37.27);
        // map.centerAndZoom(point,12);
        let that=this;
        /* global BMap*/
        let geolocation = new BMap.Geolocation();
        // 创建百度地理位置实例，代替 navigator.geolocation
        geolocation.getCurrentPosition( function (e){
          // eslint-disable-next-line no-undef
          if (this.getStatus() === BMAP_STATUS_SUCCESS) {
            // const mk = new BMap.Marker(e.point);
            // map.addOverlay(mk);
            // map.panTo(e.point);
            // 百度 geolocation 的经纬度属性不同，此处是 point.lat 而不是 coords.latitude
            let point = new BMap.Point(e.point.lng,e.point.lat);
            let gc = new BMap.Geocoder();

            gc.getLocation(point, function (rs) {
              that.address=rs.address;
              that.$store.state.address=rs.address;
              //<<<<<<<<<<<<<<<<需要的位置信息在这获取
            });
          } else {
            alert("定位失败，请手动选择区域或重新定位");
            this.showloading = false;
          }
        },function (err) {
              console.log(err.code);
        },{
          enableHighAccuracy: true, //位置是否精确获取
          timeout: 5000,//获取位置允许的最长时间
          maximumAge: 0 //多久更新获取一次位置
        });
      });
    },
  },
  mounted() {
    if (this.$store.state.user.permissions==="2"){
      this.identity="电影院经理";
    }
    this.restaurants = this.loadAll();
    this.activeIndex=localStorage.getItem("activeIndex");
    this.getLocation()

  },
}
</script>

<style scoped>
.el-menu-distance{
  margin-left: 50px;
}
.button{
  font-size: medium;
  font-weight: bolder;
  margin-top: 10px;
  margin-left: 20px;
}
.el-menu-demo{
  margin-left: 20%;
}

.el-input-group__append .el-button{
  margin: -1px -21px;
}
.el-form-item{
  margin-top: 18px;
}
.inline-input i{
  color: white;
}
.chatView{
  width: 80%;
  min-width: 1200px;
  margin: -5% auto auto;
}
</style>