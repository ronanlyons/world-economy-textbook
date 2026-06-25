# Chapter 3 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (Asia <-> North Atlantic spectrum)
png("cog-locator-03.png", width = 1400, height = 460, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.78, "ASIA", col = base_blue, font = 2, cex = 1.3, adj = 0)
text(0.95, 0.78, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.3, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38,
         seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
x <- 0.05 + 0.16 * 0.90
points(x, 0.50, pch = 19, cex = 3.2, col = accent)
points(x, 0.50, pch = 21, cex = 3.2, col = base_blue, lwd = 2)
text(x, 0.25, "c.1000 - the bipolar Asian/Islamic core; Europe peripheral",
     col = "#333333", font = 3, cex = 0.95, adj = 0.2)
title(main = "Centre-of-gravity locator", col.main = base_blue, cex.main = 1.3)
dev.off()

# ---------------------------------------------------------------------------
# 2. Orientation: two cores, the ocean between, silver north
png("map-two-cores-03.png", width = 1600, height = 760, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
nodes <- list("Carolingian\nEurope" = c(8, 20), "ABBASID\ncore" = c(30, 20),
              India = c(52, 20), Srivijaya = c(70, 20), "TANG-SONG\nChina" = c(90, 20))
for (nm in names(nodes)) {
  p <- nodes[[nm]]; big <- nm %in% c("ABBASID\ncore", "TANG-SONG\nChina")
  rect(p[1] - 7, p[2] - 5, p[1] + 7, p[2] + 5,
       col = if (big) "#cdddee" else land, border = base_blue, lwd = if (big) 2.5 else 1.5)
  text(p[1], p[2], nm, cex = 0.74, font = 2, col = base_blue)
}
# sea road (goods) along the bottom
arrows(83, 13, 59, 13, length = 0.10, lwd = 2.5, col = base_blue)
arrows(63, 13, 39, 13, length = 0.10, lwd = 2.5, col = base_blue)
text(60, 8.5, "ceramics, silk, spices, cotton - the maritime sea road", cex = 0.8, col = base_blue, font = 2)
# silver north (out of the core)
arrows(30, 26, 30, 44, length = 0.12, lwd = 3, col = accent)
text(30, 47, "Abbasid silver drains NORTH (to the Rus / Baltic, for furs & slaves)",
     cex = 0.82, col = accent, font = 2)
title(main = "Two cores and the ocean between - and the silver runs north",
      cex.main = 1.05, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. China structure map (schematic)
png("map-china-03.png", width = 1300, height = 980, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 100), axes = FALSE, xlab = "", ylab = "", asp = 1)
cx <- c(54,70,92,110,118, 114,102,90,78,70, 60,54,50,52,54)
cy <- c(86,92,90,86,76, 60,46,38,40,48, 58,66,74,80,86)
polygon(cx, cy, col = land, border = base_blue, lwd = 2)
text(90, 71, "TANG-SONG CHINA", font = 2, col = base_blue, cex = 0.9)
text(90, 64, "agrarian-fiscal core; centre shifting south", cex = 0.62, col = grey, font = 3)
points(70, 76, pch = 19, col = accent, cex = 1.1); text(70, 76, "Chang'an", pos = 2, cex = 0.72)
points(96, 48, pch = 19, col = accent, cex = 1.1); text(96, 48, "Guangzhou", pos = 4, cex = 0.72)
# Grand Canal (north-south spine)
segments(72, 74, 88, 54, col = base_blue, lwd = 2, lty = 2)
text(68, 58, "Grand Canal", cex = 0.6, col = base_blue, srt = -38, pos = 4)
# Nanhai trade south
arrows(96, 44, 80, 24, length = 0.10, lwd = 2, col = base_blue)
text(74, 20, "Nanhai trade:\nto Srivijaya, India,\nthe Gulf", cex = 0.64, col = base_blue, pos = 2)
# overland west fraying
arrows(56, 76, 18, 80, length = 0.10, lwd = 2, col = grey, lty = 3)
text(10, 86, "overland Silk Road\n(fraying after An Lushan)", cex = 0.62, col = grey, pos = 4, font = 3)
title(main = "China: the eastern core turns to face the sea",
      cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. India structure map (three coastal arms)
png("map-india-03.png", width = 1020, height = 1160, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(-2, 102), ylim = c(6, 112), axes = FALSE, xlab = "", ylab = "", asp = 1)
px <- c(26,34,50,64,74, 71,66,59,53,50, 45,40,34,29,26)
py <- c(98,103,101,102,98, 84,64,44,26,14, 28,52,76,90,98)
polygon(px, py, col = land, border = base_blue, lwd = 2)
text(50, 92, "North - Rashtrakuta / Pratihara", cex = 0.66, col = grey, font = 3)
text(50, 60, "Deccan - Rashtrakutas", cex = 0.68, col = grey, font = 3)
text(50, 33, "Tamil south - Pallava, rising Chola", cex = 0.64, col = grey, font = 3)
pts <- list(Gujarat = c(30,86,2), Sanjan = c(33,74,2), Malabar = c(37,40,2),
            Coromandel = c(63,42,4))
for (nm in names(pts)) { p <- pts[[nm]]
  points(p[1], p[2], pch = 19, col = accent, cex = 1.05); text(p[1], p[2], nm, pos = p[3], cex = 0.7) }
arrows(31, 66, 4, 72, length = 0.10, lwd = 2, col = base_blue)
text(2, 80, "to the Gulf\n(Siraf, Basra)", cex = 0.68, col = base_blue, pos = 4)
arrows(70, 54, 96, 60, length = 0.10, lwd = 2, col = base_blue)
text(98, 68, "to Srivijaya\n& Tang China", cex = 0.68, col = base_blue, pos = 2)
title(main = "India: the workshop between two cores",
      cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. Abbasid structure map (one free-trade zone)
png("map-abbasid-03.png", width = 1500, height = 820, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 70), axes = FALSE, xlab = "", ylab = "", asp = 1)
ax <- c(8,40,80,112,120, 116,96,70,40,16, 8)
ay <- c(46,52,50,46,38, 26,22,24,26,32, 46)
polygon(ax, ay, col = land, border = base_blue, lwd = 2)
text(64, 44, "ABBASID CALIPHATE - one free-trade zone, al-Andalus to Sind",
     font = 2, col = base_blue, cex = 0.74)
points(74, 36, pch = 19, col = accent, cex = 1.2); text(74, 36, "Baghdad", pos = 3, cex = 0.74)
points(82, 30, pch = 19, col = accent, cex = 0.9); text(82, 30, "Basra/Siraf", pos = 1, cex = 0.66)
points(14, 40, pch = 19, col = accent, cex = 0.9); text(14, 40, "Cordoba", pos = 3, cex = 0.66)
# silver north
arrows(74, 48, 74, 66, length = 0.12, lwd = 3, col = accent)
text(74, 68, "silver dirhams NORTH (for furs & slaves)", cex = 0.74, col = accent, font = 2)
# gold from W Africa
arrows(20, 20, 28, 30, length = 0.10, lwd = 2.5, col = gold)
text(16, 14, "gold from West Africa", cex = 0.7, col = gold, font = 2, pos = 4)
# sea road east
arrows(86, 28, 122, 30, length = 0.12, lwd = 2.5, col = base_blue)
text(124, 36, "sea road to\nIndia & China", cex = 0.68, col = base_blue, pos = 2)
title(main = "The Abbasid core: one money, one market, silver running out the top",
      cex.main = 0.98, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. Five-phase timeline, c.500-1000
png("phase-timeline-03.png", width = 1700, height = 600, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(500, 1000), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(500, 630, "1 Ground cleared",  "#dde6f0"),
  c(630, 751, "2 Two cores form",  "#cdddee"),
  c(751, 763, "3 The swing",       "#e8d4d4"),
  c(763, 870, "4 Maritime apogee", "#bcd2e8"),
  c(870, 1000,"5 Fragment, sea on","#cfe0d4"))
for (p in ph) { x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2])
  rect(x0, 3.5, x1, 6.5, col = p[4], border = base_blue)
  text((x0 + x1) / 2, 7.5, p[3], cex = 0.74, font = 2, col = base_blue) }
axx <- c(500, 630, 751, 830, 945, 1000)
laby <- c("500", "630", "751", "830", "945", "1000")
segments(axx, 3.3, axx, 3.5, col = grey); text(axx, 2.6, laby, cex = 0.72, col = grey)
ev <- list(c(541, "Justinianic\nplague"), c(751, "Talas"), c(762, "Baghdad\nfounded"),
           c(830, "Belitung\nwreck"), c(878, "Guangzhou\nmassacre"), c(945, "Buyids\ntake Baghdad"))
for (e in ev) { x <- as.numeric(e[1]); points(x, 5, pch = 19, cex = 0.7, col = accent) }
text(541, 1.3, "541 plague", cex = 0.6, col = accent)
text(762, 9.1, "762 Baghdad", cex = 0.6, col = accent)
text(830, 1.3, "830 Belitung", cex = 0.6, col = accent)
text(945, 9.1, "945 Buyids", cex = 0.6, col = accent)
title(main = "The maritime apogee in five phases - ending in a boom, not a collapse",
      cex.main = 1.02, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 7. Gold:silver ratio - a long-run band (not a false-precision line)
png("goldsilver-band-03.png", width = 1600, height = 760, res = 150)
par(mar = c(4, 4.5, 3, 1))
plot(NA, xlim = c(-600, 1000), ylim = c(0, 16), axes = FALSE,
     xlab = "", ylab = "gold : silver ratio")
# the converged Mediterranean/Islamic band ~10-14:1
rect(-500, 10, 1000, 14, col = "#dbe6f1", border = NA)
text(250, 12, "coined-bullion band  ~10-14 : 1", col = base_blue, font = 2, cex = 0.82)
# axis
axx <- c(-500, -250, 1, 300, 700, 1000)
labx <- c("500 BCE", "250 BCE", "1 CE", "300 CE", "700 CE", "1000 CE")
segments(-600, 0, 1000, 0, col = grey)
segments(axx, -0.3, axx, 0, col = grey); text(axx, -1.1, labx, cex = 0.7, col = grey)
yt <- c(0, 4, 8, 12, 16); segments(-600, yt, -585, yt, col = grey); text(-610, yt, yt, cex = 0.7, col = grey, pos = 2)
# anchor points (Ross & Bettenay 2023; Thompson; Diocletian; Abbasid implied)
an <- list(c(-440, 14, "Athens 440 BCE"), c(-407, 12, "Athens 407 BCE"),
           c(1, 11.5, "Rome (imperial)"), c(301, 12, "Diocletian 301"),
           c(340, 14.4, "late Rome 340"), c(800, 12, "Abbasid implied ~10-14"))
for (a in an) { x <- as.numeric(a[1]); y <- as.numeric(a[2])
  points(x, y, pch = 19, col = accent, cex = 1.0) }
text(-440, 15, "Athens 440", cex = 0.6, col = accent)
text(301, 10.6, "Diocletian 301", cex = 0.6, col = accent)
text(800, 14.8, "Abbasid c.800 (implied)", cex = 0.62, col = accent, font = 2)
# pre-coinage plural note (low band, left)
rect(-600, 2, -500, 3, col = "#efe2cf", border = NA)
text(-550, 5.4, "pre-coinage:\nregionally plural\n(Egypt ~2-3,\nNear East ~8-10)",
     cex = 0.6, col = gold, font = 3)
title(main = "The oldest price we can track: gold-to-silver, a supply-geography price",
      cex.main = 0.98, col.main = base_blue)
mtext("Level genuinely contested; shown as a band with anchor points. Sources: Ross & Bettenay (2023); Thompson (1964).",
      side = 1, line = 2.4, cex = 0.62, col = grey)
dev.off()

# ---------------------------------------------------------------------------
# 8. Dirham hoards - a dated flow north
png("dirham-hoards-03.png", width = 1200, height = 720, res = 150)
par(mar = c(4, 5, 3, 1))
b <- barplot(c(300, 1750), names.arg = c("800-810", "830-840"),
             col = c("#cdddee", base_blue), border = NA, ylim = c(0, 2050),
             ylab = "dirham hoards in the north (count)", cex.names = 0.95, cex.lab = 0.9)
text(b, c(300, 1750) + 110, c("<300", ">1,750"), font = 2, col = base_blue)
text(mean(b), 1980, "the silver pours north within one generation", cex = 0.82, col = accent, font = 2)
title(main = "Follow the silver: northern dirham hoards as a dated flow",
      cex.main = 0.98, col.main = base_blue)
mtext("Noonan/Kovalev estimates; orders of magnitude, not fixed totals.",
      side = 1, line = 2.5, cex = 0.62, col = grey)
dev.off()

# ---------------------------------------------------------------------------
# 9. Belitung cargo - a dataset of one
png("belitung-cargo-03.png", width = 1300, height = 640, res = 150)
par(mar = c(2, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 34), axes = FALSE, xlab = "", ylab = "")
rect(8, 20, 92, 27, col = "#cdddee", border = base_blue)        # ~70,000 loaded
rect(8, 20, 8 + 84 * (60/70), 27, col = base_blue, border = base_blue)  # ~60,000 recovered
rect(8, 11, 8 + 84 * (55/70), 18, col = accent, border = accent)        # ~55,000 Changsha
text(50, 30.5, "one Gulf-built dhow, c.830 - a single direct China-Gulf cargo", font = 2, col = base_blue, cex = 0.86)
text(50, 23.5, "~60,000 recovered  /  ~70,000 loaded", col = "white", font = 2, cex = 0.78)
text(34, 14.5, "~55,000 Changsha bowls (mass-produced for export)", col = "white", font = 2, cex = 0.72)
text(50, 6, "Figures estimated; the count is itself part of the debate.", col = grey, cex = 0.7, font = 3)
title(main = "The Belitung cargo: the first physical proof of direct sailing",
      cex.main = 0.98, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 10. Largest cities c.1000 - the centre-of-gravity proxy
png("city-size-03.png", width = 1350, height = 760, res = 150)
par(mar = c(5, 5, 3, 1))
vals <- c(500, 500, 350, 8)
cols <- c(base_blue, base_blue, base_blue, grey)
b <- barplot(vals, names.arg = c("Baghdad", "Chang'an", "Cordoba", "Aachen"),
             col = cols, border = NA, ylim = c(0, 600),
             ylab = "population (thousands, est.)", cex.names = 0.92, cex.lab = 0.9)
text(b, vals + 22, c("~500k", "~500k", "~350k", "~few k"), font = 2, col = base_blue, cex = 0.85)
text(b[1:3] %*% c(1,1,1)/3, 560, "Asia / the Islamic world", col = base_blue, font = 2, cex = 0.8)
text(b[4], 90, "Carolingian\nEurope", col = grey, font = 2, cex = 0.72)
title(main = "Where the weight sat, c.1000: the largest cities of the connected world",
      cex.main = 0.96, col.main = base_blue)
mtext("Order-of-magnitude estimates (Bosker-Buringh-van Zanden 2013; Reba-Reitsma-Seto 2016); taught as debate, not census.",
      side = 1, line = 3.4, cex = 0.6, col = grey)
dev.off()

cat("ch03 figures written\n")
