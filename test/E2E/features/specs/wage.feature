# language: pt
Funcionalidade: Wage teste
# Sendo um usuario
# Possa fazer login no sistema
# Para que eu possa utilizar


Esquema do Cenário: Valida valores ao alterar campo de salario mensal.

Dado que eu esteja na pagina inicial do aplicativo wage.
Quando informar no campo de salario mensal o valor "<mensal>".
Então no campo de salario anual deve ser apresentado o valor "<anual>".
E no campo de salario quinzenal deve ser apresentado o valor "<quinzenal>".
E no campo de salario semanal deve ser apresentado o valor "<semanal>".
E no campo de salario diario deve ser apresentado o valor "<diario>".
E no campo de salario por hora deve ser apresentado o valor "<hora>".

Exemplos: 
| mensal     | anual        | quinzenal    | semanal      | diario      | hora        |
| 10.00      | $ 120.00     | $ 4.62       | $ 2.31       | $ 0.46      | $ 0.06      |
| 1000.00    | $ 12,000.00  | $ 461.54     | $ 230.77     | $ 46.15     | $ 5.77      |