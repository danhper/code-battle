google.load "visualization", "1", { packages: ["corechart"] }

$ ->
  drawChart = ->
    return unless Dmtc.Globals.guilds?
    stats = Dmtc.Globals.guilds.getStatsData()
    container = document.getElementById('guilds-piechart')
    data = google.visualization.arrayToDataTable([['Guild', 'Codes']].concat stats)
    chart = new google.visualization.PieChart(container);
    options =
      colors: Dmtc.Globals.guilds.statsColors()
      backgroundColor: "#EEDFC7"

    chart.draw data, options


  google.setOnLoadCallback drawChart


