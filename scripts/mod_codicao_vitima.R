#MÓDULO CONDIÇÃO DA VÍTIMA

cond_vitima_ui <- function(id) {
  fluidPage(
    panel(
      ##Controle----
      tags$div(
        style = "position:relative; 
        float:left; margin-right:10px; width: 9%;",
        #Selecionar
        pickerInput(
          inputId = NS(id, "ano"),
          label = "Ano",
          #choices = sort(unique(base_01$Ano), decreasing = T),
          choices = sort(unique(Pareamento_Limpo_db$Ano), decreasing = T),
          width = "100px"
        )
      ),
      tags$div(
        style = "position:relative; 
        float:left; margin-right:30px; width: 9%;",
        #select Município
        pickerInput(
          inputId = NS(id,"muni"),
          label = "Município",
          #choices = base_01$Municípios %>% unique(),
          choices = Pareamento_Limpo_db$Municípios %>% unique(),
          width = "200px"
        )
      )
    ),
    fluidRow(
    #Condição da Vítima----
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
        column(11,
        tags$b("Fonte: "), "DENTRA-PA"),
        downdoload_ui(NS(id,"")) 
        ) 
    ),
    #Tipos de Acidentes----
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
        column(11,
        tags$b("Fonte: "), "DENTRA-PA"),
        downdoload_ui(NS(id,"")) 
        ) 
    ),
    #Tipos de Veículos----
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
        column(11,
        tags$b("Fonte: "), "DENTRA-PA"),
        downdoload_ui(NS(id,"")) 
        ) 
    ),
    
    #Efeito de Drogas----
    box(
      width = 12,
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
        column(11,
        tags$b("Fonte: "), "DENTRA-PA"),
        downdoload_ui(NS(id,"")) 
        ) 
    ),
    #Efeito de Álcool----
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
        column(11,
        tags$b("Fonte: "), "DENTRA-PA"),
        downdoload_ui(NS(id,"")) 
        ) 
    ),
    box(
      width = 6,
      title = textOutput(NS(id,"txt6")),
      status = "primary",
      solideHeder = TRUE,
      collapsible = TRUE,
      height = 35,
      withSpinner(
        plotlyOutput(NS(id, "graf6")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
        tags$b("Fonte: "), "DENTRA-PA"),
        downdoload_ui(NS(id,"")) 
        ) 
    )
  ))
}

#Função do modulo servidor
cond_vitima_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
    #Condição da Vitima----
    output$txt1 <- renderText({
      paste0("Gráfico - Condição da Vitima no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf1 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% 
        filter(Variavel =="Condição da Vítima", Ano == input$ano,  Municípios == input$muni)
      x %>% 
        e_charts(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "blue",
          name = "Sexo",
          legend = F,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = T,
          itemStyle = list (barBorderRadius =  5)
        ) %>%
        e_labels(
          fontWeight = "bold",
        ) %>% 
        e_x_axis(
          name = "Condição da Vitima",
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
        e_grid(show = T)
    })
    #Tipos de Acidentes----
    output$txt2 <- renderText({
      paste0("Gráfico - Tipos de Acidentes no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf2 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% 
        filter(Variavel =="Tipo de Acidente", Ano == input$ano,  Municípios == input$muni)
      x %>% e_charts(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "blue",
          name = "Tipos de Acidentes",
          legend = F,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = T,
          itemStyle = list (barBorderRadius =  5)
        ) %>%
        e_labels(
          fontWeight = "bold",
        ) %>% 
        e_x_axis(
          name = "Tipos de Acidentes",
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
        e_grid(show = T)
    })
    #Tipos de Veículos----
    output$txt3 <- renderText({
      paste0("Gráfico - Tipos de Veículos no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf3 <- renderEcharts4r({
      x <- Pareamento_Limpo_db %>% 
        filter(Variavel =="Veículo Vítima", Ano == input$ano,  Municípios == input$muni)
      x %>% e_charts(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "blue",
          name = "Tipos de Veículos",
          legend = F,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = T,
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
        e_grid(show = T)
      
    })
    #Efeito de Drogas----
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
          legend = F,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = T,
          barWidth = "45%",
          itemStyle = list (barBorderRadius =  5)
        ) %>%
        e_labels(
          fontWeight = "bold",
        ) %>%
        e_x_axis(
          name = "Tipos de Drogas",
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
        e_grid(show = T)
    })
    #Efeito de Álcool----
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
          legend = F,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = T,
          itemStyle = list (barBorderRadius =  5)
        ) %>%
        e_labels(
          fontWeight = "bold",
        ) %>% 
        e_x_axis(
          name = "Tipos de Acidentes",
          axisLabel = list(show = T,fontSize = 11),
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)
        ) %>%
        e_y_axis(
          name = "Efeito de Álcool",
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
        e_grid(show = T)
    })
    #Vítimas Fatais----
    output$txt6 <- renderText({
      paste0("Gráfico - Vítimas Fatais p/ Acidentes de Trânsito")
    })
    #OBS: A coluna Drogas cm valores não existe na nova base de dados(base_01).
    output$graf6 <- renderPlotly({
      Pareamento_Limpo$Genero = factor(Pareamento_Limpo$Genero,levels = names(sort(table(Pareamento_Limpo$Genero),decreasing = TRUE)))
      gbox1 <-
        ggplot(Pareamento_Limpo, aes(y = Alcool, x = Genero, color = Genero)) +
        geom_boxplot(alpha = 0.15, fill = "blue") +
        labs(
          x = "Gênero",
          y = "Dosagem Alcoólica (mg/l)",
          caption = "Fonte: Detran"
        ) +
        theme_gray(base_size = 14) +
        theme(
          plot.title = element_text(
            size = 12L,
            face = "bold",
            hjust = 0.5
          ),
          plot.caption = element_text(
            size = 10L,
            face = "bold",
            hjust = 0
          ),
          axis.title.y = element_text(size = 12L, face = "bold"),
          axis.title.x = element_text(size = 12L, face = "bold")
        ) +
        geom_point() +
        geom_jitter() +
        geom_violin(
          trim = FALSE,
          alpha = 0.1,
          fill = "blue",
          color = "blue"
        )
      ggplotly(gbox1)
    })
    
  })
}

cond_vitima_App <- function() {
  ui <- fluidPage(cond_vitima_ui("cond_vitima"))
  server <- function(input, output, session) {
    cond_vitima_Server("cond_vitima")
  }
  shinyApp(ui, server)
}

#Play do Módulo
ui <-
  dashboardPage(
    header = dashboardHeader(),
    title = "condição da vitima",
    sidebar = dashboardSidebar(),
    body = dashboardBody(fluidPage(cond_vitima_ui("cond_vitima")))
  )

server <- function(input, output) {
  cond_vitima_Server("cond_vitima")
}

shinyApp(ui, server)
