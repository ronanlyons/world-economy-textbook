# Schematic "actor structure" maps for chapter actor profiles (house style: R base graphics).
# Stylised, not cartographically exact: regions, emporia, and trade arms.

base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"

png("actor-india-t2.png", width = 1000, height = 1150, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(-2, 102), ylim = c(6, 112), axes = FALSE, xlab = "", ylab = "", asp = 1)

# stylised peninsula
px <- c(26,34,50,64,74, 71,66,59,53,50, 45,40,34,29,26)
py <- c(98,103,101,102,98, 84,64,44,26,14, 28,52,76,90,98)
polygon(px, py, col = land, border = base_blue, lwd = 2)

# region bands
text(50, 90, "North - Mauryan & Kushan reach", cex = 0.72, col = "#555555", font = 3)
text(51.4, 63, "Deccan - Satavahanas",            cex = 0.72, col = "#555555", font = 3)
text(50, 9.5, "Tamil south - Chera \u00b7 Chola \u00b7 Pandya", cex = 0.70, col = "#555555", font = 3)

# emporia / cities
pts <- list(
  Taxila        = c(27,104,3),
  Pataliputra   = c(60,96,4),
  Tamralipti    = c(72,88,4),
  Barygaza      = c(31,86,2),
  Muziris       = c(36,42,2),
  Coromandel    = c(62,42,4))
for (nm in names(pts)) {
  p <- pts[[nm]]
  points(p[1], p[2], pch = 19, col = accent, cex = 1.1)
  text(p[1], p[2], nm, pos = p[3], cex = 0.72, col = "#222222", offset = 0.4)
}

# trade arms
arrows(29, 66, 4, 72, length = 0.10, lwd = 2, col = base_blue)
text(2, 80, "to Rome\n(Red Sea, Egypt)", cex = 0.70, col = base_blue, pos = 4)
arrows(70, 54, 96, 60, length = 0.10, lwd = 2, col = base_blue)
text(98, 68, "to Han China\n& SE Asia", cex = 0.70, col = base_blue, pos = 2)

title(main = "India in the first world system (1st-2nd c. CE)",
      cex.main = 1.0, col.main = base_blue)
dev.off()
cat("actor-india-t2.png written\n")

# ---------------------------------------------------------------------------
# Sri Lanka (T2): the island pivot - Anuradhapura inland, Mantai the entrepot.
png("actor-srilanka-t2.png", width = 1000, height = 1050, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 108), axes = FALSE, xlab = "", ylab = "", asp = 1)

# stylised island (teardrop, north at top)
ix <- c(50,60,68,73,74,71,64,55,46,38,32,28,27,31,38,44,50)
iy <- c(96,94,88,78,66,54,40,30,26,29,38,50,62,74,86,93,96)
polygon(ix, iy, col = land, border = base_blue, lwd = 2)

# dry zone / wet zone hint
text(63, 84, "northern\ndry zone", cex = 0.66, col = "#555555", font = 3)
text(50, 45, "wet zone", cex = 0.66, col = "#555555", font = 3)

# sites: x, y, cex
pts <- list(
  Anuradhapura = c(49, 79, 4),
  Mantai       = c(33, 88, 3),
  Kantarodai   = c(45, 97, 2),
  Tissamaharama= c(58, 31, 2)
)
for (nm in names(pts)) {
  p <- pts[[nm]]
  points(p[1], p[2], pch = 21, bg = accent, col = "white", cex = p[3], lwd = 1.4)
}
text(49, 74.5, "Anuradhapura", cex = 0.72, col = base_blue, font = 2)
text(24, 88,   "Mantai",       cex = 0.70, col = base_blue, font = 2, adj = 1)
text(37, 99, "Kantarodai", cex = 0.62, col = "#555555", adj = 1)
text(66, 29,   "Tissamaharama",cex = 0.64, col = "#555555")

# capital-to-port link (the separation of government from trade)
segments(46, 80.5, 35.5, 87, col = base_blue, lwd = 1.6, lty = 3)
text(37, 84.5, "c.100 km", cex = 0.56, col = "#777777", font = 3)

# the two ocean arms meeting at Mantai
arrows(6, 92, 27, 89, col = accent, lwd = 2.2, length = 0.09)
text(6, 96, "Arabian Sea\nRed Sea, Roman Egypt", cex = 0.62, col = accent, adj = 0)
arrows(94, 70, 74, 78, col = accent, lwd = 2.2, length = 0.09)
text(94, 64, "Bay of Bengal\nSoutheast Asia", cex = 0.62, col = accent, adj = 1)
# India to the north
text(62, 104, "to SOUTH INDIA", cex = 0.64, col = "#555555", font = 2)
arrows(60, 102, 53, 97.5, col = "#999999", lwd = 1.4, length = 0.07)

title(main = "Sri Lanka: capital inland, entrepot on the coast", cex.main = 0.92,
      col.main = base_blue, font.main = 1)
dev.off()
