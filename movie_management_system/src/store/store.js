import Vue from 'vue';

import Vuex from 'vuex';
Vue.use(Vuex);


export default new Vuex.Store({
    state:{
        user:{
            phone:'',
            username:'',
            permissions:'',
            password:"",
        },
        address:'',
    },
    mutations:{
       login(state,value){
           state.user=value;
       }
    },
    actions:{

    },
    getters:{

    }
})