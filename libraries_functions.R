
### libraries
packages = c("tidyverse", "ggpubr", "purrr","reshape2","gghalves","corrplot", "ggalluvial","rstatix", "readxl","Hmisc","ordinal","writexl","FactoMineR","factoextra")

## Now load or install&load all
package.check <- lapply(packages,FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)}})

### %in& negate
`%!in%` = Negate(`%in%`)

# colorblind friendly colors for clusters
cols_cluster <- c("1"= "#77AADD", "2"= "#99DDFF",
                  "3"= "#44BB99", "4"= "#BBCC33",
                  "5"= "#AAAA00", "6"= "#EEDD88",
                  "7"= "#EE8866", "8"= "#FFAABB", 
                  "9"= "#DDDDDD")

# colorblind friendly colors for age groups
cols_agegroup <- c(`25-49` = "#F0E442", `50-64` = "#85C0F9", `65-98` = "#F5793A")


## create output folder
dir.create(file.path(analysis.path, "results"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/tables"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/PCA"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/MFI"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/MFI/age_group"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/MFI/cluster"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/MFI/TQ"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/MFI/CMV"),showWarnings = FALSE)

dir.create(file.path(analysis.path, "results/figures/PCA"),showWarnings = FALSE)

dir.create(file.path(analysis.path, "results/figures/som"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/som/age_group"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/som/cluster"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/som/TQ"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/som/CMV"),showWarnings = FALSE)

dir.create(file.path(analysis.path, "results/figures/manualgate"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/manualgate/age_group"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/manualgate/cluster"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/manualgate/TQ"),showWarnings = FALSE)
dir.create(file.path(analysis.path, "results/figures/manualgate/CMV"),showWarnings = FALSE)




table_save.dir <- file.path(analysis.path, "results/tables/")
PCA_save.dir <- file.path(analysis.path, "results/figures/PCA/")
MFI_cluster_save.dir <- file.path(analysis.path, "results/figures/MFI/cluster/")
MFI_agegroup_save.dir <- file.path(analysis.path, "results/figures/MFI/age_group/")
MFI_save.dir <- file.path(analysis.path, "results/figures/MFI/")
MFI_CMV_save.dir <- file.path(analysis.path, "results/figures/MFI/CMV/")
MFI_TQ_save.dir <- file.path(analysis.path, "results/figures/MFI/TQ/")
som_TQ_save.dir <- file.path(analysis.path, "results/figures/som/TQ/")
som_agegroup_save.dir <- file.path(analysis.path, "results/figures/som/age_group/")
som_cluster_save.dir <- file.path(analysis.path, "results/figures/som/cluster/")
som_CMV_save.dir <- file.path(analysis.path, "results/figures/som/CMV/")
som_save.dir <- file.path(analysis.path, "results/figures/som/")
manual_agegroup_save.dir <- file.path(analysis.path, "results/figures/manualgate/age_group/")
manual_cluster_save.dir <- file.path(analysis.path, "results/figures/manualgate/cluster/")
manual_save.dir <- file.path(analysis.path, "results/figures/manualgate/")
manual_TQ_save.dir <- file.path(analysis.path, "results/figures/manualgate/TQ/")
manual_CMV_save.dir <- file.path(analysis.path, "results/figures/manualgate/CMV/")

# boxplot with log2 y axis
boxplot_cluster <- function()
{
  p <- ggplot(df_loop, aes(x=Xaxis, y=Yaxis)) +
    geom_boxplot(aes(fill=Groups), alpha=0.9,outlier.size=0,outlier.colour="white") +
    geom_jitter(aes(fill=Groups), alpha=0.4, width = 0.3, shape=21,size=1) +
    scale_fill_manual("Immunotypes", values=cols_cluster) +
    theme_classic()+
    stat_summary(aes(y=Yaxis, x=Xaxis),size=0.2)
}

boxplot_agegroup <- function()
{
  p <- ggplot(df_loop, aes(x=Xaxis, y=Yaxis)) +
    geom_boxplot(aes(fill=Groups), alpha=0.9,outlier.size=0,outlier.colour="white") +
    geom_jitter(aes(fill=Groups), alpha=0.4, width = 0.3, shape=21,size=1) +
    scale_fill_manual("Age group", values=cols_agegroup) +
    theme_classic()+
    stat_summary(aes(y=Yaxis, x=Xaxis),size=0.2)
}
