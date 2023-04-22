
# Descricao ---------------------------------------------------------------

## Disciplina: Introcucao a Ciencia dos Dados                            
## Descricao: Aula 3 em 13/04/2023                                       
## Autor: Washington S. Silva                                                      


# Pacotes -----------------------------------------------------------------

library(tidyverse)
library(gapminder)


# Desafio Aula 1 ----------------------------------------------------------

## Importando o arquivo
ukhp <- read_excel("C:/icd2022/dados_brutos/UKHP.xls",
                   col_types = c("date", "numeric"))
head(ukhp) 
dplyr::glimpse(ukhp)


## grafico de linha
ukhp %>%
  ggplot(aes(x = Month, y = `Average House Price`)) +
  geom_line(color = "#69b3a2") +
  labs(
    title = "Preço Médio de Casas",
    subtitle = "em Libras",
    caption = "Fonte: Brooks (2019)",
    x = "Mês",
    y = "Preço Médio de Casas (Libras)"
  ) +
  theme_minimal



# Desafio 1 Aula 2 --------------------------------------------------------

## inserindo os dados de acesso nos vetores
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

## linkedin excede 10 e facebook menor que 10
linkedin > 10 & facebook < 10

## last esta entre 15 (exclusive) e 20 (inclusive)?
last <- tail(linkedin, 1) # tail(x, n) exibe os 6 ultimos elementos de um objeto
                          # se n = 1, exibe apenas o ultimo elemento do vetor
last
last > 15 & last <= 20



# Desafio 2 Aula 2 --------------------------------------------------------

dados_africa <- gapminder %>%
  filter(continent == "Africa") %>%
  select(lifeExp, country, year)
dados_africa



# Desafio 3 Aula 2 --------------------------------------------------------

## esperanca media de vida por pais
lifexp_pais_maior <- gapminder %>%
  group_by(country) %>%
  summarize(lifeExp_media = mean(lifeExp))
lifexp_pais_maior

## esperanca media de vida mais longa
lifexp_pais_maior <- gapminder %>%
  group_by(country) %>%
  summarize(lifeExp_media = mean(lifeExp)) %>%
  arrange(lifeExp_media) %>%
  head(1)
lifexp_pais_maior

## esperanca media de vida curta
lifexp_pais_menor <- gapminder %>%
  group_by(country) %>%
  summarize(lifeExp_media = mean(lifeExp)) %>%
  arrange(desc(lifeExp_media)) %>%
  head(1)
lifexp_pais_menor



# Desafio 4 Aula 2 --------------------------------------------------------

## 1. Por continente em 2002
lifexp_continentes <- gapminder %>%
  filter(year==2002) %>%
  group_by(continent) %>%
  summarize(lifeExp_media = mean(lifeExp)) %>%
  arrange(desc(lifeExp_media))
lifexp_continentes


## 2. Por paises em 2002
lifexp_paises <- gapminder %>%
  filter(year==2002) %>%
  group_by(country) %>%
  summarize(lifeExp_media = mean(lifeExp)) %>%
  arrange(desc(lifeExp_media))
lifexp_paises




