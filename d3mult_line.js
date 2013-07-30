    var svg = d3.select("svg");
    var line = d3.svg.line()
                      .x(function (d) {
                          return +d.x;
                       })
                      .y(function (d) { return +d.y; })
                      .interpolate("basis");

    var parseDate = d3.time.format("%Y-%m-%d").parse,
                        bisectDate = d3.bisector(function (d) { return +d.x; }).left;

    function pointsToArray(points) {
      var pointsArray = new Array();

      pointsArray = points.match(/[^ ]+/g);

      pointsArray = pointsArray.map(
                          function (d, i) {
                            return {
                              x: d.split(",")[0],
                              y: d.split(",")[1],
                            }
                          }
                      );

      return pointsArray;
    }

    var g = svg.selectAll('.lines');

    var pointsdata = [];
    var pointsline = [];
    d3.entries(data.data).forEach(
      function (d,i) {
        pointsline = pointsToArray(d3.select(g[0][i]).select('polyline').attr("points"));
        d.value.groups.forEach(
          function (dd, ii) {
            pointsdata.push(
               {
                  x:pointsline[ii].x, y:pointsline[ii].y,
                  data: {"x": d.value.x[ii], "y": d.value.y[ii], "group": d.value.groups[ii], "strip": d.key } 
               }
            )
          }
        )
      }
    )


    //assign data to the line
    //g.data(d3.entries(data.data));
    g.data(d3.nest().key(function (d) { return d.data.group }).entries(pointsdata));

    //loop through each polyline and add a path to contain the data for tootips/hover
    g[0].forEach(function(d) {   
      var mypath = d3.select(d).append("path")
      mypath
        .datum(mypath.datum().values)
        .attr("d",line)
    })

    var focus = svg.selectAll(".focus")
                        .data(d3.entries(data.groups)).enter().append("g")
                              .attr("class", "focus")
                              .attr("id", function (d, i) { return "focus-" + i; })
                              .style("display", "none");

    focus.append("circle")
                      .attr("r", 4.5)
                      .attr("stroke", "black")
                      .attr("fill-opacity", "0");

    focus.append("text")
      .attr("x", 9)
      .attr("dy", ".35em");

    svg
      .on("mouseover", function () { focus.style("display", null); })
      .on("mouseout", function () { focus.style("display", "none"); })
      .on("mousemove", mousemove);

    function mousemove() {
      var x0 = d3.mouse(this)[0];
      var i;

      for(i1 = 0; i1<data.groups.length; i1++) {
        groupdata = d3.select(g.select("path")[0][i1]).datum().values
        if(d3.max(groupdata, function(d){return d.x}) > x0) {
          i = bisectDate(groupdata, x0, 1);
          break;
        }
      }

      d3.entries(data.groups).forEach(function (group, i1) {
          groupdata = d3.select(g.select("path")[0][i1]).datum().values

          var d;
          d = groupdata[i];
          //if (Boolean(d1)) { d = x0 - d0.x > d1.x - x0 ? d1 : d0 } else { d = d0 };
          d3.select("#focus-" + i1)
                  .attr("transform", "translate(" + d.x + "," + ((+d3.select("rect").attr("height")) - d.y) + ")")
                  .attr("fill", "black"); //color(0));
          d3.select("#focus-" + i1).select("text")
                  .text(d.data.group + ": " + d.data.y)
                 // .attr("fill", "black"); //color(0));
      });
    }