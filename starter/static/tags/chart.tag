<!-- © Devon Rueckner 2016 -->
<chart>

  <div class="chart"></div>

  <script>
  app.chart = {};
  app.chart.size = 250;
  app.chart.margin = {
    top: 20,
    right: 20,
    bottom: 30,
    left: 40
  };
  app.chart.width = app.chart.size - app.chart.margin.left - app.chart.margin.right;
  app.chart.height = app.chart.size - app.chart.margin.top - app.chart.margin.bottom;

  app.chart.x_scale = d3.scale.linear()
    .domain([0, 100])
    .range([0, app.chart.width]);

  app.chart.y_scale = d3.scale.linear()
    .domain([0, 100])
    .range([app.chart.height, 0]);

  app.chart.colors = {
    available: '#129fea',
    saved: '#bd4b1e',
    filtered: '#6f6f6f',
  };

  app.chart.xAxis = d3.svg.axis()
    .scale(app.chart.x_scale)
    .ticks(5)
    .orient("bottom");

  app.chart.yAxis = d3.svg.axis()
    .scale(app.chart.y_scale)
    .ticks(5)
    .orient("left");

  app.chart.drag = d3.behavior.drag();
  app.chart.drag.on('drag', function() {
    app.ctrl.setCritMin(app.chart.y_scale.invert(d3.event.y));
    app.ctrl.setAudMin(app.chart.x_scale.invert(d3.event.x));
  });

  this.on('mount', function() {

    app.chart.svg = d3.select(".chart").append("svg")
      .attr("width", app.chart.width + app.chart.margin.left + app.chart.margin.right)
      .attr("height", app.chart.height + app.chart.margin.top + app.chart.margin.bottom)
      .append("g")
      .attr("transform", "translate(" + app.chart.margin.left + "," + app.chart.margin.top + ")");

    app.chart.crit_thresh = app.chart.svg.append('line')
      .attr('class', 'threshold')
      .attr("x2", app.chart.x_scale(100));

    app.chart.aud_thresh = app.chart.svg.append('line')
      .attr('class', 'threshold')
      .attr("y2", app.chart.y_scale(100));

    app.chart.svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + app.chart.height + ")")
      .call(app.chart.xAxis)
      .append("text")
      .attr("class", "label")
      .attr("x", app.chart.width)
      .attr("y", -6)
      .style("text-anchor", "end")
      .text("Audience");

    app.chart.svg.append("g")
      .attr("class", "y axis")
      .call(app.chart.yAxis)
      .append("text")
      .attr("class", "label")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Critics");

    app.chart.svg.selectAll(".dot")
      .data(app.movies)
      .enter().append("circle")
      .attr("class", "dot")
      .attr("cx", function(movie) {
        return app.chart.x_scale(movie.audience_score);
      })
      .attr("cy", function(movie) {
        return app.chart.y_scale(movie.critics_score);
      });

    app.chart.handle = app.chart.svg.append("circle")
      .attr("class", "handle")
      .attr("r", 6.5);

    app.chart.handle.call(app.chart.drag);

    app.chart.updateChart();
  });

  app.chart.updateChart = function() {
    app.chart.svg.selectAll(".dot")
      .data(app.movies)
      .attr("r", function(movie) {
        return app.isSaved(movie.id) ? 3 : 2;
      })
      .style("fill", function(movie) {
        if (app.isAvailable(movie.id)) {
          return app.chart.colors.available;
        } else if (app.isSaved(movie.id)) {
          return app.chart.colors.saved;
        }
        return app.chart.colors.filtered;
      });

    var crit_min_pos = app.chart.y_scale(app.critics_min),
      aud_min_pos = app.chart.x_scale(app.audience_min);

    app.chart.crit_thresh
      .attr("x1", aud_min_pos)
      .attr("y1", crit_min_pos)
      .attr("y2", crit_min_pos);

    app.chart.aud_thresh
      .attr("y1", crit_min_pos)
      .attr("x1", aud_min_pos)
      .attr("x2", aud_min_pos);

    app.chart.handle
      .attr("cx", aud_min_pos)
      .attr("cy", crit_min_pos);
  };

  app.on('update', app.chart.updateChart);

  </script>


  <style scoped>
  :scope {
    display: block;
    margin-top: 20px;
  }

  .chart {
    position: relative;
    left: -10px;
  }

  .threshold {
    fill: none;
    stroke: #6f6f6f;
    shape-rendering: crispEdges;
  }

  .axis path,
  .axis line {
    fill: none;
    stroke: #000000;
    shape-rendering: crispEdges;
  }

  .dot {
    stroke: none;
  }

  .handle {
    fill: #e8e8e8;
    stroke: #949494;
    stroke-width: 1;
  }

  </style>

</chart>
