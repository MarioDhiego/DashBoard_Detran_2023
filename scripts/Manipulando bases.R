


base1 <- base_01 %>% filter(Ano == "2020")
base2 <- base_01 %>% filter(Ano == "2021")
base3 <- base_01 %>% filter(Municípios == "Belém")

unique(base3$Bairro)
belem_ocorrencia <- tabyl(base3$Bairro)

a <- full_join(bairros_geo,belem_ocorrencia,"NM_BAIRRO")

belem_ocorrencia <- belem_ocorrencia %>% dplyr::rename(NM_BAIRRO = `base3$Bairro`)

