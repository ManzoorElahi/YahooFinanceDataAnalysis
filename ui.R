library(RCurl)
library(shiny)
library(lubridate)
library(ggplot2)
library(reshape)

shinyUI(fluidPage(

  titlePanel("Yahoo Finance Data Analysis"),

  sidebarLayout(
    sidebarPanel(
       textInput("sym1", label = h6("Enter the first organization's Symbol"), 
                 value = "HDFCBANK.NS"),
       textInput("sym2", label = h6("Enter the second organization's Symbol"), 
                 value = "ABCIL.BO"),
       dateRangeInput("dates", label = h6("Select the Date range")),
       sliderInput("parp", label = h6("Autoregression Parameter"),
                   min = 0, max = 10, value = 2),
       sliderInput("pard", label = h6("Integration Parameter"),
                   min = 0, max = 10, value = 0),
       sliderInput("parq", label = h6("Moving Average Parameter"),
                   min = 0, max = 10, value = 2)
    ),
    

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("p1"),
      br(""),
      plotOutput("p2"),
      br(""),
      tableOutput("t1"),
      br(""),
      plotOutput("p3"),
      br(""),
      tableOutput("t2"),
      br(""),
      plotOutput("p4"),
      br(""),
      tableOutput("t3"),
      br(""),
      p("Price used is the Adjusted closing price"),
      h5("Autoregressive integrated moving average (ARIMA):"),
      p("In statistics and econometrics, and in particular in time series analysis, an autoregressive integrated moving average (ARIMA) model is a generalization of an autoregressive moving average (ARMA) model. These models are fitted to time series data either to better understand the data or to predict future points in the series (forecasting).The model is generally referred to as an ARIMA(p,d,q) model where parameters p, d, and q are non-negative integers that refer to the order of the autoregressive, integrated, and moving average parts of the model respectively."),
      em({
"• ME: Mean Error;
• RMSE: Root Mean Absolute Error;
• MAE: Mean Absolute Error;
• MPE: Mean Percentage Error;
• MAPE: Mean Absolute Percentage Error;
• MASE: Mean Absolute Scaled Error;
• ACF1: Autocorrelation of errors at lag 1."})
    )
  )
))
