
##################################################################
##                        Load Libraries                        ##
##################################################################

{require(RMySQL)
  require(date)
  require(lubridate)
  library("data.table")
  library(waterwheelr)
  library(tidyverse)
  library(ggplot2)
  library(ggpubr)
  library(bannerCommenter)
  library(viridis)
  require(scales)
  library(stringr)
  library(openxlsx)
  library(data.table)
  library(zoo)
  library(ggh4x)
  library(readxl)
  library(xtable)
  library(clipr)
  library(patchwork)
}


theme_facets <- function () {
  theme_classic() %+replace%
    theme(panel.border =     element_rect(color = "black", fill = NA),
          strip.background = element_rect(color = "black", linetype="solid", fill = "LightGray"))}



{
  library(colorspace)
  A<-c((0.18995),(0.19483),(0.19956),(0.20415),(0.2086),(0.21291),(0.21708),(0.22111),(0.225),(0.22875),(0.23236),(0.23582),(0.23915),(0.24234),(0.24539),(0.2483),(0.25107),(0.25369),(0.25618),(0.25853),(0.26074),(0.2628),(0.26473),(0.26652),(0.26816),(0.26967),(0.27103),(0.27226),(0.27334),(0.27429),(0.27509),(0.27576),(0.27628),(0.27667),(0.27691),(0.27701),(0.27698),(0.2768),(0.27648),(0.27603),(0.27543),(0.27469),(0.27381),(0.27273),(0.27106),(0.26878),(0.26592),(0.26252),(0.25862),(0.25425),(0.24946),(0.24427),(0.23874),(0.23288),(0.22676),(0.22039),(0.21382),(0.20708),(0.20021),(0.19326),(0.18625),(0.17923),(0.17223),(0.16529),(0.15844),(0.15173),(0.14519),(0.13886),(0.13278),(0.12698),(0.12151),(0.11639),(0.11167),(0.10738),(0.10357),(0.10026),(0.0975),(0.09532),(0.09377),(0.09287),(0.09267),(0.0932),(0.09451),(0.09662),(0.09958),(0.10342),(0.10815),(0.11374),(0.12014),(0.12733),(0.13526),(0.14391),(0.15323),(0.16319),(0.17377),(0.18491),(0.19659),(0.20877),(0.22142),(0.23449),(0.24797),(0.2618),(0.27597),(0.29042),(0.30513),(0.32006),(0.33517),(0.35043),(0.36581),(0.38127),(0.39678),(0.41229),(0.42778),(0.44321),(0.45854),(0.47375),(0.48879),(0.50362),(0.51822),(0.53255),(0.54658),(0.56026),(0.57357),(0.58646),(0.59891),(0.61088),(0.62233),(0.63323),(0.64362),(0.65394),(0.66428),(0.67462),(0.68494),(0.69525),(0.70553),(0.71577),(0.72596),(0.7361),(0.74617),(0.75617),(0.76608),(0.77591),(0.78563),(0.79524),(0.80473),(0.8141),(0.82333),(0.83241),(0.84133),(0.8501),(0.85868),(0.86709),(0.8753),(0.88331),(0.89112),(0.8987),(0.90605),(0.91317),(0.92004),(0.92666),(0.93301),(0.93909),(0.94489),(0.95039),(0.9556),(0.96049),(0.96507),(0.96931),(0.97323),(0.97679),(0.98),(0.98289),(0.98549),(0.98781),(0.98986),(0.99163),(0.99314),(0.99438),(0.99535),(0.99607),(0.99654),(0.99675),(0.99672),(0.99644),(0.99593),(0.99517),(0.99419),(0.99297),(0.99153),(0.98987),(0.98799),(0.9859),(0.9836),(0.98108),(0.97837),(0.97545),(0.97234),(0.96904),(0.96555),(0.96187),(0.95801),(0.95398),(0.94977),(0.94538),(0.94084),(0.93612),(0.93125),(0.92623),(0.92105),(0.91572),(0.91024),(0.90463),(0.89888),(0.89298),(0.88691),(0.88066),(0.87422),(0.8676),(0.86079),(0.8538),(0.84662),(0.83926),(0.83172),(0.82399),(0.81608),(0.80799),(0.79971),(0.79125),(0.7826),(0.77377),(0.76476),(0.75556),(0.74617),(0.73661),(0.72686),(0.71692),(0.7068),(0.6965),(0.68602),(0.67535),(0.66449),(0.65345),(0.64223),(0.63082),(0.61923),(0.60746),(0.5955),(0.58336),(0.57103),(0.55852),(0.54583),(0.53295),(0.51989),(0.50664),(0.49321),(0.4796))
  B<-c((0.07176),(0.08339),(0.09498),(0.10652),(0.11802),(0.12947),(0.14087),(0.15223),(0.16354),(0.17481),(0.18603),(0.1972),(0.20833),(0.21941),(0.23044),(0.24143),(0.25237),(0.26327),(0.27412),(0.28492),(0.29568),(0.30639),(0.31706),(0.32768),(0.33825),(0.34878),(0.35926),(0.3697),(0.38008),(0.39043),(0.40072),(0.41097),(0.42118),(0.43134),(0.44145),(0.45152),(0.46153),(0.47151),(0.48144),(0.49132),(0.50115),(0.51094),(0.52069),(0.5304),(0.54015),(0.54995),(0.55979),(0.56967),(0.57958),(0.5895),(0.59943),(0.60937),(0.61931),(0.62923),(0.63913),(0.64901),(0.65886),(0.66866),(0.67842),(0.68812),(0.69775),(0.70732),(0.7168),(0.7262),(0.73551),(0.74472),(0.75381),(0.76279),(0.77165),(0.78037),(0.78896),(0.7974),(0.80569),(0.81381),(0.82177),(0.82955),(0.83714),(0.84455),(0.85175),(0.85875),(0.86554),(0.87211),(0.87844),(0.88454),(0.8904),(0.896),(0.90142),(0.90673),(0.91193),(0.91701),(0.92197),(0.9268),(0.93151),(0.93609),(0.94053),(0.94484),(0.94901),(0.95304),(0.95692),(0.96065),(0.96423),(0.96765),(0.97092),(0.97403),(0.97697),(0.97974),(0.98234),(0.98477),(0.98702),(0.98909),(0.99098),(0.99268),(0.99419),(0.99551),(0.99663),(0.99755),(0.99828),(0.99879),(0.9991),(0.99919),(0.99907),(0.99873),(0.99817),(0.99739),(0.99638),(0.99514),(0.99366),(0.99195),(0.98999),(0.98775),(0.98524),(0.98246),(0.97941),(0.9761),(0.97255),(0.96875),(0.9647),(0.96043),(0.95593),(0.95121),(0.94627),(0.94113),(0.93579),(0.93025),(0.92452),(0.91861),(0.91253),(0.90627),(0.89986),(0.89328),(0.88655),(0.87968),(0.87267),(0.86553),(0.85826),(0.85087),(0.84337),(0.83576),(0.82806),(0.82025),(0.81236),(0.80439),(0.79634),(0.78823),(0.78005),(0.77181),(0.76352),(0.75519),(0.74682),(0.73842),(0.73),(0.7214),(0.7125),(0.7033),(0.69382),(0.68408),(0.67408),(0.66386),(0.65341),(0.64277),(0.63193),(0.62093),(0.60977),(0.59846),(0.58703),(0.57549),(0.56386),(0.55214),(0.54036),(0.52854),(0.51667),(0.50479),(0.49291),(0.48104),(0.4692),(0.4574),(0.44565),(0.43399),(0.42241),(0.41093),(0.39958),(0.38836),(0.37729),(0.36638),(0.35566),(0.34513),(0.33482),(0.32473),(0.31489),(0.3053),(0.29599),(0.28696),(0.27824),(0.26981),(0.26152),(0.25334),(0.24526),(0.2373),(0.22945),(0.2217),(0.21407),(0.20654),(0.19912),(0.19182),(0.18462),(0.17753),(0.17055),(0.16368),(0.15693),(0.15028),(0.14374),(0.13731),(0.13098),(0.12477),(0.11867),(0.11268),(0.1068),(0.10102),(0.09536),(0.0898),(0.08436),(0.07902),(0.0738),(0.06868),(0.06367),(0.05878),(0.05399),(0.04931),(0.04474),(0.04028),(0.03593),(0.03169),(0.02756),(0.02354),(0.01963),(0.01583))
  C<-c((0.23217),(0.26149),(0.29024),(0.31844),(0.34607),(0.37314),(0.39964),(0.42558),(0.45096),(0.47578),(0.50004),(0.52373),(0.54686),(0.56942),(0.59142),(0.61286),(0.63374),(0.65406),(0.67381),(0.693),(0.71162),(0.72968),(0.74718),(0.76412),(0.7805),(0.79631),(0.81156),(0.82624),(0.84037),(0.85393),(0.86692),(0.87936),(0.89123),(0.90254),(0.91328),(0.92347),(0.93309),(0.94214),(0.95064),(0.95857),(0.96594),(0.97275),(0.97899),(0.98461),(0.9893),(0.99303),(0.99583),(0.99773),(0.99876),(0.99896),(0.99835),(0.99697),(0.99485),(0.99202),(0.98851),(0.98436),(0.97959),(0.97423),(0.96833),(0.9619),(0.95498),(0.94761),(0.93981),(0.93161),(0.92305),(0.91416),(0.90496),(0.8955),(0.8858),(0.8759),(0.86581),(0.85559),(0.84525),(0.83484),(0.82437),(0.81389),(0.80342),(0.79299),(0.78264),(0.7724),(0.7623),(0.75237),(0.74265),(0.73316),(0.72393),(0.715),(0.70599),(0.69651),(0.6866),(0.67627),(0.66556),(0.65448),(0.64308),(0.63137),(0.61938),(0.60713),(0.59466),(0.58199),(0.56914),(0.55614),(0.54303),(0.52981),(0.51653),(0.50321),(0.48987),(0.47654),(0.46325),(0.45002),(0.43688),(0.42386),(0.41098),(0.39826),(0.38575),(0.37345),(0.3614),(0.34963),(0.33816),(0.32701),(0.31622),(0.30581),(0.29581),(0.28623),(0.27712),(0.26849),(0.26038),(0.2528),(0.24579),(0.23937),(0.23356),(0.22835),(0.2237),(0.2196),(0.21602),(0.21294),(0.21032),(0.20815),(0.2064),(0.20504),(0.20406),(0.20343),(0.20311),(0.2031),(0.20336),(0.20386),(0.20459),(0.20552),(0.20663),(0.20788),(0.20926),(0.21074),(0.2123),(0.21391),(0.21555),(0.21719),(0.2188),(0.22038),(0.22188),(0.22328),(0.22456),(0.2257),(0.22667),(0.22744),(0.228),(0.22831),(0.22836),(0.22811),(0.22754),(0.22663),(0.22536),(0.22369),(0.22161),(0.21918),(0.2165),(0.21358),(0.21043),(0.20706),(0.20348),(0.19971),(0.19577),(0.19165),(0.18738),(0.18297),(0.17842),(0.17376),(0.16899),(0.16412),(0.15918),(0.15417),(0.1491),(0.14398),(0.13883),(0.13367),(0.12849),(0.12332),(0.11817),(0.11305),(0.10797),(0.10294),(0.09798),(0.0931),(0.08831),(0.08362),(0.07905),(0.07461),(0.07031),(0.06616),(0.06218),(0.05837),(0.05475),(0.05134),(0.04814),(0.04516),(0.04243),(0.03993),(0.03753),(0.03521),(0.03297),(0.03082),(0.02875),(0.02677),(0.02487),(0.02305),(0.02131),(0.01966),(0.01809),(0.0166),(0.0152),(0.01387),(0.01264),(0.01148),(0.01041),(0.00942),(0.00851),(0.00769),(0.00695),(0.00629),(0.00571),(0.00522),(0.00481),(0.00449),(0.00424),(0.00408),(0.00401),(0.00401),(0.0041),(0.00427),(0.00453),(0.00486),(0.00529),(0.00579),(0.00638),(0.00705),(0.0078),(0.00863),(0.00955),(0.01055))
  turbo_colormap_data<-cbind(A,B,C) 
  turbo_colormap_data_sRGB<-sRGB(turbo_colormap_data)
  turbo_colormap_data_HEX = hex(turbo_colormap_data_sRGB)
  library(pals)
  Turbo <- function(pal.min = 0,pal.max = 1,out.colors = NULL,pal = turbo_colormap_data_HEX,reverse = F) {
    if(pal.min == 0){pal.start = 1}
    if(pal.min > 0){pal.start = round(length(pal)*pal.min) }
    pal.end = round(length(pal)*pal.max )
    out = pal[pal.start:pal.end]
    
    if(!is.null(out.colors)){
      pal2 = colorRampPalette(colors = out ,space="rgb", interpolate = "linear")
      out = pal2(out.colors)
    }
    if(reverse == T){out = rev(out)}
    
    return(out)
}
}



##################################################################
##                    Import Raw Sensor Data                    ##
##################################################################


# Import raw data
sensor_raw <- read_csv("ES&T_Falcone_et_al-SensorData.csv") %>%
  ungroup()



############################################################################
############################################################################
###                                                                      ###
###                         SENSOR DATA CLEANING                         ###
###                                                                      ###
############################################################################
############################################################################



#################################################################
##                      Clean Sensor Data                      ##
#################################################################
sensor_data <- sensor_raw %>%
  select(site,
         datetime,
         distance,
         community,
         tanks,
         filter_start) %>%
  mutate(site = factor(site, levels = c("Kiosk - 04",
                                        "Kiosk - 08",
                                        "Kiosk - 09",
                                        "Kiosk - 15",
                                        "Kiosk - 05",
                                        "Kiosk - 02",
                                        "Kiosk - 04A",
                                        "Kiosk - 06",
                                        "Kiosk - 07",
                                        "Kiosk - 11A"))) %>%
  mutate(datetime = as.POSIXct(datetime, tz = "UTC")) %>%
  # Filter out data from before the start of sensor and kiosk operations
  filter(filter_start == "start") %>%
  # Filter out data outside of the real ranges (minimum value 32)
  mutate(filter_range = ifelse(distance >= 30 & distance < 325, "inrange", "outrange")) %>%
  filter(filter_range == "inrange") %>%
  
  # Filter out data with insufficient observations per day
  group_by(site, as.Date(datetime)) %>%
  mutate(daily_observations = n()) %>%
  ungroup() %>%
  mutate(filter_dailyobservations = ifelse(daily_observations <= 22, "insufficient", "sufficient")) %>%
  filter(filter_dailyobservations == "sufficient") %>%
  ungroup() %>%
  
# Filter out data from periods of sensor dysfunction
  mutate(filter_functional = case_when(
    
    (site == "Kiosk - 02" & (
      (datetime >= (as.POSIXct("2021-08-01 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-10-29 00:00:00", tz = "UTC"))) |
        (datetime >= (as.POSIXct("2021-05-11 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-05-13 00:00:00", tz = "UTC"))) |
        (datetime >= (as.POSIXct("2022-06-13 00:00:00", tz = "UTC")))
    )) ~ "dysfunctional",
    
    (site == "Kiosk - 04" & (
      (datetime >= as.POSIXct("2021-12-16 00:00:00", tz = "UTC"))
    )) ~ "dysfunctional",
    
    (site == "Kiosk - 04A" & (
      (datetime >= (as.POSIXct("2022-02-23 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2022-03-18 00:00:00", tz = "UTC"))) |
        (datetime >= (as.POSIXct("2022-06-14 00:00:00", tz = "UTC"))) |
        (datetime >= (as.POSIXct("2021-05-24 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-05-28 00:00:00", tz = "UTC"))) |
        (datetime >= (as.POSIXct("2021-06-04 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-06-20 00:00:00", tz = "UTC")))
    )) ~ "dysfunctional",
    
    (site == "Kiosk - 05" & (
      (datetime < as.POSIXct("2021-05-07 00:00:00", tz = "UTC"))
    )) ~ "dysfunctional",
    
    (site == "Kiosk - 06" & (
      (datetime >= (as.POSIXct("2021-10-01 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-10-09 00:00:00", tz = "UTC"))) |
        (datetime >= (as.POSIXct("2022-03-27 00:00:00", tz = "UTC")))
    )) ~ "dysfunctional",
    
    (site == "Kiosk - 07" & (
      (datetime >= (as.POSIXct("2021-07-27 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-07-30 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2021-08-14 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-08-16 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2021-08-20 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-08-24 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2021-08-27 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-08-28 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2021-10-18 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-10-20 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2021-10-23 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-10-27 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2021-11-01 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-11-20 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2021-11-24 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-11-25 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2021-11-30 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-12-02 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2022-02-03 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2022-02-12 00:00:00", tz = "UTC")))
    )) ~ "dysfunctional",
    
    (site == "Kiosk - 09" & (
      (datetime >= (as.POSIXct("2022-05-24 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2022-05-26 00:00:00", tz = "UTC"))) |
        (datetime >= (as.POSIXct("2021-05-24 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2021-06-04 00:00:00", tz = "UTC")))
      )) ~ "dysfunctional",
    
    (site == "Kiosk - 11A" & (
      (datetime >= (as.POSIXct("2022-03-12 00:00:00", tz = "UTC")))
    )) ~ "dysfunctional",
    
    (site == "Kiosk - 15" & (
      (datetime >= (as.POSIXct("2022-08-24 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2022-08-27 00:00:00", tz = "UTC"))) |
         (datetime >= (as.POSIXct("2022-09-09 00:00:00", tz = "UTC")) & datetime <= (as.POSIXct("2022-09-10 00:00:00", tz = "UTC")))
    )) ~ "dysfunctional",
    
    TRUE ~ "functional"))

sensor_clean <- 
  sensor_data %>%
  filter(filter_functional == "functional") %>%
  # Note if the above secondary filter for dysfunctional data is restored, remove the line above, and return the line below
  # rbind(sensor_functional, sensor_dysfunctional) %>%
  arrange(site, datetime) %>%
  group_by(site) %>%
  arrange(datetime) %>%
  # Compute Rolling Median and Absolute Difference from Rolling Median
  mutate(rolling_med = rollmedian(distance, k = 7, fill = NA),
         ADfRM = abs(distance - rolling_med),
         filter_spike = ifelse(ADfRM >= 75, "spike", "trend")) %>%
  filter(filter_spike == "trend")



############################################################################
############################################################################
###                                                                      ###
###                         SENSOR DATA ANALYSIS                         ###
###                                                                      ###
############################################################################
############################################################################


community_aberdeen <- c("Kiosk - 08",
                        "Kiosk - 09",
                        "Kiosk - 05",
                        "Kiosk - 15",
                        "Kiosk - 04")
community_kingtom <-  c("Kiosk - 04A",
                        "Kiosk - 02",
                        "Kiosk - 06",
                        "Kiosk - 11A",
                        "Kiosk - 07")


##################################################################
##                  Import Cleaned Sensor Data                  ##
##################################################################

calibration <- function(n, d) {n * pi * (208.8/2)^2 * ((292 + 30) - d) * 10^(-3)}

# Import cleaned data, tank capacity, time periods, identification of bowser periods, volume calibration
sensor_volume <- sensor_clean %>%
  # Both of the following filtered out in SDC script
  # filter(filter_functional == "functional",
  #        filter_dailyobservations == "sufficient") %>% 
  mutate(site = factor(site, levels = c("Kiosk - 04",
                                        "Kiosk - 02",
                                        
                                        "Kiosk - 08",
                                        "Kiosk - 04A",
                                        
                                        "Kiosk - 09",
                                        "Kiosk - 06",
                                        
                                        "Kiosk - 15",
                                        "Kiosk - 07",
                                        
                                        "Kiosk - 05",
                                        "Kiosk - 11A")),
         capacity  = 10000 * tanks) %>%
  mutate(datetime = as.POSIXct(datetime, tz = "GMT")) %>%
  # Filtered out in SDC script
  # mutate(dysfunctional = ifelse(filter_functional == "dysfunctional", 0, NA),
  
  # Discretize periods for further analysis %>%
  mutate(date       = as.Date.POSIXct(datetime, tz = "GMT"),
         week       = epiweek(datetime),
         weekday    = lubridate::wday(datetime, TRUE),
         month      = month(datetime),
         time       = as.numeric(format(strptime(datetime, format = "%Y-%m-%d %H:%M:%S"), "%H")) + 
           as.numeric(format(strptime(datetime, format = "%Y-%m-%d %H:%M:%S"), "%M"))/60 +
           as.numeric(format(strptime(datetime, format = "%Y-%m-%d %H:%M:%S"), "%S"))/60/60,
         hour       = floor(time)) %>%
  # Periodize hours of the day
  mutate(timeperiod = factor(
    case_when((hour >= 0  & hour < 4)   ~ "Late Night",
              (hour >= 4  & hour < 8)   ~ "Early Morning",
              (hour >= 8  & hour < 12)  ~ "Late Morning",
              (hour >= 12 & hour < 16)  ~ "Afternoon",
              (hour >= 16 & hour < 20)  ~ "Evening",
              (hour >= 20 & hour <= 23) ~ "Early Night"),
    levels = c("Late Night",
               "Early Morning",
               "Late Morning",
               "Afternoon",
               "Evening",
               "Early Night")),
    timeperiod_time = case_when(timeperiod == "Late Night"    ~ "02:00:00",
                                timeperiod == "Early Morning" ~ "06:00:00",
                                timeperiod == "Late Morning"  ~ "10:00:00",
                                timeperiod == "Afternoon"     ~ "14:00:00",
                                timeperiod == "Evening"       ~ "18:00:00",
                                timeperiod == "Early Night"   ~ "22:00:00")) %>%
  mutate(filter_source = case_when(
    # Aberdeen
    site == "Kiosk - 04"  ~ "piped",
    site == "Kiosk - 08"  ~ "bowser",
    site == "Kiosk - 09" & 
      datetime <= as.POSIXct("2022-01-21", tz = "UTC") ~ "piped",
    site == "Kiosk - 09" & 
      datetime > as.POSIXct("2022-01-21", tz = "UTC") ~ "bowser",
    site == "Kiosk - 15"  ~ "bowser",
    site == "Kiosk - 05"  ~ "piped",
    
    
    # Kingtom
    site == "Kiosk - 02"  ~ "bowser",
    site == "Kiosk - 04A" ~ "bowser",
    site == "Kiosk - 06" & 
      datetime <= as.POSIXct("2021-07-01", tz = "UTC") ~ "piped",
    site == "Kiosk - 06" & 
      datetime > as.POSIXct("2021-07-01", tz = "UTC") & 
      datetime < as.POSIXct("2021-11-01", tz = "UTC") ~ "mixed",
    site == "Kiosk - 06" &
      datetime >= as.POSIXct("2021-11-01", tz = "UTC") ~ "bowser",
    
    # site == "Kiosk - 07" & 
    #   datetime < as.POSIXct("2021-09-15", tz = "UTC") ~ "mixed",
    # site == "Kiosk - 07" &
    #   datetime > as.POSIXct("2021-09-15", tz = "UTC") ~ "bowser",
    site == "Kiosk - 07" ~ "bowser",
    
    site == "Kiosk - 11A" ~ "mixed")) %>%
  mutate(volume    = calibration(tanks, distance)) %>%
  ungroup()


# write.csv(sensor_volume, "2023_sensor_volume.csv")



# 
# ##---------------------------------------------------------------
# ##                  Raw Data with Calibration                   -
# ##---------------------------------------------------------------
# # Import raw data in same format as above
# sensor_raw_volume <- read_csv("2023_sensor_data.csv") %>%
#   mutate(site = factor(site, levels = c("Kiosk - 04",
#                                         "Kiosk - 02",
#                                         
#                                         "Kiosk - 08",
#                                         "Kiosk - 04A",
#                                         
#                                         "Kiosk - 09",
#                                         "Kiosk - 06",
#                                         
#                                         "Kiosk - 15",
#                                         "Kiosk - 07",
#                                         
#                                         "Kiosk - 05",
#                                         "Kiosk - 11A")),
#          capacity  = 10000 * tanks) %>%
#   mutate(datetime = as.POSIXct(datetime, tz = "GMT")) %>%
#   
#   # Discretize periods for further analysis %>%
#   mutate(date       = as.Date.POSIXct(datetime, tz = "GMT"),
#          week       = epiweek(datetime),
#          weekday    = lubridate::wday(datetime, TRUE),
#          month      = month(datetime),
#          time       = as.numeric(format(strptime(datetime, format = "%Y-%m-%d %H:%M:%S"), "%H")) + 
#            as.numeric(format(strptime(datetime, format = "%Y-%m-%d %H:%M:%S"), "%M"))/60 +
#            as.numeric(format(strptime(datetime, format = "%Y-%m-%d %H:%M:%S"), "%S"))/60/60,
#          hour       = floor(time)) %>%
#   
#   # Periodize hours of the day
#   mutate(timeperiod = factor(
#     case_when((hour >= 0  & hour < 4)   ~ "Late Night",
#               (hour >= 4  & hour < 8)   ~ "Early Morning",
#               (hour >= 8  & hour < 12)  ~ "Late Morning",
#               (hour >= 12 & hour < 16)  ~ "Afternoon",
#               (hour >= 16 & hour < 20)  ~ "Evening",
#               (hour >= 20 & hour <= 23) ~ "Early Night"),
#     levels = c("Late Night",
#                "Early Morning",
#                "Late Morning",
#                "Afternoon",
#                "Evening",
#                "Early Night")),
#     timeperiod_time = case_when(timeperiod == "Late Night"    ~ "02:00:00",
#                                 timeperiod == "Early Morning" ~ "06:00:00",
#                                 timeperiod == "Late Morning"  ~ "10:00:00",
#                                 timeperiod == "Afternoon"     ~ "14:00:00",
#                                 timeperiod == "Evening"       ~ "18:00:00",
#                                 timeperiod == "Early Night"   ~ "22:00:00")) %>%
#   # Calibrate data
#   mutate(volume    = calibration(tanks, distance))





#################################################################
##                    Sensor Data by Volume                    ##
#################################################################





periods <- sensor_volume %>%
  # Group by site and set counters indexes for days and time periods
  group_by(site) %>%
  arrange(datetime) %>%
  mutate(timeperiod_new = ifelse(lag(timeperiod) == timeperiod, 0, 1),
         date_new        = ifelse(lag(date) == date, 0, 1)) %>%
  mutate(timeperiod_new = replace_na(timeperiod_new, 1),
         date_new        = replace_na(date_new, 1)) %>%
  mutate(index_timeperiod = cumsum(timeperiod_new),
         index_date = cumsum(date_new)) %>%
  ungroup() %>%
  
  # Group by site and index date to take daily means
  group_by(site, index_date) %>%
  mutate(day_mean_volume = mean(volume, na.rm = TRUE),
         day_median_volume = median(volume, na.rm = TRUE)) %>%
  ungroup() %>%
  
  # Group again by site and index time period to take period means
  group_by(site, index_timeperiod) %>%
  mutate(period_volume = mean(volume, na.rm = TRUE)) %>%
  summarise(site          = unique(site),
            community     = unique(community),
            tanks         = unique(tanks),
            capacity      = unique(capacity),
            filter_source = unique(filter_source),
            month         = unique(month),
            weekday       = unique(weekday),
            index_date    = unique(index_date),
            date          = unique(date),
            index_period  = unique(index_timeperiod),
            period        = unique(timeperiod),
            time          = unique(timeperiod_time),
            period_volume  = unique(period_volume),
            day_mean_volume = unique(day_mean_volume),
            day_median_volume = unique(day_median_volume)
  ) %>%
  mutate(datetime = as.POSIXct(paste(date, time), format="%Y-%m-%d %H:%M:%S", tz = "UTC"),
         datetime_day = as.POSIXct(paste(date, "12:00:00"), format="%Y-%m-%d %H:%M:%S", tz = "UTC")) %>%
  ungroup() %>%
  # Group by site and arrange by time to calculate running diff in volume
  group_by(site) %>%
  arrange(index_timeperiod) %>%
  mutate(period_volume_diff = period_volume - lag(period_volume)) %>%
  ungroup() %>%
  
  # # # K07 spike filter
  group_by(site) %>%
  arrange(datetime) %>%
  mutate(filter_spike_K07 = ifelse(site == "Kiosk - 07" & lead(period_volume_diff) < -3500, "spike_K07", "trend")) %>%
  mutate(period_volume = ifelse(filter_spike_K07 == "spike_K07", NA, period_volume)) %>%
  mutate(period_volume = ifelse(is.na(period_volume),
                                (lead(period_volume) + lag(period_volume)) /2,
                                period_volume)) %>%
  ungroup() %>%
  group_by(site) %>%
  arrange(index_timeperiod) %>%
  mutate(period_volume_diff = period_volume - lag(period_volume)) %>%
  ungroup() %>%
  # # for plotting only:
  mutate(filter_spike_K07 = ifelse(filter_spike_K07 == "spike_K07", 10000, NA)) %>%
  
  # Filter for periods of fluctutions longer than two days
  mutate(filter_SaFs = case_when(
    # (site == "Kiosk - 07" & (
    #   # (datetime >= as.POSIXct("2021-07-27 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2021-07-30 00:00:00", tz = "UTC")) |
    #     # (datetime >= as.POSIXct("2021-08-05 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2021-08-06 00:00:00", tz = "UTC"))
    # )) ~ "SaFs",
    
    (site == "Kiosk - 11A" & (
      (datetime >= as.POSIXct("2021-07-12 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2021-07-18 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2021-09-24 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2021-09-27 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2021-08-09 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2021-08-15 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2021-10-02 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2021-10-08 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2021-10-11 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2021-10-28 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2021-11-15 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2021-12-03 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2022-01-10 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2022-01-17 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2022-01-24 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2022-02-14 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2022-02-19 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2022-02-23 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2022-02-27 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2022-03-12 00:00:00", tz = "UTC"))
    )) ~ "SaFs",
    
    (site == "Kiosk - 09" & (
      (datetime >= as.POSIXct("2022-01-04 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2022-01-19 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2022-01-21 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2022-03-20 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2022-04-09 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2022-04-24 00:00:00", tz = "UTC")) |
        (datetime >= as.POSIXct("2022-01-21 00:00:00", tz = "UTC") & datetime <= as.POSIXct("2022-03-20 00:00:00", tz = "UTC")) 
    )) ~ "SaFs",
    
    TRUE ~ "ok")) %>%
  # For plotting only:
  mutate(filter_SaFs = ifelse(filter_SaFs == "SaFs", 5000, NA)) %>%
  
  # Status identifier
  group_by(site) %>%
  arrange(index_period) %>%
  mutate(status = case_when(#period_volume_diff <= -210                               ~ "emptying",
    #period_volume_diff >  -210  & period_volume_diff <= 400  ~ "no activity",
    period_volume_diff <= 400 ~ "not refilling",
    period_volume_diff >   400  & period_volume_diff <= 2720 ~ "refill",
    period_volume_diff >   2720                              ~ "bowser"),
    status = ifelse(is.na(period_volume), NA, status)) %>%
  group_by(site, index_date) %>%
  mutate(operations_basic = ifelse((last(period_volume) - first(period_volume)) < -500, 1, 0))


index_time <- data.frame(
  expand_grid(
    site = c(community_aberdeen, community_kingtom),
    datetime = seq(as.POSIXct("2021-04-01 02:00:00", tz  = "UTC"),
                   as.POSIXct("2022-12-31 22:00:00", tz  = "UTC"),
                   by = "4 hours")))

discontinous_timeseries <- merge(periods, index_time, all = T) %>%
  group_by(site) %>%
  arrange(datetime) %>%
  mutate(sensor_counter = replace_na(ifelse(is.na(lag(period_volume)) & !is.na(period_volume), 1, 0), 0)) %>%
  mutate(sensor_index = cumsum(sensor_counter))















#####

daily_mean <- periods %>%
  group_by(site, index_date) %>%
  summarise(site = unique(site),
            index_date = unique(index_date),
            datetime_day = unique(datetime_day),
            day_mean_volume = unique(day_mean_volume),
            filter_SaFs = unique(filter_SaFs)) %>%
  ungroup() %>%
  
  group_by(site) %>%
  arrange(index_date) %>%
  mutate(day_mean_volume_diff = day_mean_volume - lag(day_mean_volume)) %>%
  mutate(operations_daydiff = ifelse(day_mean_volume_diff < -500, "operational", "non-ops"),
         operations_SaFs = ifelse(filter_SaFs == "SaFs", operations_daydiff, NA))



##---------------------------------------------------------------
##                        Bowser Analysis                       -
##---------------------------------------------------------------
bowser_sections <- periods %>%
  filter(filter_source == "bowser" |
           filter_source == "mixed")

post_bowser <- bowser_sections %>%
  group_by(site, index_date) %>%
  mutate(bowser_counter_post = replace_na(ifelse(status == "bowser", 1, 0), 0)) %>%
  mutate(index_bowser_post = cumsum(bowser_counter_post)) %>%
  filter(index_bowser_post == max(index_bowser_post) & index_bowser_post != 0) %>%
  mutate(operations_bowser_post = ifelse((last(period_volume) - first(period_volume)) < -500, 1, 0)) %>%
  ungroup()

pre_bowser <- bowser_sections %>%
  group_by(site, index_date) %>%
  mutate(bowser_counter_pre = replace_na(ifelse(status == "bowser", 1, 0), 0)) %>%
  mutate(index_bowser_pre = cumsum(bowser_counter_pre)) %>% 
  filter(max(index_bowser_pre) != 0) %>%
  filter(index_bowser_pre == 0) %>%
  mutate(operations_bowser_pre = ifelse((last(period_volume) - first(period_volume)) < -500, 1, 0)) %>%
  # filter(max(operations_pre) == 1) %>% View()
  ungroup()

bowser_refills <- bowser_sections %>%
  filter(status == "bowser") %>%
  group_by(site, date) %>%
  arrange(desc(datetime)) %>%
  slice(1) %>%
  ungroup() %>%
  as.data.frame() %>%
  group_by(site) %>%
  arrange(index_timeperiod) %>%
  mutate(consecutive = ifelse(lead(index_timeperiod) - index_timeperiod == 1, "consecutive", "ok")) %>%
  filter(consecutive != "consecutive")



##----------------------------------------------------------------
##                        Piped Analysis                         -
##----------------------------------------------------------------

piped <- periods %>%
  filter(filter_source == "piped" |
           filter_source == "mixed")

post_piped <- piped %>%
  mutate(status = str_replace_all(status, "bowser", "refill")) %>%
  group_by(site, index_date) %>%
  mutate(piped_counter_post = replace_na(ifelse(status == "refill", 1, 0), 0)) %>%
  mutate(index_piped_post = cumsum(piped_counter_post)) %>%
  filter(index_piped_post == max(index_piped_post) & index_piped_post != 0) %>%
  mutate(operations_piped_post = ifelse((last(period_volume) - first(period_volume)) < -500, 1, 0)) %>%
  ungroup()

pre_piped <- piped %>%
  mutate(status = ifelse(status == "bowser", "refill", status)) %>%
  group_by(site, index_date) %>%
  mutate(piped_counter_pre = replace_na(ifelse(status == "refill", 1, 0), 0)) %>%
  mutate(index_piped_pre = cumsum(piped_counter_pre)) %>%
  filter(max(index_piped_pre) != 0) %>%
  filter(index_piped_pre == 0) %>%
  mutate(operations_piped_pre = ifelse((last(period_volume) - first(period_volume)) < -500, 1, 0)) %>%
  # filter(max(operations_pre) == 1) %>% View()
  ungroup()



# flowmeter <- flowmeter %>%
#   filter(date %in% piped$date) %>%
#   mutate(piped_source = factor(case_when(flowmeter_daily == 0 ~ "0 L",
#                                   flowmeter_daily > 0 & flowmeter_daily <= 100 ~ "1-100 L",
#                                   flowmeter_daily > 100 & flowmeter_daily <= 1000 ~ "100-1k L",
#                                   flowmeter_daily > 1000 & flowmeter_daily <= 5000 ~ "1k-5k L",
#                                   flowmeter_daily > 5000 & flowmeter_daily <= 10000 ~ "5k-10k L",
#                                   flowmeter_daily > 10000 ~ "10k+ L"),
#                                levels = c("0 L",
#                                           "1-100 L",
#                                           "100-1k L",
#                                           "1k-5k L",
#                                           "5k-10k L",
#                                           "10k+ L")))


##---------------------------------------------------------------
##                Merge Bowser and Piped Analyses               -
##---------------------------------------------------------------

activities <- merge(
  merge(periods,
        merge(
          merge(post_bowser, pre_bowser, all = T),
          merge(post_piped, pre_piped, all = T),
          all = T),
        all = T),
  daily_mean, all = T) %>%
  
  # Operational day via max of numeric sum
  mutate_at(c("operations_basic",
              "operations_bowser_post",
              "operations_bowser_pre",
              "operations_piped_post",
              "operations_piped_pre"),
            ~replace_na(., 0)) %>%
  mutate(operations_sum = rowSums(across(c(operations_basic,
                                           operations_bowser_post,
                                           operations_bowser_pre,
                                           operations_piped_post,
                                           operations_piped_pre)),
                                  na.rm = TRUE)) %>%
  group_by(site, index_date) %>%
  mutate(operations_max = max(operations_sum),
         operations_BBBPP = ifelse(operations_max > 0, "operational", "non-ops")) %>%
  mutate(operational = ifelse(!is.na(operations_SaFs), operations_SaFs, operations_BBBPP)) %>%
  ungroup() %>%
  
  # # For outcomes use
  mutate(operational_day = ifelse(operational > 0, "operational", "not_operational")) %>%
  
  # For plotting
  mutate(operational_plot = ifelse(operational == "operational", 100, NA)) %>%
  
  # reorder kiosks using factors
  mutate(site = factor(site, levels = c("Kiosk - 04",
                                        "Kiosk - 08",
                                        "Kiosk - 09",
                                        "Kiosk - 15",
                                        "Kiosk - 05",
                                        "Kiosk - 02",
                                        "Kiosk - 04A",
                                        "Kiosk - 06",
                                        "Kiosk - 07",
                                        "Kiosk - 11A"))) %>%
  select(community,
         site,
         tanks,
         capacity,
         datetime,
         index_period,
         index_timeperiod,
         period,
         time,
         period_volume,
         period_volume_diff,
         month,
         index_date,
         date,
         weekday,
         datetime_day,
         day_mean_volume,
         day_mean_volume_diff,
         filter_source,
         filter_spike_K07,
         filter_SaFs,
         status,
         operations_basic,
         operations_bowser_post,
         operations_bowser_pre,
         operations_piped_post,
         operations_piped_pre,
         operations_sum,
         operations_max,
         operations_BBBPP,
         operations_daydiff,
         operations_SaFs,
         operational,
         operational_plot
  )

# Write updated sensor activities file
# write.csv(activities, "2023_sensor_activities.csv")


############################################################################
############################################################################
###                                                                      ###
###                         SENSOR DATA OUTCOMES                         ###
###                                                                      ###
############################################################################
############################################################################






sensor_volume <- sensor_volume %>%
  mutate(season = factor(case_when(month == 12 | month <= 3 ~ "Dry",
                                   month >= 4  & month <= 6 ~ "Dry to Rainy",
                                   month >= 7  & month <= 8 ~ "Rainy",
                                   month >= 9 & month <= 11 ~ "Rainy to Dry"),
                         levels = c("Dry",
                                    "Dry to Rainy",
                                    "Rainy",
                                    "Rainy to Dry")))


##################################################################
##                 Import Analyzed Sensor Data                  ##
##################################################################

activities <- activities %>%
  select(site,
         community,
         tanks,
         capacity,
         filter_source,
         
         month,
         weekday,
         datetime,
         index_date,
         date,
         index_period,
         period,
         time,
         
         period_volume,
         period_volume_diff,
         status,
         
         operations_basic,
         operations_bowser_post,
         operations_bowser_pre,
         operations_piped_post,
         operations_piped_pre,
         operations_sum,
         operations_max,
         operations_BBBPP,
         operations_daydiff,
         operations_SaFs,
         operational) %>%
  mutate(site = factor(site, levels = c("Kiosk - 04",
                                        "Kiosk - 08",
                                        "Kiosk - 09",
                                        "Kiosk - 15",
                                        "Kiosk - 05",
                                        "Kiosk - 02",
                                        "Kiosk - 04A",
                                        "Kiosk - 06",
                                        "Kiosk - 07",
                                        "Kiosk - 11A")),
         community = factor(community, levels = c("Aberdeen",
                                                  "Kingtom")),
         filter_source = factor(case_when(filter_source == "bowser" ~ "Bowser",
                                          filter_source == "mixed" ~ "Mixed",
                                          filter_source == "piped" ~ "Piped"), 
                                levels = c("Bowser",
                                           "Mixed",
                                           "Piped")),
         weekday = factor(weekday, levels = c("Sun",
                                              "Mon",
                                              "Tue",
                                              "Wed",
                                              "Thu",
                                              "Fri",
                                              "Sat")),
         period = factor(period, levels = c("Late Night",
                                            "Early Morning",
                                            "Late Morning",
                                            "Afternoon",
                                            "Evening",
                                            "Early Night")),
         operational = factor(operational, levels = c("operational", "non-ops"))) %>%
  mutate(datetime = as.POSIXct(datetime, tz = "GMT"))


# activities %>%
#   select(site, filter_source) %>%
#   filter(filter_source %in% c("Piped")) %>%
#   select(site) %>%
#   table() %>%
#   View()


##################################################################
##                         Data Summary                         ##
##################################################################
# summary(activities)
# str(activities)



##---------------------------------------------------------------
##                      Observation Summary                     -
##---------------------------------------------------------------

{
  # Days of Observation per Kiosk
  observed_kiosk <- sensor_data %>%
    as.data.frame() %>%
    mutate(date = as.Date(datetime)) %>%
    group_by(site) %>%
    summarise(community = unique(community),
              observed_start = min(date),
              observed_end   = max(date),
              observed_period  = ceiling(difftime(observed_end, observed_start)),
              observed_days  = length(unique(date))) %>%
    mutate(site = factor(site, levels = c("Kiosk - 04",
                                          "Kiosk - 08",
                                          "Kiosk - 09",
                                          "Kiosk - 15",
                                          "Kiosk - 05",
                                          "Kiosk - 02",
                                          "Kiosk - 04A",
                                          "Kiosk - 06",
                                          "Kiosk - 07",
                                          "Kiosk - 11A"))) %>%
    arrange(site)
  
  # Days of Observation Combined
  observed_combined <- observed_kiosk %>%
    summarize(community  = "Combined",
              site       = "Combined",
              observed_start      = min(observed_start),
              observed_end        = max(observed_end),
              observed_period = ceiling(difftime(max(observed_end), min(observed_start), "days")),
              observed_days = sum(observed_days))
  
  # Days of Analysis Summary
  observed_summary <- rbind(observed_kiosk,
                            observed_combined)
}


##----------------------------------------------------------------
##                        Analysis Summary                       -
##----------------------------------------------------------------

{ # Analysis Summary
  # Days of Analysis per Kiosk
  analysed_kiosk <- activities %>%
    group_by(site) %>%
    summarise(community = unique(community),
              analysis_start      = min(date),
              analysis_end        = max(date),
              analysis_period = ceiling(difftime(max(datetime), min(datetime), "days")),
              analysis_days = length(unique(date))) %>%
    mutate(site = factor(site, levels = c("Kiosk - 04",
                                          "Kiosk - 08",
                                          "Kiosk - 09",
                                          "Kiosk - 15",
                                          "Kiosk - 05",
                                          "Kiosk - 02",
                                          "Kiosk - 04A",
                                          "Kiosk - 06",
                                          "Kiosk - 07",
                                          "Kiosk - 11A"))) %>%
    arrange(site)
  
  # Days of Analysis Combined
  analysed_combined <- analysed_kiosk %>%
    summarize(community  = "Combined",
              site       = "Combined",
              analysis_start      = min(analysis_start),
              analysis_end        = max(analysis_end),
              analysis_period = ceiling(difftime(max(analysis_end), min(analysis_start), "days")),
              analysis_days = sum(analysis_days))
  
  
  
  
  # Days of Analysis Summary
  analysed_summary <- rbind(analysed_kiosk,
                            analysed_combined)
}


##----------------------------------------------------------------
##                Observation and Analysis Summary               -
##----------------------------------------------------------------

# Merge Observation and Analysis Summary
data_summary <- merge(observed_summary, analysed_summary) %>%
  arrange(site) %>%
  relocate(community, site, everything()) %>%
  as.data.frame() %>%
  mutate(observed_start = as.character(observed_start),
         observed_end = as.character(observed_end),
         analysis_start = as.character(analysis_start),
         analysis_end = as.character(analysis_end),
         observed_period = as.integer(observed_period),
         observed_days = as.integer(observed_days),
         analysis_period = as.integer(analysis_period),
         analysis_days = as.integer(analysis_days))




##################################################################
##                 Bowser Demand Classification                 ##
##################################################################

bowser_ref <- activities %>%
  filter(filter_source == "Bowser") %>%
  filter(status == "bowser") %>%
  group_by(site, date) %>%
  arrange(desc(datetime)) %>%
  slice(1) %>%
  ungroup() %>%
  as.data.frame() %>%
  mutate(bowser_id = 1) %>%
  select(site,
         datetime,
         bowser_id)

activities_bowser <- merge(activities, bowser_ref, all = T)


demand <-  activities_bowser %>%
  filter(filter_source == "Bowser") %>%
  group_by(site) %>%
  arrange(datetime) %>%
  mutate(bowser_id = replace_na(bowser_id, 0)) %>%
  mutate(bowser_counter = 0) %>%
  mutate(bowser_counter = cumsum(bowser_id)) %>%
  ungroup() %>%
  
  group_by(site, bowser_counter) %>%
  filter(bowser_counter > 0) %>%
  mutate(site_bowser = paste0(site, "_", bowser_counter)) %>%
  ungroup() %>%
  group_by(site_bowser) %>%
  arrange(datetime) %>%
  mutate(bowser_periods = 1) %>%
  mutate(index_bowser_day = cumsum(bowser_periods)/6)  %>%
  ungroup() %>%
  
  mutate(abandoned = ifelse(index_bowser_day == 30, 1, 0)) %>%
  group_by(site_bowser) %>%
  ### problem at this line
  mutate(site_bowser_abandoned = ifelse(max(abandoned) == 1, "abandoned", "in_use")) %>%
  filter(site_bowser_abandoned == "in_use") %>%
  # filter(index_bowser_day <= 30) %>%
  ungroup()

# Check size of dataset
length(unique(demand$site_bowser))
nrow(demand)/6




##---------------------------------------------------------------
##                  Days between Bowser Refills                 -
##---------------------------------------------------------------

{
  # Calculate time between bowser refills
  DbBR <- demand %>%
    group_by(site_bowser) %>%
    summarise(DbBR = max(index_bowser_day))
  
  # Calculate median time between bowser refills
  MDbBR <- median(DbBR$DbBR)
}

##---------------------------------------------------------------
##              Function of Stored Volume over Time             -
##---------------------------------------------------------------

# Median per time period
volume_medianSLBR <- demand %>%
  group_by(index_bowser_day) %>%
  summarize(index_bowser_day = unique(index_bowser_day),
            predicted_vol = median(period_volume),
            n = n()) %>%
  mutate(withdrawal = 10000 - predicted_vol)

# ggplot(volume_medianSLBR) +
#   stat_ecdf(aes(withdrawal))

######
{# Function (Exponential Decay) of Volume over Time for EMPTY and RATE
  profile_vol_time <- summary(
    nls(predicted_vol ~ (10000 - vol_empty) * exp(-alpha * index_bowser_day) + vol_empty,
        start = list(vol_empty = 1000, alpha = 0.5),
        data = volume_medianSLBR)
  )
  profile_vol_time
  
  
  
  ##### R2 analysis
  profile_vol_time_mod <- 
    nls(predicted_vol ~ (10000 - vol_empty) * exp(-alpha * index_bowser_day) + vol_empty,
        start = list(vol_empty = 1000, alpha = 0.5),
        data = volume_medianSLBR)
  
  # library(aomisc)
  # R2nls(profile_vol_time_mod)$PseudoR2
  # ## [1] 0.9930399
  # detach("package:aomisc")
  
  
}



##----------------------------------------------------------------
##                    Days until Empty Tanks                     -
##----------------------------------------------------------------

# Calculate time between bowser refill and functionally empty tank
DuET <- demand %>%
  group_by(site_bowser) %>%
  arrange(datetime) %>%
  mutate(fEmpty_id = ifelse(period_volume < 2000, 1, 0),
         fEmpty_counter = cumsum(fEmpty_id)) %>%
  filter(fEmpty_counter == 0) %>%
  summarise(DuET = max(index_bowser_day))
MDuET <- median(DuET$DuET)


##---------------------------------------------------------------
##                  Bowser Refill Distributions                 -
##---------------------------------------------------------------

# Plot Density of DbBR and DuET
# plot_density_EmptyRefill <- 

# colors <- c("DuET" = "#1eb53a",
#             "DbBR" = "#0072c6")

BowserRefillDistributions <- rbind(
  DuET %>%
    rename(value = DuET) %>%
    mutate(Distribution = "Days until Empty Tanks") %>%
    select(-site_bowser) %>%
    as.data.frame(),
  
  DbBR %>%
    rename(value = DbBR) %>%
    mutate(Distribution = "Days between Bowser Refills") %>%
    select(-site_bowser) %>%
    as.data.frame()
)


plot_density_bowsers <- ggplot() +
  geom_density(data = BowserRefillDistributions,
               aes(value,
                   group = Distribution,
                   color = Distribution,
                   fill = Distribution),
               alpha = 0.25,
               linewidth = 2) +
  geom_vline(aes(xintercept = MDbBR,
                 color = "Days between Bowser Refills"),
             linetype = "longdash",
             linewidth = 2) +
  geom_vline(aes(xintercept = MDuET,
                 color = "Days until Empty Tanks"),
             linetype = "longdash",
             linewidth = 2) +
  labs(x = "Days since Last Bowser Refill",
       y = "Density") +
  scale_x_continuous(expand = c(0,0),
                     limits = c(0, 30),
                     breaks = seq(0, 30, 7)) +
  scale_y_continuous(expand = c(0,0),
                     limits = c(0, 0.1375)) +
  theme_classic() +
  scale_fill_manual(name = "Distribution",
                    labels = c("Days until Empty Tanks", "Days between Bowser Refills"),
                    values = c(Treatment = "#0072c6", Cohort = "#1eb53a"),
                    breaks = c("Days until Empty Tanks", "Days between Bowser Refills")) +
  theme(legend.position = "bottom",
        panel.grid.major.x = element_line(colour = "lightgray"))
plot_density_bowsers

# pdf(file = "plot_density_bowsers.pdf", width = 8, height = 4)
# plot_density_bowsers
# dev.off()

# png(file = "plot_density_EmptyRefill.png",
#     height = 2.7,
#     width = 6.265,
#     units = "in",
#     res = 1000)
# plot_density_EmptyRefill
# dev.off()



##---------------------------------------------------------------
##      Plot of Time Series since Last Bowser with Analysis     -
##---------------------------------------------------------------

IROD <- data.frame(volumesofinterest = c(10000, 7500, 5000, 2500, 2000, 1379)) %>%
  # mutate(timesofinterest   = -(log((volumesofinterest - profile_vol_time$coefficients[1]) / (10000 - profile_vol_time$coefficients[1]) ) / profile_vol_time$coefficients[2])) %>%
  # mutate(withdrawal = profile_vol_time$coefficients[2] * (10000 - profile_vol_time$coefficients[1]) * exp(- profile_vol_time$coefficients[2] * timesofinterest)) %>%
  mutate(#withdrawal = profile_vol_time$coefficients[2] * (10000 - profile_vol_time$coefficients[1]) * exp(- profile_vol_time$coefficients[2] * -(log((volumesofinterest - profile_vol_time$coefficients[1]) / (10000 - profile_vol_time$coefficients[1]) ) / profile_vol_time$coefficients[2])),
    #w2 = profile_vol_time$coefficients[2] * (10000 - profile_vol_time$coefficients[1]) * exp(log((volumesofinterest - profile_vol_time$coefficients[1]) / (10000 - profile_vol_time$coefficients[1]))),
    #w3 = profile_vol_time$coefficients[2] * (10000 - profile_vol_time$coefficients[1]) * ((volumesofinterest - profile_vol_time$coefficients[1]) / (10000 - profile_vol_time$coefficients[1])),
    w4 = profile_vol_time$coefficients[2] * (volumesofinterest - profile_vol_time$coefficients[1]),
    norm = profile_vol_time$coefficients[2] * (volumesofinterest - profile_vol_time$coefficients[1]) / w4[1]) %>%
  mutate(ratio = w4/(volumesofinterest-1379)/10000)
IROD




# ggplot(IROD) +
#   geom_point(aes(volumesofinterest, w4)) +
#   stat_function(fun=function(x)
#     profile_vol_time$coefficients[2] * (x - profile_vol_time$coefficients[1])) +
# 
#   geom_vline(aes(xintercept = 1379)) +
#   geom_vline(aes(xintercept = 2000)) +
#   geom_vline(aes(xintercept = 2500)) +
#   geom_vline(aes(xintercept = 5000)) +
#   geom_vline(aes(xintercept = 7500)) +
#   geom_vline(aes(xintercept = 10000)) +
#   
#   geom_hline(aes(yintercept = 3359)) +
#   geom_hline(aes(yintercept = 2385)) +
#   geom_hline(aes(yintercept = 1410)) +
#   geom_hline(aes(yintercept = 436)) +
#   geom_hline(aes(yintercept = 241)) +
#   geom_hline(aes(yintercept = 0))



plot_withdrawal <- ggplot(IROD) +
  # Horizontal Lines for empty volumes
  geom_vline(aes(xintercept = profile_vol_time$coefficients[1],
                 linetype = "Completely Empty"),
             linewidth = 0.75,
             color = "gray") +
  geom_vline(aes(xintercept = 2000,
                 linetype = "Functionally Empty"),
             linewidth = 0.75,
             color = "gray") +
  
  # Withdrawal wrt Volume
  stat_function(fun=function(x)
    profile_vol_time$coefficients[2] * (x - profile_vol_time$coefficients[1]),
    linewidth = 2) +
  
  
  
  labs(x = "Stored Water Volume (L)",
       y = "Withdrawal Capacity\nwith respect to\nStored Water Volume (L/d)") +
  
  scale_x_continuous(expand = c(0,0),
                     limits = c(0, 10000),
                     breaks = c(0, 1379, 2000, 10000),
                     labels = c("CETV",
                                "ETV",
                                "FETV",
                                "FTV")) +
  scale_y_continuous(expand = c(0,0),
                     limits = c(0, 3359)) +
  coord_flip() +
  scale_linetype_manual(name = "Volume Thresholds",
                        labels = c("Completely Empty", "Functionally Empty"),
                        values = c("solid", "longdash")) +
  theme_classic() +
  theme(legend.position = "none",
        axis.title.y = element_blank())










plot_VolSLBR_simple <-
  ggplot() +
  
  # Horizontal Lines for empty volumes
  geom_hline(aes(yintercept = profile_vol_time$coefficients[1],
                 linetype = "Completely Empty"),
             linewidth = 0.75,
             color = "gray") +
  geom_hline(aes(yintercept = 2000,
                 linetype = "Functionally Empty"),
             linewidth = 0.75,
             color = "gray") +
  
  # Median volumes by time
  geom_point( data = volume_medianSLBR, 
              aes(index_bowser_day, predicted_vol,
                  shape = "Median Volumes at Days Since Refill"),
              size = 2,
              show.legend = FALSE) +
  # geom_point(data = IROD,
  #            aes(time, volume,
  #                shape = "Times and Volumes of Interest"),
  #            size = 5,
  #            stroke = 2) + 
  
  # Modeled function for storage over time
  
  #exp decay
  stat_function(fun=function(x)
    (10000 - profile_vol_time$coefficients[1]) * exp(-profile_vol_time$coefficients[2] * x) + profile_vol_time$coefficients[1],
    linewidth = 2) +
  
  # stat_function(fun=function(x)
  #   profile_vol_time$coefficients[2] * (10000 - profile_vol_time$coefficients[1]) * exp(- profile_vol_time$coefficients[2] * x),
  #   linewidth = 2) +
  
  # #sqrt decay
  # stat_function(fun=function(x)
  #   ((10000 - profile_vol_time_sqrt$coefficients[1]) / sqrt(x)) + profile_vol_time_sqrt$coefficients[1],
  #   linewidth = 1) +
  
  # #inv decay
# stat_function(fun=function(x)
#   (profile_vol_time_inv$coefficients[2] / x) + profile_vol_time_inv$coefficients[1],
#   linewidth = 1) +

# # demand function
# stat_function(fun=function(x)
#   3359.6 * exp((-0.3897) * x),
# linewidth = 1) +



# geom_hline(aes(yintercept = 5000))+
# geom_vline(aes(xintercept = 2.226)) +

scale_y_continuous(expand = c(0,0),
                   limits = c(0, 10000), breaks = seq(0, 20000, 2000)) +
  scale_x_continuous(expand = c(0,0),
                     limits = c(0,30),
                     breaks = seq(0, 30, 7)) +
  labs(x = "Time since Last Bowser Refill (days)\n\n",
       y = "Stored Water Volume (L)") +
  # scale_shape_manual(show.legend = FALSE) +
  #name = "Volume",
  #labels = c("Median Volumes at Days Since Refill", "Times and Volumes of Interest"),
  #values = c(16, 10)) +
  scale_linetype_manual(name = "Volume Thresholds",
                        labels = c("ETV", "FETV"),
                        values = c("solid", "longdash")) +
  
  theme_classic() +
  theme(legend.position = "bottom",
        panel.grid.major.x = element_line(colour = "lightgray")) +
  guides(linetype = guide_legend(keywidth = 3))

plot_VolSLBR_simple


# pdf(file = "plot_VolSLBR_simple.pdf", width = 8, height = 4)
# plot_VolSLBR_simple
# dev.off()

# png(file = "plot_VolSLBR.png",
#     height = 2.7,
#     width = 6.265,
#     units = "in",
#     res = 1000)
# plot_VolSLBR
# dev.off()



plot_Storage_Withrawal <- 
  ggarrange(plot_VolSLBR_simple,
            plot_withdrawal,
            widths = c(0.65, 0.35),
            common.legend = TRUE,
            legend = "bottom")
plot_Storage_Withrawal

# pdf(file = "plot_Storage_Withrawal.pdf", width = 12, height = 6)
# plot_Storage_Withrawal
# dev.off()




##---------------------------------------------------------------
##                        Meetable Demand                       -
##---------------------------------------------------------------

# Average rate of meetable demand (which includes pressure limitations)

# Function (Exponential Decay) of Volume over Time for AVERAGE DEMAND RATE

# peak_demand_rate <- summary(
# lm(#predicted_vol ~ 10000 - index_bowser_day,
#   I(10000 - predicted_vol) ~ 0 + index_bowser_day,
#   data = demand_median))
# peak_demand_rate





##################################################################
##                      Buffering Capacity                      ##
##################################################################

buffering <- activities %>%
  group_by(site, date) %>%
  mutate(A_storage    = ifelse(median(period_volume, na.rm = TRUE) < 0.2*capacity, "empty", "not_empty"),
         B_operations = (as.character(operational))) %>%
  mutate(category = factor(case_when(A_storage == "empty" ~ "Empty",
                                     A_storage != "empty" & B_operations != "operational" ~ "Offline",
                                     A_storage != "empty" & B_operations == "operational" ~ "Operational"),
                           levels = c("Operational", "Offline", "Empty"))) %>%
  mutate(all = "All Sites") %>%
  mutate(season = factor(case_when(month == 12 | month <= 3 ~ "Dry",
                                   month >= 4  & month <= 6 ~ "Dry to Rainy",
                                   month >= 7  & month <= 8 ~ "Rainy",
                                   month >= 9 & month <= 11 ~ "Rainy to Dry"),
                         levels = c("Dry",
                                    "Dry to Rainy",
                                    "Rainy",
                                    "Rainy to Dry")),
         tanks = case_when(tanks == 1 ~ "Single",
                           tanks == 2 ~ "Double")) %>%
  ungroup()



##----------------------------------------------------------------
##                          Odds Ratio                           -
##----------------------------------------------------------------


# detach("package:plyr")
# library(dplyr)

or_vars <- c("community",
             "season",
             "tanks",
             "filter_source")


# Mutate and filter "buffering" data.frame into data useable for OLS
or_data <- buffering %>%
  group_by(site, date) %>%
  summarise(community = unique(community),
            season = unique(season),
            filter_source = unique(filter_source),
            category = unique(category),
            tanks = unique(factor(tanks))) %>%
  dplyr::select(category, all_of(or_vars)) %>%
  mutate(tanks = factor(tanks,
                        levels = c("Double", "Single")),
         filter_source = factor(case_when(filter_source == "Piped" ~ "Piped",
                                          filter_source == "Bowser" ~ "Bowser",
                                          TRUE ~ NA),
                                levels = c("Piped", "Bowser")),
         season = factor(case_when(season == "Rainy" ~ "Rainy",
                                   season == "Dry" ~ "Dry",
                                   TRUE ~ NA),
                         levels = c("Rainy", "Dry"))) %>%
  ungroup()
# or_data %>%
#   select(category) %>%
#   table() %>%
#   print()

or_data_t1 <- or_data %>%
  mutate(category = fct_collapse(category,
                                 "Empty" = c("Empty"),
                                 "NotEmpty" = c("Offline", "Operational")))
# or_data_t1 %>%
#   select(category) %>%
#   table() %>%
#   print()

or_data_t2 <- or_data %>%
  mutate(category = fct_collapse(category,
                                 "NotOperational" = c("Empty", "Offline"),
                                 "Operational" = c("Operational")))
# or_data_t2 %>%
#   select(category) %>%
#   table() %>%
#   print()



# ##------------------------
# ##  Calculate Odds Ratio  
# ##------------------------
# or_variable <- or_vars[1]
# 
# 
# # Create table for variable of interest
# or_table <- or_data_t1 %>%
#   select(any_of(or_variable),
#          category) %>%
#   table()
# or_table
# 
# 
# # Fit OR model
# or_fit <- oddsratio(or_table)
# View(or_fit$p.value)
# 
# 
# # Select OR estimate and 95% CI from model
# or_values <- round(or_fit$measure[2,], 2)
# or_values
# 
# # Select Fisher's Exact p-value for OR
# or_p <- format(or_fit$p.value[2,"fisher.exact"], scientific = TRUE)
# 
# 
# or_result <- 
#   c(variable = or_variable,
#       or_values,
#       or_p)

##----------------------------------------------------------------
##                    For Loop on Odds Ratio                     -
##----------------------------------------------------------------

library(ggforce)
library(epitools)
library(gtools)


##----------
##  Test 1  
##----------
table_OR_T1 <- NA

for(i in 1:length(or_vars)){
  # for(i in 4){
  
  or_variable <- or_vars[i]
  # or_variable
  
  # Create table for variable of interest
  or_table <- or_data_t1 %>%
    dplyr::select(any_of(or_variable),
                  category) %>%
    table()
  or_sample <- sum(or_table)
  
  
  # Fit OR model
  or_fit <- oddsratio(or_table)
  
  
  # Select OR estimate and 95% CI from model
  # or_values <- round(or_fit$measure[2,], 2)
  or_values <- or_fit$measure[2,]
  
  
  # Select Fisher's Exact p-value for OR
  # or_p <- format(or_fit$p.value[2,"fisher.exact"]*8, scientific = TRUE)
  # or_p <- stars.pval(or_fit$p.value[2,"fisher.exact"]*8)
  or_p <- stars.pval(
    ifelse(or_fit$p.value[2,"fisher.exact"]*8 <= 1,
           or_fit$p.value[2,"fisher.exact"],
           1)
  )
  
  # Select Measure vs Comparison
  # or_measure <-rownames(or_fit$measure)[1]
  # or_comparison <- rownames(or_fit$measure)[2]
  or_measureVcomparison <- paste0(rownames(or_fit$measure)[1], " vs ", rownames(or_fit$measure)[2])
  
  
  # Bind current results to results table
  table_OR_T1 <- cbind(table_OR_T1,
                       c(variable = or_variable,
                         sample = or_sample,
                         # measure = or_measure,
                         # comparison = or_comparison,
                         measureVcomparison = or_measureVcomparison,
                         or_values,
                         p.fisher.adj = or_p))
  
}


table_OR_T1 <- table_OR_T1 %>%
  t() %>%
  as.data.frame() %>%
  remove_rownames() %>%
  filter(!is.na(variable)) %>%
  mutate(estimate = as.numeric(estimate),
         lower = as.numeric(lower),
         upper = as.numeric(upper))





##----------
##  Test 2  
##----------
table_OR_T2 <- NA

for(i in 1:length(or_vars)){
  # for(i in 4){
  
  or_variable <- or_vars[i]
  # or_variable
  
  # Create table for variable of interest
  or_table <- or_data_t2 %>%
    select(any_of(or_variable),
           category) %>%
    table()
  # or_table
  or_sample <- sum(or_table)
  
  
  # Fit OR model
  or_fit <- oddsratio(or_table)
  
  
  # Select OR estimate and 95% CI from model
  # or_values <- round(or_fit$measure[2,], 2)
  # or_values <- as.numeric(or_fit$measure[2,])
  or_values <- or_fit$measure[2,]
  
  
  
  # Select Fisher's Exact p-value for OR
  # or_p <- format(or_fit$p.value[2,"fisher.exact"]*8, scientific = TRUE)
  or_p <- stars.pval(
    ifelse(or_fit$p.value[2,"fisher.exact"]*8 <= 1,
           or_fit$p.value[2,"fisher.exact"],
           1)
  )
  
  # Select Measure vs Comparison
  # or_measure <- rownames(or_fit$measure)[1]
  # or_comparison <- rownames(or_fit$measure)[2]
  or_measureVcomparison <- paste0(rownames(or_fit$measure)[1], " vs ", rownames(or_fit$measure)[2])
  
  # Bind current results to results table
  table_OR_T2 <- cbind(table_OR_T2,
                       c(variable = or_variable,
                         sample = or_sample,
                         # measure = or_measure,
                         # comparison = or_comparison,
                         measureVcomparison = or_measureVcomparison,
                         or_values,
                         p.fisher.adj = or_p))
  
}



table_OR_T2 <- table_OR_T2 %>%
  t() %>%
  as.data.frame() %>%
  remove_rownames() %>%
  filter(!is.na(variable)) %>%
  mutate(estimate = as.numeric(estimate),
         lower = as.numeric(lower),
         upper = as.numeric(upper))


##-----------------------------------
##  Combine OR Resuts for T1 and T2  
##-----------------------------------
table_OR_T1
table_OR_T2


table_OR <- merge(table_OR_T1,
                  table_OR_T2,
                  by = c("variable",
                         "sample",
                         "measureVcomparison")) %>%
  as.data.frame() %>%
  select(-variable) %>%
  relocate(measureVcomparison, everything()) %>%
  arrange(desc(estimate.y)) %>%
  print()

print(xtable(table_OR,
             digits = 2),
      include.rownames = FALSE)


##################################################################
##                         Daily Demand                         ##
##################################################################

range01 <- function(x, ...){(x - min(x, ...)) / (max(x, ...) - min(x, ...))}

# dailydemand_bowser <- sensor_volume %>%
#   filter(filter_source == "bowser") %>%
#   group_by(site) %>%
#   arrange(datetime) %>%
#   mutate(volume_diff = volume - lag(volume)) %>%
#   filter(volume_diff <= 0) %>%
#   group_by(hour) %>%
#   summarise(hour = unique(hour),
#             mean_diff = -mean(volume_diff, na.rm = TRUE)) %>%
#   filter(hour >= 5 & hour <= 23) %>%
#   ungroup() %>%
#   mutate(scale_mean_diff = range01(mean_diff))
# 
# 
# dailydemand_mean <-
#   ggplot() +
# #   geom_line(data = dailydemand_piped,
# #             aes(hour, -mean_diff), color = "blue", size = 2) +
#   # geom_line(data = dailydemand_bowser,
#             # aes(hour, -mean_diff), color = "red", size = 2) +
#   # geom_line(data = dailydemand_mixed,
#   #           aes(hour, -mean_diff), color = "purple", size = 2) +
#   geom_area(data = dailydemand_bowser,
#             aes(hour,
#                 scale_mean_diff), 
#             color = "black",
#             fill = "blue",
#             alpha = 0.5,
#             size = 2) +
#     scale_color_viridis_d() +
#     # theme_facets() +
#   
#   scale_x_continuous(limits = c(6, 23),
#                      breaks = seq(0, 24, 2),
#                      expand = c(0,0)) +
#   scale_y_continuous(limits = c(0,1),
#                      expand = c(0,0),
#                      labels = scales::percent_format(scale = 100)) +
# 
#   labs(x = "Hour of Day",
#        y = "Normalized Mean Hourly Demand") +
#   # theme_bw()
#   theme_classic()
#   
# # pdf(file = "dailydemand_mean.pdf", width = 8, height = 4)
# dailydemand_mean
# # dev.off()




dailydemand_bowser2 <- sensor_volume %>%
  filter(filter_source == "bowser") %>%
  group_by(site) %>%
  arrange(datetime) %>%
  mutate(volume_diff = volume - lag(volume)) %>%
  filter(volume_diff <= 0) %>%
  group_by(hour) %>%
  summarise(hour = unique(hour),
            mean_diff = -mean(volume_diff, na.rm = TRUE)) %>%
  filter(hour >= 5 & hour <= 23) %>%
  ungroup() %>%
  mutate(total = sum(mean_diff),
         relativedemand = mean_diff/total)

dailydemand_bowser2_plusone <- merge(
  data.frame(hour = seq(4,24,1)),
  dailydemand_bowser2,
  all = TRUE) %>%
  select(hour, relativedemand) %>%
  mutate(relativedemand = replace_na(relativedemand, 0))


dailydemand_bowser2_full <- merge(
  data.frame(hour = seq(0,24,1)),
  dailydemand_bowser2,
  all = TRUE) %>%
  select(hour, relativedemand) %>%
  mutate(relativedemand = replace_na(relativedemand, 0))


DemandProfile <- data.frame(TIME = seq(0, 719, 1),
                            DemandProfile = rep(
                              dailydemand_bowser2_full %>%
                                filter(hour != 24) %>%
                                rename(demandprofile = relativedemand) %>%
                                select(demandprofile) %>%
                                pull(),
                              30))

# write.xlsx(DemandProfile, "~/Research/PhD - CU MCGE/PhD Research/RP3 - Leverage - Systems Modeling of Kiosk Scaling/2023_SDM_Freetown/2023_Freetown_SFM/Data/DemandProfile_Monthly.xlsx")
print(xtable(DemandProfile %>%
               filter(TIME < 24) %>%
               mutate(TIME = as.character(TIME),
                      DemandProfile = percent(DemandProfile, accuracy = 0.01))),
      include.rownames = FALSE)



spline_demand <- as.data.frame(
  spline(dailydemand_bowser2_plusone$hour, 
         dailydemand_bowser2_plusone$relativedemand))

plot_DemandProfile <-
  ggplot(dailydemand_bowser2_full) +
  # geom_point(aes(hour, relativedemand)) +
  geom_area(data = spline_demand,
            aes(x = x, y = y),
            fill = "blue",
            alpha = 0.8) +
  scale_x_continuous(limits = c(0,24),
                     breaks = seq(0, 24, 2),
                     expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0),
                     labels = scales::percent_format(scale = 100)) +
  labs(x = "Hour of Day",
       y = "Relative Hourly Demand") +
  theme_classic() +
  theme(panel.grid.major.x = element_line(colour = "lightgray"))

# pdf(file = "plot_DemandProfile.pdf", width = 8, height = 4)
plot_DemandProfile
# dev.off()



#################################################################
##                Functionality Breakdown Table                ##
#################################################################



buffering_daily <- buffering %>%
  group_by(site, date) %>%
  summarize(community = unique(community),
            season = unique(season),
            tanks = unique(tanks),
            filter_source = unique(filter_source),
            category = unique(category),
            weekday = unique(weekday),
            all = unique(all),
            month = unique(month))

table_all <- table(buffering_daily$all, buffering_daily$category) %>%
  as.data.frame.matrix() %>%
  mutate(Total = rowSums(.[1:3])) %>%
  mutate_at(vars(1:3), funs(paste0(round(100*./Total, 0), "%"))) %>%
  relocate(Total, everything()) %>%
  mutate(category = "All")

table_community <- table(buffering_daily$community, buffering_daily$category) %>%
  as.data.frame.matrix() %>%
  mutate(Total = rowSums(.[1:3])) %>%
  mutate_at(vars(1:3), funs(paste0(round(100*./Total, 0), "%"))) %>%
  relocate(Total, everything()) %>%
  mutate(category = "Community")

table_site <- table(buffering_daily$site, buffering_daily$category) %>%
  as.data.frame.matrix() %>%
  mutate(Total = rowSums(.[1:3])) %>%
  mutate_at(vars(1:3), funs(paste0(round(100*./Total, 0), "%"))) %>%
  relocate(Total, everything()) %>%
  mutate(category = "Site")

table_tanks <- table(buffering_daily$tanks, buffering_daily$category) %>%
  as.data.frame.matrix() %>%
  mutate(Total = rowSums(.[1:3])) %>%
  mutate_at(vars(1:3), funs(paste0(round(100*./Total, 0), "%"))) %>%
  relocate(Total, everything()) %>%
  mutate(category = "Tanks")

table_source <- table(buffering_daily$filter_source, buffering_daily$category) %>%
  as.data.frame.matrix() %>%
  mutate(Total = rowSums(.[1:3])) %>%
  mutate_at(vars(1:3), funs(paste0(round(100*./Total, 0), "%"))) %>%
  relocate(Total, everything()) %>%
  mutate(category = "Source")

table_weekday <- table(buffering_daily$weekday, buffering_daily$category) %>%
  as.data.frame.matrix() %>%
  mutate(Total = rowSums(.[1:3])) %>%
  mutate_at(vars(1:3), funs(paste0(round(100*./Total, 0), "%"))) %>%
  relocate(Total, everything()) %>%
  mutate(category = "Weekday")

table_month <- table(buffering_daily$month, buffering_daily$category) %>%
  as.data.frame.matrix() %>%
  mutate(Total = rowSums(.[1:3])) %>%
  mutate_at(vars(1:3), funs(paste0(round(100*./Total, 0), "%"))) %>%
  relocate(Total, everything()) %>%
  mutate(category = "Month")

table_season <- table(buffering_daily$season, buffering_daily$category) %>%
  as.data.frame.matrix() %>%
  mutate(Total = rowSums(.[1:3])) %>%
  mutate_at(vars(1:3), funs(paste0(round(100*./Total, 0), "%"))) %>%
  relocate(Total, everything()) %>%
  mutate(category = "Season")



table_functionality <- rbind(
  table_all,
  table_community,
  table_site,
  table_tanks,
  table_source,
  table_season)


# # Convert to LaTeX
# xtable(table_functionality,
#        digits = 0)
# 
# # Convert to Excel clip
# write_clip(table_functionality)




table_functionality2 <- table_functionality %>%
  mutate(Variable = row.names(.)) %>%
  remove_rownames() %>%
  # select(Variable, Operational, category, Total) %>%
  # mutate(Level = "Operational") %>%
  # dplyr::rename(Rate = "Operational") %>%
  mutate(Variable = case_when(Variable == "piped" ~ "Piped",
                              Variable == "mixed" ~ "Mixed",
                              Variable == "bowser" ~ "Bowser",
                              TRUE ~ Variable)) %>%
  arrange(Operational) %>%
  mutate(
    # Level = factor(Level,
    #               levels = c("Operational", "Non-Operational", "Empty")),
    category = factor(category,
                      levels = c("All", "Community", "Site",
                                 "Source", "Tank", "Season")),
    Variable = case_when(Variable == "piped" ~ "Piped",
                         Variable == "mixed" ~ "Mixed",
                         Variable == "bowser" ~ "Bowser",
                         TRUE ~ Variable)) %>%
  mutate(Variable = case_when(Variable == "Kiosk - 05" ~ "K - 05 (A, D)",
                              Variable == "Kiosk - 08" ~ "K - 08 (A, S)",
                              Variable == "Kiosk - 07" ~ "K - 07 (K, S)",
                              Variable == "Kiosk - 06" ~ "K - 06 (K, S)",
                              Variable == "Kiosk - 15" ~ "K - 15 (A, S)",
                              Variable == "Kiosk - 02" ~ "K - 02 (K, S)",
                              Variable == "Kiosk - 04A" ~ "K - 04A (K, S)",
                              Variable == "Kiosk - 11A" ~ "K - 11A (K, D)",
                              Variable == "Kiosk - 09" ~ "K - 09 (A, S)",
                              Variable == "Kiosk - 04" ~ "K - 04 (A, S)",
                              TRUE ~ Variable))



table_functionality_long <- 
  rbind(
    
    remove_rownames(table_functionality2) %>%
      mutate(Level = "Operational") %>%
      dplyr::select(Variable, Level, Operational, category) %>%
      dplyr::rename(Rate = Operational),
    
    remove_rownames(table_functionality2) %>%
      mutate(Level = "Offline") %>%
      dplyr::select(Variable, Level, "Offline", category) %>%
      dplyr::rename(Rate = "Offline"),
    
    remove_rownames(table_functionality2) %>%
      mutate(Level = "Empty") %>%
      dplyr::select(Variable, Level, Empty, category) %>%
      dplyr::rename(Rate = "Empty")
  ) %>%
  
  mutate(Rate = as.numeric(sub("%","",Rate))/100) %>%
  # Variable = case_when(Variable == 13 ~ 1,
  #                      Variable == 21 ~ 2,
  #                      TRUE ~ Variable),
  # Variable = factor(Variable,
  #                   levels = rev(rownames(table_functionality2)))) %>%
  mutate(Level = factor(Level,
                        levels = c("Operational", "Offline", "Empty")),
         category = factor(category,
                           levels = c("All", "Community", "Site",
                                      "Source", "Tanks", "Season")),
         Variable = case_when(Variable == "piped" ~ "Piped",
                              Variable == "mixed" ~ "Mixed",
                              Variable == "bowser" ~ "Bowser",
                              TRUE ~ Variable)) %>%
  mutate(Variable = factor(Variable,
                           levels = (table_functionality2$Variable))) %>%
  mutate(Variable = fct_relevel(Variable,
                                c("Rainy to Dry",
                                  "Rainy",
                                  "Dry to Rainy",
                                  "Dry")))





plot_OperationalRates <-
  ggplot() +
  geom_bar(data = table_functionality_long,
           aes(x = Variable, y = Rate, fill = Level),
           position = 'fill', 
           stat = "identity") +
  geom_text(data = subset(table_functionality_long, Rate > 0.05),
            aes(y = Rate,
                label = (paste0(Rate*100, "%")),
                x = Variable,
                group = Level,
                fontface = 2),
            position = position_stack(vjust = .5)) +
  
  geom_text(data = table_functionality2,
            aes(y = -0.15,
                label = paste0("(", Total, ")"),
                x = Variable),
            position = position_stack(vjust = .5)) +
  
  facet_col(~factor(category),
            scale = "free_y",
            space = "free",
            drop = TRUE,
            strip.position = "right") +
  scale_fill_manual("Service Level",
                    values = Turbo(out.colors = 3,
                                   pal.min = 0.9,pal.max = 0.1,
                                   reverse = TRUE)) +
  coord_flip() +
  theme_facets() +
  theme(panel.border = element_rect(color = "black", fill = NA, linewidth = 2)) +
  labs(y = "Service Level Daily Frequency Rate",
       x = "Variables") +
  scale_x_discrete(expand = c(0,0)) +
  scale_y_continuous(limits = c(-0.15,1),
                     expand = c(0,0),
                     labels = scales::percent_format(scale = 100)) +
  geom_hline(yintercept = 0, linewidth = 1.5)


# pdf(file = "plot_OperationalRates_updated.pdf", width = 8, height = 10)
plot_OperationalRates
# dev.off()

# png(file = "plot_OperationalRates.png",
#     height = 5.4,
#     width = 12.53,
#     units = "in",
#     res = 1000)
# plot_OperationalRates
# dev.off()




##################################################################
##                 Distribution of Water Levels                 ##
##################################################################

volume_dist <- sensor_volume %>%
  select(community, site, tanks, hour, month, volume, capacity) %>%
  as.data.frame() %>%
  mutate(daynight = ifelse(hour > 6 & hour <= 18, "Day", "Night"),
         season1 = ifelse(month >= 4 & month <= 8, "Rainy", "Dry"),
         season2 = factor(case_when(month == 12 | month <= 3 ~ "Dry",
                                    month >= 4  & month <= 6 ~ "Transitional",
                                    month >= 7  & month <= 8 ~ "Rainy",
                                    month >= 9 & month <= 11 ~ "Transitional"),
                          levels = c("Dry",
                                     "Transitional",
                                     "Rainy")),
         timeperiod = factor(
           case_when((hour >= 0  & hour < 4)   ~ "Late Night",
                     (hour >= 4  & hour < 8)   ~ "Early Morning",
                     (hour >= 8  & hour < 12)  ~ "Late Morning",
                     (hour >= 12 & hour < 16)  ~ "Afternoon",
                     (hour >= 16 & hour < 20)  ~ "Evening",
                     (hour >= 20 & hour <= 23) ~ "Early Night"),
           levels = c("Late Night",
                      "Early Morning",
                      "Late Morning",
                      "Afternoon",
                      "Evening",
                      "Early Night")),
         ETV = 0.1379 * capacity,
         FETV = 0.2 * capacity,
         tanks = factor(case_when(tanks == 1 ~ "Single",
                                  tanks == 2 ~ "Double"),
                        levels = c("Single", "Double")))

plot_WaterLevelDist_Season <-
  ggplot(volume_dist) +
  
  geom_density(aes(volume),
               key_glyph = draw_key_path,
               linewidth = 2) +
  
  geom_density(aes(volume,
                   group = (season2 ),
                   linetype = (season2)),
               key_glyph = draw_key_path,
               linewidth = 1) +
  # geom_vline(data = volume_dist %>% group_by(tanks),
  #            aes(xintercept = volume_dist$ETV)) +
  # geom_vline(data = volume_dist %>% group_by(tanks) %>% summarize(FETV = unique(FETV)),
  #            aes(xintercept = volume_dist$FETV)) +
  
  
  # geom_vline(aes(xintercept = ETV),
  #            data = volume_dist %>% 
  #              filter(tanks %in% levels(as.factor(ggplot_build(.)$layout$panel_params[[1]]$variables$tanks))) %>% 
  #              group_by(tanks) %>% 
  #              summarise(ETV = unique(ETV))) +

# geom_vline(xintercept = 1379,
#            linewidth = 3) +
# geom_vline(xintercept = 2000,
#            linewidth = 3) +

geom_vline(data = filter(volume_dist, tanks == "Single"),
           aes(xintercept = ETV),
           linewidth = 2) +
  geom_vline(data = filter(volume_dist, tanks == "Double"),
             aes(xintercept = ETV),
             linewidth = 2) +
  
  # geom_vline(data = filter(volume_dist, tanks == "Single"),
  #            aes(xintercept = FETV)) +
  # geom_vline(data = filter(volume_dist, tanks == "Double"),
  #            aes(xintercept = FETV)) +
  
  scale_x_continuous(limits = c(0, 10000),
                     expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  labs(x = "Volume (L)",
       y = "Density Estimate",
       linetype = "Season") +
  theme_classic() +
  scale_color_viridis_d() +
  facet_wrap(~tanks,
             scales = "free",
             nrow = 1) +
  facetted_pos_scales(
    x = list(
      tanks == "Double" ~ scale_x_continuous(limits = c(0, 20000),
                                             expand = c(0,0)))) +
  theme_facets() +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        panel.spacing = unit(2, "lines"),
        legend.position = "bottom")

plot_WaterLevelDist_Time <-
  ggplot(volume_dist) +
  
  geom_density(aes(volume),
               key_glyph = draw_key_path,
               linewidth = 2) +
  
  geom_density(aes(volume,
                   group = (timeperiod),
                   color = (timeperiod)),
               key_glyph = draw_key_path,
               linewidth = 1) +
  # geom_vline(xintercept = 1379) +
  # geom_vline(xintercept = 2000) +
  
  geom_vline(data = filter(volume_dist, tanks == "Single"),
             aes(xintercept = ETV),
             linewidth = 2) +
  geom_vline(data = filter(volume_dist, tanks == "Double"),
             aes(xintercept = ETV),
             linewidth = 2) +
  
  scale_x_continuous(limits = c(0, 10000),
                     expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  labs(x = "Volume (L)",
       y = "Density Estimate",
       color = "Time of Day") +
  theme_classic() +
  scale_color_viridis_d() +
  facet_wrap(~tanks,
             scales = "free",
             nrow = 1) +
  facetted_pos_scales(
    x = list(
      tanks == "Double" ~ scale_x_continuous(limits = c(0, 20000),
                                             expand = c(0,0)))) +
  theme_facets() +
  theme(axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        panel.spacing = unit(2, "lines"),
        legend.position = "bottom")


plot_StorageDistribution_yaxistitle <- 
  ggplot(data.frame(l = "Density Estimates", x = 1, y = 1)) +
  geom_text(aes(x, y, label = l), angle = 90) + 
  theme_void() +
  coord_cartesian(clip = "off")

plot_StorageDistribution <-
  plot_StorageDistribution_yaxistitle + (plot_WaterLevelDist_Season + plot_WaterLevelDist_Time + 
                                           plot_layout(guides = "collect",
                                                       nrow = 2) &
                                           theme(legend.position = "right",
                                                 legend.justification = "left",
                                                 legend.direction = "vertical",
                                                 legend.box = "vertical")) +
  plot_layout(widths = c(1, 25))




# pdf(file = "plot_StorageDistribution3.pdf", width = 10, height = 6)
plot_StorageDistribution
# dev.off()





