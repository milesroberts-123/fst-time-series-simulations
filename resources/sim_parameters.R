# fst-time-series-simulations parameter generation
# Split from grenenet-phase2 resources/06_sim_parameters.R (fst section,
# verbatim). Run from resources/: Rscript sim_parameters.R

# fst simulations parameters
fst_params <- expand.grid(
    mu=7e-09,
    R=8.06452e-10,
    msprimeN=24000,
    L=c(3081,6583),
    sigma=0.95,
    rep=1:10000,
    tau=14)

# adjust Ne based on selfing rate
fst_params$slimN = as.integer(fst_params$msprimeN/(1 - fst_params$sigma/2))

# add simulation id
fst_params$ID <- 1:nrow(fst_params)

# save
write.table(fst_params, "../config/fst_params.tsv", sep = "\t", quote = F, row.names = F)