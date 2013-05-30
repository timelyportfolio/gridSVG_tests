          svg = d3.selectAll("svg");
          //get points by group
          //points = svg.selectAll('[id*="xyplot"][class*="points"]');
                 //get points in arrays by strip
                 //points = svg.selectAll('[id*="xyplot"][class*="points"]').selectAll('use');
                 points = svg.selectAll('[id*="xyplot"][class*="points"]>use')
                 
                 pointsdata = [];
                 d3.entries(data.data).forEach(
                 function (d) {
                 d.value.groups.forEach(
                 function (dd, ii) {
                 pointsdata.push(
{ "x": d.value.x[ii], "y": d.value.y[ii], "group": d.value.groups[ii], "strip": d.key }
                 )
                 })
                 }
                 )
                 points.data(pointsdata);
                 
                 //all this could be handled in lattice but experiment with changing in d3/javascript
                 points
                 .attr("fill-opacity", "100")
                 .attr("fill", function (d) {
                 return this.attributes["stroke"].value;
                 })
                 .attr("width", "8")
                 .attr("height", "8")
                 .attr("transform", "translate(-4,-4)");
                 
                 points.on("click", function (d) { alert(d.x + " " + d.group + " " + d.y) });
                 
                 //if we want to move points then we need to preserve the old location
                 //but this does not work and will need to get the values
                 points[0].map(function (d) { d.oldattributes = d.attributes });
                 
                 
                 //example of how we might use
                 //            points.filter(function(d){return d.strip==="Waseca"}).attr("stroke-opacity","100")
                 //also might want to bind the legend or key to data
                 var legend = new Object();
                 legend.text = d3.selectAll('.text [id*="key"]');
                 legend.points = d3.selectAll('.points [id*="key"]');
                 legend.text.data(data.groups);
                 legend.points.data(data.groups);
                 
                 legend.points
                 .attr("fill-opacity", "100")
                 .attr("fill", function (d) {
                 return this.attributes["stroke"].value
                 });
                 
                 legend.text.on("click", function (d) {
                 points.filter(
                 function (point) {
                 return point.group === d;
                 }
                 )
                 .attr("fill-opacity",
                 function () {
                 //debugger;
                 return this.attributes["fill-opacity"].value == 100 ? 0 : 100;
                 });
                 legend.points.filter(
                 function (point) {
                 return point === d
                 })
                 .attr("fill-opacity",
                 function () {
                 //debugger;
                 return this.attributes["fill-opacity"].value == 100 ? 0 : 100;
                 });
                 }
                 );
                 
                 //bind y axis labels to the data or do differently and inspect the text for the value
                 var ylabels = d3.selectAll('[id*="ticklabels.left.panel"] text');
                 ylabels
                 .attr("font-size", "8")
                 .attr("y", "-2");
                 
                 var ylabelsdata = Array();
                 ylabels[0].forEach(function (d, i) {
                 ylabelsdata.push(ylabels.filter(function (dd, ii) {
                 return ii == i
                 })
                 .text().replace(/\s/gm, ''))  //thanks http://stackoverflow.com/questions/7339287/remove-newlines-javascript-problem
                 });
                 ylabels.data(ylabelsdata);
                 ylabels.on("click", function (d) {
                 // points.filter(
                 //  function (point) {
                 //   return !(point.y == d);
                 //  }
                 //)
                 // .attr("fill",
                 //   function () {
                 //debugger;
                 //return this.attributes["fill"].value == "gray" ? this.attributes["stroke"].value : "gray";
                 //   });
                 points.filter(
                 function (point) {
                 return point.y.replace(/\s/gm, '') == d;
                 }
                 )
                 .attr("fill",
                 function () {
                 //debugger;
                 //return this.attributes["fill-opacity"].value = 100;
                 return this.attributes["fill"].value == "gray" ? this.attributes["stroke"].value : "gray";
                 });
                 });
                 
                 //also might want to bind the strip to data
                 //could then define on events to provide tooltips with the data          
