custom_box = function(title, text) {
  HTML(paste0("
      <div class=\"alert alert-dismissible alert-secondary\">
      <h5 style=\"color:#666666\"><strong>", title, "</strong></h5>
      <p>", text, "</p>
      </div>
  "))
}

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
                 custom_box("Baseline %", 
                            "Success rate you currently have or expect from 
                            control group."),
                 custom_box("Improvement %", 
                            "Percent of improvement for variation group
                            that you want to detect with given statistical power."),
                 custom_box("Improvement Type", 
                            "Should Improvement % be added to baseline as absolute 
                            value or relative % from baseline."),
                 custom_box("Statistical Significance (alpha)", 
                            "Desired statistical significance for the test, 
                            probability of making type I error."),
                 custom_box("Statistical Power", 
                            "Desired statistical power for the test, 
                            probability of rejecting null hypothesis when alternative 
                            hypothesis with specified baseline and improvement is correct.")
          )  
        )
     )
)
