


shinyServer(function(input, output) {
 
    #sold avocados by week
    output$volume <- renderPlot({
        df %>%
            gather(key="PLU", value="Volume", Small_4046,Medium_4225,Large_4770,Other_PLU) %>%
            filter(Date>input$dates[1] & Date<input$dates[2]) %>%
            group_by(PLU,Date) %>%
            summarise(PLU_Vol = sum(as.numeric(Volume))) %>%
            ggplot(aes(x=Date, y=PLU_Vol)) + 
            geom_col(aes(fill=PLU)) +
            scale_y_continuous(labels = scales::comma) +
            xlab("Weeks") + ylab("Avocados Sold")
    })
    
    #annual volume chart
    output$year_volume <- renderPlot({
        df %>%
            gather(key="PLU", value="Volume", Small_4046,Medium_4225,Large_4770,Other_PLU) %>%
            filter(Date>input$dates[1] & Date<input$dates[2]) %>%
            group_by(PLU,Year) %>%
            summarise(PLU_Vol = sum(as.numeric(Volume))) %>%
            ggplot(aes(x=Year,y=PLU_Vol)) +
            geom_col(position = 'dodge', aes(fill=PLU)) +
            scale_y_continuous(labels = scales::comma) +
            xlab("Weeks") + ylab("Avocados Sold")
    })
    
    #annual bags sold chart
    output$year_bags <- renderPlot({
        df %>%
            gather(key="Bags", value="Volume", Small_Bags,Medium_Bags,Large_Bags) %>%
            filter(Date>input$dates[1] & Date<input$dates[2]) %>%
            group_by(Bags,Year) %>%
            summarise(Bag_Vol = sum(as.numeric(Volume))) %>%
            ggplot(aes(x=Year,y=Bag_Vol)) +
            geom_col(position = 'dodge', aes(fill=Bags)) +
            scale_y_continuous(labels = scales::comma) +
            xlab("Weeks") + ylab("Bags Sold")
    })
    
    #bag distribution by weeks
    output$bags <- renderPlot({
        df %>%
            gather(key="Bags", value="Volume", Small_Bags,Medium_Bags,Large_Bags) %>%
            filter(Date>input$dates[1] & Date<input$dates[2]) %>%
            group_by(Bags,Date) %>%
            summarise(Bags_Vol = sum(as.numeric(Volume))) %>%
            ggplot(aes(x=Date, y=Bags_Vol)) + 
            geom_col(aes(fill=Bags)) + 
            scale_y_continuous(labels = scales::comma) +
            xlab("Weeks") + ylab("Bags Sold")
    })
    
    #main price chart
    output$price <- renderPlot({
        if (input$type == 'both'){
            df %>%
                filter(Date>input$dates[1] & Date<input$dates[2]) %>%
                group_by(Date) %>%
                summarise(Price_for_Date = mean(Avg_Price)) %>%
                ggplot(aes(x=Date, y= Price_for_Date)) + 
                geom_line(color='blue')
        }else if(input$type == 'compare'){
            df %>%
                filter(Date>input$dates[1] & Date<input$dates[2]) %>%
                group_by(Type,Date) %>%
                summarise(Price_for_Date = mean(Avg_Price)) %>%
                ggplot(aes(x=Date,y=Price_for_Date)) + geom_line(aes(colour=Type))
        }else{
            df %>% 
                filter(Date>input$dates[1] & Date<input$dates[2]& Type==input$type) %>%
                group_by(Date) %>%
                summarise(Price_for_Date = mean(Avg_Price)) %>%
                ggplot(aes(x=Date, y= Price_for_Date)) + 
                geom_line(color='blue')
        }
    })
    
    #raw dataframe
    output$table = DT::renderDataTable({df})
    
})
