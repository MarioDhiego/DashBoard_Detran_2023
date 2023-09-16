#Carregando shapefile
bairros_geo <- st_read("Shapes/Belém_2022/Bairros_Belem_2022.shp")
bairros_geo <- bairros_geo %>% select(NM_BAIRRO,geometry)
bairros_geo <- bairros_geo[-1,]
bairros_geo <- bairros_geo %>% rename(Bairros = NM_BAIRRO)


write_rds(bairros_geo,"bairros_geo.rds")

write.xlsx(bairros,"bairros.xlsx")

# bairros_bairro <- st_read("Shape_belém_dados/shape_dados.shx")
# bairros <- bairros_bairro %>% select(LIM_BAIR_1,NOME) %>% arrange(NOME)
# bairros <-  bairros %>% rename(Valor = LIM_BAIR_1)
# bairros %>% keep(negate(is.list))
# bairros <- st_drop_geometry(bairros)

ascidentes <- read_excel("data/ACIDENTES_BAIRRO_BELÉM_2016_2019.xls",sheet = "Arrumados")
ascidentes <- ascidentes %>% pivot_longer(!Bairros,names_to = "Ano",values_to = "Valor")
write_rds(ascidentes,"ascidentes.rds")

#MAPA
#Tratamento da informação
##Filtrando informação
rm(df,x,z,bk,a,b,c,bins,pal,conteudo)

#funiconando desde aqui

x <- ascidentes %>% filter(Ano == "2016")
x <- cbind(bairros_geo,x)

z <- x$Valor[x$Valor > 0]
bk <- unique(getJenksBreaks(z, 6, subset = NULL))
x$Valor[x$Valor == 0] <- NA
bins <- c(bk)
if (length(bins) < 2 || length(bins) < 5) {
  bins <- 5
}

pal <- colorBin(c("#B6EDF0","#74B4E8","#1F83E0","#1D44B8","#090991"), domain = x$Valor, bins = bins)
conteudo <-
  sprintf(
    "<strong>%s</strong><br/> <b>Mortos:</b> %s",
    x$Bairros,
    format(x$Valor, big.mark = ".",decimal.mark = ",")
  ) %>% lapply(htmltools::HTML)
#Mapas com leafleft
x %>% leaflet(options = leafletOptions(minZoom = 0,maxZoom = 15)) %>%
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
