<template>
  <div class="main">
    <section class="container">
      <div class="row">
        <!-- <h1>Salary Calculator</h1> -->
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Annual salary</label>
              
            <input v-money="money" v-on:keyup="calculate('year')" id="year" v-model.lazy="year" type="text" class="form-control" money>
          </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Monthly wage</label>
            <input v-money="money" v-on:keyup="calculate('month')" id="month" v-model.lazy="month" type="text" class="form-control" money>
         </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Biweekly wage</label>
            <input v-money="money" v-on:keyup="calculate('biweek')" id="biweek" v-model.lazy="biweek" type="text" class="form-control" money>
          </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Weekly wage</label>
            <input v-money="money" v-on:keyup="calculate('week')" id="week" v-model.lazy="week" type="text" class="form-control" money>
          </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Daily wage</label>
            <input   v-money="money" v-on:keyup="calculate('day')" id="day" v-model.lazy="day" type="text" class="form-control" money>
          </div>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <div class="form-group">
            <label for="annual">Hourly wage</label>
            <input  v-money="money" v-on:keyup="calculate('hour')" id="hour" v-model.lazy="hour" type="text" class="form-control" money>
          </div>
        </div>
      </div>
    </section>
  </div> 
</template>
<script>
import { VMoney } from "v-money";
export default {
  name: "Main",
  directives: { money: VMoney },
  data() {
    return {
      conf: {
        numWeeks: 52,
        numHoursWeek: 40,
        numYear: 1,
        numMonths: 12,
        numDays: 360,
        numDayWeek: 5
      },
      price: null,
      year: null,
      month: null,
      week: null,
      biweek: null,
      day: null,
      hour: null,
      money: {
        decimal: ".",
        thousands: ",",
        prefix: "$ ",
        suffix: " ",
        precision: 2,
        masked: false /* doesn't work with directive */
      }
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
        case "biweek":
          this.calculateByBiweek();
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
      this.hour = this.calc( this.year, 1 / (this.conf.numWeeks * this.conf.numHoursWeek) );
      this.calculateAllByHour("year");
    },
    calculateByMonth: function() {
      this.hour = this.calc( this.month, 1 / (this.conf.numWeeks / this.conf.numMonths * this.conf.numHoursWeek) );
      this.calculateAllByHour("month");
    },
    calculateByBiweek: function() {
      this.hour = this.calc(this.biweek, 1 / (this.conf.numHoursWeek * 2));
      this.calculateAllByHour("biweek");
    },
    calculateByWeek: function() {
      this.hour = this.calc(this.week, 1 / this.conf.numHoursWeek);
      this.calculateAllByHour("week");
    },
    calculateByDay: function() {
      this.hour = this.calc( this.day, 1 / (this.conf.numHoursWeek / this.conf.numDayWeek) );
      this.calculateAllByHour("day");
    },
    calculateByHour: function() {
      this.calculateAllByHour();
    },
    calculateAllByHour: function(exclude) {
      if (exclude !== "day") {
        this.day = this.calc(this.hour, this.conf.numHoursWeek / 5);
      }
      if (exclude !== "week") {
        this.week = this.calc(this.hour, this.conf.numHoursWeek);
      }
      if (exclude !== "biweek") {
        this.biweek = this.calc(this.hour, this.conf.numHoursWeek * 2);
      }
      if (exclude !== "month") {
        this.month = this.calc(
          this.week,
          this.conf.numWeeks / this.conf.numMonths
        );
      }
      if (exclude !== "year") {
        this.year = this.calc(this.month, this.conf.numMonths);
      }
    },
    calc: function(value, ratio) {
      var correctValue = value
        ? parseFloat(value.replace(/[^0-9\\.]+/g, ""))
        : 0;
      return (correctValue * ratio).toFixed(2);
    }
  }
};
</script>
/*
check: https://www.omnicalculator.com/business/salary-to-hourly
 */
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">

</style>
