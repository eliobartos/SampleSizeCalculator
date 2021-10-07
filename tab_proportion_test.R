

tab_proportion_test = 
  tabPanel('Proportion Test',
        sidebarPanel(width = 4,
          numericInputIcon("baseline",
                           label = "Baseline %",
                           value = 30,
                           min = 0.0001,
                           max = 99.9999,
                           icon = icon('percent')),
          numericInputIcon("improvement",
                           label = "Improvement %",
                           value = 10,
                           min = 0,
                           icon = icon('percent')),
          radioButtons("improvement_type",
                       label = "Improvement Type",
                       choiceValues = c("relative", "absolute"),
                       selected = c("relative"),
                       choiceNames = c("Relative", "Absolute")),
          numericInputIcon("significance",
                           label = "Statistical Significance (alpha)",
                           value = 5,
                           min = 0.00001,
                           max = 99.99999,
                           icon = icon('percent')),
          numericInputIcon("wanted_power",
                           label = "Statistical Power (1 - Beta)",
                           value = 80,
                           min = 0.00001,
                           max = 99.99999,
                           icon = icon('percent')),
          actionButton('calculate', 'Calculate')
        ),
        
      mainPanel(
        fluidRow(
          column(6,
                 h4("Users needed per AB test group:"),
                 br(),
                 h1(textOutput("sample_size"), align = "center")
          ),
          column(6,
                 h4("Instructions"),
                 h5("Baseline:"),
                 p("Conversion rate you currently expect.")
          )  
        )
     )
)
