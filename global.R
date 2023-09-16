
#===============================================================================#
# 1.0 CARREGAMENTO DE PACOTES                                                   ----
# 1.1 Pacotes de Interface Gráfica do Dashboard                                 ---- 

library(shiny)                                                                  # Criação de aplicativos web interativos em R.
library(shinydashboard)                                                         # Fornecer layouts e componentes específicos para criar dashboards em Shiny.
library(shinydashboardPlus)                                                     # Extensão do shinydashboard que adiciona recursos extras.
library(shinyWidgets)                                                           # Widgets adicionais e personalizados para aplicativos Shiny.
library(shinycssloaders)                                                        # Indicadores de carregamento e animações CSS para aplicativos Shiny.
library(shinyjs)                                                                # Adição de interações JavaScript em aplicativos Shiny.
library(shinyauthr)
library(shinyLP)
library(shinybusy)
library(shinyBS)
library(htmltools)                                                              # Criação e manipulação de elementos HTML em R.
library(htmlwidgets)                                                            # Criação e manipulação de widgets HTML em R.
#===============================================================================#


#===============================================================================#
# 1.2 Pacotes de Leitura de Dados                                               ----

library(readr)                                                                  # Funções eficientes para ler dados tabulares (CSV, TSV, etc.) em R.
library(readxl)                                                                 # Leitura de dados em formatos do Excel (XLS e XLSX) em R.
library(openxlsx)                                                               # Carrega a biblioteca openxlsx para manipulação de arquivos Excel (.xlsx)
library(stringr)
library(stringi)
#library(xlsx)
#===============================================================================#

#===============================================================================#
# 1.3 Pacotes Relacionados a Geolocalização/Mapas                               ----

library(geobr)                                                                  # Acesso a dados geoespaciais do Brasil.
library(sf)                                                                     # Suporte a dados geoespaciais em formato Simple Features (padrão da indústria) em R.
library(leaflet)
library(raster)
#library(tmap)
#library(tmaptools)
library(rgdal)
#library(leaflet.extras)
library(leaflet.providers)
#library(leaflet.minicharts)
#library(ggmap)
#library(maps)
#library(ggtext)
#library(BETS)
library(RColorBrewer)
library(ggspatial)
library(curl)
library(lwgeom)
#===============================================================================#

#===============================================================================#
#1.4 Pacotes p/ Visualizações Gráficas                                          ----

library(ggplot2)                                                                # Criação de gráficos estatísticos em R.
library(ggthemes)                                                               # Temas adicionais para personalizar gráficos criados com ggplot2.
library(gganimate)
#library(gplots)
library(plotly)                                                                 # Criação de gráficos interativos e animados.
library(highcharter)                                                            # Interface em R para a biblioteca Highcharts de visualizações interativas em JavaScript.
library(echarts4r)                                                              # Criação de gráficos interativos usando a biblioteca ECharts.
library(ggcorrplot)                                                            # Visualização de matrizes de correlação usando ggplot2.
#library(geojsonsf)
#library(geojsonio)
#library(fmsb)
#ibrary(ggiraph)
#library(ggiraphExtra)
#library(viridis)
#library(radarchart)
#===============================================================================#

#===============================================================================#
# 1.5 Pacotes relacionados a análise e manipulação de dados                     ----

library(tidyverse)   #tidyverse_update()                                        # Conjunto de pacotes que facilitam a manipulação e transformação de dados.
library(tidyr)
library(dplyr)
library(magrittr)
library(purrr)
library(janitor)                                                                # Limpeza e formatação de dados.
library(waiter)
library(glue)
library(utf8)
library(tippy)
#===============================================================================#

#===============================================================================#
# 1.6 Pacotes relacionados a Craiação de Tabelas   

library(data.table)                                                             # Estrutura de dados eficiente para manipulação de grandes conjuntos de dados.
library(reactable)                                                              # Tabelas interativas e filtráveis.
library(DT)                                                                     # Tabelas interativas e filtráveis com recursos avançados.
library(reactablefmtr)
library(kableExtra)
library(rmarkdown)
library(sparkline)
library(kableExtra)
library(knitr)
library(DiagrammeR)                                                             # Criação de diagramas e gráficos em R.
library(crosstalk)
library(DescTools)
#library(mice)
#===============================================================================#


#===============================================================================#
# 1.7 Pacotes relacionados a recursos e utilitários                             ----

library(rsconnect)                                                              # Funcionalidades para implantar aplicativos Shiny em um servidor.
library(BAMMtools)                                                              # Ferramentas para análise de diversificação evolutiva usando modelos BAMM.
library(classInt)                                                               # Funções para classificação de dados em classes ou intervalos.
library(htmltools)
#library(fontawesome)
#===============================================================================#



# Carregamento de Dados:
load("GlobalData.RData")



#===============================================================================#
# 2.0 FUNÇÕES EM JAVA SCRIPT                                                    ----
# 2.1 Função em java Script para Separado de milhar e decimal                   ----
formatar_numero_br <- function(serie) {
  htmlwidgets::JS(
    glue::glue(
      "function(params) {return Intl.NumberFormat('pt-BR', { style: 'decimal'}).format(params.value[{{serie}}]);}",
      .open = "{{",
      .close = "}}"
    )
  )
}
#===============================================================================#


#===============================================================================#
#2.2 Função para Formatar Lengenda em leaflet                                   ----

labelFormat_decimal <- function (prefix = "", suffix = "", between = " &ndash; ", digits = 3,
                                 big.mark = ",", transform = identity, decimal.mark = "."){
  formatNum <- function(x) {
    format(round(transform(x), digits), trim = TRUE, scientific = FALSE,
           big.mark = big.mark, decimal.mark = decimal.mark)
  }
  function(type, ...) {
    switch(type, numeric = (function(cuts) {
      paste0(prefix, formatNum(cuts), suffix)
    })(...), bin = (function(cuts) {
      n <- length(cuts)
      paste0(prefix, formatNum(cuts[-n]), between, formatNum(cuts[-1]),
             suffix)
    })(...), quantile = (function(cuts, p) {
      n <- length(cuts)
      p <- paste0(round(p * 100), "%")
      cuts <- paste0(formatNum(cuts[-n]), between, formatNum(cuts[-1]))
      paste0("<span title=\"", cuts, "\">", prefix, p[-n],
             between, p[-1], suffix, "</span>")
    })(...), factor = (function(cuts) {
      paste0(prefix, as.character(transform(cuts)), suffix)
    })(...))
  }
}
#===============================================================================#


#===============================================================================#
# 3.0 CRIAÇÃO DE MÓDULOS                                                        ----
# 3.1 Carregando Módulos                                                        ----

source("modulos/mod_download.R", encoding="UTF-8")
source("modulos/mod_microdados.R", encoding="UTF-8")
source("modulos/mod_socioeconomico.R", encoding="UTF-8")
source("modulos/mod_codicao_vitima.R", encoding="UTF-8")
source("modulos/mod_ocorrencias.R", encoding="UTF-8")
source("modulos/mod_custo_hospitalar.R", encoding="UTF-8")
source("modulos/mod_localizacao.R", encoding="UTF-8")
source("modulos/mod_anuario.R", encoding="UTF-8")
#===============================================================================#



















