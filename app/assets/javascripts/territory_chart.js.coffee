google.load "visualization", "1", { packages: ["corechart"] }

$ ->
  return unless Dmtc.Globals.guilds?
  territorys = Dmtc.Globals.guilds.getTerritory()
  counts = Dmtc.Globals.guilds.getTerritoryCount()
  sum = _.reduce(counts ,(x, y) -> x + y)

  drawTerritoryChart = ->
    return unless territorys.length > 0
    return unless sum > 0
    container = document.getElementById('territory-piechart')
    container.style.display = 'block'
    data = google.visualization.arrayToDataTable([['Guild', 'Territory']].concat territorys)
    chart = new google.visualization.PieChart(container);
    options =
      title: 'ギルドの領土'
      titleTextStyle:
        fontSize: 18
      colors: Dmtc.Globals.guilds.statsColors()
      backgroundColor: "#EEDFC7"

    chart.draw data, options

  if sum > 0
    google.setOnLoadCallback drawTerritoryChart
  
