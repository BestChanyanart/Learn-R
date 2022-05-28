df %>%
    gather(variable, value) %>%
    ggplot()+
    geom_bar(aes(x = variable, fill = value),
             color = " black",
             position = "stack", show.legend = FALSE)+
    geom_text(stat = "count",
              aes(x = variable,
                  label =  value,
                  y = ..count..,
                  group = value),
              position = "stack", vjust = 1) +
    scale_y_continuous(labels =  c("0%", "25%", "50%", "75%", "100%"),
                       breaks = c(0, 5, 10, 15, 20))