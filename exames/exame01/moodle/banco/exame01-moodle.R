## exams ---------------------------------------------------------------------

## load package
library("exams")

## -> lista de vetores dos exercicios
elearn_exam <- c("ex01.Rmd", "ex02.Rmd", "ex03.Rmd", "ex04.Rmd", "ex05.Rmd",
                  "ex06.Rmd", "ex07.Rmd", "ex08.Rmd", "ex09.Rmd", "ex10.Rmd")


## exams2moodle --------------------------------------------------------------
## output: Moodle XML (1 arquivo contendo todos os exames)
## -> para exportar para um sistema Moodle

path_banco <- '/Users/wss/github/icd2023_mestrado/exames/exame01/moodle/banco'
output <- '/Users/wss/github/icd2023_mestrado/exames/exame01/moodle'

## gera exame Moodle com tres replicacoes por questao

set.seed(2023-05-18)
exams2moodle(elearn_exam, n = 3, name = "R-exams")

ex01 <- exams2moodle(questoes_exame,
                      name = path_banco,
                      encoding = "UTF-8",
                      points = 10,
                      dir = output)
exams_metainfo(ex01)

## dica: para checar rapidamente (antes de exportar para Moodle)
## se cada exercicio pode ser convertido para html
## exams2html() pode ser usada
setwd('/Users/wss/github/icd2023_mestrado/exames/exame01/moodle/banco')
exams2html("ex10.Rmd")

