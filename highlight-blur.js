
function highlight(i) {
    for (row=1; row<3; row++) {
        for (col=1; col<3; col++) {
            for (j=1; j<5; j++) {
                var target = 
                    document.getElementById("plot_01.xyplot.points.group." 
                                            + j + ".panel." + 
                                            row + "." + col + ".1");
                if (i == j) {
                    target.setAttribute("filter", "none");            
                } else {
                    target.setAttribute("filter", "url(#point-blur.1)");
                }
            }
        }
    }
}


