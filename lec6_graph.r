hitting.data <- read.table("Rx-data/batting.history.txt", header=TRUE, sep="\t")
names(hitting.data)
attach(hitting.data)


plot(Year, HR)
plot(Year, HR, xlab="Season", ylab="Avg HR hit per team per game",
    main="Home Run Hitting", sub="(a)")
plot(Year, HR, xlab="Season", ylab="Avg HR hit per team per game",
    main="Home Run Hitting", sub="(a)",
    type="b")

# xlim ylim : domains
# xaxt="n", yaxt="n" or axes=F : no axes
plot(Year, HR, xlab="Season", ylab="Avg HR hit per team per game",
    main="Home Run Hitting", sub="(a)",
    type="b", yaxt="n")

row = rep(1:3, each=7)
col = rep(1:7, times=3)
plot(2, 3, xlim=c(.5, 3.5), ylim=c(.5, 7.5), type="n",
    xaxt="n", yaxt="n", ylab="", xlab="")
points(row, col, pch=0:20, cex=3)
text(row, col, 0:20, pos=4, offset=2, cex=1.5)
#cex: size of the numbers/symbols

plot(Year, HR, xlab="Season", ylab="Avg HR hit per team per game",
    main="Home Run Hitting", sub="(a)", pch=19, cex=0.9)
lines(lowess(Year, HR), lwd=2)
lines(lowess(Year, HR, f=1/3), lty="dashed", lwd=2)
lines(lowess(Year, HR, f=1/12), lty=3, lwd=2)

#colors
colors()
palette() #col=integer case

#text Format
#argument examples: font, srt(rotation), family



# multiple figures1: par

n=20; p=0.2; y=0:20
py = dbinom(y, size=n, prob=p)
plot(y, py, type="h", lwd=3, xlim=c(0, 15))
curve(dbinom(x,)

#expression <- add formula
?expression
?text
#locs = locator(2) #get coordinates by click
?locator
?arrows


# multiple figures2: layout
?layout

snow.yr1 <- c(85.9, 71.4, 68.8, 58.8, 34.4)
snow.yr2 <- c(150.9, 102, 86.2, 80.1, 63.8)
layout(matrix(c(1,2), ncol=1), heights=c(6,4)) 
#first argument: space index (correspond to matrix structure)

par("plt")
# (x1,y2) --- (x2, y2)
#  |             |
#  |             |
#  |             |
# (x1,y1) --- (x2, y1)
par(plt=c(0.20, 0.80, 0, 0.88), xaxt="n")
#           x1, x2,   y1, y2
layout.show(2)


plot(snow.yr1, snow.yr2, xlim=c(30, 100), ylim=c(30,155),
    ylab="2010-11 snowfall(in)",pch=19)
abline(a=0, b=1)
text(80, 145, "syracuse")

tm = par("yaxp")
tm
tickmarks = seq(tm[1], tm[2], length=tm[3]+1)
axis(4, at=tickmarks, labels="(cm)")

par(plt=c(0.2, 0.80, 0, 0.88), xaxt="s")
plot(snow.yr1, snow.yr2-snow.yr1, xlim=c(30,100), ylim=c(20,60))
axis(4, at=tickmarks, labels="(cm)")

#see slide...



# low-level functions

# export
# pdf/png(file="") -> plot -> dev.off()