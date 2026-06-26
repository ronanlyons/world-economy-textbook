# Chapter 8 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (now firmly Western; rests on the IO periphery)
png("cog-locator-08.png", width = 1400, height = 470, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.78, "ASIA", col = base_blue, font = 2, cex = 1.3, adj = 0)
text(0.95, 0.78, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.3, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38, seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
x <- 0.05 + 0.88 * 0.90
points(x, 0.50, pch = 19, cex = 3.2, col = accent); points(x, 0.50, pch = 21, cex = 3.2, col = base_blue, lwd = 2)
text(0.5, 0.28, "peak Western dominance: Europe + offshoots ~89.8% of world manufacturing (1913)", col = "#333333", font = 3, cex = 0.82)
text(0.5, 0.17, "but the apex rested on the Indian-Ocean periphery it governed (the drain)", col = accent, font = 3, cex = 0.82)
title(main = "Centre-of-gravity locator, c.1850-1914", col.main = base_blue, cex.main = 1.25)
dev.off()

# ---------------------------------------------------------------------------
# 2. Three ways to be integrated (core / settler periphery up / colonial periphery down)
png("ch08-two-peripheries.png", width = 1650, height = 760, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
# core
rect(38, 30, 62, 44, col = "#cdddee", border = base_blue, lwd = 2.4)
text(50, 39, "THE CORE", font = 2, col = base_blue, cex = 0.85); text(50, 34, "Britain / NW Europe\nsets the terms; exports\ncapital & manufactures", cex = 0.56, col = grey)
# settler periphery (left, converging up)
rect(6, 28, 30, 42, col = land, border = green, lwd = 1.8)
text(18, 37, "SETTLER PERIPHERY", font = 2, col = green, cex = 0.62); text(18, 32, "US, Argentina,\nAustralia, Canada", cex = 0.55, col = grey)
arrows(18, 43, 18, 47.5, length = 0.10, lwd = 2.6, col = green); text(18, 49, "converges UP", col = green, font = 2, cex = 0.66)
# colonial periphery (right, integrating down)
rect(70, 28, 94, 42, col = land, border = accent, lwd = 1.8)
text(82, 37, "COLONIAL PERIPHERY", font = 2, col = accent, cex = 0.6); text(82, 32, "India, Ceylon,\nMalaya, Egypt", cex = 0.55, col = grey)
arrows(82, 27, 82, 22.5, length = 0.10, lwd = 2.6, col = accent); text(82, 21, "integrates DOWN", col = accent, font = 2, cex = 0.66)
# flows
arrows(31, 35, 37, 36, length = 0.08, lwd = 2, col = grey); arrows(63, 36, 69, 35, length = 0.08, lwd = 2, col = grey)
text(50, 12, "Same world economy, three fates: the convergence that lifted the Atlantic locked the Indian Ocean in as a periphery",
     col = base_blue, font = 3, cex = 0.72)
title(main = "Three ways to be integrated, c.1850-1914 (stylised; not to scale)", cex.main = 0.98, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. India: commodity-exporting periphery + linchpin (the drain)
png("ch08-india-structure.png", width = 1100, height = 1150, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(-2, 110), ylim = c(6, 112), axes = FALSE, xlab = "", ylab = "", asp = 1)
px <- c(28,38,52,62,68, 64,58,52,49,47, 42,37,32,28,28)
py <- c(98,103,100,98,90, 74,58,42,28,16, 30,52,74,88,98)
polygon(px, py, col = land, border = base_blue, lwd = 2)
text(48, 86, "INDIA", font = 2, col = base_blue, cex = 0.9)
text(48, 80, "commodity-exporting\ncolonial periphery", cex = 0.56, col = grey, font = 3)
points(34, 68, pch = 19, col = accent, cex = 0.9); text(34, 68, "cotton,\njute (Bengal)", pos = 2, cex = 0.54)
points(58, 56, pch = 19, col = accent, cex = 0.9); text(60, 56, "wheat, tea", pos = 4, cex = 0.54)
# commodities out
arrows(64, 60, 96, 66, length = 0.09, lwd = 2.2, col = base_blue); text(99, 72, "cotton, jute,\nwheat, tea ->", cex = 0.52, col = base_blue, pos = 2)
# manufactures in
arrows(96, 44, 64, 48, length = 0.09, lwd = 2, col = grey); text(99, 38, "<- British\nmanufactures", cex = 0.52, col = grey, pos = 2)
# the drain
arrows(48, 26, 48, 12, length = 0.10, lwd = 2.6, col = accent); text(48, 8, "export surplus -> London (Council Bills):\n>40% of Britain's BoP deficits, 1870-1915", cex = 0.54, col = accent, font = 2)
title(main = "India: the deindustrialised periphery that propped up the core", cex.main = 0.84, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. China: treaty-port semi-periphery
png("ch08-china-structure.png", width = 1320, height = 940, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 100), axes = FALSE, xlab = "", ylab = "", asp = 1)
cx <- c(56,74,96,112,118, 112,100,88,78,70, 60,56,52,54,56)
cy <- c(88,94,90,84,72, 56,44,38,40,48, 58,66,74,82,88)
polygon(cx, cy, col = land, border = base_blue, lwd = 2)
text(88, 72, "QING CHINA", font = 2, col = base_blue, cex = 0.86)
text(88, 65, "a treaty-port semi-periphery,\nopened by force", cex = 0.56, col = grey, font = 3)
points(98, 50, pch = 19, col = accent, cex = 1.1); text(98, 50, "treaty ports\n(tariff fixed 5%, 1842;\nforeign-run Customs)", pos = 4, cex = 0.54)
arrows(118, 44, 101, 49, length = 0.09, lwd = 2.2, col = grey); text(124, 37, "foreign\nmanufactures", cex = 0.52, col = grey, pos = 2)
arrows(96, 46, 80, 30, length = 0.09, lwd = 2, col = base_blue); text(74, 25, "tea, silk ->", cex = 0.54, col = base_blue, pos = 1)
text(64, 8, "terms of trade +25% in China's favour (1870-1913) -- yet it still fell behind", cex = 0.56, col = accent, font = 3)
title(main = "China: the treaty-port semi-periphery", cex.main = 0.92, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. Phase timeline 1850-1914
png("ch08-timeline.png", width = 1750, height = 600, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(1848, 1918), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(1850, 1869, "1 steam & liberal interlude", "#cdddee"),
  c(1869, 1875, "2 Suez: a 'British lake'",     "#bcd2e8"),
  c(1873, 1895, "3 price-convergence big bang", "#e8e0d0"),
  c(1878, 1896, "4 backlash + gold standard",   "#e0c4c4"),
  c(1890, 1914, "5 apogee: capital, drain, famine", "#cfe0d4"))
ypos <- c(8.2, 8.2, 6.2, 4.2, 2.3)
for (i in seq_along(ph)) { p <- ph[[i]]; x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2]); y <- ypos[i]
  rect(x0, y - 0.85, x1, y + 0.85, col = p[4], border = base_blue)
  text((x0 + x1) / 2, y, p[3], cex = 0.58, font = 2, col = base_blue) }
axx <- seq(1850, 1910, by = 20)
segments(axx, 0.7, axx, 0.95, col = grey); text(axx, 0.2, axx, cex = 0.66, col = grey)
ev <- list(c(1860, "Cobden-Chevalier"), c(1869, "Suez"), c(1879, "iron & rye"), c(1914, "war"))
for (e in ev) { points(as.numeric(e[1]), 1.05, pch = 19, cex = 0.6, col = accent) }
title(main = "The world compresses, 1850-1914: five phases from steam to the integrated apogee", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. Suez distance saving + freight collapse
png("ch08-suez-freight.png", width = 1450, height = 720, res = 150)
par(mfrow = c(1, 2), mar = c(4.5, 4.5, 3.2, 1), oma = c(0, 0, 2, 0))
# left: Suez distance
d <- c(10667, 6224)
b <- barplot(d, names.arg = c("via the Cape", "via Suez (1869)"), col = c(silver, base_blue), border = NA,
             ylim = c(0, 12500), ylab = "Britain-Bombay sea route (miles)", cex.names = 0.85, cex.lab = 0.85)
text(b, d + 600, format(d, big.mark = ","), font = 2, col = base_blue, cex = 0.85)
text(mean(b), 11800, "~40% shorter", col = accent, font = 2, cex = 0.82)
title(main = "Suez cuts the route", cex.main = 0.9, col.main = base_blue)
# right: freight index
yr <- c(1840, 1870, 1910); idx <- c(100, 70, 30)
plot(yr, idx, type = "b", pch = 19, lwd = 2.4, col = accent, axes = FALSE, xlab = "", ylab = "British ocean-freight index (1840 = 100)",
     ylim = c(0, 110), xlim = c(1835, 1915), cex.lab = 0.82)
axis(1, at = yr, cex.axis = 0.8, col = grey); axis(2, cex.axis = 0.8, col = grey)
text(yr, idx + 8, idx, col = accent, font = 2, cex = 0.82)
text(1875, 100, "fell ~70%, 1840-1910 (Harley)", col = base_blue, font = 2, cex = 0.78)
title(main = "Ocean freights collapse", cex.main = 0.9, col.main = base_blue)
mtext("Suez and the freight collapse compress the eastern ocean", outer = TRUE, cex = 0.86, col = base_blue, font = 2)
dev.off()

# ---------------------------------------------------------------------------
# 7. Price-convergence (the signature exhibit): gaps close 1873 -> 1913
png("ch08-price-convergence.png", width = 1320, height = 820, res = 150)
par(mar = c(4, 5, 3.5, 7))
plot(NA, xlim = c(0, 1), ylim = c(0, 100), axes = FALSE, xlab = "", ylab = "price gap between markets (per cent)")
axis(2, at = seq(0, 100, 20), cex.axis = 0.8, col = grey)
series <- list(
  list(name = "Liverpool-Bombay cotton", a = 57, b = 20, col = base_blue),
  list(name = "London-Rangoon rice",      a = 93, b = 26, col = accent),
  list(name = "London-Calcutta jute",     a = 35, b = 4,  col = green))
for (s in series) {
  segments(0.08, s$a, 0.92, s$b, lwd = 3, col = s$col)
  points(c(0.08, 0.92), c(s$a, s$b), pch = 19, cex = 1.1, col = s$col)
  text(0.05, s$a, paste0(s$a, "%"), pos = 2, cex = 0.72, col = s$col, font = 2)
  text(0.94, s$b, paste0(s$name, " (", s$b, "%)"), pos = 4, cex = 0.62, col = s$col, font = 2, xpd = TRUE) }
text(0.08, -7, "1873", cex = 0.8, col = grey, font = 2, xpd = TRUE); text(0.92, -7, "1913", cex = 0.8, col = grey, font = 2, xpd = TRUE)
title(main = "The price gaps close, 1873-1913: the signature of true globalisation", cex.main = 0.9, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 8. Wage-rental ratios by 1910 (1870 = 100): contrasting national fates
png("ch08-wage-rental.png", width = 1320, height = 720, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(25, 100, 270, 560)
cols <- c(accent, silver, "#6a8fc0", green)
b <- barplot(vals, names.arg = c("Australia", "Spain", "Britain", "Ireland"), col = cols, border = NA,
             ylim = c(0, 650), ylab = "wage-rental ratio, 1910 (1870 = 100)", cex.names = 0.9, cex.lab = 0.85)
text(b, vals + 25, c("~25", "~100", "~270", "~560"), font = 2, col = base_blue, cex = 0.85)
abline(h = 100, lty = 3, col = grey)
text(mean(b), 620, "land-abundant New World falls; labour-abundant Europe rises -- factor prices converge", col = base_blue, font = 3, cex = 0.66)
title(main = "Factor-price convergence as contrasting national fates, by 1910", cex.main = 0.9, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 9. Two migrations: free Europeans vs indentured Indians (+ distribution)
png("ch08-two-migrations.png", width = 1500, height = 740, res = 150)
par(mfrow = c(1, 2), mar = c(5, 5, 3.2, 1), oma = c(0, 0, 2, 0))
# left: free vs indentured (millions)
m <- c(60, 1.75)
b <- barplot(m, names.arg = c("free Europeans\nto the New World", "indentured Indians\nacross the IO"),
             col = c(green, accent), border = NA, ylim = c(0, 68), ylab = "migrants (millions)", cex.names = 0.78, cex.lab = 0.82)
text(b, m + 3, c("~60m", "~1.5-2m"), font = 2, col = base_blue, cex = 0.85)
text(mean(b), 64, "same integration, opposite terms", col = base_blue, font = 3, cex = 0.72)
title(main = "Two migration regimes", cex.main = 0.9, col.main = base_blue)
# right: indenture distribution (thousands)
dist <- c(400, 400, 240, 150, 145, 60)
nm <- c("Mauritius", "Malaya", "Br. Guiana", "Natal", "Trinidad", "Fiji")
bb <- barplot(rev(dist), names.arg = rev(nm), horiz = TRUE, col = "#6a8fc0", border = NA, las = 1,
              xlim = c(0, 460), xlab = "indentured Indians (thousands)", cex.names = 0.72, cex.lab = 0.8)
text(rev(dist) + 30, bb, rev(dist), cex = 0.72, col = base_blue, font = 2)
title(main = "Where the indentured went (1834-1920)", cex.main = 0.88, col.main = base_blue)
mtext("The first global economy moved labour on one market and two legal regimes", outer = TRUE, cex = 0.84, col = base_blue, font = 2)
dev.off()

# ---------------------------------------------------------------------------
# 10. The drain: the multilateral settlement triangle
png("ch08-the-drain.png", width = 1450, height = 820, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 60), axes = FALSE, xlab = "", ylab = "")
# three nodes
nodes <- list("INDIA\n(colonial periphery)" = c(20, 14), "BRITAIN\n(the core / banker)" = c(50, 46),
              "industrialising world\n(US, Continental Europe)" = c(82, 14))
for (nm in names(nodes)) { p <- nodes[[nm]]; big <- grepl("BRITAIN", nm)
  rect(p[1] - 13, p[2] - 6, p[1] + 13, p[2] + 6, col = if (big) "#cdddee" else land, border = base_blue, lwd = if (big) 2.4 else 1.6)
  text(p[1], p[2], nm, cex = 0.62, font = 2, col = base_blue) }
# India surplus -> Britain (accent)
arrows(28, 19, 42, 40, length = 0.10, lwd = 2.8, col = accent)
text(28, 32, "India's export surplus\n(Council Bills)\n>40% of Britain's\nBoP deficits", cex = 0.56, col = accent, font = 2, pos = 2)
# Britain deficit with industrialising world
arrows(58, 40, 74, 19, length = 0.10, lwd = 2.4, col = grey)
text(74, 33, "Britain's deficits\n(manufactures from\nrivals catching up)", cex = 0.56, col = grey, pos = 4)
# India trades with industrialising world (surplus earned there)
arrows(74, 12, 34, 12, length = 0.09, lwd = 2, col = base_blue, lty = 2)
text(54, 7.5, "India's commodity surplus is earned in third countries' currencies", cex = 0.58, col = base_blue, font = 3)
title(main = "The drain: how a subordinate periphery held the settlement system together", cex.main = 0.9, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 11. World manufacturing shares, 1913 (the scale / denominator)
png("ch08-mfg-shares-1913.png", width = 1320, height = 720, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(89.8, 3.6, 1.4)
cols <- c(base_blue, "#6a8fc0", accent)
b <- barplot(vals, names.arg = c("Europe + offshoots", "China", "India"), col = cols, border = NA,
             ylim = c(0, 100), ylab = "share of world manufacturing output (%)", cex.names = 0.9, cex.lab = 0.85)
text(b, vals + 3.5, c("~89.8%", "3.6%", "1.4%"), font = 2, col = base_blue, cex = 0.9)
text(mean(b[2:3]), 30, "the near-total reversal\nof c.1750 (India+China ~57%)", col = accent, font = 3, cex = 0.72)
title(main = "World manufacturing output by region, 1913 (Bairoch-type estimates)", cex.main = 0.92, col.main = base_blue)
dev.off()

cat("ch08 figures written\n")
