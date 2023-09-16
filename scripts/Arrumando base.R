# Este código em R realiza várias operações de leitura, 
# manipulação e transformação de dados. 
# Vou comentar cada parte do código para explicar o que está acontecendo:
#   
# 1. **Carregando bibliotecas e dados**:
# - As bibliotecas `readxl` e `dplyr` são carregadas.
# - Os dados dos arquivos "Pareamento_Limpo.xls" e "MORTOS_SEGUP_2016_2022.xls" 
# são lidos e armazenados nas variáveis `Pareamento_Limpo` e 
# `MORTOS_SEGUP_2016_2022`, respectivamente.
# 
# 2. **Criando variáveis para diferentes categorias**:
# - O código cria várias variáveis, como `Sexo`, `Faixa_Etaria`, 
# `Raça`, `Estado_Civil`, `Escolaridade`, `Drogas`, `Alcool`, `Condição_Vitima`, 
# `Veículo_Vitima`, `Tipo_de_Acidente`, `Turno_Obito`, `Local_Obito`, `Dia`, `Meses`, 
# `Ano`, e `Idade`, cada uma representando uma categoria de dados.
# - Para cada categoria, os dados são agrupados, resumidos, 
# completados com valores ausentes e renomeados de acordo com a categoria.
# 
# 3. **Transformação de variáveis categóricas**:
# - Algumas variáveis categóricas, como `Turno Obito`, 
# `Dia` e `Meses`, são reordenadas e transformadas em fatores.
# 
# 4. **Criação da variável `mortos_estado`**:
#   - A variável `mortos_estado` é criada a partir da variável 
# `MORTOS_SEGUP_2016_2022`, usando a função `pivot_longer` para converter 
# as colunas que começam com "20" em uma coluna "Ano" e outra coluna "Valor".
# 
# 5. **Concatenação de dados**:
# - As variáveis criadas anteriormente são concatenadas em um único 
# conjunto de dados chamado `Pareamento_Limpo_db`.
# 
# 6. **Remoção de variáveis temporárias**:
# - Variáveis temporárias criadas durante o processo 
# são removidas para economizar memória.
# 
# 7. **Carregamento de bases separadas**:
# - São carregadas várias bases de dados adicionais a partir de arquivos RDS, 
# como `base_01`, `geopa`, `mortos_estado`, `ascidentes` e `bairros_geo`.
# 
# 8. **Transformação de coordenadas (opcional)**:
# - Há comentários sobre a transformação de coordenadas usando a 
# função `st_transform`, mas essa parte está atualmente comentada (desativada).
# 
# Em resumo, este código realiza uma série de operações de preparação de dados, 
# incluindo a leitura de várias fontes de dados, a criação de variáveis para 
# diferentes categorias, a transformação de variáveis categóricas e a 
# concatenação de todos os dados em um único conjunto. Também há menções
# a transformações de coordenadas espaciais, 
# que estão atualmente desativadas (comentadas).






#Carregando dados
library(readxl)
Pareamento_Limpo <- read_excel("data/Pareamento_Limpo.xls")
MORTOS_SEGUP_2016_2022 <- read_excel("data/MORTOS_SEGUP_2016_2022.xls", 
                                 sheet = "Plan2")

Sexo <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,Genero) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,Genero, fill = list(total = 0)) %>% 
  rename(Categoria = Genero) %>% mutate(Variavel = "Sexo")

Faixa_Etaria <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,`Faixa Etária`) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,`Faixa Etária`, fill = list(total = 0)) %>% 
  rename(Categoria = `Faixa Etária`) %>% mutate(Variavel = "Faixa Etária")

Raça <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,Raça) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,Raça, fill = list(total = 0)) %>% 
  rename(Categoria = Raça) %>% mutate(Variavel = "Raça")

Estado_Civil <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,`Estado Civil`) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,`Estado Civil`, fill = list(total = 0)) %>% 
  rename(Categoria = `Estado Civil`) %>% mutate(Variavel = "Estado Civil")

Escolaridade <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,Escolaridade) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,Escolaridade, fill = list(total = 0)) %>% 
  rename(Categoria = Escolaridade) %>% mutate(Variavel = "Escolaridade")

Drogas <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,Drogas) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,Drogas, fill = list(total = 0)) %>% 
  rename(Categoria = Drogas) %>% mutate(Variavel = "Drogas")

Drogas$Valor[is.na(Drogas$Valor)] <- 0
Drogas <- na.omit(Drogas)

Alcool <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,Alcool) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,Alcool, fill = list(total = 0)) %>% 
  rename(Categoria = Alcool) %>% mutate(Variavel = "Alcool")

Alcool$Valor[is.na(Alcool$Valor)] <- 0
Alcool <- na.omit(Alcool)

Condição_Vitima <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,`Condição Vitima`) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,`Condição Vitima`, fill = list(total = 0)) %>% 
  rename(Categoria = `Condição Vitima`) %>% mutate(Variavel = "Condição da Vítima")

Veículo_Vitima <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,`Veículo Vitima`) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,`Veículo Vitima`, fill = list(total = 0)) %>% 
  rename(Categoria = `Veículo Vitima`) %>% mutate(Variavel = "Veículo Vítima")

Tipo_de_Acidente <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,`Tipo de Acidente`) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,`Tipo de Acidente`, fill = list(total = 0)) %>% 
  rename(Categoria = `Tipo de Acidente`) %>% mutate(Variavel = "Tipo de Acidente")


Pareamento_Limpo$`Turno Obito` <- Pareamento_Limpo$`Turno Obito` %>% as_factor() %>% lvls_reorder(c(2,1,4,3))
Turno_Obito <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,`Turno Obito`) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,`Turno Obito`, fill = list(total = 0)) %>% 
  rename(Categoria = `Turno Obito`) %>% mutate(Variavel = "Turno Obito")

Local_Obito <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,`Local Obito`) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,`Local Obito`, fill = list(total = 0)) %>% 
  rename(Categoria = `Local Obito`) %>% mutate(Variavel = "Local Obito")


Pareamento_Limpo$Dia <- Pareamento_Limpo$Dia %>% as_factor() %>% lvls_reorder(c(2,6,4,5,7,1,3))
Dia <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,Dia) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,Dia, fill = list(total = 0)) %>% 
  rename(Categoria = Dia) %>% mutate(Variavel = "Dia")

Pareamento_Limpo$Meses  <-  Pareamento_Limpo$Meses %>% as_factor() %>% lvls_reorder(c(10,11,1,3,9,5,4,2,12,8,7,6))

Meses <- Pareamento_Limpo %>%
  group_by(Municípios,Ano,Meses) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano,Meses, fill = list(total = 0)) %>% 
  rename(Categoria = Meses) %>% mutate(Variavel = "Meses")


Ano <- Pareamento_Limpo %>%
  group_by(Municípios,Ano) %>%
  summarize(Valor = n(), .groups = 'drop') %>%
  complete(Municípios,Ano, fill = list(total = 0)) %>% 
  mutate(Categoria = "-",Variavel = "Ano")  %>% 
  select(Municípios,Ano,Categoria,Valor,Variavel)



Idade <- Pareamento_Limpo %>% select(Municípios,Ano,Idade)
Idade <- Idade %>% mutate(Categoria = "-",Variavel = "Idade")
Idade <- Idade %>% select(Municípios,Ano,Categoria,Idade,Variavel) %>% rename(Valor = Idade)


Pareamento_Limpo_db <- rbind(Idade,
                             Meses,
                             Dia,
                             Ano,
                             Local_Obito,
                             Turno_Obito,
                             Tipo_de_Acidente,
                             Veículo_Vitima,
                             Condição_Vitima,
                             Alcool,
                             Drogas,
                             Escolaridade,
                             Estado_Civil,
                             Raça,
                             Faixa_Etaria,
                             Sexo)

#Acidentes Bairro de belém
ascidentes <- read_excel("data/ACIDENTES_BAIRRO_BELÉM_2016_2019.xls",sheet = "Arrumados")
ascidentes <- ascidentes %>% pivot_longer(!Bairros,names_to = "Ano",values_to = "Valor")
write_rds(ascidentes,"ascidentes.rds")

#Mortos Estado do Pará
mortos_estado <- MORTOS_SEGUP_2016_2022 %>% 
  pivot_longer(cols = starts_with("20"), names_to = "Ano",values_to = "Valor") 



rm(
  Idade,
  Meses,
  Dia,
  Ano,
  Local_Obito,
  Turno_Obito,
  Tipo_de_Acidente,
  Veículo_Vitima,
  Condição_Vitima,
  Alcool,
  Drogas,
  Escolaridade,
  Estado_Civil,
  Raça,
  Faixa_Etaria,
  Sexo,
  MORTOS_SEGUP_2016_2022)



#Bases Separadas
geopa <- read_rds("geopa.rds")
mortos_estado <- read_rds("mortos_estado.rds")
ascidentes <- read_rds("ascidentes.rds")
bairros_geo <- read_rds("bairros_geo.rds")


# geopa <- st_transform(geopa, crs = st_crs("+proj=longlat +datum=WGS84"))
# write_rds(geopa,"geopa.rds")
# bairros_geo <- st_transform(bairros_geo, crs = st_crs("+proj=longlat +datum=WGS84"))
# write_rds(bairros_geo,"bairros_geo.rds")
