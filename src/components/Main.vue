<template>
    <div class="main">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
<md-switch v-model="conf.display.year">Display year</md-switch>
<md-switch v-model="conf.display.month">Display month</md-switch>
<md-switch v-model="conf.display.week">Display week</md-switch>
<md-switch v-model="conf.display.biweek">Display biweek</md-switch>
<md-switch v-model="conf.display.day">Display day</md-switch>
<md-switch v-model="conf.display.hour">Display hour</md-switch>
                
                
                
                

                  <md-field>
                    <label>Type here!</label>
                    <md-input v-model="type"></md-input>
                    <span class="md-helper-text">Helper text</span>
                    </md-field>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="tax">Tax %</label>
                                <input  v-on:keyup="updateConf()" id="tax" v-model="conf.tax" type="text" class="form-control" min="0" max="100" >
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="numWeeks">Weeks per year</label>
                                <input  v-on:keyup="updateConf()" id="numWeeks" v-model="conf.numWeeks" type="text" pack class="form-control" min="0" max="100" >
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="numWeeks">Hours per week</label>
                                <input  v-on:keyup="updateConf()" id="numHoursWeek" v-model="conf.numHoursWeek" type="text" class="form-control" min="0" max="100" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <section>
                        <div class="row">
                            <div class="col-md-12" v-if="conf.display.year">
                                <div class="form-group">
                                    <label for="annual">Annual salary</label>
                                    <input v-money="money" v-on:keyup="calculate('year')" id="year" v-model.lazy="year" type="text" class="form-control" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.month">
                                <div class="form-group">
                                    <label for="annual">Monthly wage</label>
                                    <input v-money="money" v-on:keyup="calculate('month')" id="month" v-model.lazy="month" type="text" class="form-control" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.week">
                                <div class="form-group">
                                    <label for="annual">Biweekly wage</label>
                                    <input v-money="money" v-on:keyup="calculate('biweek')" id="biweek" v-model.lazy="biweek" type="text" class="form-control" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.biweek">
                                <div class="form-group">
                                    <label for="annual">Weekly wage</label>
                                    <input v-money="money" v-on:keyup="calculate('week')" id="week" v-model.lazy="week" type="text" class="form-control" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.day">
                                <div class="form-group">
                                    <label for="annual">Daily wage</label>
                                    <input   v-money="money" v-on:keyup="calculate('day')" id="day" v-model.lazy="day" type="text" class="form-control" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.hour">
                                <div class="form-group">
                                    <label for="annual">Hourly wage</label>
                                    <input  v-money="money" v-on:keyup="calculate('hour')" id="hour" v-model.lazy="hour" type="text" class="form-control" money>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-md-4">
                    <section>
                        <div class="row">
                            <div class="col-md-12" v-if="conf.display.year">
                                <div class="form-group">
                                    <label for="annual">Annual deduction</label>
                                    <input v-money="money" id="deduction.year"  v-model.lazy="deduction.year"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.month">
                                <div class="form-group">
                                    <label for="annual">Monthly deduction</label>
                                    <input v-money="money" id="deduction.month"  v-model.lazy="deduction.month"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.week">
                                <div class="form-group">
                                    <label for="annual">Biweekly deduction</label>
                                    <input v-money="money"  id="deduction.biweek"  v-model.lazy="deduction.biweek"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.biweek">
                                <div class="form-group">
                                    <label for="annual">Weekly deduction</label>
                                    <input v-money="money"  id="deduction.week"  v-model.lazy="deduction.week"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.day">
                                <div class="form-group">
                                    <label for="annual">Daily deduction</label>
                                    <input   v-money="money" id="deduction.day"  v-model.lazy="deduction.day"  type="text" class="form-control"  readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.hour">
                                <div class="form-group">
                                    <label for="annual">Hourly deduction</label>
                                    <input  v-money="money"  id="deduction.hour"  v-model.lazy="deduction.hour"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-md-4">
                    <section>
                        <div class="row">
                            <div class="col-md-12" v-if="conf.display.year">
                                <div class="form-group">
                                    <label for="annual">Annual salary (after tax)</label>
                                    <input v-money="money" id="after.year"  v-model.lazy="after.year"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.month">
                                <div class="form-group">
                                    <label for="annual">Monthly wage (after tax)</label>
                                    <input v-money="money" id="after.month"  v-model.lazy="after.month"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.week">
                                <div class="form-group">
                                    <label for="annual">Biweekly wage (after tax)</label>
                                    <input v-money="money"  id="after.biweek"  v-model.lazy="after.biweek"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.biweek">
                                <div class="form-group">
                                    <label for="annual">Weekly wage (after tax)</label>
                                    <input v-money="money"  id="after.week"  v-model.lazy="after.week"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.day">
                                <div class="form-group">
                                    <label for="annual">Daily wage (after tax)</label>
                                    <input   v-money="money" id="after.day"  v-model.lazy="after.day"  type="text" class="form-control"  readonly="true" money>
                                </div>
                            </div>
                            <div class="col-md-12" v-if="conf.display.hour">
                                <div class="form-group">
                                    <label for="annual">Hourly wage (after tax)</label>
                                    <input  v-money="money"  id="after.hour"  v-model.lazy="after.hour"  type="text" class="form-control" readonly="true" money>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>

        </div>
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
        numDayWeek: 5,
        tax: 25,
        display:{
            year:true,
            month:false,
            week:false,
            biweek:false,
            day:false,
            hour:true,
        }
      },
      year: null,
      month: null,
      week: null,
      biweek: null,
      day: null,
      hour: null,
      after: {
        year_after: null,
        month_after: null,
        week_after: null,
        biweek_after: null,
        day_after: null,
        hour_after: null,
        year_after: null
      },
      deduction: {
        month_after: null,
        week_after: null,
        biweek_after: null,
        day_after: null,
        hour_after: null
      },
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
    updateConf: function() {
      this.calculateByHour();
    },
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
          this.hour = this.hour || 0;
          this.calculateByHour();
          break;
      }
    },
    calculateByYear: function() {
      this.calculateAllByYear();
    },
    calculateByMonth: function() {
      this.year = this.calc( this.month, this.conf.numMonths);
      this.calculateAllByYear("month");
    },
    calculateByBiweek: function() {
      this.year = this.calc(this.biweek, this.conf.numWeeks / 2);
      this.calculateAllByYear("biweek");
    },
    calculateByWeek: function() {
      this.year = this.calc(this.week, this.conf.numWeeks);
      this.calculateAllByYear("week");
    },
    calculateByDay: function() {
      this.year = this.calc( this.day,  this.conf.numDayWeek * this.conf.numWeeks);
      this.calculateAllByYear("day");
    },
    calculateByHour: function() {
      this.year = this.calc( this.hour, this.conf.numHoursWeek  * this.conf.numWeeks);
      this.calculateAllByYear("hour");
    },
    calculateAllByYear: function(exclude) {
      if (exclude !== "hour") {
        this.hour = this.calc(this.year, this.getInverse(this.conf.numWeeks* this.conf.numHoursWeek ));
      }
      if (exclude !== "day") {
        this.day = this.calc(this.year, this.getInverse(this.conf.numWeeks*this.conf.numDayWeek));
      }
      if (exclude !== "week") {
        this.week = this.calc(this.year, this.getInverse(this.conf.numWeeks));
      }
      if (exclude !== "biweek") {
        this.biweek = this.calc(this.year, this.getInverse(this.conf.numWeeks / 2));
      }
      if (exclude !== "month") {
        this.month = this.calc( this.year, this.getInverse(this.conf.numMonths));
      }
      this.calculateAllTaxes();
      this.calculateAllDeductions();
    },
    calculateAllDeductions() {
      this.deduction.hour = this.calcDeduction(this.hour);
      this.deduction.day = this.calcDeduction(this.day);
      this.deduction.week = this.calcDeduction(this.week);
      this.deduction.biweek = this.calcDeduction(this.biweek);
      this.deduction.month = this.calcDeduction(this.month);
      this.deduction.year = this.calcDeduction(this.year);
    },
    calculateAllTaxes() {
      this.after.hour = this.calcTax(this.hour);
      this.after.day = this.calcTax(this.day);
      this.after.week = this.calcTax(this.week);
      this.after.biweek = this.calcTax(this.biweek);
      this.after.month = this.calcTax(this.month);
      this.after.year = this.calcTax(this.year);
    },
    calcDeduction: function(wage) {
      return this.calc(wage, this.getTax());
    },
    calcTax: function(wage) {
      return this.calc(wage, 1 - this.getTax());
    },
    calc: function(value, ratio) {
      var correctValue = value
        ? parseFloat(value.toString().replace(/[^0-9\\.]+/g, ""))
        : 0;
      return (correctValue * ratio).toFixed(2);
    },
    getTax: function() {
      return this.conf.tax / 100;
    },
    getInverse:function(value){
        return 1 / value;
    }
  }
};
</script>
/*
check: https://www.omnicalculator.com/business/salary-to-hourly
 */
<style scoped lang="scss">

</style>
