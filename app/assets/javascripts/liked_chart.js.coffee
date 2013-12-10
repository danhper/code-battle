google.load "visualization", "1", { packages: ["corechart"] }

$ ->
  #liked = Dmtc.Globals.guilds.liked.getLikedData()
  guild_name = Dmtc.Globals.guilds.liked.getName()
  liked_count = Dmtc.Globals.guilds.liked.getLikedCount()
  colors =  Dmtc.Globals.guilds.liked.statsColors()
  #liked = _.zip(guild_name,liked_count,colors)
  liked = _.zip(guild_name,liked_count)

  drawLikedChart = ->
     return unless Dmtc.Globals.guilds.liked?
     return unless liked.length > 0
    container = document.getElementById('liked-columnchart')
    container.style.display = 'block'
    data = google.visualization.arrayToDataTable([['Guild', 'Liked']].concat liked)
    chart = new google.visualization.ColumnChart(container);
    options =
      #colors: Dmtc.Globals.guilds.liked.statsColors()
      backgroundColor: "#EEDFC7"

    chart.draw data, options
    
  if stats.length > 0
    google.setOnLoadCallback drawLikedChart
