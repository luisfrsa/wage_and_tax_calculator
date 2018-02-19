<template>
  <div class="main">
    <section class="container">
      <div class="row">
        <!-- <h1>Salary Calculator</h1> -->
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Annual salary</label>
            <input  v-on:keyup="calculate('year')" id="year" v-model="year" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Monthly wage</label>
            <input  v-on:keyup="calculate('month')" id="month" v-model="month" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Weekly wage</label>
            <input v-on:keyup="calculate('week')"  id="week" v-model="week" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Daily wage</label>
            <input  v-on:keyup="calculate('day')" id="day" v-model="day" type="text" class="form-control">
          </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Hourly wage</label>
            <input  v-on:keyup="calculate('hour')" id="hour" v-model="hour" type="text" class="form-control">
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
      conf: {
        numWeeks: 52,
        numHoursWeek: 40,
        numYear:1,
        numMonths:12,
        numDays:360,
      },
      year: null,
      month: null,
      week: null,
      day: null,
      hour: null
    };
  },
  methods: {
    calculate: function(changed) {
      switch (changed) {
        case "year":
          this.calculateByYear();
          break;
        case "month":
          this.calculateByMonth();
          break;
        case "week":
          this.calculateByWeek();
          break;
        case "day":
          this.calculateByDay();
          break;
        case "hour":
          this.calculateByHour();
          break;
      }
    },
    calculateByYear: function() {
      this.month = this.calc(this.year, 12);
      this.week = this.calc(this.year, this.conf.numWeeks);
      this.day = this.calc(this.year, 12);
      this.hour = this.calc(this.year, 12);
    },
    calculateByHour: function() {
      this.year = this.calc(this.hour, 12);
      this.month = this.calc(this.hour, 12);
      this.week = this.calc(this.hour, this.conf.numWeeks);
      this.day = this.calc(this.hour, 12);
    },
    calc: function(value, ratio) {
      return (value*ratio).toFixed(2);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">

</style>
