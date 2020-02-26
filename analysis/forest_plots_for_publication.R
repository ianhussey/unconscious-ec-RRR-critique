# Open and run analysis.Rmd so that the results_combined_criteria object is present in your environment. 
# Then run this script. 

setwd("~/git/unconscious-ec-RRR-critique/analysis")

pdf(NULL)
dev.control(displaylist = "enable")

size <- 1

metafor::forest(results_combined_criteria$fitted_model,
                xlab = substitute(paste("Hedges' ", italic('g'))),
                addcred = TRUE,
                xlim = c(-1.4, 1.8),
                at = c(-0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2),
                refline = 0,
                mlab = add_heterogeneity_metrics_to_forest(results_combined_criteria$fitted_model))
text(-1.4, 14, "Combined exclusion criteria", pos = 4)
text(1.8, 13.85, substitute(paste("Hedges' ", italic('g'), " [95% CI]")), pos = 2)

p1 <- recordPlot()
invisible(dev.off())

# # display the saved plot
# grid::grid.newpage()
# p1

pdf("forest_plot.pdf",
    width = 10, 
    height = 6)
p1
dev.off()
