#MÓDULO ANUÁRIO

anuario_ui <- function(id) {
  fluidPage()
}

#Função do modulo servidor
anuario_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
  })
}


#Play do Módulo
ui <- dashboardPage(header = dashboardHeader(),
                    title = "anuario",
                    sidebar = dashboardSidebar(),
                    body = dashboardBody(fluidPage(anuario_ui("anuario"))))

server <- function(input, output) {
  anuario_Server("anuario")
}

shinyApp(ui, server)
