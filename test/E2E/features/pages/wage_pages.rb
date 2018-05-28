require 'site_prism'


class WagePage < SitePrism::Page
    set_url "/#/"
    element :annualSalaryField, '#year'
    element :mensalWageField, '#month'
    element :biweekWageField, '#biweek'
    element :weekWageField, '#week'
    element :dayWageField, '#day'
    element :hourWageField, '#hour'
    
end