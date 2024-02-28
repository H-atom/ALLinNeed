import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios'
import router from '@/router/index'
import store from "@/store/store";
import VeLine from 'v-charts/lib/line.common'
Vue.prototype.axios = axios

Vue.use(ElementUI);
Vue.component(VeLine.name, VeLine)
Vue.config.productionTip = false

new Vue({
  render: h => h(App),
  router,
  store
}).$mount('#app')
