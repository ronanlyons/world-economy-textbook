# Chapter 9 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (cracks within the West; London -> New York)
png("cog-locator-09.png", width = 1400, height = 470, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.80, "ASIA", col = base_blue, font = 2, cex = 1.25, adj = 0)
text(0.95, 0.80, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.25, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38, seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
# the within-West shift: London -> New York (both at the Atlantic end)
points(0.78, 0.50, pch = 19, cex = 2.6, col = grey); text(0.78, 0.66, "London", cex = 0.7, col = grey)
points(0.90, 0.50, pch = 19, cex = 3.0, col = accent); points(0.90, 0.50, pch = 21, cex = 3.0, col = base_blue, lwd = 2); text(0.90, 0.66, "New York", cex = 0.72, col = accent, font = 2)
arrows(0.80, 0.50, 0.875, 0.50, length = 0.06, lwd = 2, col = accent)
# Asia small turn
arrows(0.16, 0.50, 0.205, 0.50, length = 0.05, lwd = 1.6, col = green, lty = 2)
text(0.5, 0.27, "the European-centred order cracks -- but the decisive shift is WITHIN the West (London $->$ New York)", col = "#333333", font = 3, cex = 0.78)
text(0.5, 0.16, "Asia stays subordinate in aggregate, but quietly begins to turn", col = green, font = 3, cex = 0.78)
title(main = "Centre-of-gravity locator, 1914-1945", col.main = base_blue, cex.main = 1.2)
dev.off()

# ---------------------------------------------------------------------------
# 2. Four ways to meet a slump
png("ch09-four-slumps.png", width = 1700, height = 760, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
rows <- list(
  list(y = 40, col = accent,    a = "Defend gold (Britain to 1931, gold bloc, US to 1933)", b = "import deflation -> recover LAST"),
  list(y = 30, col = green,     a = "Leave gold early (Japan; sterling area after 1931)",   b = "reflate -> recover FIRST"),
  list(y = 20, col = base_blue, a = "Commodity periphery (Burma, Malaya, Ceylon, India)",    b = "price-takers -> terms-of-trade collapse (uneven, Brown)"),
  list(y = 10, col = gold,      a = "China, on silver",                                       b = "insulated at first, then wrecked by the US Silver Act (1934)"))
for (r in rows) {
  rect(4, r$y - 3.4, 50, r$y + 3.4, col = land, border = r$col, lwd = 2)
  text(27, r$y, r$a, cex = 0.62, font = 2, col = r$col)
  arrows(51, r$y, 56, r$y, length = 0.07, lwd = 1.8, col = r$col)
  text(58, r$y, r$b, cex = 0.6, col = grey, pos = 4) }
title(main = "Four ways to meet the slump -- and which one decided recovery", cex.main = 0.98, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. Phase timeline 1914-1945
png("ch09-timeline.png", width = 1750, height = 600, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(1912, 1947), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(1914, 1918, "1 the Great War: rupture",       "#e0c4c4"),
  c(1919, 1925, "2 botched restoration",          "#e8e0d0"),
  c(1925, 1929, "3 brittle boom on US credit",    "#cfe0d4"),
  c(1929, 1931, "4 the slump transmitted",        "#cdddee"),
  c(1931, 1936, "5 recovery by exit from gold",   "#bcd2e8"),
  c(1936, 1945, "6 blocs, war & the seed",        "#dcd0e4"))
ypos <- c(8.2, 8.2, 6.2, 6.2, 4.0, 2.2)
for (i in seq_along(ph)) { p <- ph[[i]]; x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2]); y <- ypos[i]
  rect(x0, y - 0.85, x1, y + 0.85, col = p[4], border = base_blue)
  text((x0 + x1) / 2, y, p[3], cex = 0.57, font = 2, col = base_blue) }
axx <- seq(1915, 1945, by = 10)
segments(axx, 0.7, axx, 0.95, col = grey); text(axx, 0.2, axx, cex = 0.66, col = grey)
ev <- list(c(1925, "gold $4.86"), c(1929, "crash"), c(1931, "UK off gold"), c(1939, "war"))
for (e in ev) { points(as.numeric(e[1]), 1.05, pch = 19, cex = 0.6, col = accent) }
title(main = "The first global economy comes apart, 1914-1945: six phases", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. The yardstick run in reverse (the signature exhibit): a round trip
png("ch09-disintegration-yardstick.png", width = 1380, height = 800, res = 150)
par(mar = c(4, 5, 3.5, 1))
yr <- c(1873, 1913, 1929, 1938)
gap <- c(93, 26, 45, 50)
plot(yr, gap, type = "n", axes = FALSE, xlab = "", ylab = "London-Rangoon rice price gap (per cent)",
     xlim = c(1868, 1943), ylim = c(0, 100), cex.lab = 0.85)
axis(1, at = yr, cex.axis = 0.78, col = grey); axis(2, at = seq(0, 100, 20), cex.axis = 0.78, col = grey)
# convergence leg (1873 -> 1913) in blue, disintegration leg (1913 -> 1938) in accent
segments(1873, 93, 1913, 26, lwd = 3, col = base_blue)
segments(1913, 26, 1929, 45, lwd = 3, col = accent); segments(1929, 45, 1938, 50, lwd = 3, col = accent)
points(yr, gap, pch = 19, cex = 1.2, col = c(base_blue, base_blue, accent, accent))
text(1873, 93, "93%", pos = 3, cex = 0.74, col = base_blue, font = 2)
text(1913, 26, "26% (peak integration)", pos = 1, cex = 0.7, col = base_blue, font = 2)
text(1936, 58, "back toward\n1870s levels", pos = 2, cex = 0.62, col = accent, font = 2)
text(1900, 70, "INTEGRATION\n1873-1913", cex = 0.7, col = base_blue, font = 2)
text(1928, 80, "DISINTEGRATION 1914-1939", cex = 0.72, col = accent, font = 2)
text(1922, 64, "(WWI spike off the scale:\ngap reached ~400%)", cex = 0.6, col = grey, font = 3)
title(main = "The integration yardstick, run forward then backward", cex.main = 0.92, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. The quiet turn: Japan's share of India's cotton-yarn imports
png("ch09-japan-india.png", width = 1300, height = 720, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(2, 46)
b <- barplot(vals, names.arg = c("1913", "1923"), col = c(silver, accent), border = NA,
             ylim = c(0, 55), ylab = "Japan's share of India's cotton-yarn imports (%)", cex.names = 0.9, cex.lab = 0.85)
text(b, vals + 2.5, c("2%", "46%"), font = 2, col = base_blue, cex = 1.0)
text(mean(b), 50, "intra-Asian substitution: as Europe withdrew, Osaka displaced Lancashire", col = base_blue, font = 3, cex = 0.72)
title(main = "The periphery acting: Japanese yarn displaces British in India, 1913-1923", cex.main = 0.86, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. The commodity-price collapse, 1929-31
png("ch09-commodity-collapse.png", width = 1320, height = 740, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(-53, -62, -77, -84)
nm <- c("coffee\n(Brazil)", "tea\n(Ceylon)", "China\nexport values", "rubber\n(Malaya)")
b <- barplot(vals, names.arg = nm, col = accent, border = NA, ylim = c(-95, 5), cex.names = 0.78,
             ylab = "fall in price / export value, 1929-31 (%)", cex.lab = 0.82)
abline(h = 0, col = grey)
text(b, vals - 5, c("-53%", "-62%", "-75 to -80%", "-84%"), font = 2, col = base_blue, cex = 0.8)
title(main = "Price-takers in the great collapse: the commodity periphery, 1929-31", cex.main = 0.9, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 7. The within-West shift: Western Europe's export share
png("ch09-within-west.png", width = 1300, height = 720, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(60.1, 41.1)
b <- barplot(vals, names.arg = c("1913", "1950"), col = c(base_blue, silver), border = NA,
             ylim = c(0, 70), ylab = "Western Europe's share of world exports (%)", cex.names = 0.9, cex.lab = 0.85)
text(b, vals + 3, c("60.1%", "41.1%"), font = 2, col = base_blue, cex = 0.95)
text(mean(b), 66, "the weight leaves its old European seat -- for New York, not Asia", col = accent, font = 2, cex = 0.74)
title(main = "The centre shifts within the West, 1913-1950", cex.main = 0.92, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 8. The gold-standard cascade (datable chain)
png("ch09-gold-cascade.png", width = 1750, height = 560, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 30), axes = FALSE, xlab = "", ylab = "")
steps <- list(
  c(10, "Britain back to\ngold at $4.86\n(1925)"),
  c(30, "US lending to\nEurope -> zero\n(H2 1928)"),
  c(50, "Creditanstalt\nfails\n(May 1931)"),
  c(70, "Britain off gold;\n~20 follow\n(Sept 1931)"),
  c(90, "recovery in the\norder of exit\n(1931-36)"))
for (i in seq_along(steps)) { s <- steps[[i]]; x <- as.numeric(s[1])
  col_i <- if (i == 5) green else accent
  rect(x - 8, 11, x + 8, 21, col = land, border = col_i, lwd = 2)
  text(x, 16, s[2], cex = 0.56, font = 2, col = base_blue)
  if (i < 5) arrows(x + 8.5, 16, x + 11.5, 16, length = 0.07, lwd = 2, col = grey) }
text(50, 5, "the gold standard as the transmission belt: deflation spread along the same rails that had carried integration",
     col = base_blue, font = 3, cex = 0.72)
title(main = "The datable cascade: how the slump was transmitted -- and escaped", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 9. Recovery in the order they left gold
png("ch09-recovery-order.png", width = 1400, height = 720, res = 150)
par(mar = c(4.5, 8, 3.5, 1))
left <- c(1930.9, 1931.7, 1933.3, 1936.0)
nm <- c("Japan", "Britain / sterling area", "United States", "gold bloc (Fr, NL, etc.)")
cols <- c(green, "#6a8fc0", gold, accent)
plot(left, 4:1, pch = 19, cex = 2.2, col = cols, axes = FALSE, xlab = "year left the gold standard", ylab = "",
     xlim = c(1930, 1937), ylim = c(0.5, 4.5), cex.lab = 0.85)
axis(1, at = 1930:1937, cex.axis = 0.78, col = grey)
text(left, 4:1, nm, pos = 2, cex = 0.74, col = base_blue, font = 2, xpd = TRUE)
for (i in 1:4) arrows(left[i] + 0.1, (4:1)[i], left[i] + 0.9, (4:1)[i], length = 0.06, lwd = 1.6, col = cols[i], lty = 2)
text(1933.5, 4.4, "earlier exit -> earlier recovery (Eichengreen & Sachs)", cex = 0.72, col = base_blue, font = 3)
title(main = "Countries recovered in the order they left gold", cex.main = 0.94, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 10. The world fragments into imperial blocs
png("ch09-blocs.png", width = 1650, height = 760, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
blocs <- list(
  list(x = 20, y = 34, col = base_blue, t = "STERLING AREA\n+ imperial preference\n(Ottawa 1932)"),
  list(x = 50, y = 38, col = grey,      t = "CONTINENTAL /\nReichsmark bloc"),
  list(x = 80, y = 34, col = accent,    t = "YEN SPHERE\n(Japan, Korea,\nManchuria)"),
  list(x = 50, y = 14, col = gold,      t = "DOLLAR /\nthe Americas"))
for (b in blocs) { rect(b$x - 13, b$y - 6, b$x + 13, b$y + 6, col = land, border = b$col, lwd = 2.2)
  text(b$x, b$y, b$t, cex = 0.6, font = 2, col = b$col) }
# barriers (dashed grey) between blocs
segments(34, 34, 37, 36, col = grey, lwd = 1, lty = 3); segments(63, 36, 66, 34, col = grey, lwd = 1, lty = 3)
text(50, 3, "near-zero trade between the great blocs by 1942 -- deglobalisation by political design",
     col = base_blue, font = 3, cex = 0.72)
title(main = "A world carved into imperial blocs (stylised; not to scale)", cex.main = 0.96, col.main = base_blue)
dev.off()

cat("ch09 figures written\n")
