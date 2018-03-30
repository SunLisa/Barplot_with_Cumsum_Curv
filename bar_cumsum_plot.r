##load ggplot2
library(ggplot2)

##example data
#example of 11 bins of 0-100 by 10s, simulating count with random generated integer
#can be seen as histogram$count
example<-data.frame(bins=seq(0,100,10),count=sample.int(20,11,replace=TRUE))

##calculate cumsum ratio
example$cumsum.ratio<-cumsum(example$count)/sum(example$count)

##plotting with ggplot2
ggplot(example, aes(x=bins,y=count,group=1)) +
#setting aes for all, group=1 since only 1 record each value
geom_bar(stat='identity') +
#generating barplot like histogram
geom_line(aes(x=bins,y=cumsum.ratio*max(example$count))) +
#generating cumulative percent curve
scale_y_continuous(sec.axis = sec_axis(~./(max(example$count)/100), name = "[%]"))
#generating second y-axis

##plot finished
#future features: color by group, multitple cumsum curv by group

#simple script just
