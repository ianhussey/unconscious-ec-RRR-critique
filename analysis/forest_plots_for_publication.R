# Open and run analysis.Rmd so that the results_combined_criteria object is present in your environment. 
# Then run this script. 

setwd("~/git/unconscious-ec-RRR-critique/analysis")

pdf(NULL)
dev.control(displaylist = "enable")

par(mfrow = c(2, 1))

size <- 1

metafor::forest(results_combined_criteria$fitted_model,
                xlab = substitute(paste("Hedges' ", italic('g'))),
                addcred = TRUE,
                xlim = c(-1.4, 1.8),
                at = c(-0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2),
                refline = 0,
                mlab = add_heterogeneity_metrics_to_forest(results_combined_criteria$fitted_model))
text(-1.4, 14, "Compound awareness exclusion criterion", pos = 4)
text(1.8, 13.85, substitute(paste("Hedges' ", italic('g'), " [95% CI]")), pos = 2)


metafor::forest(fit_moderator, 
                ilab = round(data_moderator_meta$exclude_all_four_combined, 2)*100,
                ilab.xpos = 1.2,
                ilab.pos = 2,
                xlab = substitute(paste("Hedges' ", italic('g'))),
                addcred = TRUE,
                xlim = c(-1.4, 1.8),
                at = c(-0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1.0),
                refline = 0)
text(-1.4, 13.95, "Moderation by site exclusion rate", pos = 4)
text(1.2, 13.95, "% Aware", pos = 2)
text(1.8, 13.85, substitute(paste("Hedges' ", italic('g'), " [95% CI]")), pos = 2)

p1 <- recordPlot()
invisible(dev.off())

# # display the saved plot
# grid::grid.newpage()
# p1

pdf("forest_plots.pdf",
    width = 10, 
    height = 12)
p1
dev.off()
