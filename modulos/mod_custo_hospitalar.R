#MÓDULO CUSTO HOSPITALAR

custo_hospitalar_ui <- function(id) {
  
  fluidPage(
    navbarPage(
      title = "MICRODADOS RODOVIAS",
      tabPanel("Base de Dados",
        fluidRow(
          box(
            width = 12,
            title = textOutput(NS(id,"rodovia1")),
            status = "primary",
            solideHeder = TRUE,
            collapsible = TRUE,
            height = 35,
            withSpinner(
              dataTableOutput(NS(id, "tab1")),
              type = 8,
              color = "blue",
              size = 0.5
            ),
            footer = list(
              column(10,
                     tags$b("Fonte: "), "Projeto Pareamento: SISP-PC/PRE/PRF/IML/CBM/SAMU/AIH"),
              downdoload_ui(NS(id,"d3")) 
            )
            
          )
          
        )
      ),
      tabPanel(
        "Fonte de Dados",
        fluidRow(
          box(
            width = 12,
            title = "Fontes de Dados",
            status = "primary",
            solideHeder = TRUE,
            collapsible = TRUE,
            height = 35,
            div(class = "elemente",
                DiagrammeROutput(NS(id,"fonte11"),width = "100%")
            )
            
          )
        )
      )
      
      
    )

  )
 
}

#Função do modulo servidor
custo_hospitalar_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    

    
  output$tab1 <- DT::renderDataTable({
  setwd("C:/Users/mario.valente/Documents/GitHub_scripts/DashBoard_Detran_2023-main/data")
  Sinistros_Rodovias <- read_excel("Sinistros_Rodovias.xls")
  datatable(Sinistros_Rodovias,
                filter = "top", 
                #filter = "bottom",
                plugins='natural',
                extensions='Buttons',
                options=list(dom='Blfrtip',buttons=c('copy','csv','excel','pdf','print'),
                             engthMenu=list(c(5,50,500,2500,-1)), c(5,50,1000,2500,"All"),
                             pageLength=5, 
                             autoWidth=TRUE,
                             scrollX=TRUE),
                rownames=FALSE,
                class='cell-border compact stripe hover row-border order-column dt-body-right',
                editable='cell',
                colnames=c('Ano','Rodovias','Municípios','Meses','Período',
                           'Tipo de Acidentes','Feridos', 'Mortos', 'Causa'),
                caption='Tabela 1. Base de Dados sobre Vítimas Fatais por Sinistros de Trânsito em Rodovias Estaduais.')
    })

  })
}


#Play do Módulo
ui <- dashboardPage(header = dashboardHeader(),title = "Sinistros em Rodovias Estaduais",
                    sidebar = dashboardSidebar(),
                    body = dashboardBody(fluidPage(custo_hospitalar_ui("custo_hospitalar"))))

server <- function(input, output) {
  custo_hospitalar_Server("custo_hospitalar")
}

shinyApp(ui, server)
