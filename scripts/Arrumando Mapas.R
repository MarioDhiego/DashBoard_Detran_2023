#Carregando Dados de Mortos Pará----
mortos_muni <- mortos_city %>% pivot_longer(!Municípios,names_to = "Ano",values_to = "Valor")

#Carregar Shapelife
bairros_geo <- st_read("Shapes/Belém_2022/Bairros_Belem_2022.shp")
bairros_geo <- bairros_geo %>% select(NOMEBAIRRO,geometry)
bairros_geo <- bairros_geo[-1,]

#Tratamento da informação
##Filtrando informação
rm(df,x,z,bk,a,b,c,bins,pal,conteudo)
  df <- mortos_muni %>% filter(Municípios != "Pará",Ano == "2022")
  x <- cbind(geopa,df)

##Variável para teste Lógico
z <- x$Valor[x$Valor > 0]
bk <- getJenksBreaks(x$Valor,6,subset = NULL)
bk <- unique(bk)#Para evitar o erro que quartiles iguais
#____________________________________________
if (length(z) <= 2) {
  a <- max(x$Valor,na.rm = T)+0.01
  b <- min(x$Valor,na.rm = T)
  c <- round((a - b) / 2, digits = 4)
  bk <- seq(b, a, c)
}
#____________________________________________
x$Valor[x$Valor == 0] <- NA

bk <- unique(bk)
bins <- c(bk)
pal <- colorBin(c("#B6EDF0","#74B4E8","#1F83E0","#1D44B8","#090991"), domain = x$Valor, bins = bins)
conteudo <-
  sprintf(
    "<strong>%s</strong><br/> <b>Mortos:</b> %s",
    x$name_muni,
    format(x$Valor, big.mark = ".",decimal.mark = ",")
  ) %>% lapply(htmltools::HTML)
#Mapas com leafleft
leaflet(x,options = leafletOptions(minZoom = 0,maxZoom = 15)) %>%
  addTiles() %>%
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
        weight = 3,
        color = "white",
        dashArray = "3",
        fillOpacity = 0.5,
        bringToFront = TRUE
      ),
    label = conteudo,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto"
    )
  ) %>% addLegend(
    pal = pal,
    values = ~ Valor,
    opacity = 0.7,
    title = "Mortos",
    position = "bottomright",
    labFormat = labelFormat_decimal(big.mark = ".",decimal.mark = ",",digits = 2)
  )


bairros %>% leaflet() %>% addTiles() %>% addPolygons()


#-------------------------------------------------------------------------------




df <- mortos_muni %>% filter(Municípios != "Pará",Ano == "2022")
x <- cbind(geopa,df)

##Variável para teste Lógico
z <- x$Valor[x$Valor > 0]
bk <- getJenksBreaks(x$Valor,6,subset = NULL)
bk <- unique(bk)#Para evitar o erro que quartiles iguais
#____________________________________________
if (length(z) <= 2) {
  a <- max(x$Valor,na.rm = T)+0.01
  b <- min(x$Valor,na.rm = T)
  c <- round((a - b) / 2, digits = 4)
  bk <- seq(b, a, c)
}
#____________________________________________
x$Valor[x$Valor == 0] <- NA

bk <- unique(bk)
bins <- c(bk)
pal <- colorBin(c("#B6EDF0","#74B4E8","#1F83E0","#1D44B8","#090991"), domain = x$Valor, bins = bins)
conteudo <-
  sprintf(
    "<strong>%s</strong><br/> <b>Mortos:</b> %s",
    x$name_muni,
    format(x$Valor, big.mark = ".",decimal.mark = ",")
  ) %>% lapply(htmltools::HTML)
#Mapas com leafleft
leaflet(x,options = leafletOptions(minZoom = 0,maxZoom = 15)) %>%
  addTiles() %>%
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
        weight = 3,
        color = "white",
        dashArray = "3",
        fillOpacity = 0.5,
        bringToFront = TRUE
      ),
    label = conteudo,
    labelOptions = labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto"
    )
  ) %>% addLegend(
    pal = pal,
    values = ~ Valor,
    opacity = 0.7,
    title = "Mortos",
    position = "bottomright",
    labFormat = labelFormat_decimal(big.mark = ".",decimal.mark = ",",digits = 2)
  )



