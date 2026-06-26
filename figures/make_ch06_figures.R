# Chapter 6 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (still Asian in production; Europe armed not productive)
png("cog-locator-06.png", width = 1400, height = 470, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.78, "ASIA", col = base_blue, font = 2, cex = 1.3, adj = 0)
text(0.95, 0.78, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.3, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38, seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
x <- 0.05 + 0.20 * 0.90
points(x, 0.50, pch = 19, cex = 3.2, col = accent); points(x, 0.50, pch = 21, cex = 3.2, col = base_blue, lwd = 2)
arrows(0.32, 0.50, 0.44, 0.50, length = 0.07, lwd = 1.8, col = grey, lty = 2)
text(0.46, 0.28, "still firmly Asian in PRODUCTION: India ~24.5% of world manufacturing (1750),", col = "#333333", font = 3, cex = 0.82)
text(0.46, 0.17, "silver still flows east; but Europe now holds the armed company, the navy, Atlantic capital", col = accent, font = 3, cex = 0.82)
title(main = "Centre-of-gravity locator, c.1600-1760", col.main = base_blue, cex.main = 1.25)
dev.off()

# ---------------------------------------------------------------------------
# 2. Two oceanic systems (Indian-Ocean contest + Atlantic sugar-slave complex)
png("ch06-two-oceans.png", width = 1700, height = 850, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
nodes <- list("CHINA\n(silver sink,\ntea)" = c(90, 36), "INDIA\n(cotton\nworkshop)" = c(66, 33),
              "Spice Is.\n(VOC)" = c(86, 18), Europe = c(34, 33),
              "W. Africa\n(captives)" = c(30, 14), "Americas\n(sugar)" = c(9, 20))
for (nm in names(nodes)) { p <- nodes[[nm]]; big <- grepl("INDIA|CHINA", nm)
  rect(p[1] - 6, p[2] - 4.4, p[1] + 6, p[2] + 4.4, col = if (big) "#cdddee" else land,
       border = base_blue, lwd = if (big) 2.4 else 1.4)
  text(p[1], p[2], nm, cex = 0.62, font = 2, col = base_blue) }
# Indian-Ocean system (accent = silver east, blue = cloth/spice west)
arrows(40, 33, 59, 33, length = 0.09, lwd = 2.4, col = accent)        # Europe -> India (silver)
arrows(72, 33, 83, 35, length = 0.09, lwd = 2.4, col = accent)        # India -> China (silver)
arrows(59, 31, 41, 31, length = 0.08, lwd = 2, col = base_blue)       # India -> Europe (cloth)
arrows(86, 23, 70, 30, length = 0.08, lwd = 1.8, col = base_blue, lty = 3) # spice -> India/west
text(58, 44, "INDIAN-OCEAN SYSTEM: silver east, cottons & spice west", col = base_blue, font = 2, cex = 0.78)
# Atlantic system (grey = the triangular trade)
arrows(30, 30, 16, 22, length = 0.08, lwd = 2, col = grey)            # Europe goods/cloth -> Africa
arrows(27, 11, 13, 17, length = 0.08, lwd = 2, col = grey)            # Africa captives -> Americas
arrows(11, 24, 30, 30, length = 0.08, lwd = 2, col = grey)           # Americas sugar -> Europe
text(20, 5.5, "ATLANTIC SYSTEM: the triangular sugar-and-slave trade (accumulates European capital)",
     col = grey, font = 3, cex = 0.7)
title(main = "Two oceanic systems, c.1600-1760 (stylised; not to scale)", cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. Mughal India: the cotton workshop the silver flowed to
png("ch06-india-structure.png", width = 1060, height = 1150, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(-2, 102), ylim = c(6, 112), axes = FALSE, xlab = "", ylab = "", asp = 1)
px <- c(28,38,52,62,68, 64,58,52,49,47, 42,37,32,28,28)
py <- c(98,103,100,98,90, 74,58,42,28,16, 30,52,74,88,98)
polygon(px, py, col = land, border = base_blue, lwd = 2)
text(48, 86, "MUGHAL INDIA", font = 2, col = base_blue, cex = 0.82)
text(48, 80, "the world's cotton workshop +\nthe great silver absorber", cex = 0.56, col = grey, font = 3)
points(34, 70, pch = 19, col = accent, cex = 1.0); text(34, 70, "Gujarat\n(cotton)", pos = 2, cex = 0.58)
points(60, 60, pch = 19, col = accent, cex = 1.1); text(60, 60, "Bengal\n(cloth + silk,\nEurope's chief supplier)", pos = 4, cex = 0.56)
points(60, 42, pch = 19, col = accent, cex = 0.95); text(62, 42, "Coromandel\n(calicoes)", pos = 4, cex = 0.56)
arrows(6, 54, 32, 52, length = 0.09, lwd = 2.4, col = accent); text(2, 62, "silver in\n(~185 t/yr,\n~20% of world)", cex = 0.56, col = accent, pos = 4)
arrows(64, 50, 92, 56, length = 0.09, lwd = 2, col = base_blue); text(96, 62, "cottons\n-> the world", cex = 0.56, col = base_blue, pos = 2)
title(main = "Mughal India: the cotton workshop the silver flowed to", cex.main = 0.9, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. Qing China: the silver sink, now selling tea
png("ch06-china-structure.png", width = 1320, height = 940, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 100), axes = FALSE, xlab = "", ylab = "", asp = 1)
cx <- c(56,74,96,112,118, 112,100,88,78,70, 60,56,52,54,56)
cy <- c(88,94,90,84,72, 56,44,38,40,48, 58,66,74,82,88)
polygon(cx, cy, col = land, border = base_blue, lwd = 2)
text(90, 72, "QING CHINA", font = 2, col = base_blue, cex = 0.9)
text(90, 65, "the silver sink continues;\nthe Canton tea trade opens", cex = 0.6, col = grey, font = 3)
points(95, 47, pch = 19, col = accent, cex = 1.2); text(95, 47, "Canton\n(tea, silk,\nporcelain)", pos = 4, cex = 0.6)
arrows(122, 40, 99, 45, length = 0.09, lwd = 2.4, col = accent); text(127, 33, "silver in", cex = 0.62, col = accent, pos = 2)
arrows(95, 41, 80, 26, length = 0.09, lwd = 2, col = base_blue); text(74, 21, "tea -> EIC\n(~12m lb/yr by 1757)", cex = 0.58, col = base_blue, pos = 1)
title(main = "Qing China: the silver sink, now selling tea", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. Phase timeline 1600-1760 (six phases: crisis to conquest)
png("ch06-timeline.png", width = 1750, height = 620, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(1595, 1770), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(1600, 1665, "1 spice monopoly by force", "#cdddee"),
  c(1630, 1665, "2 the 17th-c. crisis",      "#e0c4c4"),
  c(1660, 1705, "3 the textile turn",         "#e8e0d0"),
  c(1640, 1760, "4 Atlantic system matures",  "#cfe0d4"),
  c(1707, 1757, "5 Mughal fragmentation",     "#dcd0e4"),
  c(1757, 1765, "6 Plassey (the hinge)",      "#bcd2e8"))
ypos <- c(8.0, 8.0, 6.0, 4.0, 2.2, 2.2)
for (i in seq_along(ph)) { p <- ph[[i]]; x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2]); y <- ypos[i]
  rect(x0, y - 0.85, x1, y + 0.85, col = p[4], border = base_blue)
  text((x0 + x1) / 2, y, p[3], cex = 0.6, font = 2, col = base_blue) }
axx <- seq(1600, 1760, by = 40)
segments(axx, 0.7, axx, 0.95, col = grey); text(axx, 0.2, axx, cex = 0.66, col = grey)
ev <- list(c(1602, "VOC"), c(1644, "Ming falls"), c(1707, "Aurangzeb dies"), c(1757, "Plassey"))
for (e in ev) { points(as.numeric(e[1]), 1.05, pch = 19, cex = 0.6, col = accent) }
title(main = "The period in six phases, 1600-1760: from crisis to conquest", cex.main = 0.98, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. Shares of world manufacturing output, 1750 (Bairoch-type estimates)
png("ch06-manufacturing-1750.png", width = 1320, height = 760, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(24.5, 32.5, 23.2)
cols <- c(base_blue, "#6a8fc0", silver)
b <- barplot(vals, names.arg = c("India", "China\n(rest of Asia)", "Europe\n(incl. Russia)"),
             col = cols, border = NA, ylim = c(0, 38), ylab = "share of world manufacturing output (%)",
             cex.names = 0.9, cex.lab = 0.9)
text(b, vals + 1.6, c("~24.5%", "~32%", "~23%"), font = 2, col = base_blue, cex = 0.9)
text(mean(b[1:2]), 36, "ASIA ~57%: still the workshop of the world", col = accent, font = 2, cex = 0.84)
title(main = "Shares of world manufacturing output, c.1750", cex.main = 0.98, col.main = base_blue)
mtext("Bairoch-type estimates; orders of magnitude, not an audited series.", side = 1, line = 3, cex = 0.66, col = grey)
dev.off()

# ---------------------------------------------------------------------------
# 7. Same silver, several fates (two-axis framework)
png("ch06-silver-fates.png", width = 1320, height = 1000, res = 150)
par(mar = c(4.5, 4.5, 3.5, 1))
plot(NA, xlim = c(0, 10), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
rect(0.5, 0.5, 9.5, 9.5, border = base_blue, lwd = 1.5)
segments(5, 0.5, 5, 9.5, col = grey, lwd = 1); segments(0.5, 5, 9.5, 5, col = grey, lwd = 1)
# axis labels
text(5, 0.0, "MONETARY axis: silver met money DEMAND (left) vs flooded money SUPPLY (right)",
     cex = 0.66, col = base_blue, font = 2)
text(-0.2, 5, "REAL axis: exported MANUFACTURES (top) vs FACTORS / stores of value (bottom)",
     cex = 0.66, col = base_blue, font = 2, srt = 90)
# quadrant placements
text(2.6, 7.4, "CHINA & MUGHAL INDIA", font = 2, col = accent, cex = 0.78)
text(2.6, 6.7, "absorb + specialise\n-> florescence", font = 3, col = grey, cex = 0.66)
text(7.4, 3.0, "OTTOMANS", font = 2, col = base_blue, cex = 0.78)
text(7.4, 2.3, "debase coin -> inflation\n(mostly a domestic channel)", font = 3, col = grey, cex = 0.62)
text(7.4, 6.0, "WEST AFRICA", font = 2, col = base_blue, cex = 0.78)
text(7.4, 5.3, "commodity-money flood +\ncaptive/raw-gold export\n-> divergence + depletion", font = 3, col = grey, cex = 0.6)
title(main = "Same silver, several fates", cex.main = 1.05, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 8. Welfare ratios c.1700 (baskets per day's minimum wage)
png("ch06-welfare-1700.png", width = 1320, height = 720, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(4, 3, 1)
cols <- c(base_blue, "#6a8fc0", accent)
b <- barplot(vals, names.arg = c("London", "Amsterdam /\nOxford", "Beijing /\nCanton / Edo"),
             col = cols, border = NA, ylim = c(0, 5), ylab = "subsistence baskets per day's wage",
             cex.names = 0.9, cex.lab = 0.9)
text(b, vals + 0.22, c("~4", "~3", "~1"), font = 2, col = base_blue, cex = 0.95)
text(mean(b), 4.7, "a first consumption gap inside a still-Asian production centre, c.1700",
     col = accent, font = 2, cex = 0.78)
title(main = "Welfare ratios, c.1700: what a day's wage could buy", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 9. The crisis monetary shock in China (silver:copper ratio + imports)
png("ch06-crisis-silver.png", width = 1450, height = 760, res = 150)
par(mar = c(4.2, 5, 3.5, 5))
yr <- c(1638, 1643, 1645, 1647)
ratio <- c(1700, 3000, 5000, 6000)
plot(yr, ratio, type = "b", pch = 19, lwd = 2.4, col = accent, axes = FALSE,
     xlab = "", ylab = "", ylim = c(0, 6500), xlim = c(1635, 1648))
axis(1, at = yr, cex.axis = 0.8, col = grey); axis(2, col = accent, col.axis = accent, cex.axis = 0.8)
mtext("silver : copper ratio (1 : n)", side = 2, line = 3, col = accent, cex = 0.85)
text(yr, ratio + 320, paste0("1:", format(ratio, big.mark = ",")), col = accent, cex = 0.72, font = 2)
# overlay silver imports as bars (right axis) at two windows
par(new = TRUE)
plot(NA, xlim = c(1635, 1648), ylim = c(0, 700), axes = FALSE, xlab = "", ylab = "")
rect(1636, 0, 1640, 600, col = "#cdddee", border = base_blue)
rect(1641, 0, 1645, 250, col = "#cdddee", border = base_blue)
text(1638, 630, "600 t", col = base_blue, cex = 0.74, font = 2)
text(1643, 290, "<250 t", col = base_blue, cex = 0.74, font = 2)
axis(4, col = base_blue, col.axis = base_blue, cex.axis = 0.8)
mtext("silver imports to China (tonnes, 5-yr window)", side = 4, line = 3, col = base_blue, cex = 0.85)
title(main = "The crisis monetary shock in China, 1638-1647 (taught as contested)",
      cex.main = 0.92, col.main = base_blue)
dev.off()

cat("ch06 figures written\n")
