<template>
    <div class="main">
        <div class="md-layout md-gutter">
            <md-switch v-model="conf.display.year">Display year</md-switch>
            <md-switch v-model="conf.display.month">Display month</md-switch>
            <md-switch v-model="conf.display.week">Display week</md-switch>
            <md-switch v-model="conf.display.biweek">Display biweek</md-switch>
            <md-switch v-model="conf.display.day">Display day</md-switch>
            <md-switch v-model="conf.display.hour">Display hour</md-switch>
        </div>
        <div class="md-layout md-gutter">
            <div class="md-layout-item">
                <md-field>
                    <label>Tax %</label>
                    <md-input v-on:keyup="updateConf()" id="tax" v-model="conf.tax" min="0" max="100" ></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Weeks per year</label>
                    <md-input v-on:keyup="updateConf()" id="numWeeks" v-model="conf.numWeeks" ></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Hours per week</label>
                    <md-input v-on:keyup="updateConf()" id="numHoursWeek" v-model="conf.numHoursWeek"></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
        </div>
        <div class="md-layout md-gutter" v-if="conf.display.year">
            <div class="md-layout-item">
                 <md-field>
                    <label>Annual salary</label>
                    <md-input v-money="money" v-on:keyup="calculate('year')" id="year" v-model.lazy="year" money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Annual deduction</label>
                    <md-input v-money="money" id="deduction.year"  v-model.lazy="deduction.year"  readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Annual salary (after tax)</label>
                    <md-input v-money="money" id="after.year"  v-model.lazy="after.year" readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
        </div>
        <div class="md-layout md-gutter" v-if="conf.display.month">
            <div class="md-layout-item">
                 <md-field>
                    <label>Monthly salary</label>
                    <md-input v-money="money" v-on:keyup="calculate('month')" id="month" v-model.lazy="month" money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Monthly deduction</label>
                    <md-input v-money="money" id="deduction.month"  v-model.lazy="deduction.month"  readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Monthly salary (after tax)</label>
                    <md-input v-money="money" id="after.month"  v-model.lazy="after.month" readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
        </div>
        <div class="md-layout md-gutter" v-if="conf.display.biweek">
            <div class="md-layout-item">
                 <md-field>
                    <label>Biweekly salary</label>
                    <md-input v-money="money" v-on:keyup="calculate('biweek')" id="biweek" v-model.lazy="biweek" money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Biweekly deduction</label>
                    <md-input v-money="money" id="deduction.biweek"  v-model.lazy="deduction.biweek"  readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Biweekly salary (after tax)</label>
                    <md-input v-money="money" id="after.biweek"  v-model.lazy="after.biweek" readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
        </div>
        <div class="md-layout md-gutter" v-if="conf.display.week">
            <div class="md-layout-item">
                 <md-field>
                    <label>Weekly salary</label>
                    <md-input v-money="money" v-on:keyup="calculate('week')" id="week" v-model.lazy="week" money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Weekly deduction</label>
                    <md-input v-money="money" id="deduction.week"  v-model.lazy="deduction.week"  readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Weekly salary (after tax)</label>
                    <md-input v-money="money" id="after.week"  v-model.lazy="after.week" readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
        </div>
        <div class="md-layout md-gutter" v-if="conf.display.day">
            <div class="md-layout-item">
                 <md-field>
                    <label>Daily salary</label>
                    <md-input v-money="money" v-on:keyup="calculate('day')" id="day" v-model.lazy="day" money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Daily deduction</label>
                    <md-input v-money="money" id="deduction.day"  v-model.lazy="deduction.day"  readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Daily salary (after tax)</label>
                    <md-input v-money="money" id="after.day"  v-model.lazy="after.day" readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
        </div>
        <div class="md-layout md-gutter" v-if="conf.display.hour">
            <div class="md-layout-item">
                 <md-field>
                    <label>Hourly salary</label>
                    <md-input v-money="money" v-on:keyup="calculate('hour')" id="hour" v-model.lazy="hour" money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Hourly deduction</label>
                    <md-input v-money="money" id="deduction.hour"  v-model.lazy="deduction.hour"  readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
            </div>
            <div class="md-layout-item">
                <md-field>
                    <label>Hourly salary (after tax)</label>
                    <md-input v-money="money" id="after.hour"  v-model.lazy="after.hour" readonly money></md-input>
                    <span class="md-helper-text">Helper text</span>
                </md-field>
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
      nul_calcs:0,
      is_busy:0,
      awaiting_to_calc:0,
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
            month:true,
            week:true,
            biweek:true,
            day:true,
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
        this.awaiting_to_calc = true;
        console.log("this.awaiting_to_calc "+this.awaiting_to_calc);
        console.log("this.is_busy "+this.is_busy);
        setInterval(() => {
            if(this.awaiting_to_calc && !this.is_busy){
                this.awaiting_to_calc = false;
                this.is_busy=true;   
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
                this.is_busy=false;        
            }    
        }, 1000);
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
        console.log('calcDeduction');

      return this.calc(wage, this.getTax());
    },
    calcTax: function(wage) {
        console.log('calcTax');
      return this.calc(wage, 1 - this.getTax());
    },
    calc: function(value, ratio) {
      this.nul_calcs++;
      console.log(this.nul_calcs);
      console.log('calc');
      var correctValue = value
        ? parseFloat(value.toString().replace(/[^0-9\\.]+/g, ""))
        : 0;
      return (correctValue * ratio).toFixed(2);
    },
    getTax: function() {
        console.log('getTax');

      return this.conf.tax / 100;
    },
    getInverse:function(value){
        console.log('getTax');
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
