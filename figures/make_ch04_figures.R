# Chapter 4 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (firmly Asian; first NW seed)
png("cog-locator-04.png", width = 1400, height = 470, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.78, "ASIA", col = base_blue, font = 2, cex = 1.3, adj = 0)
text(0.95, 0.78, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.3, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38, seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
x <- 0.05 + 0.17 * 0.90
points(x, 0.50, pch = 19, cex = 3.2, col = accent); points(x, 0.50, pch = 21, cex = 3.2, col = base_blue, lwd = 2)
# faint westward seed arrow
arrows(0.30, 0.50, 0.40, 0.50, length = 0.07, lwd = 1.5, col = grey, lty = 2)
text(0.40, 0.30, "centre firmly Asian (Song China leading) - but the first faint", col = "#333333", font = 3, cex = 0.86)
text(0.40, 0.20, "north-western counter-current appears: a seed, not a shift", col = accent, font = 3, cex = 0.86)
title(main = "Centre-of-gravity locator", col.main = base_blue, cex.main = 1.3)
dev.off()

# ---------------------------------------------------------------------------
# 2. The four-node ocean + Pax Mongolica arc
png("map-fournode-04.png", width = 1650, height = 800, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
# overland Pax arc across the top
lines(c(14, 35, 60, 88), c(40, 46, 46, 40), lwd = 2.5, col = gold, lty = 1)
arrows(60, 46, 86, 41, length = 0.09, lwd = 2.5, col = gold)
text(50, 48.5, "PAX MONGOLICA overland arc: Tana -> China (~7-11 months, brief)", col = gold, font = 2, cex = 0.78)
# four nodes (sea, bottom)
nodes <- list("Fatimid/Mamluk\nEgypt + Karimi" = c(12, 20), "Chola\nS. India" = c(38, 20),
              Srivijaya = c(62, 20), "Song\nChina" = c(88, 20))
for (nm in names(nodes)) { p <- nodes[[nm]]; big <- nm %in% c("Song\nChina", "Chola\nS. India")
  rect(p[1] - 7, p[2] - 5, p[1] + 7, p[2] + 5, col = if (big) "#cdddee" else land, border = base_blue, lwd = if (big) 2.5 else 1.5)
  text(p[1], p[2], nm, cex = 0.72, font = 2, col = base_blue) }
# sea road
arrows(81, 13, 69, 13, length = 0.09, lwd = 2.5, col = base_blue)
arrows(55, 13, 45, 13, length = 0.09, lwd = 2.5, col = base_blue)
arrows(31, 13, 19, 13, length = 0.09, lwd = 2.5, col = base_blue)
text(50, 8.5, "the four-node maritime ocean at fullest extent (the durable artery)", col = base_blue, font = 2, cex = 0.8)
points(20, 20, pch = 19, col = accent, cex = 0.8); text(20, 25.5, "Aden\n(hinge)", col = accent, cex = 0.6, font = 2)
title(main = "Fullest extent: four ocean nodes, and a brief land bridge over the top", cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. Song China structure map
png("map-china-04.png", width = 1320, height = 960, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 100), axes = FALSE, xlab = "", ylab = "", asp = 1)
cx <- c(52,70,94,112,118, 112,100,88,76,68, 58,52,48,50,52)
cy <- c(88,94,90,84,72, 56,44,38,40,48, 58,66,74,82,88)
polygon(cx, cy, col = land, border = base_blue, lwd = 2)
text(88, 70, "SONG CHINA", font = 2, col = base_blue, cex = 0.9)
text(88, 63, "the world's first urban-commercial revolution:\niron ~125k t/yr; paper money; ~6bn coins/yr", cex = 0.58, col = grey, font = 3)
points(72, 78, pch = 19, col = accent, cex = 1.0); text(72, 78, "Kaifeng", pos = 2, cex = 0.66)
points(74, 60, pch = 19, col = accent, cex = 1.0); text(74, 60, "Hangzhou", pos = 2, cex = 0.66)
points(98, 46, pch = 19, col = accent, cex = 1.2); text(98, 46, "Quanzhou (Zaiton)", pos = 4, cex = 0.68)
segments(72, 76, 80, 50, col = base_blue, lwd = 2, lty = 2); text(64, 62, "Grand Canal\n(~1,800 km)", cex = 0.56, col = base_blue, srt = -68, pos = 4)
arrows(98, 42, 84, 22, length = 0.09, lwd = 2.2, col = base_blue); text(78, 18, "9 customs ports ->\nthe four-node ocean", cex = 0.6, col = base_blue, pos = 2)
title(main = "Song China: the world's leading economy", cex.main = 0.98, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. Chola / South India structure map
png("map-chola-04.png", width = 1080, height = 1140, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(-2, 102), ylim = c(6, 112), axes = FALSE, xlab = "", ylab = "", asp = 1)
px <- c(28,38,52,62,68, 64,58,52,49,47, 42,37,32,28,28)
py <- c(98,103,100,98,90, 74,58,42,28,16, 30,52,74,88,98)
polygon(px, py, col = land, border = base_blue, lwd = 2)
text(48, 80, "CHOLA / TAMIL SOUTH", font = 2, col = base_blue, cex = 0.78)
text(48, 74, "Kaveri rice + temple economy;\nTamil merchant guilds (Ayyavole)", cex = 0.58, col = grey, font = 3)
points(50, 40, pch = 19, col = accent, cex = 1.1); text(50, 40, "Thanjavur", pos = 4, cex = 0.66)
points(40, 50, pch = 19, col = accent, cex = 0.9); text(40, 50, "Malabar\n(pepper)", pos = 2, cex = 0.62)
# west to Aden
arrows(38, 52, 6, 60, length = 0.10, lwd = 2.2, col = base_blue); text(2, 68, "pepper & cottons ->\nAden & the Geniza\nIndia-traders", cex = 0.58, col = base_blue, pos = 4)
# east: 1025 raid on Srivijaya
arrows(64, 44, 96, 34, length = 0.11, lwd = 2.5, col = accent); text(98, 26, "1025: Rajendra\nraids Srivijaya\nacross the bay", cex = 0.6, col = accent, font = 2, pos = 2)
title(main = "The Chola: workshop and sea power", cex.main = 0.98, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. Phase timeline
png("phase-timeline-04.png", width = 1700, height = 600, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(1000, 1400), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(1000, 1127, "1 Song revolution", "#cdddee"),
  c(1000, 1300, "2 ocean fullest extent", "#bcd2e8"),
  c(1206, 1325, "3 Pax Mongolica", "#efe6d2"),
  c(1325, 1345, "4 the fraying", "#e8e0d0"),
  c(1346, 1400, "5 Black Death", "#e0c4c4"))
ypos <- c(7.4, 5.4, 3.4, 3.4, 5.4)
for (i in seq_along(ph)) { p <- ph[[i]]; x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2]); y <- ypos[i]
  rect(x0, y - 0.9, x1, y + 0.9, col = p[4], border = base_blue)
  text((x0 + x1) / 2, y, p[3], cex = 0.64, font = 2, col = base_blue) }
axx <- c(1000, 1100, 1200, 1300, 1400)
segments(axx, 1.7, axx, 1.9, col = grey); text(axx, 1.1, axx, cex = 0.66, col = grey)
ev <- list(c(1025, "Chola raid"), c(1206, "Chinggis"), c(1258, "Baghdad sacked"), c(1346, "plague"), c(1368, "Ming"))
for (e in ev) { points(as.numeric(e[1]), 2.0, pch = 19, cex = 0.6, col = accent) }
text(1258, 9.2, "1258 Baghdad sacked", cex = 0.6, col = accent); text(1346, 9.2, "1346 Black Death", cex = 0.6, col = accent)
title(main = "Fullest extent, overland climax, then the great disintegration", cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. Trade cost: sea stayed cheaper even at the overland climax
png("trade-cost-04.png", width = 1300, height = 700, res = 150)
par(mar = c(5, 5, 3, 1))
vals <- c(1.6, 4, 20)
b <- barplot(vals, names.arg = c("Tana->China\n(overland, Pegolotti)", "Black Sea\nduties", "Alexandria\nduties"),
             col = c(gold, "#cdddee", base_blue), border = NA, ylim = c(0, 34),
             ylab = "duty / tax (% of value)", cex.names = 0.76, cex.lab = 0.85)
text(b, vals + 1.3, c("~1.6%", "~3-5%", "~10-30%"), font = 2, col = base_blue, cex = 0.82)
text(mean(b), 31, "low taxes on the overland route - but ship carriage still", cex = 0.74, col = accent, font = 2)
text(mean(b), 28, "cost a fraction of caravan carriage per ton: the sea stayed cheaper", cex = 0.74, col = accent, font = 2)
title(main = "Even at the Mongol overland climax, the sea remained the cheaper artery", cex.main = 0.9, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 7. The Little Divergence in real wages (schematic, after Pamuk 2007)
png("blackdeath-wages-04.png", width = 1450, height = 760, res = 150)
par(mar = c(4, 5, 3, 1))
plot(NA, xlim = c(1300, 1600), ylim = c(80, 260), axes = FALSE, xlab = "", ylab = "real wage (index, 1348 = 100)")
yt <- c(100, 150, 200, 250); segments(1300, yt, 1310, yt, col = grey); text(1298, yt, yt, cex = 0.7, col = grey, pos = 2)
segments(1300, 100, 1600, 100, col = grey, lty = 3)
axx <- c(1300, 1348, 1400, 1450, 1500, 1550, 1600)
segments(axx, 96, axx, 100, col = grey); text(axx, 88, axx, cex = 0.66, col = grey)
# NW Europe: rise then hold high
xnw <- c(1300, 1348, 1400, 1450, 1500, 1550, 1600); ynw <- c(105, 100, 175, 235, 230, 225, 230)
lines(xnw, ynw, lwd = 3, col = base_blue); text(1600, 232, "NW Europe\n(England, Low Countries)", col = base_blue, font = 2, cex = 0.7, pos = 2)
# Rest: rise then fall back to subsistence
xr <- c(1300, 1348, 1400, 1450, 1500, 1550, 1600); yr <- c(105, 100, 170, 195, 150, 120, 108)
lines(xr, yr, lwd = 3, col = accent, lty = 1); text(1600, 110, "Rest (Italy, Spain,\nEgypt)", col = accent, font = 2, cex = 0.7, pos = 2)
points(1348, 100, pch = 19, col = grey); text(1348, 250, "1348\nBlack Death", cex = 0.62, col = grey)
abline(v = 1450, col = grey, lty = 2); text(1450, 250, "~1450:\ndivergence", cex = 0.62, col = grey)
title(main = "The Little Divergence: post-plague wages hold only in the north-west", cex.main = 0.96, col.main = base_blue)
mtext("Schematic, after Pamuk (2007); index 1348 = 100.", side = 1, line = 2.5, cex = 0.62, col = grey)
dev.off()

cat("ch04 figures written\n")
