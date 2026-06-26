# Chapter 10 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (the centre returns east -- partially)
png("cog-locator-10.png", width = 1400, height = 470, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.80, "ASIA", col = base_blue, font = 2, cex = 1.25, adj = 0)
text(0.95, 0.80, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.25, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38, seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
# the return east: mid-Atlantic (1980) -> toward India-China (2050)
points(0.62, 0.50, pch = 19, cex = 2.6, col = grey); text(0.62, 0.66, "1980", cex = 0.7, col = grey)
points(0.20, 0.50, pch = 19, cex = 3.0, col = accent); points(0.20, 0.50, pch = 21, cex = 3.0, col = base_blue, lwd = 2); text(0.20, 0.66, "~2050", cex = 0.72, col = accent, font = 2)
arrows(0.58, 0.50, 0.245, 0.50, length = 0.08, lwd = 2.2, col = accent)
text(0.5, 0.27, "the computed centre of gravity drifts back east (mid-Atlantic 1980 -> toward India-China ~2050)", col = "#333333", font = 3, cex = 0.76)
text(0.5, 0.16, "but the return is partial: aggregate weight, not yet income per head; and built ON a US-anchored order", col = green, font = 3, cex = 0.74)
title(main = "Centre-of-gravity locator, 1945-2010s", col.main = base_blue, cex.main = 1.2)
dev.off()

# ---------------------------------------------------------------------------
# 2. The arc in two phases with a hinge (stage-setting)
png("ch10-two-phases-hinge.png", width = 1700, height = 620, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 40), axes = FALSE, xlab = "", ylab = "")
rect(4, 22, 42, 32, col = land, border = accent, lwd = 2)
text(23, 29, "CLOSURE (1945-70)", cex = 0.72, font = 2, col = accent)
text(23, 25.5, "periphery closes (ISI); India 2.6% -> 0.7%\nof world exports; the rich open to each other", cex = 0.56, col = grey)
rect(44, 16, 56, 36, col = "#f3e6c6", border = gold, lwd = 2.2)
text(50, 33, "THE HINGE", cex = 0.7, font = 2, col = gold)
text(50, 26, "1971-73\ngold window,\noil shock,\nthe container,\nthe float", cex = 0.56, font = 2, col = base_blue)
rect(58, 22, 96, 32, col = land, border = green, lwd = 2)
text(77, 29, "COMEBACK (1973-2010s)", cex = 0.72, font = 2, col = green)
text(77, 25.5, "reglobalisation; China opens 1978, India 1991;\nthe measurable return of Asian weight", cex = 0.56, col = grey)
arrows(42.5, 27, 43.5, 27, length = 0.06, lwd = 2, col = grey)
arrows(56.5, 27, 57.5, 27, length = 0.06, lwd = 2, col = grey)
text(50, 9, "1945 was the monetary reset; 1971-73 was the real reglobalisation and the Indian Ocean's recentring", col = base_blue, font = 3, cex = 0.72)
title(main = "The arc closes in two phases, with a hinge between them", cex.main = 0.98, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. China structure map (stylised: coastal SEZs vs interior)
png("ch10-china-structure.png", width = 1150, height = 820, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 10), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
polygon(c(1.2, 8.6, 8.2, 6.8, 5.2, 1.6), c(7.8, 7.4, 3.2, 2.0, 2.6, 5.0), col = land, border = base_blue, lwd = 2)
text(3.4, 6.4, "INTERIOR\n(planned, agrarian,\nlate to open)", cex = 0.66, col = grey, font = 3)
# coastal SEZ belt
points(c(8.1, 7.9, 7.6, 7.2), c(6.4, 5.4, 4.2, 3.2), pch = 15, cex = 1.5, col = accent)
text(8.7, 5.0, "coastal\nSEZs\n(export\nworkshop)", cex = 0.6, col = accent, font = 2, pos = 4, xpd = TRUE)
text(7.0, 6.9, "Beijing", cex = 0.6, col = base_blue, pos = 4); points(6.8, 6.9, pch = 19, cex = 0.7, col = base_blue)
text(8.0, 4.2, "Shanghai", cex = 0.58, col = accent, pos = 2)
arrows(8.6, 4.6, 9.4, 4.6, length = 0.07, lwd = 2, col = accent); text(9.4, 4.1, "to world\nmarkets", cex = 0.55, col = accent, pos = 4, xpd = TRUE)
title(main = "China: the planned interior and the export coast", cex.main = 0.84, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. India structure map (retreat then return; services hubs)
png("ch10-india-structure.png", width = 1150, height = 820, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 10), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
polygon(c(3.2, 6.8, 7.4, 5.6, 4.4, 2.8), c(8.4, 8.2, 5.0, 1.6, 2.2, 5.4), col = land, border = base_blue, lwd = 2)
text(5.0, 6.6, "STATIST CORE\n(planning, public\nheavy industry, ISI)", cex = 0.62, col = grey, font = 3)
# services / knowledge hubs (post-1991)
points(c(4.6, 5.8, 4.2), c(3.0, 4.0, 7.6), pch = 17, cex = 1.3, col = green)
text(4.6, 2.6, "Bangalore", cex = 0.55, col = green, font = 2, pos = 1)
text(5.8, 4.4, "Hyderabad", cex = 0.52, col = green, pos = 4)
text(2.0, 8.0, "knowledge &\nservices hubs\n(post-1991)", cex = 0.6, col = green, font = 2, pos = 4, xpd = TRUE)
arrows(7.2, 4.0, 8.2, 4.0, length = 0.07, lwd = 2, col = green); text(8.2, 3.5, "services\nexports", cex = 0.55, col = green, pos = 4, xpd = TRUE)
title(main = "India: statist core, then knowledge-led return", cex.main = 0.84, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. Phase timeline 1944-2010s
png("ch10-timeline.png", width = 1750, height = 600, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(1942, 2018), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(1944, 1958, "1 reconstruction & the dollar order", "#cdddee"),
  c(1958, 1971, "2 the great reversal at its deepest", "#e0c4c4"),
  c(1971, 1973, "3 the hinge",                          "#f3e6c6"),
  c(1978, 1991, "4 the reopening",                      "#cfe0d4"),
  c(1991, 2015, "5 the measurable return",              "#bcd2e8"))
ypos <- c(8.2, 6.2, 8.2, 4.0, 2.2)
for (i in seq_along(ph)) { p <- ph[[i]]; x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2]); y <- ypos[i]
  rect(x0, y - 0.85, x1, y + 0.85, col = p[4], border = base_blue)
  text((x0 + x1) / 2, y, p[3], cex = 0.55, font = 2, col = base_blue) }
axx <- seq(1950, 2010, by = 20)
segments(axx, 0.7, axx, 0.95, col = grey); text(axx, 0.2, axx, cex = 0.66, col = grey)
ev <- list(c(1944, "Bretton Woods"), c(1971, "gold window"), c(1978, "China opens"), c(1991, "India"), c(2010, "China #1 mfr"))
for (e in ev) { points(as.numeric(e[1]), 1.05, pch = 19, cex = 0.6, col = accent) }
title(main = "The arc comes home, 1944-2010s: five phases, closure to comeback", cex.main = 0.94, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. India's world-export share: the great reversal (signature of the closure)
png("ch10-india-export-share.png", width = 1300, height = 740, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
yr <- c(1948, 1953, 1970); sh <- c(2.6, 1.5, 0.7)
plot(yr, sh, type = "b", pch = 19, cex = 1.3, lwd = 3, col = accent, axes = FALSE,
     xlab = "", ylab = "India's share of world exports (%)", xlim = c(1945, 1973), ylim = c(0, 3), cex.lab = 0.85)
axis(1, at = yr, cex.axis = 0.8, col = grey); axis(2, at = seq(0, 3, 0.5), cex.axis = 0.78, col = grey)
text(yr, sh + 0.18, c("2.6%", "1.5%", "0.7%"), font = 2, col = base_blue, cex = 0.9)
text(1962, 2.5, "the periphery closes:\nimport substitution, the retreat from world trade", col = grey, font = 3, cex = 0.72)
title(main = "The great reversal, deepest: India walks out of world trade, 1948-1970", cex.main = 0.84, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 7. THE SIGNATURE EXHIBIT: the centre of gravity drifts back east (Quah)
png("ch10-cog-drift.png", width = 1500, height = 820, res = 150)
par(mar = c(4, 1.5, 3.5, 1.5))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
# a stylised longitude band from Americas (left) to East Asia (right)
segments(8, 18, 92, 18, lwd = 2, col = grey)
labs <- c("N. America", "mid-Atlantic", "W. Europe", "Helsinki/\nBucharest", "India-China")
at <- c(12, 30, 50, 66, 86)
for (i in seq_along(at)) { segments(at[i], 16.5, at[i], 19.5, col = grey); text(at[i], 13, labs[i], cex = 0.6, col = grey) }
# the path: 1500 (east) -> 1980 mid-Atlantic (west) -> 2008 -> 2050 (east again)
pts_x <- c(82, 30, 60, 86); pts_y <- c(34, 18, 26, 40)
labs2 <- c("~1500\n(Asia ~50-60%\nof world output)", "1980", "2008", "~2050\n(projected)")
cols2 <- c(silver, accent, accent, green)
# the European interruption arc (1500 -> 1980, swinging west) then the return (1980 -> 2050, east)
lines(c(82, 56, 30), c(34, 30, 18), lwd = 2.5, col = silver, lty = 2)
lines(c(30, 60, 86), c(18, 26, 40), lwd = 3, col = accent)
points(pts_x, pts_y, pch = 19, cex = 1.6, col = cols2)
text(82, 34, labs2[1], pos = 3, cex = 0.6, col = grey, font = 2)
text(30, 18, labs2[2], pos = 1, cex = 0.66, col = accent, font = 2)
text(60, 26, labs2[3], pos = 4, cex = 0.66, col = accent, font = 2)
text(86, 40, labs2[4], pos = 3, cex = 0.62, col = green, font = 2)
text(45, 44, "THE RETURN", cex = 0.9, col = accent, font = 2)
text(56, 9, "the European interruption (the centre swings WEST to ~1980), then the return EAST", col = base_blue, font = 3, cex = 0.74)
title(main = "The world economy's centre of gravity, computed (Quah): out west, then back east", cex.main = 0.82, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 8. The return measured: manufacturing shares 2019
png("ch10-manufacturing-shares.png", width = 1280, height = 740, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(28.7, 16.8)
b <- barplot(vals, names.arg = c("China", "United States"), col = c(accent, silver), border = NA,
             ylim = c(0, 34), ylab = "share of global manufacturing output, 2019 (%)", cex.names = 0.95, cex.lab = 0.82)
text(b, vals + 1.6, c("28.7%", "16.8%"), font = 2, col = base_blue, cex = 1.0)
text(mean(b), 31, "China the world's largest manufacturer since 2010 -- the workshop returns east", col = base_blue, font = 3, cex = 0.72)
title(main = "The return, measured: world manufacturing in 2019", cex.main = 0.9, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 9. Asia's share of world GDP, 1990 -> 2023
png("ch10-asia-gdp-share.png", width = 1280, height = 740, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(21, 39)
b <- barplot(vals, names.arg = c("1990", "2023"), col = c(silver, accent), border = NA,
             ylim = c(0, 48), ylab = "Asia's share of world GDP (%)", cex.names = 0.95, cex.lab = 0.85)
text(b, vals + 2.2, c("~21%", "~39%"), font = 2, col = base_blue, cex = 1.0)
text(mean(b), 45, "the aggregate weight swings back toward its pre-1800 level", col = base_blue, font = 3, cex = 0.72)
title(main = "Asia's share of world GDP nearly doubles, 1990-2023", cex.main = 0.88, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 10. The 1973 oil shock (dual: price and producer revenues)
png("ch10-oil-shock.png", width = 1500, height = 720, res = 150)
par(mfrow = c(1, 2), mar = c(4.5, 5, 3.5, 1))
# price
vals <- c(2.90, 11.65)
b <- barplot(vals, names.arg = c("before", "after\n(6 months)"), col = c(silver, accent), border = NA,
             ylim = c(0, 14), ylab = "crude oil ($/barrel)", cex.names = 0.82, cex.lab = 0.82)
text(b, vals + 0.7, c("$2.90", "$11.65"), font = 2, col = base_blue, cex = 0.9)
title(main = "Price, 1973", cex.main = 0.9, col.main = base_blue)
# revenues
vals <- c(23, 140)
b <- barplot(vals, names.arg = c("1972", "5 yrs later"), col = c(silver, accent), border = NA,
             ylim = c(0, 165), ylab = "producer revenues ($bn)", cex.names = 0.82, cex.lab = 0.82)
text(b, vals + 9, c("$23bn", "$140bn"), font = 2, col = base_blue, cex = 0.9)
title(main = "Producer revenues", cex.main = 0.9, col.main = base_blue)
mtext("The Gulf becomes an energy-and-capital pole: the 1973 oil shock", outer = TRUE, line = -1.5, col = base_blue, font = 2, cex = 0.9)
dev.off()
par(mfrow = c(1, 1))

# ---------------------------------------------------------------------------
# 11. The drain inverted: Bretton Woods II (mirror of T8)
png("ch10-bw2.png", width = 1600, height = 640, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 30), axes = FALSE, xlab = "", ylab = "")
rect(8, 12, 34, 22, col = land, border = accent, lwd = 2.2); text(21, 17, "SAVING ASIA\n(China et al.)\n~50% savings", cex = 0.66, font = 2, col = accent)
rect(66, 12, 92, 22, col = land, border = base_blue, lwd = 2.2); text(79, 17, "THE WEST\n(US deficits,\nthe consumer)", cex = 0.66, font = 2, col = base_blue)
arrows(35, 19, 65, 19, length = 0.09, lwd = 2.4, col = green); text(50, 22.2, "goods (exports)", cex = 0.62, col = green, font = 2)
arrows(65, 14.5, 35, 14.5, length = 0.09, lwd = 2.4, col = gold); text(50, 11.6, "savings recycled into US Treasuries", cex = 0.62, col = gold, font = 2)
text(50, 5.5, "'Bretton Woods II': the rising East underwrites the established core -- the colonial drain (Ch 8) run in reverse", col = base_blue, font = 3, cex = 0.72)
title(main = "The drain inverted: who finances whom", cex.main = 0.94, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 12. The dollar order strains: US gold vs foreign claims, 1969
png("ch10-gold-claims.png", width = 1280, height = 720, res = 150)
par(mar = c(4.5, 5, 3.5, 1))
vals <- c(11.2, 40)
b <- barplot(vals, names.arg = c("US gold stock", "foreign official\ndollar claims"), col = c(gold, accent), border = NA,
             ylim = c(0, 48), ylab = "$bn, mid-1969", cex.names = 0.85, cex.lab = 0.82)
text(b, vals + 2.4, c("$11.2bn", "$40bn"), font = 2, col = base_blue, cex = 0.95)
text(mean(b), 45, "nearly four claims on the metal for every dollar of gold -- the promise was unbackable", col = base_blue, font = 3, cex = 0.68)
title(main = "Why the gold window closed: the 1969 mismatch", cex.main = 0.9, col.main = base_blue)
dev.off()

cat("ch10 figures written\n")
