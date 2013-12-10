google.load "visualization", "1", { packages: ["corechart"] }

$ ->
  liked = Dmtc.Globals.guilds.liked.getLikedData()

  drawLikedChart = ->
     return unless Dmtc.Globals.guilds.liked?
     return unless liked.length > 0
    container = document.getElementById('liked-columnchart')
    container.style.display = 'block'
    data = google.visualization.arrayToDataTable([['Guild', 'Liked']].concat liked)
    chart = new google.visualization.ColumnChart(container);
    options =
      colors: Dmtc.Globals.guilds.liked.statsColors()
      backgroundColor: "#EEDFC7"

    chart.draw data, options
    
  if stats.length > 0
    google.setOnLoadCallback drawLikedChart
