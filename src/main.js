// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
require('../node_modules/bootstrap-sass/assets/stylesheets/_bootstrap.scss')

import Vue from 'vue'
import App from './App'
import router from './router'
import VueCurrencyFilter from 'vue-currency-filter'

Vue.config.productionTip = false

Vue.use(VueCurrencyFilter,
  {
    symbol: '$',
    thousandsSeparator: ',',
    fractionCount: 2,
    fractionSeparator: '.',
    symbolPosition: 'front',
    symbolSpacing: true
  });

Vue.directive('money', {
  twoWay: true, // this transformation applies back to the vm
  bind: function () {
    console.log(Vue);
    this.handler = function () {
      this.set(this.el.value.toFixed(2));
    }.bind(this);
    this.el.addEventListener('input', this.handler);
  },
  unbind: function () {
    this.el.removeEventListener('input', this.handler);
  }
});
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
