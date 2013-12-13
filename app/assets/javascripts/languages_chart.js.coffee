google.load "visualization", "1", { packages: ["corechart"] }

$ ->
  return unless Dmtc.Globals.guilds?
  stats = Dmtc.Globals.guilds.getStatsData()

  $('a[href="#guilds-tab"]').on 'shown.bs.tab', (e) ->
    drawChart()

  drawChart = ->
    return unless stats.length > 0
    container = document.getElementById('guilds-piechart')
    container.style.display = 'block'
    data = google.visualization.arrayToDataTable([['Guild', 'Codes']].concat stats)
    chart = new google.visualization.PieChart(container)
    options =
      title: I18n.t('code.usage_ratio')
      titleTextStyle:
        fontSize: 18
      colors: Dmtc.Globals.guilds.statsColors()
      backgroundColor: "#EEDFC7"

    chart.draw data, options

  if stats.length > 0
    google.setOnLoadCallback drawChart
