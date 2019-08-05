

shinyUI(fluidPage(

    dashboardPage(
        skin = 'green',
        dashboardHeader(
            title = "Avocado Prices",
            titleWidth = 230,
            tags$li('Jimmy Jing',
                    style = 'text-align: right; padding-right: 13px; padding-top:17px; font-family: Arial, Helvetica, sans-serif;
                              font-weight: bold;  font-size: 13px;',
                    class='dropdown'),
            tags$li(a(href = 'https://github.com/jimmy-jing/avocado_shiny',
                      img(src = 'github.png',title = "Github Repository", height = "19px")),
                    class = "dropdown")
        ),
        dashboardSidebar(
            sidebarUserPanel(
                'Jimmy Jing',
                subtitle = "Saving America from Avocalypse"
            ),
            sidebarMenu(
                menuItem(text = 'Overview', icon = icon('black-tie'), tabName = 'overview'),
                menuItem(text = 'Graphs', icon = icon('chart-bar'), tabName = 'graphs'),
                menuItem(text = 'Data', icon = icon('database'), tabName = 'data')
            )
        ),
        dashboardBody(
                tags$head(
                    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                ),
                tabItems(
                    tabItem(tabName='graphs',
                        fluidRow(
                            column(2, h3("Selection Options:"), align="center"),
                            column(3, selectInput("type", label= h3("Type"), choices=list('both',"conventional",'organic','compare'))),
                            column(3, dateRangeInput("dates", label=h3('Date Range'), 
                                                     start="2015-01-04", end="2018-03-25"))
                        ),
                        fluidRow(
                            plotOutput("price")
                        ),
                        fluidRow(
                            column(6, plotOutput("volume")),
                            column(6, plotOutput("bags"))
                        ),
                        fluidRow(
                            column(6, plotOutput("year_volume")),
                            column(6, plotOutput("year_bags"))
                        )
                        ),
                    tabItem(tabName = "data",
                            fluidRow(box(DT::dataTableOutput("table"))),
                            fluidRow(column(12, align='center', img(src='avocado_tree.jpg', width='500', height='380')))
                    ),
                    tabItem(tabName='overview',
                            img(src='avosizeguideBIG.jpg', width="85%", height="540",aligh='center'),
                            
                            fluidRow(
                                h1('A Look at Avocado Prices in the US', align='center'),
                                h2("Overview", align = 'center'),
                                box(width=12, title = "The Data",
                                    "The data used is from kaggle regarding avocado prices in the US from 2015 up to March 2018",
                                    br(),
                                    br(),
                                    "Below is an explanation of the different components of the dataset:",
                                    br(),
                                    tags$ol(
                                        br(),
                                        tags$li(
                                            "Date: Each date refers to the data collected from various cash registers for the week ending on the specified date."
                                        ),
                                        br(),
                                        tags$li(
                                            "Avg_Price: The average price of each individual avocado sold during that week."
                                        ),
                                        br(),
                                        tags$li(
                                            "Total Volume: The total number of individual avocados sold."
                                        ),
                                        br(),
                                        tags$li(
                                            "Small_4046: Avocados sold with the PLU of 4046. The PLUs listed here focus on the main varieties of Hass Avocadoes."
                                        ),
                                        br(),
                                        tags$li(
                                            "Medium_4225: Avocados sold with the PLU of 4225. For Hass avocados, they are ordered by size of the size of individual avocados."
                                        ),
                                        br(),
                                        tags$li(
                                            "Large_4770: Avocados sold with the PLU of 4770."
                                        ),
                                        br(),
                                        tags$li(
                                            "Other_PLU: Avocados sold with other various unlisted PLUs. The three listed above are the main varieties tracked."
                                        ),
                                        br(),
                                        tags$li(
                                            "Total_Bags: Total number of bags of avocados sold. The bags will vary in size and each size does not have a standard number of avocados"
                                        ),
                                        br(),
                                        tags$li(
                                            "Small_Bags/Medium_Bags/Large_Bags: Actual number of bags sold. There is no standardized size of each type of bags. This metric is mostly tracked to gauge frequency of purchases."
                                        ),
                                        br(),
                                        tags$li(
                                            "Type: The methods used in growing the avocado. Conventional or organic."
                                        ),
                                        br(),
                                        tags$li(
                                            "Region: Each region refers to an urban area but the boundaries of the sales are not limited to that city/cities alone. Detroit avocados can be found outside of Detroit and there is no quantitative metric for radius of sale."
                                        )
                                        
                                    ),
                                    solidHeader = TRUE,
                                    height = "670px"
                                ),
                                tags$iframe(src="https://www.youtube.com/embed/whNYlkV-TMU", width="80%", height="600")
                            )
                            )
                )
                
    )
    )
   
))
