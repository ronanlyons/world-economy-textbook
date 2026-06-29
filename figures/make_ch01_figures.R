# Chapter 1 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (no single centre yet)
png("cog-locator-01.png", width = 1400, height = 470, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.78, "ASIA", col = base_blue, font = 2, cex = 1.3, adj = 0)
text(0.95, 0.78, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.3, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38, seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
# several loosely linked cores - scatter of faint markers, no single weight
for (x in c(0.20, 0.33, 0.40, 0.55)) { points(x, 0.50, pch = 21, cex = 2.2, col = base_blue, bg = "#cdddee", lwd = 1.5) }
text(0.37, 0.25, "no single centre - several loosely linked riverine cores;",
     col = "#333333", font = 3, cex = 0.92)
text(0.37, 0.13, "the spine is not yet applicable", col = accent, font = 3, cex = 0.92)
title(main = "Centre-of-gravity locator", col.main = base_blue, cex.main = 1.3)
dev.off()

# ---------------------------------------------------------------------------
# 2. The stage and the three channels (orientation)
png("map-channels-01.png", width = 1600, height = 780, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 50), axes = FALSE, xlab = "", ylab = "")
# three channel bands
rect(4, 38, 96, 45, col = "#dfe7d8", border = NA); text(50, 41.5, "THE STEPPE - the era's dynamic engine (~9,000 km of grass)", col = green, font = 2, cex = 0.82)
rect(4, 29, 96, 35, col = "#efe6d2", border = NA); text(50, 32, "the desert / oasis corridor (the future Silk Road)", col = gold, font = 2, cex = 0.78)
rect(4, 7, 96, 14, col = "#dbe6f1", border = NA); text(50, 10.5, "the maritime INDIAN OCEAN - monsoon laid down, traffic still thin", col = base_blue, font = 2, cex = 0.8)
# riverine cores (middle band)
cores <- list("East Asian\ncore" = 90, "Indus\n(Harappa)" = 64, Dilmun = 50, "Mesopotamia\nUruk" = 36, Egypt = 14)
for (nm in names(cores)) { x <- cores[[nm]]
  rect(x - 6, 18.5, x + 6, 26.5, col = land, border = base_blue, lwd = 1.6); text(x, 22.5, nm, cex = 0.66, font = 2, col = base_blue) }
# the Gulf trade arrow Indus -> Dilmun -> Sumer
arrows(58, 22.5, 56, 22.5, length = 0, lwd = 0)
arrows(64, 18, 50, 18, length = 0.08, lwd = 2.5, col = accent)
arrows(50, 18, 38, 18, length = 0.08, lwd = 2.5, col = accent)
text(50, 15.8, "the Gulf trade: Indus -> Dilmun -> Sumer (ships run west)", col = accent, font = 2, cex = 0.7)
title(main = "The stage and the three channels (c.3500-500 BCE)", cex.main = 1.05, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. Indus structure map
png("map-indus-01.png", width = 1020, height = 1120, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(-2, 102), ylim = c(6, 112), axes = FALSE, xlab = "", ylab = "", asp = 1)
px <- c(30,40,52,60,66, 63,58,52,48,45, 40,36,32,29,30)
py <- c(98,103,100,98,90, 74,58,42,28,16, 30,52,74,88,98)
polygon(px, py, col = land, border = base_blue, lwd = 2)
text(48, 84, "INDUS / HARAPPA", font = 2, col = base_blue, cex = 0.82)
text(48, 78, "planned cities; standard weights & seals;\nno attested palaces or kings", cex = 0.6, col = grey, font = 3)
pts <- list(Harappa = c(50,72,4), "Mohenjo-daro" = c(44,52,2), Lothal = c(40,34,2))
for (nm in names(pts)) { p <- pts[[nm]]; points(p[1], p[2], pch = 19, col = accent, cex = 1.05); text(p[1], p[2], nm, pos = p[3], cex = 0.68) }
# Gulf trade west
arrows(40, 40, 8, 30, length = 0.10, lwd = 2.5, col = accent)
text(2, 22, "carnelian, ivory,\nbeads, hardwoods\n-> Magan -> Dilmun -> Sumer", cex = 0.62, col = accent, pos = 4)
arrows(10, 44, 38, 56, length = 0.09, lwd = 2, col = base_blue)
text(2, 50, "silver, tin,\nwool, oil", cex = 0.64, col = base_blue, pos = 4)
title(main = "The Indus: the agency-holder that ran the Gulf trade", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. Mesopotamia / Uruk structure map
png("map-mesopotamia-01.png", width = 1400, height = 900, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 92), axes = FALSE, xlab = "", ylab = "", asp = 1)
mx <- c(40,60,84,100,104, 98,84,66,52,44, 40)
my <- c(70,76,72,64,52, 40,34,36,42,54, 70)
polygon(mx, my, col = land, border = base_blue, lwd = 2)
text(72, 58, "MESOPOTAMIA", font = 2, col = base_blue, cex = 0.86)
text(72, 52, "resource-poor alluvium = the DEMAND CORE", cex = 0.62, col = grey, font = 3)
points(64, 46, pch = 19, col = accent, cex = 1.2); text(64, 46, "Uruk", pos = 1, cex = 0.72)
points(80, 50, pch = 19, col = accent, cex = 0.9); text(80, 50, "Ashur", pos = 3, cex = 0.64)
# imports in: tin/copper/lapis/carnelian from all sides
arrows(108, 66, 92, 58, length = 0.09, lwd = 2.2, col = base_blue); text(112, 70, "tin & textiles\n(Kanesh, ~950 km)", cex = 0.6, col = base_blue, pos = 2)
arrows(110, 30, 96, 42, length = 0.09, lwd = 2.2, col = gold); text(116, 24, "lapis (Badakhshan,\n~2,500 km)", cex = 0.6, col = gold, pos = 2)
arrows(86, 22, 78, 36, length = 0.09, lwd = 2.2, col = accent); text(88, 16, "copper & carnelian\n(Gulf via Dilmun)", cex = 0.6, col = accent, pos = 4)
title(main = "Mesopotamia/Uruk: the resource-poor demand core", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. The cycles timeline (deep time -> 500 BCE)
png("phase-cycles-01.png", width = 1700, height = 600, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(-3700, -300), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(-3700, -3500, "0 deep time", "#e6e6e6"),
  c(-3500, -3000, "1 Uruk system", "#cdddee"),
  c(-3000, -1900, "2 Gulf trade",  "#bcd2e8"),
  c(-2000, -1200, "3 steppe revolution", "#dfe7d8"),
  c(-1900, -1700, "4 Harappan unwind", "#e8d4d4"),
  c(-1177, -900,  "5 LBA collapse", "#e0c4c4"))
ypos <- c(6.5, 6.5, 6.5, 4.2, 6.5, 6.5)
for (i in seq_along(ph)) { p <- ph[[i]]; x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2]); y <- ypos[i]
  rect(x0, y - 1.1, x1, y + 1.1, col = p[4], border = base_blue)
  text((x0 + x1) / 2, y + 1.7, p[3], cex = 0.66, font = 2, col = base_blue) }
axx <- c(-3500, -3000, -2500, -2000, -1500, -1000, -500)
segments(axx, 2.7, axx, 2.9, col = grey); text(axx, 2.1, paste0(abs(axx), " BCE"), cex = 0.62, col = grey)
title(main = "Four thousand years in cycles, not one arc", cex.main = 1.02, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. Tin arbitrage (15:1 Ashur vs 7:1 Anatolia)
png("tin-arbitrage-01.png", width = 1400, height = 560, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 40), axes = FALSE, xlab = "", ylab = "")
rect(6, 14, 30, 30, col = land, border = base_blue, lwd = 2); text(18, 25, "ASHUR", font = 2, col = base_blue, cex = 0.95)
text(18, 20, "tin : silver", cex = 0.72, col = grey); text(18, 16.5, "~15 : 1", font = 2, cex = 1.05, col = base_blue)
rect(70, 14, 94, 30, col = land, border = base_blue, lwd = 2); text(82, 25, "ANATOLIA", font = 2, col = base_blue, cex = 0.95)
text(82, 20, "tin : silver", cex = 0.72, col = grey); text(82, 16.5, "~7 : 1", font = 2, cex = 1.05, col = base_blue)
arrows(31, 22, 69, 22, length = 0.14, lwd = 3, col = accent)
text(50, 26.5, "tin carried where it is dear", cex = 0.8, col = accent, font = 2)
text(50, 18, "~200% profit on textiles; ~50-day caravan", cex = 0.74, col = grey)
title(main = "Arbitrage before coins: the price gap moved the metal", cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 7. Uluburun cargo (dataset of one)
png("uluburun-cargo-01.png", width = 1000, height = 640, res = 150)
par(mar = c(4.2, 5.2, 3.2, 1), cex.axis = 1.1)
b <- barplot(c(10, 1), names.arg = c("copper", "tin"), col = c("#b87333", silver),
             border = NA, ylim = c(0, 12.5), ylab = "tonnes (estimated)", cex.names = 1.35, cex.lab = 1.2)
text(b, c(10, 1) + 0.65, c("~10 t", "~1 t"), font = 2, col = base_blue, cex = 1.25)
text(mean(b), 11.8, "~10:1 copper:tin; cargo from >=7 countries", cex = 1.0, col = accent, font = 2)
title(main = "The Uluburun wreck (c.1350 BCE): one hull, many economies", cex.main = 1.05, col.main = base_blue)
dev.off()

cat("ch01 figures written\n")
