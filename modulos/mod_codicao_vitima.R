
#===============================================================================
#MÓDULO CONDIÇÃO DA VÍTIMA                                                      ----

cond_vitima_ui <- function(id) {
  fluidPage(
    panel(
##Controle                                                                     ----
      tags$div(
        style = "position:relative; 
        float:left; margin-right:10px; width: 9%;",
#Selecionar                                                                    ----
        pickerInput(
          inputId = NS(id, "ano"),
          label = "ANO",
          choices = sort(unique(Pareamento_Limpo_db$Ano), decreasing = TRUE),
          width = "100px"
        )
      ),
      tags$div(
        style = "position:relative; 
        float:left; margin-right:30px; width: 9%;",
#Select Município                                                              ----
        pickerInput(
          inputId = NS(id,"muni"),
          label = "MUNICÍPIO",
          #choices = base_01$Municípios %>% unique(),
          choices = Pareamento_Limpo_db$Municípios %>% unique(),
          width = "200px"
        )
      )
    ),
    fluidRow(

#===============================================================================
#Gráfico de Barras - Condição da Vítima                                         ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt1")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        echarts4rOutput(NS(id, "graf1")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
        tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d1")) 
        )
        
    ),

#===============================================================================
#Gráfico de Barras - Tipos de Acidentes                                         ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt2")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        echarts4rOutput(NS(id, "graf2")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d2")) 
      )
    ),

#===============================================================================
#Tabela - Condição da Vítima                                                    ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt1_1")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        reactableOutput(NS(id, "tab1")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d3")) 
      )
      
    ),

#===============================================================================
#Tabela - Tipos de Acidentes                                                    ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt2_1")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        reactableOutput(NS(id, "tab2")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d4")) 
      )
      
    ),

#===============================================================================
#Gráfico de Barras - Tipos de Veículos                                          ----
    box(
      width = 12,
      title = textOutput(NS(id,"txt3")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
       echarts4rOutput(NS(id, "graf3")),
       type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d5")) 
      )
      
    ),

#===============================================================================
#Tabela - Tipos de Veículos                                                     ----
    box(
      width = 12,
      title = textOutput(NS(id,"txt3_1")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        reactableOutput(NS(id, "tab3")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d6")) 
      )
      
    ),

#===============================================================================
#Gráfico de Barras - Efeito de Drogas                                           ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt4")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        echarts4rOutput(NS(id, "graf4")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d7")) 
      )
      
    ),
#Gráfico de Barras - Efeito de Álcool                                           ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt5")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        echarts4rOutput(NS(id, "graf5")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d8")) 
      )
      
    ),

#===============================================================================
#Tabela - Efeito de Drogas                                                      ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt4_1")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        reactableOutput(NS(id, "tab4")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d9")) 
      )
      
    ),

#===============================================================================
#Tabela - Efeito de Álcool                                                      ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt5_1")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        reactableOutput(NS(id, "tab5")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d10")) 
      )
      
    )
    
  ))
}
#===============================================================================

#Função do Modulo Servidor                                                      ----

cond_vitima_Server <- function(id) {
  moduleServer(id, function(input, output, session) {

    
#Gráfico de Barras - Condição da Vitima                                         ----
    
output$txt1 <- renderText({
  paste0("Gráfico 01- Condição da Vítima no Município  de  ",input$muni," - ",input$ano)})
output$graf1 <- renderEcharts4r({
  x <- Pareamento_Limpo_db %>% 
    filter(Variavel =="Condição da Vítima", Ano == input$ano,  Municípios == input$muni)
  x %>% 
    e_charts(Categoria) %>%
    e_bar(serie = Valor,
          color = "blue",
          name = "Natureza da Vítima",
          legend = FALSE,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = TRUE,
          itemStyle = list (barBorderRadius =  5)) %>%
    e_labels(fontWeight = "bold",) %>%
    e_x_axis(name = "Condição da Vítima",
             axisLabel = list(show=TRUE,
                              fontSize=11,
                              interval=0,
                              rotate = 0,
                              formatter = JS("function(value) { return value.split(' ').join('\\n'); }")
                              ),
          
             nameLocation = "middle",
             nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)) %>%
    e_y_axis(name = "Quantidade",
             nameTextStyle = list(fontWeight = "bold", fontSize = 14),
             scale = TRUE,
             axisLabel = list(
             formatter = htmlwidgets::JS("
             function (value, index) {
             return value.toLocaleString('pt-BR', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
              }
            ")
          )
        ) %>%
        e_locale("pt-Br") %>%
        e_grid(show = T) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
    e_toolbox_feature(feature = "saveAsImage") %>%
    e_toolbox_feature(feature = "dataZoom") %>%
    e_toolbox_feature(feature = "dataView") 
  #%>% e_theme("blue")
  #%>% e_flip_coords()
    })

#===============================================================================
#Tipos de Acidentes----
output$txt2 <- renderText({
      paste0("Gráfico 02- Tipo de Acidente no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf2 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% 
        filter(Variavel =="Tipo de Acidente", Ano == input$ano,  Municípios == input$muni)
      x %>% e_charts(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "red",
          name = "Natureza do Acidente",
          legend = FALSE,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = TRUE,
          itemStyle = list (barBorderRadius =  5)
        ) %>%
        e_labels(
          fontWeight = "bold",
        ) %>% 
        e_x_axis(
          name = "Tipo de Acidente",
          axisLabel = list(show = T,fontSize = 11),
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)
        ) %>%
        e_y_axis(
          name = "Quantidade",
          nameTextStyle = list(fontWeight = "bold", fontSize = 14),
          scale = T,
          axisLabel = list(
            formatter = htmlwidgets::JS("
              function (value, index) {
              return value.toLocaleString('pt-BR', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
              }
            ")
          )
        ) %>%
        e_locale("pt-Br") %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView")
      #%>% e_theme("")
      #%>% e_flip_coords()
    })

#===============================================================================
#Tabela -  Condição da Vitima                                                   ----
    output$txt1_1 <- renderText({
      paste0("Tabela - Condição da Vítima por Município em ",input$ano)
    })
    output$tab1 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Condição da Vítima", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>% 
        reactable(
          defaultPageSize = 10,
          filterable = FALSE,
          searchable = TRUE,
          #selection = "multiple",
          wrap = FALSE,
          striped = TRUE,
          highlight = TRUE,
          bordered = TRUE,
          borderless = TRUE,
          compact = TRUE,
          outlined = TRUE,
          resizable = TRUE,
          showSortable = TRUE,
          showPageSizeOptions = TRUE, 
          pagination = FALSE,
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })

#===============================================================================
#Tabela -  Tipos de Acidentes                                                   ----
    output$txt2_1 <- renderText({
      paste0("Tabela - Tipo de Acidente por Município em ",input$ano)
    })
    output$tab2 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Tipo de Acidente", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>% 
        reactable(
          defaultPageSize = 10,
          filterable = FALSE,
          searchable = TRUE,
          #selection = "multiple",
          wrap = FALSE,
          striped = TRUE,
          highlight = TRUE,
          bordered = TRUE,
          borderless = TRUE,
          compact = TRUE,
          outlined = TRUE,
          resizable = TRUE,
          showSortable = TRUE,
          showPageSizeOptions = TRUE, 
          pagination = FALSE,
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",width = 150,
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })
#===============================================================================

#Gráfico de Barras - Tipos de Veículos                                          ----
output$txt3 <- renderText({
  paste0("Gráfico - Tipo de Veículo no Município  de  ",input$muni," - ",input$ano)
  })
    output$graf3 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% 
        filter(Variavel =="Veículo Vítima", Ano == input$ano,  Municípios == input$muni)
      x %>% e_charts(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "blue",
          name = "Tipos de Veículos",
          legend = FALSE,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = TRUE,
          barWidth = "45%",    
          itemStyle = list (barBorderRadius =  5)
        ) %>%
        e_labels(
          fontWeight = "bold",
        ) %>%
        e_x_axis(
          name = "Tipos de Veículos",
          axisLabel = list(show = T,fontSize = 11),
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)
        ) %>%
        e_y_axis(
          name = "Quantidade",
          nameTextStyle = list(fontWeight = "bold", fontSize = 14),
          scale = TRUE,
          axisLabel = list(
            formatter = htmlwidgets::JS("
              function (value, index) {
              return value.toLocaleString('pt-BR', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
              }
            ")
          )
        ) %>%
        e_locale("pt-Br") %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView")
      #%>% e_flip_coords()
    })
    
#===============================================================================
#Tabela -  Tipos de Veículos                                                    ----
    output$txt3_1 <- renderText({
      paste0("Tabela - Tipo de Veículo por Município em ",input$ano)
    })
    output$tab3 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Veículo Vítima", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>% 
        reactable(
          defaultPageSize = 10,
          filterable = FALSE,
          searchable = TRUE,
          #selection = "multiple",
          wrap = FALSE,
          striped = TRUE,
          highlight = TRUE,
          bordered = TRUE,
          borderless = TRUE,
          compact = TRUE,
          outlined = TRUE,
          resizable = TRUE,
          showSortable = TRUE,
          showPageSizeOptions = TRUE, 
          pagination = FALSE,
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })
    
#=============================================================================== 
#Efeito de Drogas                                                               ----
    output$txt4 <- renderText({
      paste0("Gráfico - Efeito de Drogas no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf4 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% 
        filter(Variavel =="Drogas", Ano == input$ano,  Municípios == input$muni)
      x %>% e_charts(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "blue",
          name = "",
          legend = FALSE,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = TRUE,
          barWidth = "45%",
          itemStyle = list (barBorderRadius =  5)
        ) %>%
        e_labels(
          fontWeight = "bold",
        ) %>%
        e_x_axis(
          name = "Tipos de Drogas",
          axisLabel = list(show = TRUE,fontSize = 11),
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)
        ) %>%
        e_y_axis(
          name = "Quantidade",
          nameTextStyle = list(fontWeight = "bold", fontSize = 14),
          scale = TRUE,
          axisLabel = list(
            formatter = htmlwidgets::JS("
              function (value, index) {
              return value.toLocaleString('pt-BR', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
              }
            ")
          )
        ) %>%
        e_locale("pt-Br") %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView")
      #%>% e_flip_coords()
    })

#===============================================================================
#Efeito de Álcool                                                               ----
    output$txt5 <- renderText({
      paste0("Gráfico - Efeito de Álcool no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf5 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% 
        filter(Variavel =="Alcool", Ano == input$ano,  Municípios == input$muni)
      x %>% e_charts(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "blue",
          name = "Efeito de Álcool",
          legend = FALSE,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = TRUE,
          itemStyle = list (barBorderRadius =  5)
        ) %>%
        e_labels(
          fontWeight = "bold",
        ) %>% 
        e_x_axis(
          name = "Faixa de Concetração (mlg)",
          axisLabel = list(show = TRUE,fontSize = 11),
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)
        ) %>%
        e_y_axis(
          name = "Efeito de Álcool",
          nameTextStyle = list(fontWeight = "bold", fontSize = 14),
          scale = TRUE,
          axisLabel = list(
            formatter = htmlwidgets::JS("
              function (value, index) {
              return value.toLocaleString('pt-BR', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
              }
            ")
          )
        ) %>%
        e_locale("pt-Br") %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView")
      #%>% e_flip_coords()
    })
    
#===============================================================================
#Tabela -  Efeito de Drogas                                                     ----
    output$txt4_1 <- renderText({
      paste0("Tabela - Efeito de Drogas por Município em ",input$ano)
    })
    output$tab4 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Drogas", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>% 
        reactable(
          defaultPageSize = 10,
          filterable = FALSE,
          searchable = TRUE,
          #selection = "multiple",
          wrap = FALSE,
          striped = TRUE,
          highlight = TRUE,
          bordered = TRUE,
          borderless = TRUE,
          compact = TRUE,
          outlined = TRUE,
          resizable = TRUE,
          showSortable = TRUE,
          showPageSizeOptions = TRUE, 
          pagination = FALSE,
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })

#===============================================================================
#Tabela -  Efeito de Álcool                                                     ----
    output$txt5_1 <- renderText({
      paste0("Tabela - Efeito de Álcool por Município em ",input$ano)
    })
    output$tab5 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Alcool", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>% 
        reactable(
          defaultPageSize = 10,
          filterable = FALSE,
          searchable = TRUE,
          #selection = "multiple",
          wrap = FALSE,
          striped = TRUE,
          highlight = TRUE,
          bordered = TRUE,
          borderless = TRUE,
          compact = TRUE,
          outlined = TRUE,
          resizable = TRUE,
          showSortable = TRUE,
          showPageSizeOptions = TRUE, 
          pagination = FALSE,
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })

#===============================================================================
#Download de Arquivos                                                           ----
##Gráfico de Barras - Condição da Vítima                                        ----
#Filtra os Dados
    
d1 <- reactive({
  Pareamento_Limpo_db %>% 
    filter(Variavel =="Condição da Vítima", Ano == input$ano,  Municípios == input$muni) %>% 
    select(Categoria,Valor)
  })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d1(), {
  t <- paste0("Gráfico - Condição da Vítima no Município  de  ",input$muni," - ",input$ano)
  download_Server("d1",d1(),t)})
    
##Gráfico de Barras - Tipos de Acidentes                                        ----
#Filtra os Dados
    d2 <- reactive({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Tipo de Acidente", Ano == input$ano,  Municípios == input$muni)%>% 
        select(Categoria,Valor)
      })
#Monitora a base filtrada, defini o texto a ser baixado                         ----
observeEvent(d2(), {
  t <- paste0("Gráfico - Tipos de Acidentes no Município  de  ",input$muni," - ",input$ano)
  download_Server("d2",d2(),t)})
    
##Tabela - Condição da Vítima                                                   ----
#Filtra os Dados
d3 <- reactive({
  Pareamento_Limpo_db %>% 
    filter(Variavel =="Condição da Vítima", Ano == input$ano) %>% 
    select(Municípios,Categoria,Valor) %>% 
    pivot_wider(names_from = Categoria,values_from = Valor)
  })
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d3(), {
      t <- paste0("Tabela - Condição da Vítima por Município em ",input$ano)
      download_Server("d3",d3(),t)})
    
##Tabela - Tipos de Acidentes                                                   ----
#Filtra os Dados
d4 <- reactive({
  Pareamento_Limpo_db %>% 
    filter(Variavel =="Tipo de Acidente", Ano == input$ano) %>% 
    select(Municípios,Categoria,Valor) %>% 
    pivot_wider(names_from = Categoria,values_from = Valor)
  })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d4(), {
  t <- paste0("Tabela - Tipos de Acidentes por Município em ",input$ano)
  download_Server("d4",d4(),t)})
    
##Gráfico de Barras - Tipos de Veículos                                         ----
#Filtra os Dados
d5 <- reactive({
  Pareamento_Limpo_db %>% 
    filter(Variavel =="Veículo Vítima", Ano == input$ano,  Municípios == input$muni)%>% 
    select(Categoria,Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado                         ----
observeEvent(d5(), {
  t <- paste0("Gráfico - Tipos de Veículos no Município  de  ",input$muni," - ",input$ano)
  download_Server("d5",d5(),t)})
    
##Tabela - Tipos de Veículos                                                    ----
#Filtra os Dados
d6 <- reactive({
  Pareamento_Limpo_db %>% 
    filter(Variavel =="Veículo Vítima", Ano == input$ano) %>% 
    select(Municípios,Categoria,Valor) %>% 
    pivot_wider(names_from = Categoria,values_from = Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d6(), {
  t <- paste0("Tabela - Tipos de Veículos por Município em ",input$ano)
  download_Server("d6",d6(),t)})
    
##Gráfico de Barras - Efeito de Drogas                                          ----
#Filtra os Dados                                                                ----
d7 <- reactive({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Drogas", Ano == input$ano,  Municípios == input$muni) %>% 
        select(Categoria,Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d7(), {
  t <- paste0("Gráfico - Efeito de Drogas no Município  de  ",input$muni," - ",input$ano)
  download_Server("d7",d7(),t)})
    
##Gráfico de Barras - Efeito de Álcool                                          ----
#Filtra os Dados
d8 <- reactive({
  Pareamento_Limpo_db %>% 
    filter(Variavel =="Alcool", Ano == input$ano,  Municípios == input$muni) %>% 
    select(Categoria,Valor)
  })
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d8(), {
      t <- paste0("Gráfico - Efeito de Álcool no Município  de  ",input$muni," - ",input$ano)
      download_Server("d8",d8(),t)})
    
##Tabela - Efeito de Drogas                                                     ----
#Filtra os Dados
d9 <- reactive({
  Pareamento_Limpo_db %>% 
    filter(Variavel =="Drogas", Ano == input$ano) %>% 
    select(Municípios,Categoria,Valor) %>% 
    pivot_wider(names_from = Categoria,values_from = Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d9(), {
  t <- paste0("Tabela - Efeito de Drogas por Município em ",input$ano)
  download_Server("d9",d9(),t)})
    
##Tabela - Efeito de Álcool                                                     ----
#Filtra os Dados
d10 <- reactive({
  Pareamento_Limpo_db %>% 
    filter(Variavel =="Alcool", Ano == input$ano) %>% 
    select(Municípios,Categoria,Valor) %>% 
    pivot_wider(names_from = Categoria,values_from = Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d10(), {
  t <- paste0("Tabela - Efeito de Álcool por Município em ",input$ano)
  download_Server("d10",d10(),t)})
})
}

#===============================================================================
#Play do Módulo
ui <-dashboardPage(
  header = dashboardHeader(),
  title = "condição da vitima",
  sidebar = dashboardSidebar(),
  body = dashboardBody(fluidPage(cond_vitima_ui("cond_vitima")))
  )

server <- function(input, output) {
  cond_vitima_Server("cond_vitima")
}

shinyApp(ui, server)
#===============================================================================

