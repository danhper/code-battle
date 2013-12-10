google.load "visualization", "1", { packages: ["corechart"] }

$ ->
  stats = Dmtc.Globals.guilds.getStatsData()

  drawChart = ->
    return unless Dmtc.Globals.guilds?
    return unless stats.length > 0
    container = document.getElementById('guilds-piechart')
    container.style.display = 'block'
    data = google.visualization.arrayToDataTable([['Guild', 'Codes']].concat stats)
    chart = new google.visualization.PieChart(container);
    options =
      colors: Dmtc.Globals.guilds.statsColors()
      backgroundColor: "#EEDFC7"

    chart.draw data, options


  if stats.length > 0
    google.setOnLoadCallback drawChart


