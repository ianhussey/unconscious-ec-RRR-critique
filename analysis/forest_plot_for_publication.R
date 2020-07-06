# Open and run analysis.Rmd so that the results_combined_criteria object is present in your environment. 
# Then run this script. 

library(tidyverse)
library(metafor)

# add heterogeneity metrics to metafor forest plot
add_heterogeneity_metrics_to_forest <- function(fit) {
  bquote(paste("RE Model (", 
               italic('I')^"2", " = ", .(formatC(format(round(fit$I2, 1), nsmall = 1))),
               "%, ", italic('H')^"2", " = ", .(formatC(format(round(fit$H2, 1), nsmall = 1))), ")"))
}

setwd("~/git/unconscious-ec-RRR-critique/analysis")
results_combined_criteria <- read_rds("models/results_combined_criteria.rds")


pdf(NULL)
dev.control(displaylist = "enable")

par(mfrow = c(1, 1))

size <- 1

metafor::forest(results_combined_criteria$fitted_model,
                xlab = substitute(paste("Hedges' ", italic('g'))),
                addcred = TRUE,
                xlim = c(-1.6, 2.1),
                at = c(-0.8, -0.4, 0, 0.4, 0.8, 1.2),
                refline = 0,
                mlab = add_heterogeneity_metrics_to_forest(results_combined_criteria$fitted_model))
text(-1.6, 14, "Site", pos = 4)
text(2.1, 13.85, substitute(paste("Hedges' ", italic('g'), " [95% CI]")), pos = 2)

p1 <- recordPlot()
invisible(dev.off())

# # display the saved plot
# grid::grid.newpage()
# p1

pdf("forest_plot.pdf",
    width = 7, 
    height = 5)
p1
dev.off()
