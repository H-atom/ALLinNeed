<template>
<div>
  <el-card class="box-card">
    <div slot="header" class="clearfix">
      <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>{{cinema}}</el-breadcrumb-item>
        <el-breadcrumb-item>{{movieName}}</el-breadcrumb-item>
        <el-breadcrumb-item>{{movieDate}}</el-breadcrumb-item>
        <el-breadcrumb-item>您正在选座</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="text item">
      <el-tabs @tab-click="tabChange" tab-position="left" style="height: 100%">
        <el-tab-pane :label="item.startTime+'-'+item.endTime" v-for="item in dataList" :key="item.startTime" style="text-align: center;height: 100%;">
          <div>
            <el-checkbox-group v-model="checkList" v-for="(row,rowIndex) in item.seatList" :key="rowIndex" style="margin-top: 8px">
              <el-checkbox :disabled="column.state==='2'||column.state==='-1'" v-for="(column,columnIndex) in row"
                                :label="column.seat" :checked="column.state==='2'"
                                  :key="columnIndex"  style="margin-left: -30px;zoom: 190%" @change="change(item,column)">&nbsp;</el-checkbox>
            </el-checkbox-group>
          </div>
          <div style="justify-content: center;vertical-align: middle;display: inline-block;margin-bottom: 5%;margin-left:0;height: 20%;position: fixed;bottom: -140px">
            <span class="bottom_span">状态:</span>
            <el-checkbox label="未出售" style="margin-left: 10px"></el-checkbox>
            <el-checkbox label="已选择" checked></el-checkbox>
            <el-checkbox label="已出售" disabled checked></el-checkbox>
            <el-button type="primary" style="height: 40px;margin-left: 60px" @click="buy">立即购买</el-button>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
  </el-card>
  <el-dialog
      title="订单"
      :visible.sync="dialogVisible"
      width="45%"
      :before-close="handleClose">
    <el-card v-for="item in seatList" :key="item" style="margin-top: 5px">
      <el-descriptions>
        <el-descriptions-item label="电影名">{{ movieName }}</el-descriptions-item>
        <el-descriptions-item label="影院">{{ cinema }}</el-descriptions-item>
        <el-descriptions-item label="影院地址">{{ address }}</el-descriptions-item>
        <el-descriptions-item label="放映厅">{{ screeningRoom }}</el-descriptions-item>
        <el-descriptions-item label="放映日期">{{ movieDate }}</el-descriptions-item>
        <el-descriptions-item label="放映时间">{{ startTime }}</el-descriptions-item>
        <el-descriptions-item label="购买位置" content-style="color: red">
          {{item}}
        </el-descriptions-item>
        <el-descriptions-item label="单价">{{ ticketValue }}￥</el-descriptions-item>
      </el-descriptions>
    </el-card>
    <span slot="footer" class="dialog-footer">
      <span style="margin-right: 15px">总价: <span style="color: crimson">{{seatList.length*ticketValue}}</span>￥</span>
    <el-button @click="dialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="payForTicket">立即付款</el-button>
    </span>
  </el-dialog>
  <el-dialog title="支付状态" :visible.sync="stateDialogVisible" width="45%" :before-close="handleClose">
    <el-card>
      <el-steps direction="vertical" :active="active">
        <el-step title="步骤 1" :description="description1"></el-step>
        <el-step title="步骤 2" :description="description2"></el-step>
        <el-step title="步骤 3" :description="description3"></el-step>
      </el-steps>
    </el-card>
  </el-dialog>
</div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "chooseSeatBody",
  data(){
    return{
      dialogVisible: false,
      stateDialogVisible:false,
      active:1,
      description1:"",
      description2:"",
      description3:"",
      movieName:"",
      ticketValue:'',
      cinema:'',
      movieDate:'',
      address:'',
      screeningRoom:'',
      startTime:'',
      checkList:[],
      dataList:[],
      seatList:[],
    }
  },
  mounted() {
   this.cinema=this.$route.query.cinema;
   this.movieName=this.$route.query.movieName;
   this.address=this.$route.query.address;
   this.ticketValue=this.$route.query.ticketValue;
   this.movieDate=this.$route.query.movieDate;
   request.post("/api/screeningRoom/buyingScreeningRoom",{cinema:this.cinema,movieName:this.movieName,
   address:this.address,movieDate:this.movieDate}).then(res=>{
     console.log(res.status)
     if (res.status===200){
       this.dataList=res.data;
       console.log(this.dataList)
     }
   })
  },
  methods:{
    buy(){
      this.dialogVisible = true;
    },

    payForTicket(){
      if (this.$store.state.user.phone===''){
        this.$message({
          type:"warning",
          message:'请先登录！',
          showClose:true,
        })
      }else {
        this.stateDialogVisible=true;
        this.active=1;
        this.description1="正在生成订单";
        request.post("/api/orders/addOrders",{phone :this.$store.state.user.phone,movieName: this.movieName,
          address: this.address,cinema: this.cinema, screeningRoom: this.screeningRoom,startDate: this.movieDate, startTime: this.startTime,
          ticketValue: this.ticketValue, seatList: this.seatList}).then(res=>{
            if (res.status===200){
              this.active=2;
              this.description1="订单已生成";
              this.description2="正在准备支付环境";
              let interval = setInterval(()=>{
                request.post("/api/orders/isPaying",{phone :this.$store.state.user.phone,movieName: this.movieName,
                  address: this.address,cinema: this.cinema, screeningRoom: this.screeningRoom,startDate: this.movieDate, startTime: this.startTime,
                  ticketValue: this.ticketValue,}).then(res=>{
                  if (res.status===200){
                    this.active=3;
                    this.description3=res.statusText;
                    clearInterval(interval);
                    this.$message({
                      type:"success",
                      message:res.statusText,
                      showClose:true,
                    })
                    setTimeout(()=>{
                      this.stateDialogVisible=false;
                      this.dialogVisible=false;
                      this.$router.replace("/")
                    },3000)
                  }else if (res.status===400){
                    this.active=3;
                    this.description3="支付失败";
                    clearInterval(interval);
                    this.$message({
                      type:"error",
                      message:"支付失败",
                      showClose:true,
                    })
                  }
                })
              },100);
            }else if (res.status===400){
              let string='';
              res.data.forEach(item=>{
                if (res.data[res.data.length-1]===item){
                  string+=item;
                }else {
                  string+=item+",";
                }
              })
              this.$message({
                type:"warning",
                message:string+"已被购买，请重新购票！",
                showClose:true,
              })
            }
        })
      }
    },

    tabChange(){
      this.checkList=[]
    },
    // 选择或取消座位
    change(item,column){
      this.screeningRoom=item.screeningRoom;
      this.startTime=item.startTime;
      // this.checkList.unshift(this.dataList[row][column])
      // alert(column)
      if (this.seatList.includes(column.seat)){
        this.seatList.splice(this.seatList.indexOf(column.seat),1)
      }else {
        this.seatList.push(column.seat)
      }
    },
    handleClose(done) {
      this.$confirm('确认关闭？')
          .then(() => {
            done();
          })
          .catch(() => {});
    }
  }
}
</script>

<style scoped>
/*卡片的样式*/
.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both
}

.box-card {
  width: 80%;
  margin-left: 10%;
  height: 680px;
}
.bottom_span{
  margin-left: 25px;
}

</style>