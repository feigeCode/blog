import Vue from 'vue'
import Router from 'vue-router'
import User from '../views/user'
import Login from '../views/login'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/user',
      name: 'user',
      component: User
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    }
  ]
})
