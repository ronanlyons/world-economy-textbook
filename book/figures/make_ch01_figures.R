# Chapter 1 visual programme (house style: R base graphics, ECU palette; 6-digit hex).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; silver <- "#8a8d91"; green <- "#3c7d5a"

# ---------------------------------------------------------------------------
# 1. Centre-of-gravity locator (no single centre yet)
png("cog-locator-01.png", width = 1400, height = 470, res = 150)
par(mar = c(2.5, 1, 2.5, 1))
plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
rect(0.05, 0.40, 0.95, 0.60, col = land, border = base_blue, lwd = 2)
text(0.05, 0.78, "NORTH ATLANTIC", col = base_blue, font = 2, cex = 1.3, adj = 0)
text(0.95, 0.78, "ASIA", col = base_blue, font = 2, cex = 1.3, adj = 1)
segments(seq(0.05, 0.95, length.out = 5), 0.38, seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
# several loosely linked cores - markers keyed a-d WEST -> EAST, matching the axis, no single weight
dotx <- c(0.45, 0.60, 0.67, 0.80)
for (x in dotx) { points(x, 0.50, pch = 21, cex = 2.7, col = base_blue, bg = "#cdddee", lwd = 1.5) }
text(dotx, 0.50, c("a", "b", "c", "d"), col = base_blue, font = 2, cex = 0.9)
text(0.63, 0.25, "no single centre - several loosely linked riverine cores;",
     col = "#333333", font = 3, cex = 1.0)
text(0.63, 0.13, "the spine is not yet applicable", col = accent, font = 3, cex = 1.0)
title(main = "Centre-of-gravity locator", col.main = base_blue, cex.main = 1.3)
dev.off()

# ---------------------------------------------------------------------------
# 2. The stage and the three channels (orientation)
png("map-channels-01.png", width = 1600, height = 780, res = 150, pointsize = 16)
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
png("map-indus-01.png", width = 1020, height = 1120, res = 150, pointsize = 15)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(-2, 102), ylim = c(6, 112), axes = FALSE, xlab = "", ylab = "", asp = 1)
px <- c(30,40,52,60,66, 63,58,52,48,45, 40,36,32,29,30)
py <- c(98,103,100,98,90, 74,58,42,28,16, 30,52,74,88,98)
polygon(px, py, col = land, border = base_blue, lwd = 2)
text(48, 84, "INDUS / HARAPPA", font = 2, col = base_blue, cex = 0.82)
# re-wrapped to three shorter lines: the single long line was wider than the outline and
# the polygon border cut through it at both ends
text(48, 78, "planned cities;\nstandard weights & seals;\nno attested palaces or kings", cex = 0.6, col = grey, font = 3)
pts <- list(Harappa = c(50,72,4), Lothal = c(40,34,2))
for (nm in names(pts)) { p <- pts[[nm]]; points(p[1], p[2], pch = 19, col = accent, cex = 1.05); text(p[1], p[2], nm, pos = p[3], cex = 0.68) }
# Mohenjo-daro: the label is wider than the valley at this latitude, so it sits below the
# dot rather than beside it, where the outline and the inbound arrow used to cut through it
points(44, 52, pch = 19, col = accent, cex = 1.05)
text(45.5, 47.5, "Mohenjo-daro", cex = 0.68)
# Gulf trade west
arrows(40, 40, 8, 30, length = 0.10, lwd = 2.5, col = accent)
text(2, 22, "carnelian, ivory,\nbeads, hardwoods\n-> Magan -> Dilmun -> Sumer", cex = 0.62, col = accent, pos = 4)
arrows(10, 44, 38, 56, length = 0.09, lwd = 2, col = base_blue)
text(2, 50, "silver, tin,\nwool, oil", cex = 0.64, col = base_blue, pos = 4)
title(main = "The Indus: the agency-holder that ran the Gulf trade", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. Mesopotamia / Uruk structure map
png("map-mesopotamia-01.png", width = 1400, height = 900, res = 150, pointsize = 15)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 92), axes = FALSE, xlab = "", ylab = "", asp = 1)
mx <- c(40,60,84,100,104, 98,84,66,52,44, 40)
my <- c(70,76,72,64,52, 40,34,36,42,54, 70)
polygon(mx, my, col = land, border = base_blue, lwd = 2)
text(60, 68, "MESOPOTAMIA", font = 2, col = base_blue, cex = 0.86)
# two lines, not one: the single-line version ran straight through the Assur label
text(60, 62, "resource-poor alluvium\n= the DEMAND CORE", cex = 0.60, col = grey, font = 3)
# GEOGRAPHY CORRECTED 2026-09-08: Assur sits ~470 km NORTH-WEST of Uruk (35.5N 43.3E vs
# 31.3N 45.6E), and the blob's long axis already runs NW-SE like the Tigris-Euphrates.
# The old version put Assur east of Uruk and level with it, and brought the Kanesh
# caravan in from the upper RIGHT when Kanesh is north-west of Assur.
points(92, 44, pch = 19, col = accent, cex = 1.2); text(92, 44, "Uruk", pos = 1, cex = 0.72)
points(74, 54, pch = 19, col = accent, cex = 0.9); text(74, 54, "Assur", pos = 3, cex = 0.64)
# imports in, each from the direction it actually came from
arrows(32, 82, 52, 73.5, length = 0.09, lwd = 2.2, col = base_blue); text(4, 85, "tin & textiles\n(Kanesh, ~950 km NW)", cex = 0.6, col = base_blue, pos = 4)
arrows(118, 60, 103, 56, length = 0.09, lwd = 2.2, col = gold); text(128, 66, "lapis (Badakhshan,\n~2,500 km E)", cex = 0.6, col = gold, pos = 2)
arrows(102, 18, 94, 37, length = 0.09, lwd = 2.2, col = accent); text(96, 12, "copper & carnelian\n(Gulf via Dilmun, SE)", cex = 0.6, col = accent, pos = 4)
title(main = "Mesopotamia/Uruk: the resource-poor demand core", cex.main = 0.96, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. The cycles timeline (deep time -> 500 BCE)
png("phase-cycles-01.png", width = 1700, height = 560, res = 150, pointsize = 15)
par(mar = c(2, 1, 3, 1))
# Linear time axis, one contiguous row: the ~300-year gap that the steppe
# technologies fill between cycles two and three is real time, not spacing.
plot(NA, xlim = c(-3760, -240), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(-3700, -3500, "deep time", "#e6e6e6", "top"),
  c(-3500, -3000, "Cycle 1\nUruk sphere", "#cdddee", "top"),
  c(-2600, -1900, "Cycle 2: Gulf / Harappan trade", "#bcd2e8", "top"),
  c(-1900, -1600, "", "#dfe7d8", "below"),
  c(-1600, -1177, "Cycle 3\nLBA system", "#cdddee", "top"),
  c(-1177, -500,  "reset: empire + iron + coin", "#e6e6e6", "top"))
for (k in seq_along(ph)) {
  q <- ph[[k]]; x0 <- as.numeric(q[1]); x1 <- as.numeric(q[2])
  rect(x0, 5.4, x1, 7.6, col = q[4], border = base_blue)
  if (q[5] == "top") text((x0 + x1) / 2, 8.5, q[3], cex = 0.66, font = 2, col = base_blue)
}
# the narrow interval is too tight to label in place: leader down to a caption
segments(-1750, 5.4, -1750, 3.9, col = green)
text(-1750, 3.4, "between the cycles:\nhorse, wheel, chariot\n(and the Assur-Kanesh trade)", cex = 0.58, font = 2, col = green)
# the two unwindings, marked where they actually fall
segments(-1900, 5.4, -1900, 4.8, col = accent, lty = 3)
text(-1935, 4.5, "Harappan end", cex = 0.62, col = accent, font = 2, adj = 1)
segments(-1177, 5.4, -1177, 4.8, col = accent, lty = 3)
text(-1142, 4.5, "LBA collapse", cex = 0.62, col = accent, font = 2, adj = 0)
axx <- c(-3500, -3000, -2500, -2000, -1500, -1000, -500)
segments(axx, 1.7, axx, 1.95, col = grey); text(axx, 1.1, paste0(abs(axx), " BCE"), cex = 0.62, col = grey)
segments(-3700, 1.95, -500, 1.95, col = grey)
title(main = "Three thousand years in three cycles, not one arc", cex.main = 1.02, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. Tin arbitrage. Silver is the unit of account (RL, 2026-09-06): 100 shekels of tin
#    cost ~6.7 shekels of silver at Assur and ~14.3 in Anatolia. The old "15:1 vs 7:1"
#    comment here quoted the retired, inverted convention; the figure itself was right.
png("tin-arbitrage-01.png", width = 1400, height = 560, res = 150, pointsize = 14)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 40), axes = FALSE, xlab = "", ylab = "")
rect(6, 14, 30, 30, col = land, border = base_blue, lwd = 2); text(18, 25, "ASSUR", font = 2, col = base_blue, cex = 0.95)
text(18, 20, "silver per 100 tin", cex = 0.72, col = grey); text(18, 16.5, "~6.7", font = 2, cex = 1.05, col = base_blue)
rect(70, 14, 94, 30, col = land, border = base_blue, lwd = 2); text(82, 25, "ANATOLIA", font = 2, col = base_blue, cex = 0.95)
text(82, 20, "silver per 100 tin", cex = 0.72, col = grey); text(82, 16.5, "~14.3", font = 2, cex = 1.05, col = base_blue)
arrows(31, 22, 69, 22, length = 0.14, lwd = 3, col = accent)
text(50, 26.5, "tin carried where it is dear", cex = 0.8, col = accent, font = 2)
text(50, 18, "~50-day caravan; ~200% gross mark-up on cloth", cex = 0.66, col = grey)
title(main = "Before coins: the price gap moved the metal (prices in silver)", cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 7. Uluburun cargo (dataset of one)
png("uluburun-cargo-01.png", width = 1000, height = 640, res = 150)
par(mar = c(4.2, 5.2, 3.2, 1), cex.axis = 1.1)
b <- barplot(c(10, 1), names.arg = c("copper", "tin"), col = c("#b87333", silver),
             border = NA, ylim = c(0, 12.5), ylab = "tonnes (estimated)", cex.names = 1.35, cex.lab = 1.2)
text(b, c(10, 1) + 0.65, c("~10 t", "~1 t"), font = 2, col = base_blue, cex = 1.25)
text(mean(b), 11.8, "~10:1 copper:tin; products of >=9-10 cultures", cex = 1.0, col = accent, font = 2)
title(main = "The Uluburun wreck (c.1300 BCE): one hull, many economies", cex.main = 1.05, col.main = base_blue)
dev.off()

cat("ch01 figures written\n")
