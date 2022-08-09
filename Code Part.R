# Read data ###############################################################################################################################
Plot.OR.Mat.6 <- read.csv('DataForForestPlot.csv')
# First six rows of the dataset
head(Plot.OR.Mat.6)

# Version 0.0 #############################################################################################################################
ggplot(Plot.OR.Mat.6, aes(x = OR, y = Variable)) +    # x is for X-axis | y is for Y-axis                  
  geom_point() +                                      # a function for plotting points
  geom_errorbarh(aes(xmin = Lower, xmax = Upper))     # a function for plotting two whiskers

# Version 1.0 #############################################################################################################################
ggplot(Plot.OR.Mat.6, aes(x = OR, y = Variable)) +                  # x is for X-axis | y is for Y-axis                  
  geom_point(shape = 18, size = 3) +                                # a function for plotting points
  geom_errorbarh(aes(xmin = Lower, xmax = Upper),                   # a function for plotting two whiskers
                 height = 0.25) +                                   # the length of vertical ticks 
  scale_x_continuous(trans = 'log',                                 # log transformation for values in X-axis
                     limits = c(0.005, 13),                         # range of X-axis in original scale
                     labels = label_number()) +                     # round digits
  xlab("Odds Ratio (95% CI, log scale)") +                          # X-axis label
  ggtitle('6-month Timepoint')                                      # title of plots

# Version 2.0 #############################################################################################################################
p1 <- 
  ggplot(Plot.OR.Mat.6, aes(x = OR, y = Variable)) +                  # x is for X-axis | y is for Y-axis                  
  geom_point(shape = 18, size = 3) +                                # a function for plotting points
  geom_errorbarh(aes(xmin = Lower, xmax = Upper),                   # a function for plotting two whiskers
                 height = 0.25) +                                   # the length of vertical ticks 
  scale_x_continuous(trans = 'log',                                 # log transformation for values in X-axis
                     limits = c(0.005, 13),                         # range of X-axis in original scale
                     labels = label_number()) +                     # round digits
  xlab("Odds Ratio (95% CI, log scale)") +                          # X-axis label
  ggtitle('6-month Timepoint') +                                    # title of plots
  theme_bw() +                                                      # dark-on-light theme
  theme(panel.border = element_blank(),                             # these four are for the background and grid
        panel.background = element_blank(),                    
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line.x = element_line(),                               # these two are for the axis line
        axis.line.y = element_blank(),
        axis.text.x = element_text(colour = "black", size = 11),    # there two are for texts in axes
        axis.text.y = element_text(colour = "black", size = 11),
        axis.ticks.x = element_line(),                              # these two are for ticks in axes
        axis.ticks.y = element_blank(),
        axis.title.x = element_text(),                              # these two are for titles in axes 
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = -0.065, face = "bold")) +  # the main title
  # hjust is for title position
  geom_vline(xintercept = 1,                                        # the position of vertical line
             color = "red",                                         # the color of line
             linetype = "dashed",                                   # the type of line
             # we used dashed line in here
             alpha = 0.5)                                           # the transparency level of the line 
p1

# Version 3.0 #############################################################################################################################
# Empty plot for Summary
table_base <- 
  ggplot(Plot.OR.Mat.6, aes(y = Variable)) +                          # everything in this plot is empty 
  ylab(NULL) + xlab('') + ggtitle('') + 
  xlim(0, 13) +                                                       # make sure this is the same as p1
  theme(panel.border = element_blank(),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line.x = element_blank(),
        axis.line.y = element_blank(),
        axis.text.x = element_text(color = "white", hjust = -3, size = 11),
        axis.text.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = -0.065, face = "bold"))      # make sure hjust is the same as p1

## OR point estimate table
tab1 <- table_base + geom_text(aes(y = Index, x = 1, label = Summary), size = 4, hjust = 0, vjust = -0.9)  
# eventually we attach the summary to the plot
grid.arrange(p1, tab1, 
             nrow = 1, ncol = 2)

# Version 4.0 #############################################################################################################################
p2 <- 
  ggplot(Plot.OR.Mat.6, aes(x = OR, y = Variable)) +                  # x is for X-axis | y is for Y-axis                  
  geom_point(shape = 18, size = 3) +                                # a function for plotting points
  geom_errorbarh(aes(xmin = Lower, xmax = Upper),                   # a function for plotting two whiskers
                 height = 0.25) +                                   # the length of vertical ticks 
  scale_x_continuous(trans = 'log',                                 # log transformation for values in X-axis
                     limits = c(0.005, 13),                         # range of X-axis in original scale
                     labels = label_number()) +                     # round digits
  ggtitle('12-month Timepoint') +                                    # title of plots
  theme_bw() +                                                      # dark-on-light theme
  theme(panel.border = element_blank(),                             # these four are for the background and grid
        panel.background = element_blank(),                    
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line.x = element_blank(),                               # these two are for the axis line
        axis.line.y = element_blank(),
        axis.text.x = element_blank(),    
        axis.text.y = element_text(colour = "black", size = 11),
        axis.ticks.x = element_blank(),                              # these two are for ticks in axes
        axis.ticks.y = element_blank(),
        axis.title.x = element_blank(),                              # these two are for titles in axes 
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = -0.065, face = "bold")) +  # the main title
  # hjust is for title position
  geom_vline(xintercept = 1,                                        # the position of vertical line
             color = "red",                                         # the color of line
             linetype = "dashed",                                   # the type of line
             # we used dashed line in here
             alpha = 0.5)                                           # the transparency level of the line 
# This is the empty 
table_base2 <- 
  ggplot(Plot.OR.Mat.6, aes(y = Variable)) +                          # everything in this plot is empty 
  ylab(NULL) + xlab('') + ggtitle('') + 
  xlim(0, 13) +                                                       # make sure this is the same as p1
  theme(panel.border = element_blank(),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line.x = element_blank(),
        axis.line.y = element_blank(),
        axis.text.x = element_text(color = "white", hjust = -3, size = 11),
        axis.text.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.title = element_text(hjust = -0.065, face = "bold"))      # make sure hjust is the same as p1

## OR point estimate table
tab2 <- table_base2 + geom_text(aes(y = Index, x = 1, label = Summary), size = 4, hjust = 0, vjust = 1.35)  
# eventually we attach all together!
grid.arrange(p2, tab2,
             p1, tab1,
             nrow = 2, ncol = 2)


























