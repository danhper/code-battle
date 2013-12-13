google.load "visualization", "1", { packages: ["corechart"] }

$ ->
  guild_name = Dmtc.Globals.guilds.liked.getName()
  liked_count = Dmtc.Globals.guilds.liked.getLikedCount()
  colors =  Dmtc.Globals.guilds.liked.statsColors()
  liked = _.zip(guild_name,liked_count,colors)
  sum = _.reduce(liked_count,(x, y) -> x + y)

  drawLikedChart = ->
    return unless Dmtc.Globals.guilds.liked?
    return unless liked.length > 0
    return unless sum > 0
    container = document.getElementById('liked-columnchart')
    container.style.display = 'block'
    data = google.visualization.arrayToDataTable([['Guild', 'Liked', role:'style']].concat liked)
    chart = new google.visualization.ColumnChart(container);
    options =
      backgroundColor: "#EEDFC7"

    chart.draw data, options
    
  if sum > 0
    google.setOnLoadCallback drawLikedChart
