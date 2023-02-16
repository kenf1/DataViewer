#ui
ui <- fluidPage(
  #app main page
  navbarPage("Data Viewer App",
    tabPanel("View Data",
      sidebarLayout(
        sidebarPanel(
          h5("Application by KF to preview and download tabular datasets from link."),
          p("For more information and link to GitHub repo, visit the About tab."),
          textInput("file_link","Insert link to dataset file:"),
          selectInput("file_extension","Select extension of file:",c(".csv",".xlsx")),
          actionButton("execute_action","View Data")
         ),
      mainPanel(
        tabsetPanel(
          tabPanel(
            DT::dataTableOutput("dataset")
        )
       )
      )
     )
    ),
    #about tab
    tabPanel("About",
     tags$div(style="width:40%;text-align:center;margin-left:auto;margin-right:auto;", 
      class="well",
      tags$h3("DataViewer App"),
      tags$p("This app is created by KF with R, Shiny, and Docker."),
      tags$br(),
      tags$p("Leave feedback or feature requests under this repo's Issues page."),
      tags$br(),
      tags$html(
        tags$body(a(href="https://github.com/kenf1/DataViewer","DataViewer GitHub Repo"))
        )
      )
    )
  )
)

#server
server <- function(input,output){
  #using if else w/o any other conditions bcuz those are only options user is given
  temp_df <- eventReactive(input$execute_action,{
    if(input$file_extension==".csv"){
      read_csv(input$file_link)
    }else{
      readxl::read_xlsx(input$file_link)
    }
  })
  #render table w/ download button
  output$dataset <- DT::renderDT({
    DT::datatable(temp_df(),
                  extensions='Buttons',
                  options=list(
                    dom='Blfrtip',buttons='csv',pageLength=10))
  })
}
