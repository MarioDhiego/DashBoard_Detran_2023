
#===============================================================================
#1.0 MÓDULO OCORRÊNCIAS                                                         -----

ocorrencia_ui <- function(id) {
  fluidPage(
    panel(
##1.1 Controle                                                                  ----
      tags$div(
        style = "position:relative; 
        float:left; margin-right:10px; width: 9%;",
        pickerInput(
          inputId = NS(id, "ano"),
          label = "ANO",
          choices = sort(unique(Pareamento_Limpo_db$Ano), decreasing = T),
          width = "100px"
        )
      ),
      tags$div(
        style = "position:relative; 
        float:left; margin-right:30px; width: 9%;",
        pickerInput(
          inputId = NS(id,"muni"),
          label = "MUNICÍPIO",
          choices = Pareamento_Limpo_db$Municípios %>% unique(),
          width = "200px"
        )
      )
    ),
    fluidRow(
#===============================================================================
##1.2 Gráfico de Barras - Dias da Semana                                        ----
      box(
        width = 6,
        title = textOutput(NS(id,"txt1")),
        status = "primary",
        solideHeder = TRUE,
        collapsible = TRUE,
        height = 35,
        withSpinner(
        echarts4rOutput(NS(id,"graf1")),
        type = 8,
        color = "blue",
        size = 0.5),
        footer = list(
          column(10,
                 tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
          downdoload_ui(NS(id,"d1")) 
        )
      ),
#===============================================================================
#1.3 Gráfico de Barras - Meses                                                  ----
      box(
        width = 6,
        title = textOutput(NS(id,"txt2")),
        status = "primary",
        solideHeder = TRUE,
        collapsible = TRUE,
        height = 35,
        withSpinner(
        echarts4rOutput(NS(id,"graf2")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d2")) 
      )
      )),
    fluidRow(
#===============================================================================
#1.4 Tabela de Barras - Dias da Semana                                          ----
      box(
        width = 6,
        title = textOutput(NS(id,"txt1_1")),
        status = "primary",
        solideHeder = TRUE,
        collapsible = TRUE,
        height = 35,
        withSpinner(
          reactableOutput(NS(id,"tab1")),
          type = 8,
          color = "blue",
          size = 0.5),
        footer = list(
          column(10,
                 tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
          downdoload_ui(NS(id,"d3")) 
        )
      ),
#===============================================================================
#1.5 Tabela- Meses                                                              ----
      box(
        width = 6,
        title = textOutput(NS(id,"txt2_1")),
        status = "primary",
        solideHeder = TRUE,
        collapsible = TRUE,
        height = 35,
        withSpinner(
          reactableOutput(NS(id,"tab2")),
          type = 8,
          color = "blue",
          size = 0.5
        ),
        footer = list(
          column(10,
                 tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
          downdoload_ui(NS(id,"d4")) 
        )
      )
    ),
    fluidRow(
#===============================================================================
##1.6 Gráfico de Barras - Ano                                                   ----
      box(
        width = 6,
        title = textOutput(NS(id,"txt3")),
        status = "primary",
        solideHeder = TRUE,
        collapsible = TRUE,
        height = 35,
        withSpinner(
        echarts4rOutput(NS(id,"graf3")),
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
##1.7 Gráfico de Barras - Turno                                                 ----
      box(
        width = 6,
        title = textOutput(NS(id,"txt4")),
        status = "primary",
        solideHeder = TRUE,
        collapsible = TRUE,
        height = 35,
        withSpinner(
        echarts4rOutput(NS(id,"graf4")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(10,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d6")) 
      )
      )
    ),
    fluidRow(
#===============================================================================
##1.8 Tabela - Ano                                                              ----
      box(
        width = 6,
        title = textOutput(NS(id,"txt3_1")),
        status = "primary",
        solideHeder = TRUE,
        collapsible = TRUE,
        height = 35,
        withSpinner(
          reactableOutput(NS(id,"tab3")),
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
#===============================================================================  
##1.9 Tabela - Turno                                                            ----
      box(
        width = 6,
        title = textOutput(NS(id,"txt4_1")),
        status = "primary",
        solideHeder = TRUE,
        collapsible = TRUE,
        height = 35,
        withSpinner(
          reactableOutput(NS(id,"tab4")),
          type = 8,
          color = "blue",
          size = 0.5
        ),
        footer = list(
          column(10,
                 tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
          downdoload_ui(NS(id,"d8")) 
        )
      )
    )
  )
}
#===============================================================================
#2.0 Função do Módulo Servidor                                                  ----
ocorrencia_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
##2.1 Gráfico de Barras - Dias da Semana                                        ----
    output$txt1 <- renderText({
      paste0("Gráfico - Sinistros por Dias da Semana, no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf1 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% filter(Ano == input$ano,Municípios == input$muni,Variavel == "Dia")
      x %>% e_charts(Categoria) %>%
        #e_theme("infographic")%>%
        e_line(
          smooth = FALSE,
          serie = Valor,
          color = "blue",
          name = "Dia da Semana",
          legend = FALSE,
          symbol = "roundRect",
          symbolSize = 10,
          legendHoverLink = TRUE,
          barWidth = "70%",
          itemStyle = list (barBorderRadius =  10)
          )  %>% 
        e_grid(show = TRUE) %>%
        #e_color(background = "black")%>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_datazoom(x_index = c(0, 1))%>%
        #e_datazoom(startValue = 14)%>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        e_labels(fontWeight = "bold") %>% 
        e_x_axis(
          axisLabel = list(show = TRUE,fontSize = 14),
          name = "Dias da Semana",
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)) %>% 
        e_y_axis(
          name = "Ocorrências",
          nameTextStyle = list(fontWeight = "bold", fontSize = 14),
          scale = TRUE,
          axisLabel = list(
            formatter = htmlwidgets::JS("
              function (value, index) {
              return value.toLocaleString('pt-BR', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
              }
            ")
          )) 
    })
#===============================================================================
##2.2 Gráfico de Barras - Meses                                                 ----
output$txt2 <- renderText({
  paste0("Gráfico - Sinistros por Meses, no Município  de  ",input$muni," - ",input$ano)})
    output$graf2 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% filter(Ano == input$ano,Municípios == input$muni,Variavel == "Meses")
      x %>% e_charts(Categoria) %>%
        #e_theme("infographic")%>%
        e_line(
          smooth = FALSE,
          serie = Valor,
          color = "blue",
          name = "Mês",
          legend = FALSE,
        symbol = "roundRect",
        symbolSize = 10,
        legendHoverLink = TRUE,
        barWidth = "70%",
        itemStyle = list (barBorderRadius =  8)) %>%
        #e_execute()%>%
        #e_brush(throttleDelay = 1000)%>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_datazoom(x_index = c(0, 1))%>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        e_labels(fontWeight = "bold") %>% 
        e_x_axis(
          axisLabel = list(show = TRUE,fontSize = 14),
          name = "Meses",
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)) %>% 
        e_y_axis(
          name = "Ocorrências",
          nameTextStyle = list(fontWeight = "bold", fontSize = 14),
          scale = TRUE,
          axisLabel = list(
            formatter = htmlwidgets::JS("
              function (value, index) {
              return value.toLocaleString('pt-BR', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
              }
            ")
          )) 

    })
#===============================================================================
##2.3 Tabela - Dias da Semana                                                   ----
    output$txt1_1 <- renderText({
      paste0("Tabela - Sinistros por Dias da Semana, nos Municípios - ",input$ano)
    })
    output$tab1 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Dia", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>% 
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Dias")%>%
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
          columns = list(
            Municípios = colDef(width = 150)
          ),
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })
#===============================================================================
##2.3 Tabela - Meses                                                            ----
    output$txt2_1 <- renderText({
      paste0("Tabela - Sinistros por Meses, nos Municípios - ",input$ano)
    })
    output$tab2 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Meses", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>%
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Meses")%>%
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
          columns = list(
            Municípios = colDef(width = 150)
          ),
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })
#===============================================================================
##2.4Gráfico de Setor - Ano                                                     ----
output$txt3 <- renderText({
      paste0("Gráfico - Anos de Ocorrência no Município  de  ",input$muni)
    })
    output$graf3 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% filter(Municípios == input$muni,Variavel == "Ano")
      x %>% e_charts(Ano) %>%
        e_pie(
          serie = Valor,
          roseType = "radius",
          name = "Ano",
          legend = TRUE,
          symbol = "roundRect",
          symbolSize = 10,
          legendHoverLink = TRUE,
          label = list(show = TRUE),
          itemStyle = list (barBorderRadius =  8),
          showBackground = TRUE) %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        e_tooltip(
          formatter = htmlwidgets::JS(
            "function(params) {
           return '<strong>' + params.name + '</strong>' + ': ' + params.value + ' (' + params.percent + '%)';
           }"
          )
        )
    })
#===============================================================================
##2.5 Gráfico de Barras - Turno                                                 ----
output$txt4 <- renderText({
  paste0("Gráfico - Sinistros por Turnos de Ocorrência, no Município  de  ",input$muni," - ",input$ano)
  })
    output$graf4 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% filter(Ano == input$ano,Municípios == input$muni,Variavel == "Turno Obito")
      x %>% e_charts(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "blue",
          name = "",
          legend = FALSE,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = TRUE,
          itemStyle = list (barBorderRadius =  5)) %>%
        e_labels(fontWeight = "bold",show = TRUE) %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        e_x_axis(
          axisLabel = list(show = T,fontSize = 12),
          name = "Período",
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)) %>%
        e_y_axis(
          name = "Ocorrências",
          nameTextStyle = list(fontWeight = "bold", fontSize = 14),
          scale = TRUE,
          axisLabel = list(
            formatter = htmlwidgets::JS("
              function (value, index) {
              return value.toLocaleString('pt-BR', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
              }
            ")
          ))
      
    })
#===============================================================================
##2.6 Tabela - Ano                                                              ----
output$txt3_1 <- renderText({
  paste0("Tabela - Sinistrsos por Anos de Ocorrência no Município")
  })
    output$tab3 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Ano") %>% 
        select(Municípios,Ano,Valor) %>% 
        pivot_wider(names_from = Ano,values_from = Valor) %>% 
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Anos")%>%
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
          columns = list(
            Municípios = colDef(width = 150),
            "2020" = colDef(align = "right"),
            "2021" = colDef(align = "right")
          ),
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })
#===============================================================================
##2.7 Tabela - Turno                                                            ----
output$txt4_1 <- renderText({
      paste0("Tabela - Sinistros por Turno de Ocorrência no Município")
    })
    output$tab4 <- renderReactable({
      Pareamento_Limpo_db %>% 
        filter(Variavel == "Turno Obito", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>%
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Turnos")%>%
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
          columns = list(
            Municípios = colDef(width = 150)
          ),
          defaultColDef = colDef(footerStyle = list(fontWeight = "bold"),na = "0",
                                 format = colFormat(separators = TRUE,locales = "pt-Br"),
                                 headerStyle = list(background = "#f7f7f8")
          )
        )
    })
#===============================================================================
#3.0 Downaload de Arquivos                                                      ----
##3.1 Gráfico de Barras - Dias da Semana                                        ----
###3.11 Filtra os Dados
d1 <- reactive({
      Pareamento_Limpo_db %>% filter(Ano == input$ano,Municípios == input$muni,Variavel == "Dia") %>% 
        select(Categoria,Valor)
    })
##3.12 Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d1(), {
      t <- paste0("Gráfico - Dias Semana de Ocorrência no Município  de  ",input$muni," - ",input$ano)
      download_Server("d1",d1(),t)})
    
##3.2 Gráfico de Barras - Meses                                                 ----
###3.21 Filtra os dados
    d2 <- reactive({
      Pareamento_Limpo_db %>% filter(Ano == input$ano,Municípios == input$muni,Variavel == "Meses") %>% 
        select(Categoria,Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d2(), {
      t <-  paste0("Gráfico - Meses de Ocorrência no Município  de  ",input$muni," - ",input$ano)
      download_Server("d2",d2(),t)})
    
#Tabela de Barras - Dias Semana----
    #Filtra os dados
    d3 <- reactive({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Dia", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor)
    })
    #Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d3(), {
      t <- paste0("Tabela - Dias Semana de Ocorrência nos Municípios - ",input$ano)
      download_Server("d3",d3(),t)})
    
    #Tabela- Meses----
    #Filtra os dados
    d4 <- reactive({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Meses", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor)
    })
    #Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d4(), {
      t <- paste0("Tabela - Meses de Ocorrência nos Municípios - ",input$ano)
      download_Server("d4",d4(),t)})
    
    #Gráfico de Setor - Ano----
    #Filtra os dados
    d5 <- reactive({
      Pareamento_Limpo_db %>% filter(Municípios == input$muni,Variavel == "Ano") %>% 
        select(Ano,Valor)
    })
    #Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d5(), {
      t <- paste0("Gráfico - Anos de Ocorrência no Município  de  ",input$muni)
      download_Server("d5",d5(),t)})
    
    #Gráfico de Barras - Turno----
    #Filtra os dados
    d6 <- reactive({
     Pareamento_Limpo_db %>% filter(Ano == input$ano,Municípios == input$muni,Variavel == "Turno Obito") %>% 
        select(Categoria,Valor)
    })
    #Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d6(), {
      t <- paste0("Gráfico - Turno de Ocorrência no Município  de  ",input$muni," - ",input$ano)
      download_Server("d6",d6(),t)})
    
    #Tabela - Ano----
    #Filtra os dados
    d7 <- reactive({
      Pareamento_Limpo_db %>% 
        filter(Variavel =="Ano") %>% 
        select(Municípios,Ano,Valor) %>% 
        pivot_wider(names_from = Ano,values_from = Valor)
    })
    #Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d7(), {
      t <- paste0("Tabela - Anos de Ocorrência no Município")
      download_Server("d7",d7(),t)})
    
    #Tabela - Turno----
    #Filtra os dados
    d8 <- reactive({
      Pareamento_Limpo_db %>% 
        filter(Variavel == "Turno Obito", Ano == input$ano) %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor)
    })
    #Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d8(), {
      t <- paste0("Tabela -Turno de Ocorrência no Município")
      download_Server("d8",d8(),t)})
  })
}

#===============================================================================
#4.0 Play do Módulo                                                             ----
ui <- dashboardPage(header = dashboardHeader(),title = "ocorrencia",
                    sidebar = dashboardSidebar(),
                    body = dashboardBody(fluidPage(ocorrencia_ui("ocorrencia"))))

server <- function(input, output) {
  ocorrencia_Server("ocorrencia")
}

shinyApp(ui, server)
#===============================================================================


