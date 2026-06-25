# Placeholder "centre-of-gravity locator" figures (house style: R base graphics, ECU blue).
# A spectrum from Asia (left) to North Atlantic (right) with a marker for the period.
# Replace with the real per-chapter locator maps in the figure programme.

base_blue <- "#1f4e79"
accent    <- "#c00000"

make_locator <- function(file, pos, caption) {
  png(file, width = 1400, height = 460, res = 150)
  par(mar = c(2.5, 1, 2.5, 1))
  plot(NA, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
  # spectrum bar
  rect(0.05, 0.40, 0.95, 0.60, col = "#e9eef4", border = base_blue, lwd = 2)
  # pole labels
  text(0.05, 0.75, "ASIA",            col = base_blue, font = 2, cex = 1.3, adj = 0)
  text(0.95, 0.75, "NORTH ATLANTIC",  col = base_blue, font = 2, cex = 1.3, adj = 1)
  # ticks
  segments(seq(0.05, 0.95, length.out = 5), 0.38,
           seq(0.05, 0.95, length.out = 5), 0.62, col = base_blue, lwd = 1)
  # marker
  x <- 0.05 + pos * 0.90
  points(x, 0.50, pch = 19, cex = 3.2, col = accent)
  points(x, 0.50, pch = 21, cex = 3.2, col = base_blue, lwd = 2)
  text(x, 0.27, caption, col = "#333333", font = 3, cex = 1.0)
  title(main = "Centre-of-gravity locator", col.main = base_blue, cex.main = 1.3)
  dev.off()
}

make_locator("cog-locator-02.png", 0.22, "c.150 CE — Asia the productive core of a multipolar relay")
make_locator("cog-locator-07.png", 0.70, "c.1850 — the hinge: the weight crosses west")
cat("locator figures written\n")
