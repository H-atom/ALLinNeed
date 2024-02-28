import Vue from "vue";
import vueRouter from "vue-router"

Vue.use(vueRouter)

export default new vueRouter({
    mode:"history",
    routes:[
        {
            path:"/",
            redirect:"/contextBody"
        },
        {
            path:"/contextBody",
            component:()=>import("@/components/contextBody"),
        },
        {
            path:"/cinemaBody",
            component:()=>import("@/components/cinemaBody")
        },
        {
            path:"/movieBody",
            component:()=>import("@/components/movieBody"),
            // children:[
            //     {   path:"chooseSeat",
            //         component:()=>import("@/components/chooseSeatBody")
            //     }
            // ]
        },
        {
            path:"/chooseSeatBody",
            component:()=>import("@/components/chooseSeatBody")
        },
        {
            path:"/managerView",
            component:()=>import("@/components/managerView")
        },
        {
            path:'/customerView',
            component:()=>import("@/components/customerView")
        }
    ],
})