// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
require('../node_modules/bootstrap-sass/assets/stylesheets/_bootstrap.scss')
import Vue from 'vue'
import VueMaterial from 'vue-material'
import 'vue-material/dist/vue-material.min.css'

import App from './App';
import router from './router';
// import mask from './directives/Mask.Directive';

Vue.config.productionTip = false

Vue.use(VueMaterial)

new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
