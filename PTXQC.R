#PTXQCҪ��maxquant��Ӣ�ﻷ���²���ʹ�ã����ĵ��ַ���ʶ������Ŀǰ���ǲ���Ӧ��
install.packages("PTXQC")
help(package="PTXQC")
browseVignettes(package="PTXQC")
vignette("PTXQC-CustomizeReport", package = "PTXQC")
require(PTXQC)
require(yaml)
require(methods)
txt_folder = "txt"
fh_out = getReportFilenames(txt_folder)
if (file.exists(fh_out$yaml_file))
{
  cat("\nUsing YAML config already present in target directory ...\n")
  yaml_config = yaml.load_file(input = fh_out$yaml_file)
} else {
  cat("\nYAML config not found in folder '", txt_folder, "'. The first run of PTXQC will create one for you.", sep="")
  yaml_config = list()
}
r = createReport(txt_folder, yaml_config)
cat(paste0("\nReport generated as '", r$report_file, "'\n\n"))
r = createReport(txt_folder)