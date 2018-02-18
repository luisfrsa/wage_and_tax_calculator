<template>
  <div class="main">
    <section class="container">
      <div class="row">
        <h1>Salary Calculator</h1>
        <div class="col-md-12">
          <div class="form-group">
            <label for="annual">Annual salary</label>
            <input id="annual" v-model="annual" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-12">
          <div class="form-group">
            <label for="annual">Monthly wage</label>
            <input id="annual" v-model="annual" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-12">
          <div class="form-group">
            <label for="annual">Weekly wage</label>
            <input id="annual" v-model="annual" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-12">
          <div class="form-group">
            <label for="annual">Daily wage</label>
            <input id="annual" v-model="annual" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-12">
          <div class="form-group">
            <label for="annual">Hourly wage</label>
            <input id="annual" v-model="annual" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-12">
          <div class="form-group">
            <label for="annual">Hours per week</label>
            <input id="annual" v-model="annual" type="text" class="form-control">
          </div>
        </div>
      </div>
    </section>
  </div>
</template>
<script>
export default {
  name: "Main",
  data() {
    return {
      msg: "Welcome to Your Vue.js App"
    };
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">

</style>
