<template>
<div>
  <el-card style="width: 570px;height: 500px;">
    <div style="text-align: center;">
      <span>{{ cinema}}</span>
      <el-divider><i class="el-icon-more"></i>&nbsp;&nbsp;&nbsp;<i class="el-icon-more"></i>&nbsp;&nbsp;&nbsp;<i class="el-icon-more"></i></el-divider>
    </div>
    <div class="infinite-list-wrapper" style="overflow:auto;height: 390px;margin-top: -25px;">
      <ul class="list" style="overflow:auto;list-style-type: none;padding: 0;margin: 0;height: 100%">
        <li v-for="(item,index) in chatList" :key="index" class="list-item" style="margin-top: 10px;color: white;background-color: white;width: 510px;height: fit-content;min-height: 45px">
          <div v-if="item.chatText">
            <div v-if="item.fromPhone===buyerPhone" style="float: right;display: flex;">
              <div>
                <div style="color: #606266;font-size: small;text-align: right">用户</div>
                <div class="chatDiv" style="background-color: #409EFF">
                  <span>{{ item.chatText }}</span>
                </div>
              </div>
              <el-avatar :src="buyerSrc" style="margin-right: -10px;padding: 0;margin-left: 3px;margin-top: 9px"></el-avatar>
            </div>
            <div v-else style="float: left;display: flex;">
              <el-avatar :src="sellerSrc" style="margin-left: 0;margin-right: 3px;padding: 0;margin-top: 9px"></el-avatar>
              <div>
                <span style="color: #606266;font-size: small">客服</span>
                <div class="chatDiv">
                  <span>{{ item.chatText }}</span>
                </div>
              </div>
            </div>
          </div>
          <el-card v-if="item.html" style="width: 500px;margin: auto">
            <el-descriptions>
              <el-descriptions-item label="电影名">{{ item.html.movie }}</el-descriptions-item>
              <el-descriptions-item label="影院">{{ item.html.cinema }}</el-descriptions-item>
              <el-descriptions-item label="影院地址">{{ item.html.address }}</el-descriptions-item>
              <el-descriptions-item label="放映厅">{{ item.html.screeningRoom }}</el-descriptions-item>
              <el-descriptions-item label="放映日期">{{ item.html.startDate }}</el-descriptions-item>
              <el-descriptions-item label="放映时间">{{ item.html.startTime }}</el-descriptions-item>
              <el-descriptions-item label="购买位置" content-style="color: red">
                {{item.html.seat}}
              </el-descriptions-item>
              <el-descriptions-item label="单价">{{ item.html.ticketValue }}</el-descriptions-item>
            </el-descriptions>
          </el-card>
        </li>
      </ul>
    </div>
    <div style="display: flex;padding: 5px;background-color: #909399;width: 100%;margin-top: 5px">
      <el-input
          type="textarea"
          autosize
          placeholder="请输入内容"
          maxlength="30"
          show-word-limit
          v-model="textarea"
      style="flex: 5">
      </el-input>
      <el-button type="primary" size="mini" style="flex: 1" @click="submitChatData">发送</el-button>
    </div>
  </el-card>
</div>
</template>

<script>
import request from "@/utils/request";

let socket;
export default {
  name: "chatView",
  props:["buyerPhone","sellerPhone","cinema","ticketDetails"],
  data(){
    return{
      textarea:"",
      sellerSrc: require("../assets/客服.png"),
      buyerSrc: require("../assets/用户.png"),
      chatList:[],
    }
  },
  // created() {
  //   this.init()
  // },
  methods:{
    submitChatData(){
      if (!this.textarea) {
        this.$message({type: 'warning', message: "请输入内容"})
      } else {
        if (typeof (WebSocket) == "undefined") {
          console.log("您的浏览器不支持WebSocket");
        } else {
          console.log("您的浏览器支持WebSocket");

          // 组装待发送的消息 json
          // {"from": "zhang", "to": "admin", "text": "聊天文本"}
          let message = {from: this.buyerPhone, to: this.sellerPhone, text: this.textarea}
          socket.send(JSON.stringify(message));  // 将组装好的json发送给服务端，由服务端进行转发
        }
      }
      request.post("/api/chatData/sendChatData",{buyerPhone: this.buyerPhone,sellerPhone: this.sellerPhone,textarea: this.textarea}).then(res=>{
        if (res.status===200){
          this.chatList.push({fromPhone: this.buyerPhone,chatText: this.textarea})
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
    init: function () {
      let username = this.buyerPhone;
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
          let message = {from: _this.buyerPhone, to: _this.sellerPhone, html: _this.ticketDetails}
          socket.send(JSON.stringify(message));// 将组装好的json发送给服务端，由服务端进行转发

        };
        //  浏览器端收消息，获得从服务端发送过来的文本消息
        socket.onmessage = function (msg) {
          console.log("收到数据====" + msg.data)
          let data;
          if (typeof msg.data === 'string') {
            data = msg.data ? JSON.parse(msg.data) : msg.data
          }// 对收到的json数据进行解析， 类似这样的： {"users": [{"username": "zhang"},{ "username": "admin"}]}
          if (!data.users) {  // 获取在线人员信息
            // 如果服务器端发送过来的json数据 不包含 users 这个key，那么发送过来的就是聊天文本json数据
            //  // {"from": "zhang", "text": "hello"}
            let list = {fromPhone: data.from, chatText: data.text}
            _this.chatList.push(list)
            _this.$nextTick(() => {
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
  mounted() {
    if (this.$store.state.user.phone!==''){
      request.post("/api/chatData/getChatData",{buyerPhone: this.buyerPhone,sellerPhone: this.sellerPhone}).then(res=>{
        if(res.status===200){
          this.chatList=res.data.map(item=>{
            return {fromPhone: item.fromPhone, chatText: item.chatText, html: JSON.parse(item.html)}
          });
          this.$nextTick(()=>{
            var container = this.$el.querySelector(".list");
            container.scrollTop = container.scrollHeight;
          })
        }
      })
      request.post("/api/chatData/sendChatData", {
        buyerPhone: this.buyerPhone,
        sellerPhone: this.sellerPhone,
        html: JSON.stringify(this.ticketDetails)
      })
      this.init()

    }
  }
}
</script>

<style scoped>
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


</style>