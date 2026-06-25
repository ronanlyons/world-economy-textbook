# Chapter 2 visual programme (house style: R base graphics, ECU palette).
base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"; gold <- "#b8860b"

# ---------------------------------------------------------------------------
# 1. Orientation / bullion-drain strip: silver east, goods west
png("bullion-drain.png", width = 1500, height = 620, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 42), axes = FALSE, xlab = "", ylab = "")
nodes <- list(Rome = 8, "Parthia &\nKushan tolls" = 35, India = 63, China = 90)
ny <- 21
for (nm in names(nodes)) {
  x <- nodes[[nm]]
  rect(x - 7, ny - 4, x + 7, ny + 4, col = land, border = base_blue, lwd = 2)
  text(x, ny, nm, cex = 0.82, font = 2, col = base_blue)
}
# silver east (top)
arrows(15, 30, 56, 30, length = 0.12, lwd = 3, col = accent)
arrows(70, 30, 83, 30, length = 0.12, lwd = 3, col = accent)
text(50, 35, "silver & gold coin flow east", cex = 0.85, col = accent, font = 2)
# goods west (bottom)
arrows(83, 12, 70, 12, length = 0.12, lwd = 3, col = base_blue)
arrows(56, 12, 15, 12, length = 0.12, lwd = 3, col = base_blue)
text(50, 7, "silk, pepper, cotton, gems flow west", cex = 0.85, col = base_blue, font = 2)
title(main = "Following the metal: bullion flowed east, toward the workshop",
      cex.main = 1.05, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 2. Five-phase timeline
png("five-phases.png", width = 1600, height = 560, res = 150)
par(mar = c(3, 1, 3, 1))
plot(NA, xlim = c(-520, 320), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "")
ph <- list(
  c(-500, -30, "1 Opening",   "#dde6f0"),
  c(-30,  100, "2 Switch-on", "#cdddee"),
  c(100,  165, "3 Apogee",    "#bcd2e8"),
  c(165,  200, "4 The turn",  "#e8d4d4"),
  c(200,  300, "5 Collapse",  "#e0c4c4"))
for (p in ph) {
  x0 <- as.numeric(p[1]); x1 <- as.numeric(p[2])
  rect(x0, 3.5, x1, 6.5, col = p[4], border = base_blue)
  text((x0 + x1) / 2, 7.4, p[3], cex = 0.8, font = 2, col = base_blue, srt = 0)
}
# axis ticks
ax <- c(-500, -250, 0, 100, 200, 300)
lab <- c("500 BCE", "250 BCE", "1 CE", "100 CE", "200 CE", "300 CE")
segments(ax, 3.3, ax, 3.5, col = grey); text(ax, 2.7, lab, cex = 0.72, col = grey)
# landmark events
ev <- list(c(-30, "30 BCE: Rome takes Egypt"), c(166, "166 CE: 'Antun' embassy"),
           c(165, "165 CE: Antonine plague"), c(220, "220 CE: Han falls"))
for (e in ev) {
  x <- as.numeric(e[1]); points(x, 5, pch = 19, cex = 0.7, col = accent)
}
text(-30, 1.4, "30 BCE\nRome takes Egypt", cex = 0.62, col = accent)
text(166, 9.2, "166 CE\n'Antun' embassy", cex = 0.62, col = accent)
text(300, 1.4, "220 CE\nHan falls", cex = 0.62, col = accent)
title(main = "The first world system: one rise, one fall, in five phases",
      cex.main = 1.05, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 3. Silver:gold arbitrage
png("silver-arbitrage.png", width = 1400, height = 560, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 40), axes = FALSE, xlab = "", ylab = "")
rect(6, 14, 30, 30, col = land, border = base_blue, lwd = 2)
text(18, 25, "ROME", font = 2, col = base_blue, cex = 0.95)
text(18, 20, "gold : silver", cex = 0.78, col = grey); text(18, 16.5, "12 : 1", font = 2, cex = 1.1)
rect(70, 14, 94, 30, col = land, border = base_blue, lwd = 2)
text(82, 25, "INDIA / KUSHAN", font = 2, col = base_blue, cex = 0.9)
text(82, 20, "gold : silver", cex = 0.78, col = grey); text(82, 16.5, "10 : 1", font = 2, cex = 1.1)
arrows(31, 22, 69, 22, length = 0.14, lwd = 3, col = accent)
text(50, 26, "silver carried east", cex = 0.82, col = accent, font = 2)
text(50, 18, "buys ~20% more goods", cex = 0.82, col = accent)
title(main = "Why the metal moved east: the gold-to-silver arbitrage",
      cex.main = 1.05, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 4. Shipping increase
png("shipping-increase.png", width = 1200, height = 700, res = 150)
par(mar = c(4, 5, 3, 1))
b <- barplot(c(20, 120), names.arg = c("Ptolemaic era", "Roman imperial"),
             col = c("#cdddee", base_blue), border = NA, ylim = c(0, 140),
             ylab = "ships per year", cex.names = 0.9, cex.lab = 0.9)
text(b, c(20, 120) + 8, c("~20", "~120"), font = 2, col = base_blue)
text(mean(b), 135, "more than a sixfold rise", cex = 0.85, col = accent, font = 2)
title(main = "Ships per year, Myos Hormos to India (Strabo)",
      cex.main = 1.0, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 5. Pepper cargo value
png("pepper-cargo.png", width = 1300, height = 560, res = 150)
par(mar = c(2, 1, 3, 1))
plot(NA, xlim = c(0, 100), ylim = c(0, 30), axes = FALSE, xlab = "", ylab = "")
rect(8, 12, 92, 20, col = gold, border = NA)
text(50, 16, "one returning 200-ton pepper ship", font = 2, col = "white", cex = 0.95)
text(50, 25, "≈ 6 million sesterces", font = 2, col = base_blue, cex = 1.1)
text(50, 7, "≈ a year's pay for 6,000 legionaries", col = grey, cex = 0.9)
title(main = "The scale of a single cargo", cex.main = 1.05, col.main = base_blue)
dev.off()

# ---------------------------------------------------------------------------
# 6. Han China structure map (schematic)
png("actor-han-t2.png", width = 1300, height = 950, res = 150)
par(mar = c(1, 1, 3, 1))
plot(NA, xlim = c(0, 130), ylim = c(0, 95), axes = FALSE, xlab = "", ylab = "", asp = 1)
hx <- c(58,72,92,108,116, 112,100,86,74,66, 60,56,54,57,58)
hy <- c(78,84,83,80,72, 58,46,40,42,48, 56,64,70,75,78)
polygon(hx, hy, col = land, border = base_blue, lwd = 2)
text(86, 64, "HAN CHINA", font = 2, col = base_blue, cex = 0.95)
text(86, 57, "agrarian core +\nsalt & iron monopolies", cex = 0.66, col = grey, font = 3)
points(74, 66, pch = 19, col = accent, cex = 1.1); text(74, 66, "Chang'an", pos = 2, cex = 0.72, col = "#222222")
points(100, 50, pch = 19, col = accent, cex = 1.0); text(100, 50, "Guangzhou", pos = 4, cex = 0.7, col = "#222222")
# Hexi corridor / Tarim route west
arrows(60, 68, 20, 72, length = 0.10, lwd = 2, col = base_blue)
text(10, 78, "silk west\n(Tarim, Parthia,\nKushan tolls) to Rome", cex = 0.64, col = base_blue, pos = 4)
# south to India
arrows(70, 50, 50, 30, length = 0.10, lwd = 2, col = base_blue)
text(46, 26, "to India\n(Bay of Bengal)", cex = 0.66, col = base_blue, pos = 2)
# steppe north
text(86, 90, "Xiongnu (steppe) — silk paid as tribute", cex = 0.66, col = grey, font = 3)
title(main = "Han China in the first world system (1st–2nd c. CE)",
      cex.main = 1.0, col.main = base_blue)
dev.off()

cat("ch02 figures written\n")
