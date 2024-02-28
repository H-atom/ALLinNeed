<template>
<div>
  <el-card style="width: 80%;height: 670px;margin: auto;">
<!--    <el-tabs tab-position="left" style="height: 640px;">-->
<!--      <el-tab-pane label="消息通知">-->
<!--        <div style="display: flex">-->
<!--          <div style="flex: 1;background-color: #92b9bb;">-->
            <el-tabs v-model="tabItem" tab-position="left" @tab-click="changeItem()">
              <el-tab-pane :name="index+''" v-for="(item,index) in buyerList" :key="index" style="height: fit-content">
                <span slot="label">
                    <el-avatar :src="buyerSrc"></el-avatar>
                   <el-badge v-if="item.noSeeNumber!==0" :value="item.noSeeNumber" :max="99" class="item">
                    <span style="vertical-align: baseline">{{item.phone}}</span>
                  </el-badge>
                  <span v-else style="vertical-align: top">{{item.phone}}</span>
                </span>
                <div class="border_div" style="height: 600px">
                  <div style="margin-left: 10px;height: 560px" >
                    <ul class="list" style="overflow:auto;list-style-type: none;padding: 0;margin: 0;height: 100%">
                      <li v-for="(chatItem,chatIndex) in item.chatList" :key="chatIndex" class="list-item" style="margin-top: 10px;color: white;background-color: white;width: 100%;height: fit-content;min-height: 45px">
                        <div v-if="chatItem.chatText">
                          <div v-if="chatItem.fromPhone===userPhone" style="float: right;display: flex;">
                            <div>
                              <div style="color: #606266;font-size: small;text-align: right">客服</div>
                              <div class="chatDiv">
                                <span>{{ chatItem.chatText }}</span>
                              </div>
                            </div>
                            <el-avatar :src="sellerSrc" style="margin-right: 10px;margin-left: 3px;padding: 0;margin-top: 9px"></el-avatar>
                          </div>
                          <div v-else style="float: left;display: flex;">
                            <el-avatar :src="buyerSrc" style="margin-right: 3px;padding: 0;margin-left: 3px;margin-top: 9px"></el-avatar>
                            <div>
                              <div style="color: #606266;font-size: small">用户</div>
                              <div class="chatDiv" style="background-color: #409EFF">
                                <span>{{ chatItem.chatText }}</span>
                              </div>
                            </div>
                          </div>
                        </div>
                        <el-card v-if="chatItem.html" style="width: 660px;margin: auto">
                        <el-descriptions>
                          <el-descriptions-item label="电影名">{{ chatItem.html.movie }}</el-descriptions-item>
                          <el-descriptions-item label="影院">{{ chatItem.html.cinema }}</el-descriptions-item>
                          <el-descriptions-item label="影院地址">{{ chatItem.html.address }}</el-descriptions-item>
                          <el-descriptions-item label="放映厅">{{ chatItem.html.screeningRoom }}</el-descriptions-item>
                          <el-descriptions-item label="放映日期">{{ chatItem.html.startDate }}</el-descriptions-item>
                          <el-descriptions-item label="放映时间">{{ chatItem.html.startTime }}</el-descriptions-item>
                          <el-descriptions-item label="购买位置" content-style="color: red">
                            {{chatItem.html.seat}}
                          </el-descriptions-item>
                          <el-descriptions-item label="单价">{{ chatItem.html.ticketValue }}</el-descriptions-item>
                        </el-descriptions>
                      </el-card>
                      </li>
                    </ul>
                  </div>
                  <div style="display: flex;padding: 5px;background-color: #909399;width: 99%;margin-top: 5px">
                    <el-input
                        type="textarea"
                        autosize
                        placeholder="请输入内容"
                        maxlength="30"
                        show-word-limit
                        v-model="textarea"
                        style="flex: 5">
                    </el-input>
                    <el-button type="primary" size="mini" style="flex: 1" @click="submitChatData(item)">发送</el-button>
                  </div>
                </div>
              </el-tab-pane>
            </el-tabs>
<!--            <ul style="overflow: auto;margin-left: -10px">-->
<!--              <li v-for="(item,index) in 2" :key="index" style="border: 2px solid #d3dce6;">-->
<!--                <el-avatar :src="buyerSrc"></el-avatar>-->
<!--                <span>{{item.username}}</span>-->
<!--              </li>-->
<!--            </ul>-->
<!--          </div>-->
<!--          -->
<!--        </div>-->
<!--      </el-tab-pane>-->
<!--      <el-tab-pane label="退款通知">退款通知</el-tab-pane>-->
<!--    </el-tabs>-->
  </el-card>
</div>
</template>

<script>

import request from "@/utils/request";

let socket;
export default {
  name: "customerView",
  data(){
    return{
      buyerList:[],
      textarea:'',
      tabItem:'0',
      userPhone: this.$store.state.user.phone,
      buyerSrc: require("../assets/用户.png"),
      sellerSrc: require("../assets/客服.png"),
    }
  },
  created() {

  },
  mounted() {
    if (this.userPhone!==''){
      request.post("/api/chatData/getChatData",{sellerPhone: this.userPhone}).then(res=>{
        if(res.status===200){
          this.buyerList=res.data.map(item=>{
            item.chatList.forEach(item1=>{
              if (item1.html){
                let html=item1.html;
                item1.html=JSON.parse(html);
              }
            })
            return { noSeeNumber:0, realPhone:item.phone, phone : item.phone.slice(0,3)+"****"+item.phone.slice(7,11), chatList: item.chatList}
          });
          this.$nextTick(()=>{
            var container = this.$el.querySelector(".list");
            container.scrollTop=container.scrollHeight;
          })
        }
      })
      this.init()
    }else {
      this.$router.replace("/")
    }
  },
  methods:{
    changeItem(){
      // item.noSeeNumber=0;
      this.buyerList[parseInt(this.tabItem)].noSeeNumber=0;
      var container = this.$el.querySelector(".list");
      container.scrollTop = container.scrollHeight;
    },

    submitChatData(item){
      if (!this.textarea) {
        this.$message({type: 'warning', message: "请输入内容"})
      } else {
        if (typeof (WebSocket) == "undefined") {
          console.log("您的浏览器不支持WebSocket");
        } else {
          console.log("您的浏览器支持WebSocket");

          // 组装待发送的消息 json
          // {"from": "zhang", "to": "admin", "text": "聊天文本"}
          let message = {from: this.userPhone, to: item.realPhone, text: this.textarea}
          socket.send(JSON.stringify(message));  // 将组装好的json发送给服务端，由服务端进行转发
        }
      }
      request.post("/api/chatData/sendChatData",{buyerPhone: this.userPhone,sellerPhone: item.realPhone,textarea: this.textarea}).then(res=>{
        if (res.status===200){
          this.buyerList.forEach(item1=>{
            if (item.realPhone===item1.realPhone){
              item1.chatList.push({fromPhone: this.userPhone,toPhone: '',chatText: this.textarea, timestamp: ''})
            }
          })
          this.$nextTick(()=>{
            var container = this.$el.querySelector(".list");
            container.scrollTop = container.scrollHeight;
          })
          this.textarea='';
        }else if (res.status===500){
          this.$message({
            type:"error",
            message:"发送失败",
            showClose:true,
          })
        }
      })
    },
    init(){
      let username=this.$store.state.user.phone;
      let _this = this;
      if (typeof (WebSocket) == "undefined") {
        console.log("您的浏览器不支持WebSocket");
      } else {
        console.log("您的浏览器支持WebSocket");
        let socketUrl = "ws://localhost:8888/webSocket/" + username;
        if (socket != null) {
          socket.close();
          socket = null;
        }
        // 开启一个websocket服务
        socket = new WebSocket(socketUrl);
        //打开事件
        socket.onopen = function () {
          console.log("websocket已打开");
        };
        //  浏览器端收消息，获得从服务端发送过来的文本消息
        socket.onmessage = function (msg) {
          console.log("收到数据====" + msg.data)
          let data;
          if (typeof msg.data === 'string') {
            data = msg.data ? JSON.parse(msg.data) : msg.data
          }// 对收到的json数据进行解析， 类似这样的： {"users": [{"username": "zhang"},{ "username": "admin"}]}
          if (!data.users){// 获取在线人员信息
            // 如果服务器端发送过来的json数据 不包含 users 这个key，那么发送过来的就是聊天文本json数据
            //  // {"from": "zhang", "text": "hello"}
            let list;
            if (data.html) list={fromPhone: data.from, html: data.html}
            else list={fromPhone: data.from, chatText: data.text}
              let isRepeat=true;
              _this.buyerList.forEach(item=>{
                if (item.realPhone===data.from){
                  item.noSeeNumber++;
                  item.chatList.push(list)
                  isRepeat=false;
                }
              })
              if (isRepeat){
                _this.buyerList.unshift({ noSeeNumber: 0,realPhone: data.phone, phone: data.phone.slice(0,3)+"****"+data.phone.slice(7,11),chatList:[list]})
              }
              _this.$nextTick(()=>{
                var container = _this.$el.querySelector(".list");
                container.scrollTop = container.scrollHeight;
              })
          }
        };
        //关闭事件
        socket.onclose = function () {
          console.log("websocket已关闭");
        };
        //发生了错误事件
        socket.onerror = function () {
          console.log("websocket发生了错误");
        }
      }
    },
  },
  // created() {
  //   this.init();
  // },
}
</script>

<style scoped>
li{
  list-style-type: none;
}
.border_div{
  border: 10px solid;
  border-image: linear-gradient(45deg, gold, deeppink) 1;
  clip-path: inset(0px round 10px);
  animation: huerotate 6s infinite linear;
  /*
  hue-rotate() (en-US) 函数在输入图像上应用色相旋转。
      angle 一值设定图像会被调整的色环角度值。值为 0deg，则图像无变化。
      若值未设置值，默认为 0deg。该值虽然没有最大值，超过 360deg 的值相当于又绕一圈。

  svg 元素 失效！！
  */
  filter: hue-rotate(360deg);
}
.chatDiv @keyframes huerotate {
  0% {
    filter: hue-rotate(0deg);
  }
  100% {
    filter: hue-rotate(360deg);
  }
}
.chatDiv{
  background-color: #67C23A;
  border-radius: 5px;
  max-width: 280px;
  width: fit-content;
  height: fit-content;
  min-height: 20px;
  margin: 0;
  padding: 5px;
}
.item {
  margin-top: -10px;
  margin-right: 40px;
}
</style>