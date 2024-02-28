<template>
<div style="margin: 10px;display: flex;height: 670px">
<!--  最左侧树形结构-->
  <el-card style="flex: 1.5">
    <el-tree
        :data="data"
        :props="defaultProps"
        :default-expanded-keys="expandedList"
        accordion
        :highlight-current="true"
        :expand-on-click-node="expandOnClickNode"
        node-key="label"
        ref="tree"
        @node-click="handleNodeClick"
        @node-expand="nodeExpand"
        @node-collapse="nodeCollapse"
        class="el-tree">
       <span class="custom-tree-node" slot-scope="{ node, data }">
        <span>{{ node.label }}</span>
        <span v-if="data.value">
          <el-tooltip content="添加" placement="left-start" effect="light">
            <el-button
                type="text"
                size="lager"
                v-if="data.treeNodeId!==-1"
                style="font-weight: bolder;font-size: larger"
                @click="() => append(data)">
            ＋
             </el-button>
          </el-tooltip>
          <el-tooltip effect="light" content="删除" placement="right-start">
            <el-button
                type="text"
                size="lager"
                v-if="data.label!=='放映管理'"
                style="font-weight: bolder;font-size: larger"
                @click="() => remove(node, data)">
            －
            </el-button>
          </el-tooltip>
        </span>
      </span>
    </el-tree>
  </el-card>
    <!--  中间展示内容区-->
    <el-card v-if="!isSearch" style="flex: 5;margin-left: 5px;">
      <div>
        <el-card style="height: 530px;margin-top: -5px">
          <el-checkbox-group v-model="checkList" v-for="(row,rowIndex) in dataList" :key="rowIndex" style="color: #67C23A;margin-top: 10px;margin-left:40px;text-align: center">
            <el-checkbox  v-for="(column,columnIndex) in row"
                          @change="addData(column)"
                          :label="column.label" :disabled="column.state==='-1'" :checked="column.state==='1'"
                          :key="columnIndex" style="margin-left: -20px;zoom: 150%">&nbsp;
            </el-checkbox>
          </el-checkbox-group>
          <el-checkbox v-if="!isSubmit" :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
        </el-card>
        <el-card style="height: 100px;margin-top: 5px">
          <el-descriptions style="margin-top: -5px" :label-style="{'font-size': '16px','color': '#fefefe','text-shadow': '0 0 0.5em #0ae642, 0 0 0.2em #5c5c5c',}">
            <el-descriptions-item label="电影名" content-class-name="text">{{ movieName }}</el-descriptions-item>
            <el-descriptions-item label="电影时长" content-class-name="text">{{ filmDuration }}</el-descriptions-item>
            <el-descriptions-item label="票价" content-class-name="text">
              <el-input v-if="!isSubmit" v-model="ticketValue" type="text" clearable placeholder="请输入票价" size="small" style="width: 150px;margin: 0;padding: 0;height: 10px"></el-input>
              <span v-if="isSubmit">{{ticketValue}}</span>
              <span>￥</span>
            </el-descriptions-item>
            <el-descriptions-item label="日期">
              <el-date-picker
                  v-model="start_endDate"
                  v-if="!isSubmit"
                  type="daterange"
                  align="right"
                  size="small"
                  style="width: fit-content"
                  value-format="yyyy-MM-dd"
                  unlink-panels
                  range-separator="至"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期"
                  :picker-options="pickerOptions">
              </el-date-picker>
              <span v-if="isSubmit">{{start_endDate[0]+"-"+start_endDate[1]}}</span>
            </el-descriptions-item>
            <el-descriptions-item label="放映时间">
              <el-time-picker
                  is-range
                  v-model="start_endTime"
                  v-if="!isSubmit"
                  value-format="HH:mm:ss"
                  size="small"
                  style="width: fit-content"
                  range-separator="至"
                  start-placeholder="开始时间"
                  end-placeholder="结束时间"
                  placeholder="选择时间范围"
              >
              </el-time-picker>
              <span v-if="isSubmit">{{start_endTime[0]+"-"+start_endTime[1]}}</span>
            </el-descriptions-item>
            <el-descriptions-item label="状态" content-class-name="context">{{state}}
              <el-button v-if="isSubmit" type="primary" size="small" @click="change" style="margin-left: 90px;float: right;">修改</el-button>
              <el-button v-if="!isSubmit" type="success" size="small" @click="submit" style="margin-left: 90px;float: right;">确定</el-button>
            </el-descriptions-item>
          </el-descriptions>
        </el-card>
      </div>
    </el-card>
    <!--  右侧电影海报轮播图-->
    <el-carousel v-if="!isSearch" :autoplay="autoPlay" indicator-position="none" type="card" height="480px" direction="vertical" style="flex: 2;margin-left: 5px">
      <el-carousel-item @click.native="chooseMovie(item)" v-for="(item,index) in movieSrc" :key="index" style="width: 100%;">
        <el-image :src="item.src" fit="cover" ></el-image>
      </el-carousel-item>
    </el-carousel>
  <el-card v-if="isSearch" style="margin-left: 5px;flex: 7;">
    <el-carousel style="height: 630px">
      <el-carousel-item v-for="(item,index) in chartsList" :key="index" style="height: fit-content">
        <div style="display: flex;height: 230px;">
          <div style="flex: 2;text-align: center">
            <el-image :src="item.movieSrc" fit="contain" style="width: 200px"></el-image>
          </div>
          <div style="flex: 1.5;display: block">
            <div class="label_div" style="background-color: #409EFF;">购票数量：{{ item.orderSum }}</div>
            <div class="label_div" style="background-color: #67C23A;">上座率：{{ item.orderRate }}</div>
            <div class="label_div" style="background-color: #E6A23C;">影院票房：{{ item.boxOffice }}</div>
          </div>
        </div>
        <template>
          <ve-line :data="item.chartData" :settings="chartSettings" width="1200px" height="400px"></ve-line>
        </template>
      </el-carousel-item>
    </el-carousel>
  </el-card>
</div>
</template>

<script>

import request from "@/utils/request";

let submitList=new Map();
let isChange=false;
export default {
  name: "managerView",
  data() {
    this.chartSettings={
      labelMap: {
        "PV": '设座数量',
        "Order": '购票数量',
        "OrderRate":"上座率"
      },
      yAxisType: ['0.[00]a', '0.[00]%'],
        axisSite: {
        right: ['OrderRate']
        },
      yAxisName: ['数值轴', '比率轴'],
      xAxisType: 'time'
    }
    return {
      chartsList:[{
        movieSrc:"https://ts1.cn.mm.bing.net/th/id/R-C.cebc1f6f784d02ea530c661ac18bea40?rik=Kraute8DM%2fROxg&riu=http%3a%2f%2fnews.xnnews.com.cn%2fylxw%2f202207%2fW020220721615023764049.png&ehk=oQGXx0IIa52Ujth9SAj7Jg57d99Gk7GiVocZRESwDv8%3d&risl=&pid=ImgRaw&r=0",
        orderSum:'0',
        orderRate: "0%",
        boxOffice:'0',
        chartData: {
          columns: ['date', 'Order', 'PV', 'OrderRate'],
          rows: [
            { 'date': '2022-8-5','Order': 1093, 'PV': 1393, 'OrderRate': 0.32 },
            { 'date': '2022-8-6','Order': 3230, 'PV': 3530, 'OrderRate': 0.26 },
            { 'date': '2022-8-7','Order': 2623, 'PV': 2923, 'OrderRate': 0.76 },
            { 'date': '2022-8-8','Order': 1423, 'PV': 1723, 'OrderRate': 0.49 },
            { 'date': '2022-8-9','Order': 3492, 'PV': 3792, 'OrderRate': 1 },
          ]
        },
      }],
      isSearch:true,
      expandedList:[],
      expandOnClickNode:true,
      isSubmit:true,
      seatList:[],
      isIndeterminate: false,
      checkAll: false,
      start_endDate:"",
      start_endTime: [],
      screeningRoom:'',
      timeSession:'',
      autoPlay:true,
      movieName:'',
      movieSrc:[],
      movieList:[],
      filmDuration:'',
      ticketValue:'',
      state:'无',
      checkList:[],
      dataList:[],
      data: [{
        label: '放映管理',
        value:true,
        children: [{
          label: '一号放映厅',
          value:true,
          treeNodeId:0,
          children: [{
            label: '第一场',
            value:true,
            treeNodeId:-1,
          }]
        },
          {
            label: '二号放映厅',
            value:true,
            treeNodeId:0,
            children: [{
              label: '第一场',
              value:true,
              treeNodeId:-1,
            }]
          }]
      }, {
        label: '数据查询',
        value: false,
        children: [{
          label: '上座率',
          value: false,
        },]
      }, ],
      defaultProps: {
        children: 'children',
        label: 'label',
      },
      pickerOptions: {
        shortcuts: [{
          text: '未来一周',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() + 3600 * 1000 * 24 * 7);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '未来一个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() + 3600 * 1000 * 24 * 30);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '未来三个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() + 3600 * 1000 * 24 * 90);
            picker.$emit('pick', [start, end]);
          }
        }]
      },
    };
  },
  methods: {
    // 提交
    submit(){
      this.$confirm('该设置将被提交, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        if (this.$store.state.user.phone!==''){
          if (this.ticketValue&&this.start_endDate&&this.start_endTime&&this.movieName&&this.dataList.length!==0){
            let timeConflict=true;
            this.seatList.forEach(item=>{
              if (item.label===this.screeningRoom)
                item.children.forEach(secondItem=>{
                  let bigTime=secondItem.label.split("-")
                  if ((this.start_endTime[0]>=bigTime[0]&&this.start_endTime[0]<=bigTime[1])||this.start_endTime[1]>=bigTime[0]&&this.start_endTime[1]<=bigTime[1]){
                    timeConflict=false;
                  }
                })
            })
            if (isChange||timeConflict){
              let i=0;
              this.dataList.forEach(item=>{
                let temp=0;
                item.forEach(secondItem=>{
                  if (secondItem.state==='0'){
                    secondItem.state='-1';
                    temp++;
                    secondItem.label="0"
                  }else {
                    let pai=secondItem.label.split("排");
                    let lie=parseInt(pai[1].split("列")[0]);
                    secondItem.label=pai[0]+"排"+(lie-temp)+"列";
                  }
                })
                if (temp===12){
                  i++;
                }else {
                  item.forEach(column=>{
                    if (column.state!=="-1"){
                      let pai=column.label.split("排");
                      column.label=(parseInt(pai[0])-i)+"排"+pai[1];
                    }
                  })
                }
              })
              submitList.set(this.screeningRoom+this.timeSession,true);
              this.isSubmit=true;
              this.judgeState();
              this.movieSrc=this.movieList.filter(item=>{
                this.autoPlay=true;
                return this.movieName===item.movieName;
              })
              request.post("/api/screeningRoom/addData",{phone:this.$store.state.user.phone,
                dataList:this.dataList,
                movie:this.movieName,
                ticketValue:this.ticketValue,
                date:this.start_endDate,
                time:this.start_endTime,
                screeningRoom:this.screeningRoom,
              }).then(res=>{
                if (res.status===200){
                  this.$message({
                    type:"success",
                    message:res.statusText,
                    showClose:true
                  })
                }
              })
              this.$nextTick(()=>{
                request.post("/api/screeningRoom/adjustRoom",{phone: this.$store.state.user.phone}).then(res=>{
                  if (res.status===200){
                    console.log(123)
                    this.data[0].children=res.data
                    this.seatList=res.data;
                  }
                })
              })
            }else {
              this.$message({
                type:"warning",
                message:'电影放映时间有重叠，请重新设置',
                showClose:true
              })
            }
          }
        }
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消提交'
        });
      });
    },
    change(){
      this.$confirm('是否修改该设置?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.isSubmit=false;
        isChange=true;
        this.dataList.forEach(item=>{
          item.forEach(secondItem=>{
            if (secondItem.state==='-1'){
              secondItem.state='0';
            }
          })
        })
        this.movieSrc=this.movieList;
        submitList.set(this.screeningRoom+this.timeSession,false);
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消修改'
        });
      });

    },

    // 往dataList里面添加数据，主要是改变state的值
    addData(item){
      if (item.state==='0'){
        item.state='1';
      }else if (item.state==='1'){
        item.state='0';
      }
    },
    // checkbox全选功能
    handleCheckAllChange(val) {
      if (val){
        for (let i = 1; i < 13; i++) {
          for (let j = 1; j < 13; j++) {
            this.checkList.push(i+"排"+j+"列");
            this.dataList[i-1][j-1].state='1';
          }
        }
      }else {
        this.checkList=[];
        this.dataList.forEach(item=>{
          item.forEach(secondItem=>{
            secondItem.state='0';
          })
        })
      }
      this.isIndeterminate = false;
    },

    // 左侧树形组件点击事件
    handleNodeClick(data) {
      if (data.label==='上座率'){
        this.isSearch=true;
      }
      if (data.treeNodeId===0){
        this.screeningRoom=data.label;
      }else if (data.treeNodeId===-1){
        this.isSearch=false;
        this.timeSession=data.label;
        let seat=this.seatList;
        // this.isSubmit=submitList.map()
        this.clearAll();
        for (let i = 0; i < seat.length; i++) {
          if (seat[i].label===this.screeningRoom){
            for (let j = 0; j < seat[i].children.length; j++) {
              if (seat[i].children[j].label===this.timeSession){
                isChange=false;
                this.movieSrc=this.movieList.filter(item=>{
                  return item.movieName===seat[i].data[j].playMovie})
                this.movieName=this.movieSrc[0].movieName;
                this.autoPlay=true;
                this.filmDuration=this.movieSrc[0].movieTime+"分钟";

                this.isSubmit=submitList.get(this.screeningRoom+this.timeSession)?submitList.get(this.screeningRoom+this.timeSession):true;

                this.ticketValue=seat[i].data[j].ticketValue;
                this.start_endDate=[seat[i].data[j].startDate,seat[i].data[j].endDate];
                this.start_endTime=[seat[i].data[j].startTime,seat[i].data[j].endTime];
                this.dataList=seat[i].children[j].data;
                this.dataList.forEach(item=>{
                  item.forEach(secondItem=>{
                    if (secondItem.state==='1'){
                      this.checkList.push(secondItem.label);
                    }
                  })
                })
                this.judgeState();
              }
            }
          }
        }
      }
    },

    judgeState(){
      let date=new Date();
      let movieDate=this.start_endDate[0].split("-");
      let movieDate1=this.start_endDate[1].split("-");
      if (date.getFullYear()<movieDate[0]){
        this.state="未上映"
      }else if ((date.getFullYear()+'')===movieDate[0]) {
        if ((date.getMonth()+1) < movieDate[1]) {
          this.state = "未上映"
        } else if ((date.getMonth()+1+ '') === movieDate[1]) {
          if (date.getDate() < movieDate[2]) {
            this.state = "未上映"
          } else {
            this.state='正在热映'
          }
        }else {
          this.state='正在热映'
        }
      }else if ((date.getFullYear()+'')===movieDate1[0]){
        if ((date.getMonth()+1)>movieDate1[1]){
          this.state='已下映'
        }else if ((date.getMonth()+1+'')===movieDate1[1]){
          if (date.getDate() > movieDate1[2]) {
            this.state = "已下映"
          } else {
            this.state='正在热映'
          }
        }else {
          this.state='正在热映'
        }
      }else if (date.getFullYear()>movieDate1[0]){
        this.state='已下映'
      }
    },
    // 左侧树形结构添加标签
    append(data) {
      this.$refs.tree.expandOnClickNode=false;
      this.$prompt('请输入名称', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputValidator:value => {
          return value !== null;
        },
        inputErrorMessage:'请输入名称'
      }).then(({ value }) => {
        let newChild;
        if (data.children&&data.treeNodeId===0){
           newChild= {value:true, label: value, treeNodeId: -1};
        }else {
          newChild = {value:true, label: value, children: [], treeNodeId: 0};
        }
        if (!data.children) {
          this.$set(data, 'children', []);
        }
        data.children.push(newChild);
          this.$message({
            type: 'success',
            message: '输入名称是: ' + value,
            showClose:true
          });
          this.$nextTick(()=>{
            isChange=false;
            this.$refs.tree.setCurrentKey(value)
            this.$refs.tree.expandOnClickNode=true;
            this.autoPlay=true;
            this.movieSrc=this.movieList;
            this.timeSession=value;
            this.checkAll=false;
            this.isSubmit=false;
            for (let i = 0; i < 12; i++) {
              let list=[]
              for (let j = 0; j < 12; j++) {
                list[j]={label:(i+1)+"排"+(j+1)+'列',state:'0'}
              }
              this.dataList[i]=list;
            }
          })
       this.clearAll();
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '取消输入',
          showClose:true
        });
      });
    },
    nodeExpand(data) {
      if (this.expandedList.length>1){
        this.expandedList.splice(this.expandedList.indexOf(data.label), 1);
      }
      this.expandedList.push(data.label); // 在节点展开是添加到默认展开数组
    },
    nodeCollapse(data) {
      this.expandedList.splice(this.expandedList.indexOf(data.label), 1); // 收起时删除数组里对应选项
    },
    // 清空全部
    clearAll(){
      this.checkList=[];
      this.movieName='';
      this.start_endTime='';
      this.start_endDate='';
      this.ticketValue='';
      this.filmDuration='';
      this.state="无";
    },

    remove(node, data) {
      this.$confirm('是否确定删除?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        const parent = node.parent;
        const children = parent.data.children || parent.data;
        const index = children.findIndex(d => d.label === data.label);
        children.splice(index, 1);
        if (data.treeNodeId===-1){
          request.post("/api/screeningRoom/deleteData",{phone:this.$store.state.user.phone,screeningRoom:this.screeningRoom,time:data.label}).then(res=>{
            if (res.status===200){
              this.$message({
                type:"success",
                message:res.statusText,
                showClose:true
              })
            }else if (res.status===400){
              this.$message({
                type:"error",
                message:res.statusText,
                showClose:true
              })
            }
          })
        }else if (data.treeNodeId===0){
          request.post("/api/screeningRoom/deleteData",{phone:this.$store.state.user.phone,screeningRoom:data.label}).then(res=>{
            if (res.status===200){
              this.$message({
                type:"success",
                message:res.statusText,
                showClose:true
              })
            }else if (res.status===400){
              this.$message({
                type:"error",
                message:res.statusText,
                showClose:true
              })
            }
          })
        }

      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },

    chooseMovie(item){
      this.autoPlay=false;
      this.movieName=item.movieName;
      this.filmDuration=item.movieTime+"分钟";
    },

  },
  mounted() {
    if (this.$store.state.user.phone===''){
      this.$router.replace("/")
    }else {
      request.post("/api/cinema/setScreeningRoom", {phone: this.$store.state.user.phone}).then(res=>{
        if (res.status===200){
          this.movieSrc=this.movieList=res.data;
        }else if (res.status===400){
          this.$message.warning(res.statusText)
        }
      })
      request.post("/api/screeningRoom/adjustRoom",{phone: this.$store.state.user.phone}).then(res=>{
        if (res.status===200){
          this.data[0].children=res.data
          this.seatList=res.data;
        }
      })
      request.post("/api/screeningRoom/chartsData",{phone: this.$store.state.user.phone}).then(res=>{
        if (res.status===200){
          this.chartsList=[]
          res.data.forEach(item=>{
            let chartData= {
                  columns: ['date', 'PV', 'Order', 'OrderRate'],
                  rows : item.rows
                }
            let data={ movieSrc : item.movieSrc, orderSum : item.orderSum, orderRate : item.orderRate, boxOffice : item.boxOffice+"￥", chartData : chartData}
            this.chartsList.push(data);
          })
        }
      })
    }
    for (let i = 0; i < 12; i++) {
      let list=[]
      for (let j = 0; j < 12; j++) {
        list[j]={label:(i+1)+"排"+(j+1)+'列',state:'0'}
      }
      this.dataList[i]=list;
    }
  },
}
</script>

<style scoped>
.el-tree{
  color: #67C23A;
  text-decoration: 2px;
  font-size: large;
  font-weight: bolder;
}
.custom-tree-node {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
}
/deep/.el-carousel__button{
  background-color: #409EFF;
}

.label_div{
  border-radius: 5px;
  width: fit-content;
  height: fit-content;
  padding: 10px;
  color: white;
  margin-top: 25px;
}
</style>
<style>
.context{
  text-shadow:  0 0 2px hsl(40, 28.57% , 28.82%),0 0 2px hsl(40, 28.57% , 28.82%), 0 0 2px hsl(40, 28.57% , 28.82%);/*多个叠加*/
  font-size: 18px;
  color: white;
}
</style>