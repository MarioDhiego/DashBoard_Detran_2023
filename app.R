


#Interface
# Carregar o arquivo geral
source("global.R")

ui <- dashboardPage(title="Anuário",
                    skin="blue", 
                    freshTheme=NULL,
                    preloader=NULL,
                    options=list(sidebarExpandOnHover=TRUE),
                    scrollToTop=TRUE,
                    footer=dashboardFooter(left="COPYRIGHT © DETRAN-PA - TODOS OS DIREITOS RESERVADOS",
                                           right="BELÉM - 2023"),
  dashboardHeader(title="ANUÁRIO ESTATÍSTICO DE SINISTROS DE TRÂNSITO",
                  titleWidth=600,
  #disable=FALSE,
 # fixed=FALSE,
  tags$li(class="dropdown",
          tags$style(".main-header {max-height:50px}"),
          tags$style(".main-header.logo {height:50px}")
  ),
  tags$li(div(img(src='detran1.jpeg',height="30px"),
              style="padding-top:12px; padding-right:350px;"),
          class="dropdown"
  ),
  tags$li(class="dropdown",
          tags$a(href="https://www.detran.pa.gov.br",
                 icon("road"),"DETRAN-PA",target="_blank")
  ),
  tags$li(class="dropdown",
          tags$a(href="https://twitter.com/DETRAN_PA",
                 icon("twitter"),"twitter",target="_blank")
  ),
  tags$li(class="dropdown",
          tags$a(href = "https://www.facebook.com/detranPARA",
                 icon("facebook"),"facebook",target = "_blank")
  ),
  tags$li(
    class="dropdown",
    tags$a(href="https://github.com/MarioDhiego",
           icon("github"), "AUTOR", target = "_blank")
  ),
 tags$li(
   class="dropdown",
   tags$a(href="",
          icon("question"), "AJUDA", target = "_blank")
 )
  ),
  dashboardSidebar(
    sidebarSearchForm(textId="SearchText",
                      buttonId="buttonSearch",
                      label="Busca",
                      icon=icon("folder-open")),
    #div(id = "sidebar_button",
    #    bsButton(inputId = "confirm", 
    #             label = "START", 
    #             icon = icon("play-circle"), 
    #             style = "danger")
    #),

    sidebarMenu(
      menuItem("ANUÁRIO",           tabName="anuario", icon=icon("address-card"),
               menuSubItem("Sobre Anuário",      tabName="sobre1",  icon=icon("book")),
               menuSubItem("Vídeo Institucional",tabName="video1",  icon=icon("video"))),
      menuItem("MICRODADOS",        tabName="microdados",        icon=icon("database")),
      menuItem("SÓCIOECONÔMICO",    tabName="socioeconomico",    icon=icon("male")),
      menuItem("CONDIÇÃO DA VÍTIMA",tabName="condicao_da_vitima",icon=icon("wheelchair")),
      menuItem("OCORRÊNCIAS",       tabName="ocorrencias",       icon=icon("calendar")),
      menuItem("RODOVIA ESTADUAL",  tabName="custo_hospitalar",  icon=icon("hospital")),
      menuItem("MAPAS",        tabName="localizacao",       icon=icon("globe")),
      menuItem("INDICADORES",tabName="indica1",icon=icon("dashboard"),
               menuSubItem("Taxa Òbito/Habitantes", tabName="Taxa1"),
               menuSubItem("Taxa Motorização", tabName="Taxa3"),
               menuSubItem("Taxa Òbito/Veículos", tabName="Taxa2")
               )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName="sobre1",
              tabBox(id="t1", width=12,
                     tabPanel("Anuário Web",icon=icon("address-card"),
                              fluidRow(column(width=8,position="left",
                                              tags$img(
                                                id="foto1",
                                                src="detran_stm.jpeg",
                                                controls="controls",
                                                width=750,height=500),
                                              tags$br() , 
                                              tags$a("Photo by Asdecom"),align="left"),
                                       column(width=4,
                                              tags$br(),
                                              tags$p(style="text-align:justify;font-si20pt",strong("A Assembléia Geral da Organização das Nações Unidas(ONU), por meio da Resolução A/RES/74/299, de 31 de agosto de 2020, lançou a Década de Ação pela Segurança Viária 2021/2030, com objetivo de reduzir em pelo menos 50/% de vítimas fatais e feridos graves no trânsito, bem como solicita aos Estados-Membros que continuem adotando medidas até 2030 para alcançar as metas dos Objetivos de Desenvolvimento Sustentável relacionados a Segurança Viária, em especial a meta 3.6.")),
                                              tags$br(),
                                              tags$p(style="text-align: justify;font-si20pt",strong("O DETRAN-PA, com sua missão fundamentada nos princípios da Política Nacional de Trânsito(Resolução do CONTRAN Nº514, de 18 de dezembro de 2014), apresenta, neste Painél, o Processo de Integração de Múltiplas Bases de Dados (Pareamento) sobre vítimas fatais por acidentes de trânsito.")),
                                              tags$br(),
                                              tags$p(style="text-align: justify;font-si20pt",strong("O Processo de Integração de Dados foi Realizado junto aos 144 municípios que compõem o Estado do Pará. Como Resultados foi criado uma Lista Ùnica de Vítimas Fatais(LUVF). Houve um incremento médio de 35/% em relação total de vítimas contabilizadas antes da utilização do processo de pareamento."))
                                       )
                              )
                     ),
                     tabPanel("Linha de Base", icon=icon("hospital"),
                              fluidRow(
                                column(
                                  width=4,position="center",
                                  tags$br(), 
                                  tags$p(style="text-align:justify;font-si20pt",strong("A Definição de Mortes e VÍtimas Graves foi Estabelecida com Base no Padrão da Organização Mundial de São de (WHO, 2022).")),
                                  tags$br(),
                                  tags$p(style="text-align:justify;font-si20pt",strong("1) VÍtima Fatal: uma pessoa morta imediatamente ou até 30 dias, como resultado do acidente de trânsito.")),
                                  tags$br(),
                                  tags$p(style="text-align:justify;font-si20pt",strong("2) VÍtima Grave: a pessoa hospitalizada por pelo menos 24 horas devido a ferimentos sofridos em acidentes de trânsito."))
                                )
                              ) 
                     ),
                     tabPanel("Alinhamento Técnico", icon = icon(""),
                              fluidRow(
                                column(
                                  width=4, position="center",
                                  tags$br(),
                                  tags$p(style="text-align: justify;font-si20pt",strong("A Lei nº 13.614/2018 criou Plano Nacional de Redução de Mortes e Lesões no Trânsito(PNATRANS), acrescentando o artigo 326-A ao Código de Trânsito Brasileiro (CTB), e propôs um novo desafio para a gestão de trânsito no Brasil e para os orgãos integrados do Sistema Nacional de Trânsito(SNT).")),
                                  tags$br(),
                                  tags$p(style="text-align: justify;font-si20pt",strong("Em 2020, foi realizado um diagnóstico, envolvendo todas as Unidades Federativas com o objetivo de estabelecer uma metodologia padronizada de coleta e tratamento dos dados sobre acidentes de trânsito e uma gestão baseada em análises e melhoria do sistema de segurança viária para todo Brasil. A fim de definir dados mínimos sobre acidentes de forma padronizada, alinhar as Unidades Federativas sobre o processo e sobre a implantação do modelo e, por fim, garantir análises e atuação sobre as causas críticas com intuito de minimizar os acidentes de trânsito no país.")),
                                  tags$br(),
                                  tags$p(style="text-align: justify;font-si20pt",strong("Nesse Contexto, o Anuário Estatístico de Acidentes de Trânsito, será construído em Alinhamento ao Manual de Gestão do RENAEST (Resolução do CONTRAN Nº808/2020), utilizando metodologias factíveis com estatísticas de trânsito padronizada para todo o Território Nacional, e aos Objetivos de Desenvolvimento Sustentáveis (Resolução da ONU Nº70/2015)."))
                                )  
                              )
                     ),
                     tabPanel("Software's", icon=icon(""),
                              fluidRow(
                                column(width=4,position="center",
                                       tags$br(),
                                       tags$p(style="text-align: justify;font-si20pt",strong("Para Criação do Anuário em Formato Web com Dasboard Interativos, foi Desenvolvido um script em Linguagem de Programação R-PROJECT Versão 4.2.2 e um Ambiente de Desenvolvmento Integrado(IDE) Chamado Rstudio Versão 1.4.1.7, utilizando um Processo de Extração-Transformação-Carga(ETL) com uso de Vários bibliotecas, para o Ambiente Windows.")),
                                       tags$br(),
                                       tags$p(style="text-align: justify;font-si20pt",strong("O Anuário em versão web, implementado em linguagem de programação R, possui a vantagem de ser um ambiente de computação estatística no formato de Projeto de Software Livre de Código Aberto (open source), ou seja, pode ser utilizado sem custos de licença (R DEVELOPMENT CORE TEAM, 2022)."))
                                )
                              )
                     ),
                     tabPanel("Material e Métodos", icon=icon(""),
                              fluidRow(
                                column(width=4,position="center",
                                       tags$br(), 
                                       tags$br("Metodologia"), 
                                       tags$br(),
                                       tags$p(style="text-align:justify;font-si20pt",strong("A Metodologia Adotada para o Planejamento e execução do Projeto foi apoiada na Estratégia de Proatividade e Parceria Desenvolvida pela GRSP (CARDITA e DI PIETRO, 2010).")),
                                       tags$br(),
                                       tags$p(style="text-align:justify;font-si20pt",strong("A Estratégia de Proatividade e Parceria (EPP) consiste em um Modelo Desenvolvido para Tratar das questões de Segurança no Trânsito.")),
                                       tags$br(),
                                       tags$p(style="text-align:justify;font-si20pt",strong(" As Etapas a Serem Desenvolvidas Durante Aplicação do Projeto são:")),
                                       tags$br(),
                                       tags$p(style="text-align:justify;font-si20pt",strong("1) Articulação Intersetorial e Formação")),
                                       tags$p(style="text-align: justify;font-si20pt",strong("2) Qualificação, Integração e Análise de Dados")),
                                       tags$p(style="text-align: justify;font-si20pt",strong("3) Ações Integradas de Segurança no Trânsito")),
                                       tags$p(style="text-align: justify;font-si20pt",strong("4) Monitoramento, Avaliação de Desenpenhp e Reconhecimento")),
                                       tags$p(style="text-align: justify;font-si20pt",strong("5) Revisão Geral Anual")),
                                       tags$p(style="text-align: justify;font-si20pt",strong("6) Renovação e Expansão"))
                                ),
                                tags$br(),
                                column(width=4,position="center",
                                       tags$br("Pareamento"),
                                       tags$br(),
                                       tags$p(style="text-align:justify;font-si20pt",strong("Para o Relacionamento das Múltiplas Bases de Dados(pareamento), utilizou-se o Método Probabilístico de Relacionamento de Registro desenvolvido por Fellegi e Sunter (1969).")),
                                       tags$br(),
                                       tags$p(style="text-align:justify;font-si20pt",strong("A principal dificuldade do pareamento é a não existência de um identificador único que permita vincular um Boletim de Ocorrência à uma Autorização de Internação Hospitalar ou Declaração de Òbito.")),
                                       tags$br(),
                                       tags$p(style="text-align:justify;font-si20pt",strong("O Processo de Padronização de Variáveis, utilizando o Método Probabilístico, foi realizado para homogeneizar as variáveis das diferentes bases de dados, visando minimizar erros no processo de pareamento, com a alocação de registros da mesma vítima num bloco lógico para evitar: erros fonéticos, perda de informação, etc."))
                                )
                              )
                     ),
                     tabPanel("Créditos", icon=icon(""),
                              fluidRow(
                                column(width=4,position="center",
                                       tags$br(),
                                       tags$p(style="text-align: justify;font-si20pt",strong("DEPARTAMENTO DE TRÂNSITO DO ESTADO DO PARÁ - DETRAN-PA")),
                                       tags$p(style="text-align: justify;font-si20pt",strong("RENATA MIRELA COELHO")),
                                       tags$p(style="text-align: justify;font-si20pt",strong("AVENIDA: AUGUSTO MONTENEGRO KM 03 S/N")),
                                       tags$p(style="text-align: justify;font-si20pt",strong("CEP: 66635-918 - PARQUE VERDE - BELÉM - PARÁ")),
                                       tags$br(),
                                       tags$p(style="text-align: justify;font-si20pt",strong("Esta publicação deve ser citada como: Departamento de Trânsito do Estado do Pará (DETRAN-PA), Anuário Estatístico de Acidentes de Trânsito, 2020 (LC/PUB.2021/1-P), Belém, 2021.")),
                                       tags$br(),
                                       tags$p(style="text-align: justify;font-si20pt",strong("A autorização para a reprodução total ou parcial deste trabalho deve ser solicitada ao Departamento de Trânsito do Estado do Pará, Gerência de Análise e Estatística de Trânsito, gerest@detran.pa.gov.br. Os Estados membros das Nações Unidas e suas instituições governamentais podem reproduzir este trabalho sem autorização prévia. Solicita-se apenas que mencionem a fonte e informem ao DETRAN-PA de tal reprodução.")
                                       ),
                                       tags$br(),
                                       
                                )
                              )        
                     )
              )
      ),
      tabItem(tabName="video1",
              tabBox(id="t2", width=12,
                     tabPanel("Video Institucional",icon=icon("video"),
                              fluidRow(
                                column(width=8,position="center",
                                       tags$br("Projeto Strengthening Road Traffic Enforcement in Brazil"),
                                       tags$video(
                                         id = "videoID",
                                         type="video/mp4",
                                         src="video_detran.mp4",
                                         width=750, height=500,
                                         controls="controls"
                                       ),
                                       tags$br() , 
                                       tags$a("Video: by Asdecom"),align="left"),
                                column(width=4,
                                       tags$br(),
                                       tags$p(style="text-align:justify;font-si20pt",strong("O Departamento de Trânsito do Estado do Pará obteve o Projeto “Strengthening Road Traffic Enforcement
in Brazil” aprovado e financiado pela (United Road Safety Fund), com duração de 12 meses, se constituindo
o único selecionado do Brasil, que somado as propostas de alguns outros países, formam o conjunto de projetos
nacionais administrados pelo Fundo, coordenado e supervisionados por diversas Agências e Comissões
Regionais das Nações Unidas.")
                                       ),
                                       tags$br(),
                                       tags$p(style="text-align: justify;font-si20pt",strong("Concomitantemente, o Projeto Brasileiro é supervisionado pela Comissão Econômica das Nações
Unidas para América Latina e Caribe (CEPAL), coordenado e implementado pelo DETRAN-PA
em parceria com Conselho Estadual de Trânsito do Estado do Pará (CETRAN-PA), e tem como objetivo
contribuir para a redução de mortes e lesões no Trânsito através das atividades de Educação, Engenharia e
Fiscalização em nível Estadual."))))))),
      tabItem(tabName = "anuario",           fluidRow()),
      tabItem(tabName = "microdados",        fluidRow(microdados_ui("microdados"))),
      tabItem(tabName = "socioeconomico",    fluidRow(socioeconomico_ui("socioeconomico"))),
      tabItem(tabName = "condicao_da_vitima",fluidRow(cond_vitima_ui("cond_vitima"))),
      tabItem(tabName = "ocorrencias",       fluidRow(ocorrencia_ui("ocorrencia"))),
      tabItem(tabName = "custo_hospitalar",  fluidRow(custo_hospitalar_ui("custo_hospitalar"))),
      tabItem(tabName = "localizacao",       fluidRow(localizacao_ui("localizacao")))
    )
  )
)
  
#Servidor
server <- function(input, output) {
  microdados_Server("microdados")
  socioeconomico_Server("socioeconomico")
  cond_vitima_Server("cond_vitima")
  ocorrencia_Server("ocorrencia")
  custo_hospitalar_Server("custo_hospitalar")
  localizacao_Server("localizacao")
}

shinyApp(ui, server)







#==============================================================================







