# MÓDULO LOCALIZAÇÃO                                                            ----

localizacao_ui <- function(id) {
  fluidPage(
    fluidRow(
      box(
        title = "Óbitos por Sinistros de Trânsito no Pará",
        status = "primary",
        solidHeader = FALSE,
        width = 12,
        enableDrag = TRUE,
        tabsetPanel(
# Mapa do Pará                                                                  ----
          tabPanel(
            tags$b("PARÁ"),
            div(
              id = "Ano", 
              style = "
              margin-left: 10px; 
              float: left;
              border-right-style: solid;
              border-right-width: 0px;
              margin-right: 15px;",
              pickerInput(
                inputId = NS(id, "ano"),
                label = "ANO",
                choices = sort(unique(mortos_estado$Ano), decreasing = TRUE),
                width = "fit"
              )
            ),
            div(
              id = "ri", style = "margin-left: 10px; margin-top: 10px;",
              pickerInput(
                inputId = NS(id, "ri"),
                label = "Região de Integração",
                choices = unique(mortos_estado[["Região de Integração"]]),
                width = "fit"
              )
            ),
            leafletOutput(NS(id, "para"), height = "650px"),
            div(
              id = "Ano", style = "margin-top: 10px;",
              downdoload_ui(NS(id,"map_pa")))
          ),
# Mapa de Belém                                                                 ----
          tabPanel(
            tags$b("BELÉM"),
            div(
              id = "Ano", style = "margin-left: 10px; margin-top: 10px;",
              pickerInput(
                inputId = NS(id, "ano1"),
                label = "ANO",
                choices = sort(unique(ascidentes$Ano), decreasing = TRUE),
                width = "fit"
              )
            ),
            
            withSpinner(
              leafletOutput(NS(id, "belem"), height = "650px"),
              type = 8,
              color = "#f2c94e",
              size = 0.5
            ),
            
            div(
              id = "Ano", style = "margin-top: 10px;",
              downdoload_ui(NS(id,"map_bel")))
          )
        ),
        footer = list(tags$b("Fonte: "), "Fonte: Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH
Gráfico 02- Idade das Vítimas Fatais no Município de Ananindeua - 2021
")
      )
    )
  )
}
#===============================================================================
# Função do modulo servidor
localizacao_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
# Mapa do Pará                                                                  ----

output$para <- renderLeaflet({
#Tratamento da Informação
##Filtrando Informação

      if (input$ri == "Pará") {
        df <- mortos_estado %>% filter(Municípios !="Pará", Ano == input$ano)
        x <- cbind(geopa,df)
        }
      else{
        df <- mortos_estado %>% filter(Municípios !="Pará", Ano == input$ano) 
        x <- cbind(geopa,df)
        x <- x %>% filter(Região.de.Integração == input$ri)
      }
      z <- x$Valor[x$Valor > 0]
      bk <- unique(getJenksBreaks(z, 6, subset = NULL))
      x$Valor[x$Valor == 0] <- NA
      bins <- c(bk)
      if (length(bins) < 2 || length(bins) < 5) {
        bins <- 5
      }
      pal <- colorBin(c("#B6EDF0", "#74B4E8", "#1F83E0", "#1D44B8", "#090880"), domain = x$Valor, bins = bins)
      conteudo <-
        sprintf(
          "<strong>%s</strong><br/> <b>Mortos:</b> %s",
          x$name_muni,
          ifelse(is.na(x$Valor), 
                 "Não disponível", 
                 format(x$Valor, big.mark = ".", decimal.mark = ","))
        ) %>% lapply(htmltools::HTML)
#===============================================================================
# Mapas com o Pacote leafleft                                                   ----
      leaflet(x, options = leafletOptions(minZoom = 0, maxZoom = 15)) %>%
        addTiles() %>%
        addProviderTiles(providers$Esri.NatGeoWorldMap)%>%
        #addProviderTiles(providers$Esri.WorldStreetMap)%>%
        addPolygons(
          weight = 2,
          opacity = 1,
          color = "black",
          fillOpacity = 1,
          fillColor = ~ pal(Valor),
          dashArray = 1,
          smoothFactor = 1.5,
          highlightOptions =
            highlightOptions(
              weight = 5,
              color = "blue",
              dashArray = "3",
              fillOpacity = 0.5,
              bringToFront = TRUE
            ),
          label = conteudo,
          labelOptions =
            labelOptions(
              style = list("font-weight" = "normal", padding = "3px 8px"),
              textsize = "15px",
              direction = "auto"
            )
        ) %>%
        addLegend(
          pal = pal,
          values = ~Valor,
          opacity = 0.7,
          title = "Mortos",
          position = "bottomright",
          na.label = "Não disponível",
          labFormat = labelFormat_decimal(big.mark = ".", decimal.mark = ",", digits = 2)
        )
    })
#===============================================================================
# Mapa de Belém                                                                 ----
    output$belem <- renderLeaflet({
      x <- ascidentes %>% filter(Ano == input$ano1)
      x <- cbind(bairros_geo, x)

      z <- x$Valor[x$Valor > 0]
      bk <- unique(getJenksBreaks(z, 6, subset = NULL))
      x$Valor[x$Valor == 0] <- NA
      bins <- c(bk)
      if (length(bins) < 2 || length(bins) < 5) {
        bins <- 5
      }
      pal <- colorBin(c("#B6EDF0", "#74B4E8", "#1F83E0", "#1D44B8", "#090881"), domain = x$Valor, bins = bins)
      conteudo <-
        sprintf(
          "<strong>%s</strong><br/> <b>Sinistros:</b> %s",
          x$Bairros,
          format(x$Valor, big.mark = ".", decimal.mark = ",")
        ) %>% lapply(htmltools::HTML)
#===============================================================================
# Mapas com o Pacote leafleft                                                   ----
      x %>%
        leaflet(options = leafletOptions(minZoom = 0, maxZoom = 15)) %>%
        addTiles() %>%
        addProviderTiles(providers$Esri.NatGeoWorldMap)%>%
        addPolygons(
          weight = 2,
          opacity = 1,
          color = "black",
          fillOpacity = 1,
          fillColor = ~ pal(Valor),
          dashArray = 2,
          smoothFactor = 1.5,
          highlightOptions =
            highlightOptions(
              weight = 5,
              color = "blue",
              dashArray = "3",
              fillOpacity = 0.7,
              bringToFront = TRUE
            ),
          label = conteudo,
          labelOptions = labelOptions(
            style = list("font-weight" = "normal", padding = "3px 8px"),
            textsize = "15px",
            direction = "auto"
          )
        ) %>%
        addLegend(
          pal = pal,
          values = ~Valor,
          opacity = 0.7,
          title = "Sinistros",
          position = "bottomright",
          labFormat = labelFormat_decimal(big.mark = ".", decimal.mark = ",", digits = 2)
        )
    })
#===============================================================================
# Download de Arquivos                                                          ----
## Para                                                                         ----
#Filtrar os Dados                                                               ----
    
d1 <- reactive({
  if (input$ri == "Pará") {
    x <- mortos_estado %>% filter(Municípios !="Pará",Ano == input$ano)
    }      
  else{
    x <- mortos_estado %>% filter(Municípios !="Pará",Ano == input$ano) 
    x <- x %>% filter(`Região de Integração` == input$ri)
    }
  x <- x %>% rename(N_Mortos = Valor)
  })
    
# Monitora a base filtrada, defini o texto a ser baixado                        ----
    observeEvent(d1(), {
      t <- if (input$ri == "Pará") {
        paste0(input$ri," - ",input$ano)  
      }else{
        paste0(input$ri," - ",input$ano)
      }
      download_Server("map_pa",d1(),t)})
    
## Belém                                                                        ----
#Filtra os Dados                                                                ----
    d2 <- reactive({
      x <- ascidentes %>% filter(Ano == input$ano1)
      x <- x %>% rename(N_Mortos = Valor)
    })
    
#Monitora a base filtrada, defini o texto a ser baixado
    observeEvent(d2(), {
      t <- paste0("Belém  - ", input$ano1)
      download_Server("map_bel",d2(),t)})
    
  })
}

#===============================================================================
# Play do Módulo                                                                ----
ui <- dashboardPage(
  header = dashboardHeader(), title = "localizacao",
  sidebar = dashboardSidebar(),
  body = dashboardBody(fluidPage(localizacao_ui("localizacao")))
)

server <- function(input, output) {
  localizacao_Server("localizacao")
}

shinyApp(ui, server)
#===============================================================================



