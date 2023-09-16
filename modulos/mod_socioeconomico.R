

#===============================================================================
#1.0 MODULO SOCIOECONOMICO                                                      ----

socioeconomico_ui <- function(id) {
  fluidPage(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "estilo.css")
    ),
    panel(
##1.1 Controle                                                                  ----
      tags$div(
        style = "position:relative; 
        float:left; margin-right:10px; width: 9%;",
##1.2 Selecionar                                                                ----
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
##1.3 Select Município                                                           ----
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
#2.0 VISUALIZAÇÃO GRÁFICA/TABULAR                                               ----       
##2.1 Gráfico - Gênero das Vítimas                                              ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt1")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        echarts4rOutput(NS(id,"graf1")),
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
##2.2 Gráfico - Idade Histograma                                                ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt2")),
      status = "primary",
      collapsible = TRUE,
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
##2.3 Tabela - Gênero das Vítimas                                               ----
    box(
      width = 4,
      title = textOutput(NS(id,"txt3")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        reactableOutput(NS(id,"tab1")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d3")) 
      )
    ),
#===============================================================================
##2.4 Tabela -Estatística Resumo                                                ----
    box(
      width = 4,
      title = textOutput(NS(id,"txt4")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        reactableOutput(NS(id, "tab2")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d4")) 
      )
    ),
#===============================================================================
##2.5 Tabela - Perfil Etário Tabela                                             ----
    box(
      width = 4,
      title = textOutput(NS(id,"txt5")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        reactableOutput(NS(id, "tab3")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d5")) 
      )
    )),
    fluidRow(
#===============================================================================
##2.6 Gráfico - Faixa Etária                                                    ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt6")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        echarts4rOutput(NS(id, "graf3")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d6")) 
      )
    ),
#===============================================================================
##2.7 Gráfico - Raça das Vítimas                                                ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt7")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        echarts4rOutput(NS(id,"graf4")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d7")) 
      )
    )),
    fluidRow(
#===============================================================================
##2.8 Tabela - Faixa Etária                                                     ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt8")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        reactableOutput(NS(id, "tab4")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d8")) 
      )
    ),
#===============================================================================
##2.9 Tabela - Raça das Vítimas                                                 ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt9")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        reactableOutput(NS(id,"tab5")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d9")) 
      )
    )),
    fluidRow(
#===============================================================================
##2.10 Gráfico - Grau de Escolaridades das Vítimas                              ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt10")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        echarts4rOutput(NS(id,"graf5")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d10")) 
      )
    ),
#===============================================================================
##2.11 Gráfico - Estado Civil das Vítimas                                       ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt11")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        echarts4rOutput(NS(id,"graf6")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d11")) 
      )
    )
  ),
    fluidRow(
#===============================================================================
##2.12 Tabela - Grau de Escolaridades das Vítimas                               ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt12")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        reactableOutput(NS(id,"tab6")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d12")) 
      )
    ),
#===============================================================================
##2.13 Tabela - Estado Civil da Vítimas                                         ----
    box(
      width = 6,
      title = textOutput(NS(id,"txt13")),
      status = "primary",
      collapsible = TRUE,
      withSpinner(
        reactableOutput(NS(id,"tab7")),
        type = 8,
        color = "blue",
        size = 0.5
      ),
      footer = list(
        column(11,
               tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
        downdoload_ui(NS(id,"d13")) 
      )
    )
  )
)
}
#===============================================================================
#Função do modulo servidor                                                      ----
socioeconomico_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
##2.14 Gráfico - Gênero das Vítimas                                             ----
    output$txt1 <- renderText({
      paste0("Gráfico 01- Gênero das Vítimas Fatais no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf1 <- renderEcharts4r({
    x <- Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Sexo")
      x %>% e_charts(x = Categoria) %>%
        e_pie(serie = Valor,
              name = "Gênero",
              label = list(show = FALSE)) %>% 
        e_grid(show = TRUE) %>%
        e_animation(duration = 5000)%>%
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
##2.15 Gráfico - Idade Histograma                                               ----
    output$txt2 <- renderText({
      paste0("Gráfico 02- Idade das Vítimas Fatais no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf2 <- renderEcharts4r({
      Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Idade") %>% 
        e_charts()  %>% 
        e_histogram(
          Valor,
          name = "Quantidade",
          legend = FALSE) %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        #e_draft()%>%
        #e_flip_coords() %>%
        e_theme("blue") %>%
        e_x_axis(
          axisLabel = list(show = TRUE,fontSize = 12),
          name = "Idade(anos)",
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
          ))
    })
#===============================================================================
##2.16 Tabela - Gênero das Vítimas                                              ----
    output$txt3 <- renderText({
      paste0("Tabela 01- Gênero das Vítimas nos Municípios - ",input$ano)
    })
    output$tab1 <- renderReactable({
     Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Sexo") %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>%
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Gênero")%>%
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
                                 headerStyle = list(background = "#f7f7f8"),
                                 format = colFormat(separators = TRUE)
          )
        )
    })
#===============================================================================
##2.17 Tabela - Perfil Etário Tabela                                            ----
output$txt4 <- renderText({
  paste0("Tabela 02- Perfil Etário no Município  de  ",input$muni," - ",input$ano)
  })
    output$tab2 <- renderReactable({
      s <- Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Sexo")
      f <- Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Faixa Etária")
      dt = data.frame(x = f$Categoria, y = s$Categoria)
      tabyl(dt, x, y, show_na = FALSE) %>%
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Idade", col_name = "Gênero") %>%
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
                                 headerStyle = list(background = "#f7f7f8"),
                                 format = colFormat(separators = TRUE)
          )
        )
    })
#===============================================================================    
##2.18 Tabela - Estatística Resumo                                              ----
    output$txt5 <- renderText({
      paste0("Tabela 03- Estatísticas no Município  de  ",input$muni," - ",input$ano)
    })
    output$tab3 <- renderReactable({
      df <- Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Idade")
      Descritiva <- rbind(
        "Nº de VÍtimas Fatais" = NROW(df$Valor),
        "Menor Idade" = min(df$Valor),
        "Maior Idade" = max(df$Valor),
        #"MeanSE" = MeanSE(df$Valor), 
        "Idade Média" = mean(df$Valor),
        "Idade Mediana" = median(df$Valor),
        "Desvio Etário" = sd(df$Valor),
        "25/%  Idades" = quantile(df$Valor, probs = 0.25),
        "75/%  Idades" = quantile(df$Valor, probs = 0.75)
      )
      colnames(Descritiva) = "Estatísticas"
      reactable(Descritiva,
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
                                       headerStyle = list(background = "#f7f7f8"),
                                       format = colFormat(separators = TRUE,digits = 2)
                )
      )
    })
#===============================================================================
##2.19 Gráfico - Faixa Etária                                                   ----
    output$txt6 <- renderText({
      paste0("Gráfico 03- Faixa Etária das Vítimas no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf3 <- renderEcharts4r({
      Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Faixa Etária") %>% 
      e_chart(Categoria) %>%
        e_bar(
          serie = Valor,
          color = "blue",
          name = "Faixa Etária",
          legend = F,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = T,
          itemStyle = list (barBorderRadius =  0)) %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        e_labels(fontWeight = "bold") %>% 
        e_x_axis(
          axisLabel = list(show = T,fontSize = 11),
          name = "Idade(anos)",
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
          ))
    })
#===============================================================================    
##2.20 Gráfico - Raça ou Etnia das Vítimas                                      ----
    output$txt7 <- renderText({
      paste0("Gráfico 04- Raça das Vítimas no Município  de  ",input$muni," - ",input$ano)
    })
    output$graf4 <- renderEcharts4r({
      Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Raça") %>% 
        e_chart(x = Categoria) %>%
        e_bar(serie = Valor,
        color = "blue",
        name = "Raça",
        legend = FALSE,
        symbol = "roundRect",
        symbolSize = 6,
        legendHoverLink = TRUE,
        barWidth = "40%",
        itemStyle = list (barBorderRadius =  5))%>% 
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        e_labels(fontWeight = "bold") %>% 
        e_x_axis(
          axisLabel = list(show = T,fontSize = 11),
          name = "Raça",
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)) %>% 
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
          )) 

    })
#===============================================================================
##2.21 Tabela - Faixa Etária                                                    ----
    output$txt8 <- renderText({
      paste0("Tabela 04- Faixa Etária das Vítimas nos Municípios - ",input$ano)
    })
    output$tab4 <- renderReactable({
      Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Faixa Etária") %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>% 
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Faixa Etária")%>%
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
                                 headerStyle = list(background = "#f7f7f8"),
                                 format = colFormat(separators = TRUE)
          )
        )
    })
#===============================================================================
##2.22 Tabela - Raça das Vítimas                                                ----
output$txt9 <- renderText({
  paste0("Tabela 05- Raça das Vítimas nos Municípios - ",input$ano)
  })
    output$tab5 <- renderReactable({
      Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Raça") %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>%
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Raça")%>%
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
                                 headerStyle = list(background = "#f7f7f8"),
                                 format = colFormat(separators = TRUE)
          )
        )
    })
#===============================================================================
##2.23 Gráfico - Grau de Escolaridade das Vítimas                               ----
    output$txt10 <- renderText({
      paste0("Gráfico 05- Escolaridade das Vítimas Fatais no Município  de  ",input$muni," - ",input$ano)
      })
    output$graf5 <- renderEcharts4r({
      Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Escolaridade") %>% 
        e_chart(x = Categoria) %>%
        e_bar(serie = Valor,
        color = "blue",
          name = "Escolaridade",
          legend = FALSE,
          symbol = "roundRect",
          symbolSize = 6,
          legendHoverLink = TRUE,
          barWidth = "40%",
          itemStyle = list (barBorderRadius =  5)) %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        e_labels(fontWeight = "bold") %>% 
        e_x_axis(
          axisLabel = list(show = T,fontSize = 11),
          name = "Grau de Escolaridade",
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)) %>%
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
          ))
    })
#===============================================================================
##2.24 Gráfico - Estado Civil das Vítimas                                       ----
    output$txt11 <- renderText({
      paste0("Gráfico 06- Estado Civil da Vítima no Município  de  ",input$muni," - ",input$ano)
      })
    output$graf6 <- renderEcharts4r({
      Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Estado Civil") %>% 
        e_chart(x = Categoria) %>%
        e_bar(serie = Valor,
        color = "blue",
        name = "Estado Civil",
        legend = FALSE,
        symbol = "roundRect",
        symbolSize = 6,
        legendHoverLink = TRUE,
        barWidth = "40%",
        itemStyle = list (barBorderRadius =  5)) %>%
        e_grid(show = TRUE) %>%
        e_tooltip(trigger = "item")%>%
        e_animation(duration = 5000) %>%
        e_toolbox_feature(feature = "saveAsImage") %>%
        e_toolbox_feature(feature = "dataZoom") %>%
        e_toolbox_feature(feature = "dataView") %>%
        e_labels(fontWeight = "bold") %>% 
        e_x_axis(
          axisLabel = list(show = TRUE,fontSize = 11),
          name = "Estado Civil",
          nameLocation = "middle",
          nameTextStyle = list(fontWeight = "bold", padding = c(30, 0, 0, 0),fontSize = 14)) %>% 
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
          )) 
        })
#===============================================================================
##2.25 Tabela - Grau de Escolaridades das Vítimas                               ----
    output$txt12 <- renderText({
      paste0("Tabela 06-  Grau de Escolaridades das Vítimas nos Municípios - ",input$ano)
    })
    output$tab6 <- renderReactable({
      Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Escolaridade") %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>%
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Escolaridade")%>%
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
                                 headerStyle = list(background = "#f7f7f8"),
                                 format = colFormat(separators = TRUE)
          )
        )
    })
#===============================================================================
##2.26 Tabela - Estado Civil das Vítimas                                        ----
    output$txt13 <- renderText({
      paste0("Tabela 07-  Estado Civil da Vítima nos Municípios - ",input$ano)
    })
    output$tab7 <- renderReactable({
      Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Estado Civil") %>% 
        select(Municípios,Categoria,Valor) %>% 
        pivot_wider(names_from = Categoria,values_from = Valor) %>%
        adorn_totals("col") %>%
        adorn_totals("row") %>%
        adorn_percentages("all") %>%
        adorn_pct_formatting(digits = 1) %>%
        #adorn_rounding(2) %>%
        adorn_ns(position = "front") %>%
        adorn_title("combined", row_name = "Município", col_name = "Estado Civil")%>%
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
                                 headerStyle = list(background = "#f7f7f8"),
                                 format = colFormat(separators = TRUE)
          )
        )
    })
#===============================================================================
#Download de Arquivos                                                           ----
##Gráfico - Gênero das Vítimas                                                  ----
#Filtra os Dados
    d1 <- reactive({
      Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Sexo") %>%
        select(Municípios,Categoria,Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d1(), {
      t <- paste0("Gênero das Vítimas nos Municípios  ",input$ano)
      download_Server("d1",d1(),t)})

## Gráfico - Idade Histograma                                                   ----
#Filtra os dados
    d2 <- reactive({
      Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Idade") %>% select(Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d2(), {
      t <- paste0("Idades no Município  de  ",input$muni," - ",input$ano)
      download_Server("d2",d2(),t)})

## Tabela - Gênero das Vítimas                                                  ----
#Filtra os dados
    d3 <- reactive({
      Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Sexo") %>%
        select(Municípios,Categoria,Valor) %>%
        pivot_wider(names_from = Categoria,values_from = Valor)
    })
    #Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d3(), {
      t <- paste0("Gênero das Vítimas nos Municípios - ",input$ano)
      download_Server("d3",d3(),t)})

#===============================================================================
## Tabela - Perfil Etário Tabela                                                ----
#Filtra os dados
    d4 <- reactive({
      s <- Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Sexo")
      f <- Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Faixa Etária")
      dt = data.frame(x = f$Categoria, y = s$Categoria)
      tabyl(dt, x, y, show_na = FALSE)
})
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d4(), {
      t <- paste0("Tabela - Perfil Etário no Município  de  ",input$muni," - ",input$ano)
      download_Server("d4",d4(),t)})

    # ## Tabela -Estatística Resumo----
    # #Filtra os dados
    # d5 <- reactive({
    #   Descritiva <- data.frame(
    #     Estatísticas = c("Vitimas Fatais", "Menor Idade", "Maior Idade", "Idade Média",
    #                      "Idade Mediana", "Desvio Etário", "25% Idades", "75% Idades"),
    #     Valor = c(
    #       NROW(df$Valor),
    #       min(df$Valor),
    #       max(df$Valor),
    #       mean(df$Valor),
    #       median(df$Valor),
    #       sd(df$Valor),
    #       quantile(df$Valor, probs = 0.25),
    #       quantile(df$Valor, probs = 0.75)
    #     )
    #   )
    # })
    # #Monitora a base filtrada, defini o texto a ser baixado
    # observeEvent(d5(), {
    #   t <- paste0("Tabela - Estatística Resumo no município  de  ",input$muni," - ",input$ano)
    #   download_Server("d5",d5(),t)})

## Gráfico - Faixa Etária                                                       ----
#Filtra os dados
d6 <- reactive({
  Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Faixa Etária") %>%
    select(Categoria,Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d6(), {
  t <- paste0("Gráfico - Faixa Etária no Município  de  ",input$muni," - ",input$ano)
  download_Server("d6",d6(),t)})

## Gráfico - Raça das Vítimas----
#Filtra os dados
d7 <- reactive({
  Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Raça") %>%
    select(Categoria,Valor)
  })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d7(), {
  t <- paste0("Gráfico - Raça das Vítimas no Município  de  ",input$muni," - ",input$ano)
  download_Server("d7",d7(),t)})

## Tabela - Faixa Etária                                                        ----
#Filtra os dados
d8 <- reactive({
  Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Faixa Etária") %>%
    select(Municípios,Categoria,Valor) %>%
    pivot_wider(names_from = Categoria,values_from = Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d8(), {
  t <- paste0("Tabela - Faixa Etária nos Municípios - ",input$ano)
  download_Server("d8",d8(),t)})

## Tabela - Raça das Vítimas                                                    ----
#Filtra os Dados
d9 <- reactive({
  Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Raça") %>%
    select(Municípios,Categoria,Valor) %>%
    pivot_wider(names_from = Categoria,values_from = Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d9(), {
  t <- paste0("Tabela - Raça das Vítimas nos Municípios - ",input$ano)
  download_Server("d9",d9(),t)})

## Gráfico - Grau de Escolaridades das Vítimas                                  ----
#Filtra os dados
d10 <- reactive({
  Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Escolaridade") %>%
    select(Categoria,Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d10(), {
  t <- paste0("Gráfico - Escolaridade das Vítimas no Município  de  ",input$muni," - ",input$ano)
  download_Server("d10",d10(),t)})

## Gráfico - Estado Civil da Vitima                                             ----
#Filtra os dados
d11 <- reactive({
  Pareamento_Limpo_db %>% filter(Municípios == input$muni,Ano == input$ano,Variavel == "Estado Civil") %>%
    select(Categoria,Valor)
  })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d11(), {
  t <- paste0("Gráfico - Estado Civil das Vítimas no Município  de  ",input$muni," - ",input$ano)
  download_Server("d11",d11(),t)})

## Tabela - Grau de Escolaridades das Vítimas                                   ----
#Filtra os dados
d12 <- reactive({
  Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Escolaridade") %>%
    select(Municípios,Categoria,Valor) %>%
    pivot_wider(names_from = Categoria,values_from = Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d12(), {
  t <- paste0("Tabela -  Escolaridades das Vítimas nos Municípios - ",input$ano)
  download_Server("d12",d12(),t)})

## Tabela - Estado Civil da Vitima----
#Filtra os dados
d13 <- reactive({
  Pareamento_Limpo_db %>% filter(Ano == input$ano,Variavel == "Escolaridade") %>%
    select(Municípios,Categoria,Valor) %>%
    pivot_wider(names_from = Categoria,values_from = Valor)
    })
#Monitora a base filtrada, defini o texto a ser baixado
observeEvent(d13(), {
  t <- paste0("Tabela -  Estado Civil das Vítimas nos Municípios - ",input$ano)
  download_Server("d13",d13(),t)})
})
}

#===============================================================================
#Play do Módulo
ui <-dashboardPage(
    header = dashboardHeader(),
    title = "Socioeconomico",
    sidebar = dashboardSidebar(),
    body = dashboardBody(fluidPage(socioeconomico_ui("socioeconomico")))
  )

server <- function(input, output) {
  socioeconomico_Server("socioeconomico")
}

shinyApp(ui, server)
#===============================================================================