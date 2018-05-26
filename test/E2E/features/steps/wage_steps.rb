wage_page = WagePage.new

Dado("que eu esteja na pagina inicial do aplicativo wage.") do
	wage_page.load
end

Quando("informar no campo de salario mensal o valor {string}.") do |mensalWage|
	wage_page.mensalWageField.set mensalWage
end

Então("no campo de salario anual deve ser apresentado o valor {string}.") do |annualSalaryExpected|
	expect(wage_page.annualSalaryField.value).to have_content(annualSalaryExpected)
end

Então("no campo de salario quinzenal deve ser apresentado o valor {string}.") do |biweekWageExpected|
	expect(wage_page.biweekWageField.value).to have_content(biweekWageExpected)
end

Então("no campo de salario semanal deve ser apresentado o valor {string}.") do |weekWageExpected|
	expect(wage_page.weekWageField.value).to have_content(weekWageExpected)
end

Então("no campo de salario diario deve ser apresentado o valor {string}.") do |dayWageExpected|
	expect(wage_page.dayWageField.value).to have_content(dayWageExpected)
end

Então("no campo de salario por hora deve ser apresentado o valor {string}.") do |hourWageFieldExpected|
	expect(wage_page.hourWageField.value).to have_content(hourWageFieldExpected)
end