# Conclusion visual programme (house style: R base graphics, ECU palette; 6-digit hex).
# The book's argument in one exhibit: the centre of economic gravity across all ten chapters.
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. The centre's East-West position across all ten chapters.
# y = where the centre sits (East at top, West at bottom); x = the ten chapters in sequence.
# Short tags only -- the full verdicts live in the Appendix table.
png("ledger-spine.png", width = 1750, height = 900, res = 150)
par(mar = c(5.2, 5.5, 3.2, 1))
ch   <- 1:10
east <- c(5.0, 7.5, 8.2, 8.0, 8.6, 7.4, 4.2, 2.4, 2.0, 5.2)   # centre position, East=10 West=0
tag  <- c("1 no centre", "2 Asia the core", "3 Asia central", "4 Asia central",
          "5 the silver sink", "6 workshop,\nEurope armed", "7 the turning\npoint west",
          "8 peak West", "9 the crack within\nthe West (Ldn->NY)", "10 the RETURN")
dates <- c("c.3500-500 BCE","200 BCE-500 CE","500-1000","1000-1400","1400-1600",
           "1600-1760","1750-1850","1850-1914","1914-1945","1945-2010s")
# explicit label positions to avoid collisions (x, y)
lx <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
ly <- c(3.9, 8.5, 9.1, 6.9, 9.5, 8.6, 3.1, 1.0, 3.4, 6.6)
plot(NA, xlim = c(0.4, 11.7), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
# light shading behind the western dip (the European interruption)
rect(6.55, 0, 9.45, 5, col = "#f7eeee", border = NA)
# East/West guide
abline(h = 5, col = "#cfd8e2", lwd = 1, lty = 3)
text(0.5, 9.7, "EAST", col = base_blue, font = 2, cex = 0.95, adj = 0)
text(0.5, 0.4, "WEST", col = accent, font = 2, cex = 0.95, adj = 0)
mtext("where the centre of economic gravity sits", side = 2, line = 3.3, col = grey, cex = 0.9)
# the connecting path: Asia plateau (1-6) blue, the move west (6-9) accent, the return (9-10) green
segments(ch[1:5], east[1:5], ch[2:6], east[2:6], lwd = 3, col = base_blue)
segments(ch[6:8], east[6:8], ch[7:9], east[7:9], lwd = 3, col = accent)
segments(ch[9], east[9], ch[10], east[10], lwd = 3, col = green)
# projection tail (10 -> ~2050)
segments(ch[10], east[10], 11.4, 6.9, lwd = 2.5, col = green, lty = 2)
points(11.4, 6.9, pch = 19, cex = 1.3, col = green); text(11.4, 7.6, "~2050\n(proj.)", cex = 0.58, col = green, font = 2)
# the ten points
ptcol <- c(rep(base_blue, 6), rep(accent, 3), green)
points(ch, east, pch = 19, cex = 1.9, col = ptcol)
points(ch, east, pch = 21, cex = 1.9, col = "white", lwd = 1.2)
# labels
for (i in ch) text(lx[i], ly[i], tag[i], cex = 0.6, font = 2, col = ptcol[i])
# the interruption annotation, in the clear space inside the dip
text(8.0, 4.5, "the European interruption", col = accent, font = 3, cex = 0.74)
# x-axis: chapter dates
axis(1, at = ch, labels = FALSE, col = grey)
text(ch, -0.85, dates, cex = 0.5, col = grey, xpd = TRUE)
mtext("the ten chapters, in sequence", side = 1, line = 3.3, col = grey, cex = 0.9)
title(main = "The centre of gravity over the very long run", cex.main = 1.05, col.main = base_blue)
dev.off()

cat("conclusion figures written\n")

# ---------------------------------------------------------------------------
# Coda: Kyoto cherry-blossom (full-flowering day-of-year), 812-2026 -- the very long
# run in one record. Eleven centuries in a narrow band, then an unprecedented modern
# break. Data: Aono via Our World in Data (staged in ../data/).
{
sil <- "#8a8d91"
ch <- read.csv("../data/kyoto_cherry_blossom_owid.csv")
ok <- !is.na(ch$full_flowering_date)
doy2lab <- function(d) format(as.Date(round(d) - 1, origin = "2001-01-01"), "%b %d")
png("cherry-climate-11.png", width = 1650, height = 880, res = 150)
par(mar = c(5.0, 5.6, 3.0, 1.2))
plot(ch$year[ok], ch$full_flowering_date[ok], type = "n",
     xlim = c(812, 2045), ylim = c(123, 82), axes = FALSE, xlab = "", ylab = "")  # y reversed: earlier = warmer up
norm <- mean(ch$full_flowering_date[ok & ch$year < 1850])
abline(h = norm, lty = 3, lwd = 1.4, col = sil)
text(820, norm + 1.6, sprintf("pre-1850 band ~%s", doy2lab(norm)), col = grey, cex = 0.72, font = 3, adj = 0)
points(ch$year[ok], ch$full_flowering_date[ok], pch = 19, cex = 0.45, col = "#1f4e7948")
ma <- !is.na(ch$average_last_30_years)
lines(ch$year[ma], ch$average_last_30_years[ma], lwd = 3.0, col = base_blue)
text(1120, 116, "eleven centuries in a narrow band\n(Little Ice Age a touch later)", col = grey, cex = 0.78, font = 3, adj = 0)
text(2040, 88.5, "the twelfth century breaks:\nearliest blooms in 1,200 years", col = accent, cex = 0.76, font = 3, adj = 1)
yt <- c(84, 91, 98, 105, 112, 119)
axis(1, at = seq(900, 2000, 100), col = grey, col.axis = grey, cex.axis = 0.85)
axis(2, at = yt, labels = doy2lab(yt), col = base_blue, col.axis = base_blue, las = 1, cex.axis = 0.82)
mtext("Year (CE)", 1, line = 2.4, col = grey, cex = 0.95)
mtext("Peak-bloom date (earlier = warmer spring)", 2, line = 4.2, col = base_blue, cex = 0.92)
title(main = "The very long run in one record: Kyoto's cherry blossom, 812-2026", cex.main = 0.96, col.main = base_blue)
mtext("Aono & Kazui (2007); Aono & Saito (2009); via Our World in Data. Full-flowering day-of-year; bold line = 30-yr mean. Kyoto/Japan proxy.",
      side = 1, line = 3.8, cex = 0.56, col = grey)
dev.off()
}
cat("conclusion cherry-climate figure written\n")
