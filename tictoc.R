for (i in 1:1260) {

  tictoc::tic()
  Sys.sleep(60)
  tictoc::toc()
  httr::authenticate(user = "MB295VIZ", password = ":U078ZS3U", type = "basic")
  response <- httr::GET("http://app.citi-mb.mx/GTFS-RT/vehiculosPosicion", extract=TRUE)
  FeedMessage <- gtfsway::gtfs_realtime(response)
  lst1 <- gtfsway::gtfs_vehiclePosition(FeedMessage)
  lst2<- data.table::rbindlist(lst1)
  write.csv(lst2, paste0("/Users/85412/Desktop/gtfs_metrobus_min/", format(Sys.time(), "%d-%b-%Y %H.%M"), ".csv"))
  
}
