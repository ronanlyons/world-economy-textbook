# Chapter 5 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (still Asian; growing seed)
png("cog-locator-05.png", width = 1400, height = 470, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.78, "ASIA", col = base_blue, font = 2, cex = 1.3, adj = 0)
text(0.95, 0.78, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.3, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38, seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
x <- 0.05 + 0.19 * 0.90
points(x, 0.50, pch = 19, cex = 3.2, col = accent); points(x, 0.50, pch = 21, cex = 3.2, col = base_blue, lwd = 2)
arrows(0.30, 0.50, 0.42, 0.50, length = 0.07, lwd = 1.8, col = grey, lty = 2)
text(0.42, 0.28, "still firmly Asian: China the great silver sink that", col = "#333333", font = 3, cex = 0.86)
text(0.42, 0.18, "organised the first global circuit; the Atlantic seed grows", col = accent, font = 3, cex = 0.86)
title(main = "Centre-of-gravity locator", col.main = base_blue, cex.main = 1.3)
dev.off()

# ---------------------------------------------------------------------------
# 2. The first global silver circuit
png("map-threeoceans-05.png", width = 1650, height = 820, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
nodes <- list("CHINA\n(the sink)" = c(89, 31), Manila = c(70, 22), Japan = c(89, 43),
              India = c(54, 31), Europe = c(28, 31), Potosi = c(10, 19), "W. Africa" = c(26, 9))
for (nm in names(nodes)) { p <- nodes[[nm]]; big <- nm == "CHINA\n(the sink)"
  rect(p[1] - 5.5, p[2] - 3.6, p[1] + 5.5, p[2] + 3.6, col = if (big) "#cdddee" else land, border = base_blue, lwd = if (big) 2.5 else 1.4)
  text(p[1], p[2], nm, cex = 0.64, font = 2, col = base_blue) }
# silver flows (accent), all to China
arrows(14, 17, 64, 22, length = 0.09, lwd = 2.2, col = accent)            # Potosi -> Manila (Pacific)
arrows(75, 24, 83, 28, length = 0.09, lwd = 2.2, col = accent)           # Manila -> China
arrows(12, 23, 24, 28, length = 0.08, lwd = 2, col = accent)            # Potosi -> Europe
arrows(34, 31, 48, 31, length = 0.08, lwd = 2, col = accent)           # Europe -> India (Cape)
arrows(60, 31, 83, 31, length = 0.08, lwd = 2, col = accent)           # India -> China
arrows(89, 39, 89, 35, length = 0.07, lwd = 2, col = accent)           # Japan -> China
text(50, 15, "New World + Japanese SILVER, all pulled east to the demand core", col = accent, font = 2, cex = 0.76)
# W Africa opposite-fate (grey)
arrows(12, 16, 22, 11, length = 0.07, lwd = 1.8, col = grey, lty = 2)
text(58, 5.5, "same silver, opposite fate: African captives + currency debasement", col = grey, font = 3, cex = 0.66)
title(main = "The first global silver circuit (three oceans, one sink)", cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. Ming China: silver sink + Zheng He
png("map-china-05.png", width = 1320, height = 940, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 100), axes = FALSE, xlab = "", ylab = "", asp = 1)
cx <- c(56,74,96,112,118, 112,100,88,78,70, 60,56,52,54,56)
cy <- c(88,94,90,84,72, 56,44,38,40,48, 58,66,74,82,88)
polygon(cx, cy, col = land, border = base_blue, lwd = 2)
text(90, 70, "MING CHINA", font = 2, col = base_blue, cex = 0.9)
text(90, 63, "single-whip silverization ->\nthe great SILVER SINK", cex = 0.62, col = grey, font = 3)
points(96, 48, pch = 19, col = accent, cex = 1.1); text(96, 48, "Canton/Macau", pos = 4, cex = 0.64)
points(86, 40, pch = 19, col = accent, cex = 0.9); text(86, 40, "Manila trade", pos = 1, cex = 0.6)
# silver in
arrows(122, 40, 100, 46, length = 0.09, lwd = 2.4, col = accent); text(126, 34, "silver in\n(Manila, Macau)", cex = 0.6, col = accent, pos = 2)
# Zheng He out (then withdrawn)
arrows(58, 56, 18, 64, length = 0.10, lwd = 2.2, col = gold, lty = 2); text(10, 72, "Zheng He 1405-33\n(then withdrawn)", cex = 0.62, col = gold, pos = 4, font = 3)
title(main = "Ming China: the silver sink that abandoned the ocean", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. India: workshop + silver absorber
png("map-india-05.png", width = 1060, height = 1140, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(-2, 102), ylim = c(6, 112), axes = FALSE, xlab = "", ylab = "", asp = 1)
px <- c(28,38,52,62,68, 64,58,52,49,47, 42,37,32,28,28)
py <- c(98,103,100,98,90, 74,58,42,28,16, 30,52,74,88,98)
polygon(px, py, col = land, border = base_blue, lwd = 2)
text(48, 84, "MUGHAL INDIA", font = 2, col = base_blue, cex = 0.8)
text(48, 78, "the cotton workshop +\nthe second great silver sink", cex = 0.58, col = grey, font = 3)
points(40, 50, pch = 19, col = accent, cex = 1.0); text(40, 50, "Calicut\n(da Gama 1498)", pos = 2, cex = 0.6)
points(34, 70, pch = 19, col = accent, cex = 0.9); text(34, 70, "Gujarat\n(cotton)", pos = 2, cex = 0.58)
points(62, 44, pch = 19, col = accent, cex = 0.9); text(62, 44, "Coromandel", pos = 4, cex = 0.6)
arrows(8, 56, 36, 52, length = 0.09, lwd = 2.2, col = accent); text(2, 64, "silver in\n(~185 t/yr)", cex = 0.6, col = accent, pos = 4)
arrows(64, 56, 92, 62, length = 0.09, lwd = 2, col = base_blue); text(96, 68, "cotton & pepper\n-> the ocean", cex = 0.58, col = base_blue, pos = 2)
title(main = "India: the workshop the silver flowed to", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. Phase timeline
png("phase-timeline-05.png", width = 1700, height = 580, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(1400, 1610), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(1405, 1433, "1 apogee abandoned", "#cdddee"),
  c(1498, 1515, "2 European entry",   "#e8e0d0"),
  c(1492, 1600, "3 Columbian Exchange","#e0c4c4"),
  c(1545, 1600, "4 silver welds, flows E","#bcd2e8"),
  c(1571, 1610, "5 one world, not one market","#cfe0d4"))
ypos <- c(7.6, 7.6, 5.4, 3.2, 3.2)
for (i in seq_along(ph)) { p <- ph[[i]]; x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2]); y <- ypos[i]
  rect(x0, y - 0.9, x1, y + 0.9, col = p[4], border = base_blue)
  text((x0 + x1) / 2, y, p[3], cex = 0.6, font = 2, col = base_blue) }
axx <- c(1400, 1450, 1500, 1550, 1600)
segments(axx, 1.5, axx, 1.7, col = grey); text(axx, 0.9, axx, cex = 0.66, col = grey)
ev <- list(c(1498, "da Gama"), c(1545, "Potosi"), c(1571, "Manila galleon"))
for (e in ev) { points(as.numeric(e[1]), 1.8, pch = 19, cex = 0.6, col = accent) }
text(1571, 9.3, "1571 Manila galleon", cex = 0.62, col = accent); text(1498, 9.3, "1498 da Gama", cex = 0.62, col = accent)
title(main = "The world becomes one: apogee abandoned, then silver welds the oceans", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. Gold:silver arbitrage (why silver ran east)
png("goldsilver-arbitrage-05.png", width = 1320, height = 700, res = 150)
par(mar = c(5, 5, 3, 1))
vals <- c(14.5, 11, 6, 8)
cols <- c(base_blue, "#9 db", "#cdddee", silver)
cols <- c(base_blue, "#6a8fc0", "#cdddee", silver)
b <- barplot(vals, names.arg = c("Europe", "India", "Canton\n(China)", "Japan"),
             col = cols, border = NA, ylim = c(0, 18), ylab = "gold : silver ratio", cex.names = 0.9, cex.lab = 0.9)
text(b, vals + 0.8, c("~14-15", "~10-12", "~6", "~8"), font = 2, col = base_blue, cex = 0.85)
text(mean(b), 16.8, "silver dear (cheap gold) in Europe, cheap (dear gold) in Asia", cex = 0.74, col = accent, font = 2)
text(mean(b), 15.3, "-> silver bought the most in Asia, so arbitrage pulled it east", cex = 0.74, col = accent, font = 2)
title(main = "Why the silver ran east: the gold-to-silver ratio, c.1600", cex.main = 0.95, col.main = base_blue)
dev.off()

cat("ch05 figures written\n")

# ---------------------------------------------------------------------------
# Data exhibit: the speed of news to Venice, c.1500 (Sardella 1948). Speed vs distance.
# Shows distance barely predicts speed -- terrain (the Alps) and the post road did.
{
city  <- c("Innsbruck","Augsburg","Rome","Vienna","Naples","Palermo","Brussels","Paris","London","Valladolid")
dist  <- c(215, 343, 394, 436, 534, 819, 842, 843, 1136, 1433)       # great-circle km to Venice
spd   <- c(1.5, 1.2, 4.1, 1.4, 2.8, 1.4, 3.5, 2.9, 2.0, 2.6)         # km/h = km / (normal days x 24)
alp   <- c(TRUE,TRUE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE)  # trans-Alpine origin
lpos  <- c(4, 1, 4, 2, 4, 1, 3, 1, 3, 2)
png("news-speed-05.png", width = 1500, height = 880, res = 150)
par(mar = c(5.2, 4.6, 3.0, 1.2))
plot(dist, spd, type = "n", xlim = c(120, 1560), ylim = c(0.8, 4.6), axes = FALSE, xlab = "", ylab = "")
abline(h = mean(spd), lty = 3, lwd = 1.4, col = silver)
text(1555, mean(spd) + 0.12, sprintf("mean ~%.1f km/h", mean(spd)), col = grey, cex = 0.72, font = 3, adj = 1)
cols <- ifelse(alp, accent, base_blue)
points(dist, spd, pch = 19, cex = 1.5, col = cols)
text(dist, spd, city, pos = lpos, offset = 0.5, col = cols, cex = 0.78, font = 2)
text(150, 2.20, "closest, yet slowest:\ntrans-Alpine crossing", col = accent, cex = 0.76, font = 3, adj = 0)
text(610, 4.50, "far but fast: well-organised lowland post-roads", col = base_blue, cex = 0.78, font = 3, adj = 0)
text(819, 1.40, "sea route", col = grey, cex = 0.70, font = 3, pos = 4, offset = 0.5)
axis(1, at = seq(200, 1400, 200), col = grey, col.axis = grey, cex.axis = 0.9)
axis(2, at = 1:4, col = base_blue, col.axis = base_blue, las = 1, cex.axis = 0.9)
mtext("Straight-line distance to Venice (km)", 1, line = 2.5, col = grey, cex = 0.95)
mtext("News speed (km/h, day and night)", 2, line = 2.7, col = base_blue, cex = 0.95)
legend("bottomright", inset = c(0, 0.08), bty = "n", pch = 19, pt.cex = 1.2,
       col = c(accent, base_blue), legend = c("trans-Alpine origin", "lowland post-road / sea"),
       text.col = grey, cex = 0.74)
title(main = "Distance barely set the speed: the Alps and the post road did", cex.main = 0.97, col.main = base_blue)
mtext("Sardella (1948), Cahiers des Annales 1 (OCLC 3854061); via Braudel. Speed = great-circle km / (normal transit x 24 h).",
      side = 1, line = 4.0, cex = 0.56, col = grey)
dev.off()
}
cat("ch05 news-speed figure written\n")

# ---------------------------------------------------------------------------
# Little Ice Age -- regional heterogeneity: the cold trough arrives centuries
# apart. Three native-annual tree-ring temperature reconstructions to 1600
# (Europe, N. America, S. America), each an anomaly vs a common 1901-95 window,
# 30-yr smoothed. Supports the ch.5 debate box (Kelly-O Grada vs White / Buntgen).
# Raw NOAA WDS-Paleo files staged in ../data/ (header/data-start lines confirmed).
{
  na_col <- "#6a8fc0"                                   # N. America -- mid blue (ch05 palette)
  sm <- function(x, k = 30) as.numeric(stats::filter(x, rep(1/k, k), sides = 2))
  eu <- read.table("../data/buentgen2006_alps.txt",          skip = 104, header = TRUE)          # Year, T_recon (JJA anomaly)
  na <- read.table("../data/goa2014_temperature.txt",         skip = 87,  header = TRUE)          # age_AD, temp (absolute degC)
  sa <- read.table("../data/SSA-Mean_Rekon_DJF_900-1995.txt", header = TRUE, check.names = FALSE) # Year, SSA-Mean (DJF anomaly)
  names(eu) <- c("year", "t"); names(na) <- c("year", "t"); sa <- sa[, 1:2]; names(sa) <- c("year", "t")
  reb <- function(d) { d <- d[order(d$year), ]; d$a <- d$t - mean(d$t[d$year >= 1901 & d$year <= 1995], na.rm = TRUE); d$s <- sm(d$a); d }
  eu <- reb(eu); na <- reb(na); sa <- reb(sa)
  win <- c(1000, 1600); clip <- function(d) d[d$year >= win[1] & d$year <= win[2], ]
  euw <- clip(eu); naw <- clip(na); saw <- clip(sa)
  tr <- function(d) { i <- which.min(d$s); c(year = d$year[i], val = d$s[i]) }
  te <- tr(euw); tn <- tr(naw); ts <- tr(saw)
  yl <- range(c(euw$a, naw$a, saw$a), na.rm = TRUE); yl <- c(floor(yl[1]), ceiling(yl[2]))
  png("lia-regional-05.png", width = 1550, height = 830, res = 150)
  par(mar = c(4.4, 4.8, 3.0, 1.2), xaxs = "i")
  plot(NA, xlim = win, ylim = yl, axes = FALSE, xlab = "", ylab = "")
  rect(1275, yl[1], 1325, yl[2], col = "#eef0f2", border = NA)
  text(1300, yl[2] - 0.2, "'Great Transition' c.1300", col = grey, cex = 0.68, font = 3)
  abline(h = 0, lty = 3, lwd = 1.2, col = silver)
  for (d in list(euw, naw, saw)) lines(d$year, d$a, col = adjustcolor(grey, 0.18), lwd = 0.4)
  lines(euw$year, euw$s, col = base_blue, lwd = 3)
  lines(naw$year, naw$s, col = na_col,   lwd = 3)
  lines(saw$year, saw$s, col = accent,   lwd = 3)
  pts <- rbind(te, tn, ts); cols <- c(base_blue, na_col, accent)
  points(pts[, "year"], pts[, "val"], pch = 21, bg = "white", col = cols, cex = 1.4, lwd = 2)
  text(te["year"] - 8, te["val"] - 0.12, round(te["year"]), col = base_blue, cex = 0.7, font = 2, adj = 1)
  text(tn["year"],     tn["val"] - 0.30, round(tn["year"]), col = na_col,    cex = 0.7, font = 2)
  text(ts["year"],     ts["val"] + 0.30, round(ts["year"]), col = accent,    cex = 0.7, font = 2)
  axis(1, at = seq(1000, 1600, 100), col = grey, col.axis = grey, cex.axis = 0.9)
  axis(2, at = seq(yl[1], yl[2], 1), col = grey, col.axis = grey, las = 1, cex.axis = 0.9)
  mtext("Year (CE)", 1, line = 2.4, col = grey, cex = 0.95)
  mtext(bquote("Temperature anomaly (" * degree * "C, vs 1901-95; 30-yr mean)"), 2, line = 2.7, col = base_blue, cex = 0.9)
  legend("bottomleft", bty = "n", cex = 0.78, lwd = 3, seg.len = 1.5, col = c(base_blue, na_col, accent),
         legend = c("Europe (Alps)", "N. America (Gulf of Alaska)", "S. America (southern SA)"))
  title(main = "No single 'Great Transition': the cold arrives centuries apart", cex.main = 0.97, col.main = base_blue)
  mtext(sprintf("Native-annual tree-ring reconstructions to 1600 CE. Coldest 30-yr window: Europe %d, N. America %d, S. America %d. Sources: Buntgen 2006; Wiles 2014; Neukom 2011 (NOAA WDS-Paleo).",
        round(te["year"]), round(tn["year"]), round(ts["year"])), side = 1, line = 3.6, cex = 0.54, col = grey)
  dev.off()
}
cat("ch05 lia-regional figure written\n")
