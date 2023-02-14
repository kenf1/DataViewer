#ui
ui <- fluidPage(
  titlePanel("Data Viewer App"),
  h3("By: KF"),
  p("To use: enter link to dataset and click View Data"),
  sidebarLayout(
    sidebarPanel(
      textInput("file_link","Insert link to dataset file:"),
      selectInput("file_extension","Select extension of file:",c(".csv",".xlsx")),
      actionButton("execute_action","View Data")
      # actionButton("clear_dt","Clear table")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel(
          DT::dataTableOutput("dataset")
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
  #render table
  output$dataset <- DT::renderDT({
    DT::datatable(temp_df())
  })
}
