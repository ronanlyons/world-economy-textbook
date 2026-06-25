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
text(50, 90, "North — Mauryan & Kushan reach", cex = 0.72, col = "#555555", font = 3)
text(50, 60, "Deccan — Satavahanas",            cex = 0.72, col = "#555555", font = 3)
text(50, 33, "Tamil south — Chera · Chola · Pandya", cex = 0.70, col = "#555555", font = 3)

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

title(main = "India in the first world system (1st–2nd c. CE)",
      cex.main = 1.0, col.main = base_blue)
dev.off()
cat("actor-india-t2.png written\n")
