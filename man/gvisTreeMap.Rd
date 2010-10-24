\name{gvisTreeMap}
\alias{gvisTreeMap}
\title{
  Google Tree Map with R
}
\description{

  A visual representation of a data tree, where each node can have zero or
  more children, and one parent (except for the root, which has no
  parents). Each node is displayed as a rectangle, sized and colored
  according to values that you assign. Sizes and colors are valued
  relative to all other nodes in the graph. You can specify how many
  levels to display simultaneously, and optionally to display deeper
  levels in a hinted fashion. If a node is a leaf node, you can specify
  a size and color; if it is not a leaf, it will be displayed as a
  bounding box for leaf nodes. The default behavior is to move down the
  tree when a user left-clicks a node, and to move back up the tree when
  a user right-clicks the graph.
  
  The total size of the graph is determined by the size of the containing
  element that you insert in your page. If you have leaf nodes with names
  too long to show, the name will be truncated with an ellipsis (...).
}
\usage{
gvisTreeMap(data,
            idvar = "", parentvar = "",
            sizevar = "", colorvar = "",
            options = list() )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{
    %%     ~~Describe \code{data} here~~
  }
  \item{idvar}{
    %%     ~~Describe \code{idvar} here~~
  }
  \item{parentvar}{column name of \code{data} that match to entries in \code{idvar}.
  }
  \item{sizevar}{column name of \code{data} with positive values to define the size of maps.
  }
  \item{colorvar}{column name of \code{data} with values to define range of color.
  }
  \item{options}{list of configuration options for the motion chart.
    The possible components are, taken from
    \url{http://code.google.com/apis/visualization/documentation/gallery/treemap.html}: 
    \describe{
      \item{\code{headerColor}}{string, default	'#988f86'. The color of
	the header section for each node. Specify an HTML color value.
      }
      \item{\code{headerHeight}}{number, default 0. The height of the
	header section for each node, in pixels (can be zero).
      }
      \item{\code{headerHighlightColor}}{string, default	null. The color
	of the header of a node being hovered over. Specify an HTML color
	value, null, or 'auto; if null or 'auto', this value will be
	headerColor lightened by 35\%
      }
      \item{\code{maxColor}}{string, default #00dd00. The color for a rectangle
	with a column 3 value of maxColorValue. Specify an HTML color value.
      }
      \item{\code{maxDepth}}{number, default 1. The maximum number of node
	levels to show in the current view. Levels will be flattened into the
	current plane. If your tree has more levels than this, you will have
	to go up or down to see them. You can additionally see maxPostDepth
	levels below this as shaded rectangles within these nodes.
      }
      \item{\code{maxHighlightColor}}{string, default	null. The highlight
	color to use for the node with the largest value in column 3. Specify
	an HTML color value, null, or 'auto. If null or 'auto', this value
	will be the value of maxColor lightened by 35\%
      }
      \item{\code{maxPostDepth}}{number, default 1. How many levels of nodes
	beyond maxDepth to show in "hinted" fashion. Hinted nodes are shown as
	shaded rectangles within a node that is within the maxDepth limit.
      }
      \item{\code{maxColorValue}}{number, default null. The maximum value
	allowed in column 3. All values greater than this will be trimmed to
	this value. If set to null or 'auto', it will be set to the max value
	in the column.
      }
      \item{\code{midColor}}{string, default	#000000. The color for a
	rectangle with a column 3 value midway between maxColorValue and
	minColorValue. Specify an HTML color value.
      }
      \item{\code{midHighlightColor}}{string, default	null. The highlight
	color to use for the node with a column 3 value near the median of
	minColorValue and maxColorValue. Specify an HTML color value or
	'auto'. If null or 'auto', this value will be the value of midColor
	lightened by 35\%.
      }
      \item{\code{minColor}}{string, default	#dd0000. The color for a
	rectangle with the column 3 value of minColorValue. Specify an HTML
	color value.
      }
      \item{\code{minHighlightColor}}{string, default	null. The highlight
	color to use for the node with a column 3 value nearest to
	minColorValue. Specify an HTML color value or 'auto'. If null or
	'auto', this value will be the value of minColor lightened by 35'%.
      }
      \item{\code{minColorValue}}{number, default null. The minimum value
	allowed in column 3. All values less than this will be trimmed to this
	value. If set to null or 'auto', it will be calculated as the minimum
	value in the column.
      }
      \item{\code{noColor}}{string, default #000000. The color to use for a
	rectangle when a node has no value for column 3, and that node is a
	leaf (or contains only leaves). Specify an HTML color value.
      }
      \item{\code{noHighlightColor}}{string, default null. The color to use
	for a rectangle of "no" color when highlighted. This will be the value
	of noColor lightened by 35\%. Specify an HTML value.
      }
      \item{\code{showScale}}{boolean, default \code{FALSE}. Whether or not to
	show a color gradient scale from minColor to maxColor along the top of
	the chart. Specify true to show the scale.
      }
      \item{\code{showTooltips}}{boolean, default \code{TRUE}. Whether or
	not to show tooltips.
      }
      \item{\code{fontColor}}{string, default	#ffffff. The text color. Specify
	an HTML color value.
      }
      \item{\code{fontFamily}}{string, default auto. The font family to use
	for all text.
      }
      \item{\code{fontSize}}{number, default 12. The font size for all text,
	in points.
      }
    }
  }
}

\details{
  %%  ~~ If necessary, more details than the description above ~~
}
\value{
  \code{gvisTreeMap} returns list of \code{\link{class}} "\code{gvis}"
  and "\code{list}". 
  
  An object of class "\code{gvis}" is a list containing at least the
  following components:
  \item{\code{type}}{Google visualisation type, here 'treemap'}
  \item{\code{chartid}}{character id of the chart object. The string is
    build at run time from chart type and date/time when the function is
    executed. Unique chart ids are required to place several charts on
    the same page.
  }
  \item{\code{html}}{a list with the building blocks for the page
    \describe{
      \item{\code{header}}{a character string of a html page header:
	\code{<html> ... <body>},}
      \item{\code{chart}}{a character string of the chart object with
	reference to Google API. Only this string is needed to embed the
	chart into pages, see also the examples in the \code{googleVis} demo,}
      \item{\code{caption}}{a character string of a standard caption,
	including data set use, chart id, R version and link to Google's
	Terms of Use,}
      \item{\code{footer}}{a character string of a html page footer:
	\code{</html> ... </body>}.}
    }
  }
}
\references{
  Google Geo Map  API:
  \url{http://code.google.com/apis/visualization/documentation/gallery/treemap.html}
  
}
\author{
Markus Gesmann, \email{markus.gesmann@gmail.com},

Diego de Castillo \email{decastillo@gmail.com}
}
\note{

  Each row in the data table describes one node (a rectangle in the
  graph). Each node (except the root node) has one or more parent
  nodes. Each node is sized and colored according to its values relative
  to the other nodes currently shown.
  
  The data table should have four columns in the following format:
  Column 0 - [string] An ID for this node. It can be any valid JavaScript
  string, including spaces, and any length that a string can hold. This
  value is displayed as the node header.
  
  Column 1 - [string] - The ID of the parent node. If this is a root node,
  leave this blank. Only one root is allowed per treemap.
  
  Column 2 - [number] - The size of the node. Any positive value is
  allowed. This value determines the size of the node, computed relative
  to all other nodes currently shown. This value is ignored for non-leaf
  nodes (it is actually calculated from the size of all its children).
  
  Column 3 - [optional, number] - An optional value used to calculate a
  color for this node. Any value, positive or negative, is allowed. The
  color value is first recomputed on a scale from minColorValue to
  maxColorValue, and then the node is assigned a color from the gradient
  between minColor and maxColor.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{

  See also \code{\link{print.gvis}}, \code{\link{plot.gvis}} for
  printing and plotting methods.   

}
\examples{
tree <- gvisTreeMap(Regions,  "Region", "parent", "Val", "Fac",
                    options=list(width=600, height=500,  showScale=TRUE, fontSize=16))
\dontrun{
plot(tree)
}
}
\keyword{ hplot }