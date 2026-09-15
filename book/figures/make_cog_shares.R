# The module's master chart: Asia's share of world population against Asia's share of
# world income, 4000 BCE to 2050. House style: R base graphics, ECU palette, 6-digit hex.
#
# Data built by _prep/build_cog_shares.py; see data/working/SOURCES.md for what each
# segment rests on. Asia here is East Asia plus South and South East Asia (Maddison's
# regions), which excludes the Middle East and Central Asia.

base_blue <- "#1f4e79"; accent <- "#c00000"; land <- "#e9eef4"; grey <- "#555555"
gold <- "#b8860b"; green <- "#3c7d5a"; pale_red <- "#f0d8d8"; pale_blue <- "#dce6f1"

d <- read.csv("../data/working/cog_asia_shares.csv", stringsAsFactors = FALSE)
d$pop <- 100 * as.numeric(d$asia_pop_share)
d$gdp <- 100 * as.numeric(d$asia_gdp_share)
d$gdpw <- 100 * as.numeric(d$asia_wa_gdp_share)   # Asia including West Asia

pop <- d[!is.na(d$pop), c("year", "pop", "pop_kind")]
gdp <- d[!is.na(d$gdp), c("year", "gdp", "gdp_kind")]
# The pre-1000 CE income rows stay in the CSV but are never plotted: they rest on holding
# China's earliest estimate (980 CE, a Song peak) flat backwards, which would show Asia's
# income share above its population share for a millennium on no evidence at all.
gdp <- gdp[gdp$gdp_kind != "assumption", ]

# 2050 GDP is a published range, not a point (see SOURCES.md)
proj50 <- c(45, 50)

# --------------------------------------------------------------------------------
# Two panels on one shared vertical scale. The left covers 5,500 years, the right 550,
# so the change of scale is stated on the figure rather than smuggled into the spacing.
png("cog-asia-shares.png", width = 2000, height = 1000, res = 150)
par(oma = c(2.6, 0, 3.0, 0))
layout(matrix(c(1, 2), nrow = 1), widths = c(0.85, 1.45))
YL <- c(0, 72)

panel <- function(xlim, ticks, title_txt, show_axis) {
  par(mar = c(4.2, if (show_axis) 4.4 else 1.6, 3.4, 1.2))
  plot(NA, xlim = xlim, ylim = YL, axes = FALSE, xlab = "", ylab = "")
  # the gap between the two lines is the thing the chart is about, so it is filled
  ov <- merge(pop, gdp, by = "year")
  ov <- ov[order(ov$year) & ov$year >= xlim[1] & ov$year <= xlim[2], ]
  if (nrow(ov) > 1) {
    polygon(c(ov$year, rev(ov$year)), c(ov$pop, rev(ov$gdp)),
            col = ifelse(mean(ov$gdp) < mean(ov$pop), pale_red, pale_blue), border = NA)
  }
  abline(h = seq(0, 70, 10), col = "#e6e6e6")
  segments(ticks, 0, ticks, -1.6, col = grey, xpd = NA)
  lab <- ifelse(ticks < 0, paste0(abs(ticks), " BCE"), ifelse(ticks == 0, "1 CE", ticks))
  text(ticks, -4.6, lab, cex = 0.72, col = grey, xpd = NA)
  if (show_axis) {
    axis(2, at = seq(0, 70, 10), labels = paste0(seq(0, 70, 10), "%"),
         las = 1, col = grey, col.axis = grey, cex.axis = 0.8)
    mtext("share of the world total", side = 2, line = 3.1, col = base_blue, cex = 0.82)
  }
  segments(xlim[1], 0, xlim[2], 0, col = grey)
  title(main = title_txt, col.main = base_blue, cex.main = 1.0, line = 1.2)
}

# ---- left panel: 4000 BCE to 1500 CE
panel(c(-4000, 1500), c(seq(-4000, 1000, by = 1000), 1500),
      "4000 BCE to 1500 CE: two lines, hard to tell apart", TRUE)
p1 <- pop[pop$year >= -4000 & pop$year <= 1500, ]
g1 <- gdp[gdp$year >= -4000 & gdp$year <= 1500, ]
lines(p1$year, p1$pop, col = base_blue, lwd = 2.6)
lines(g1$year, g1$gdp, col = accent, lwd = 2.6)
text(-3850, 47, "population", col = base_blue, font = 2, cex = 0.82, adj = 0)
text(980, 68, "income", col = accent, font = 2, cex = 0.82, adj = 0)
text(-3900, 15, paste("The income line starts at 1000 CE, which is where",
                      "\nChina's earliest estimate begins. Anything earlier",
                      "\nwould be that same figure held flat backwards,",
                      "\nso it is left in the data file and off the chart."),
     col = grey, font = 3, cex = 0.62, adj = 0)

# ---- right panel: 1500 to 2050
panel(c(1500, 2062), seq(1500, 2050, by = 50),
      "1500 to 2050: the gap opens, then closes", FALSE)
p2 <- pop[pop$year >= 1500, ]; g2 <- gdp[gdp$year >= 1500, ]
p2h <- p2[p2$pop_kind != "projection", ]; p2p <- p2[p2$year >= 2020 & p2$year <= 2050, ]
lines(p2h$year, p2h$pop, col = base_blue, lwd = 2.6)
lines(p2p$year, p2p$pop, col = base_blue, lwd = 2.2, lty = 3)
g2h <- g2[g2$gdp_kind != "projection", ]; g2p <- g2[g2$year >= 2022 & g2$year <= 2050, ]
lines(g2h$year, g2h$gdp, col = accent, lwd = 2.6)
lines(g2p$year, g2p$gdp, col = accent, lwd = 2.2, lty = 3)
# 2050: a published range, drawn as a bar rather than a point
segments(2050, proj50[1], 2050, proj50[2], col = accent, lwd = 5, lend = 1)
segments(g2p$year[nrow(g2p)], g2p$gdp[nrow(g2p)], 2050, mean(proj50), col = accent, lwd = 2, lty = 3)
text(2054, mean(proj50), "45\u201350%\nprojected", col = accent, cex = 0.6, font = 3, adj = 0, xpd = NA)
text(2050, 55.5, "2050", cex = 0.66, col = grey)

# Asia including West Asia, thin, so the reader can see how much the definition is doing:
# on that measure Asia passes half of world output in about 2020.
gw <- d[!is.na(d$gdpw) & d$year >= 1500, ]
lines(gw$year, gw$gdpw, col = accent, lwd = 1.1, lty = 5)
text(2044, 58.5, "incl. West Asia", col = accent, cex = 0.62, font = 3, adj = 1)
segments(2028, 57.2, 2022, 51.5, col = accent, lwd = 0.8)

# every marker year is a year both series actually have; 1913 was not one, which is why the
# divergence arrow used to be drawn there against nothing
marks <- data.frame(y = c(1820, 1900, 1950, 1980),
                    t = c("1820", "1900", "1950", "1980"))
for (i in seq_len(nrow(marks))) {
  segments(marks$y[i], 0, marks$y[i], 70, col = "#c9c9c9", lty = 2)
  text(marks$y[i], 71, marks$t[i], cex = 0.66, col = grey)
}
text(1560, 62, "population", col = base_blue, font = 2, cex = 0.82, adj = 0)
text(1560, 50, "income", col = accent, font = 2, cex = 0.82, adj = 0)
# 1913 is not a year in either series -- the benchmarks are 1900 and 1920 -- so the old arrow
# there spanned nothing in particular. Anchor it instead on 1950, which is where the gap is
# actually widest, and take both ends from the data rather than from the eye.
gy <- 1950
gp <- pop$pop[pop$year == gy]; gg <- gdp$gdp[gdp$year == gy]
arrows(gy, gg + 1.2, gy, gp - 1.2, code = 3, length = 0.05, col = accent, lwd = 1.5)
# the label goes in the empty band below the income line, not across the recovery
text(1852, 12, sprintf("in 1950 the gap is %.0f points:\nthis is the great divergence", gp - gg),
     col = accent, font = 3, cex = 0.73, adj = 0)
text(2016, 5.5, "the return is an income story,\nnot a numbers story",
     col = green, font = 3, cex = 0.7)

mtext("Asia's share of world population and of world income, 4000 BCE to 2050",
      side = 3, outer = TRUE, line = 0.9, col = base_blue, font = 2, cex = 1.05)
mtext(paste("Asia here is East Asia plus South and South East Asia. The thin line adds West Asia;",
            "Central Asia cannot be added, for want of any income estimate before 1973"),
      side = 3, outer = TRUE, line = -0.3, col = grey, font = 3, cex = 0.7)
mtext(paste("Note the change of time scale between the panels: the left covers 5,500 years, the right 550.",
            "Dotted = assumption or projection.",
            "Sources: HYDE/Gapminder/UN WPP 2024 (population); Maddison Project 2023 (income);",
            "IMF WEO to 2030; PwC and Goldman Sachs for 2050."),
      side = 1, outer = TRUE, line = 0.9, col = grey, cex = 0.62)
dev.off()

# --------------------------------------------------------------------------------
# The same thing as one line: income share minus population share. This is the figure
# chapter 7 wants, because the divergence is drawn rather than asserted.
png("cog-asia-gap.png", width = 1700, height = 720, res = 150)
par(mar = c(4.2, 4.6, 3.4, 1.6))
ov <- merge(pop, gdp, by = "year"); ov <- ov[order(ov$year), ]
ov$gap <- ov$gdp - ov$pop
plot(NA, xlim = c(985, 2062), ylim = c(-40, 12), axes = FALSE, xlab = "", ylab = "")
abline(h = seq(-40, 10, 10), col = "#e6e6e6")
polygon(c(ov$year, rev(ov$year)), c(pmin(ov$gap, 0), rep(0, nrow(ov))), col = pale_red, border = NA)
polygon(c(ov$year, rev(ov$year)), c(pmax(ov$gap, 0), rep(0, nrow(ov))), col = "#d7e8dd", border = NA)
lines(ov$year, ov$gap, col = accent, lwd = 2.8)
abline(h = 0, col = base_blue, lwd = 1.6)
axis(2, at = seq(-40, 10, 10), labels = paste0(seq(-40, 10, 10), "pp"), las = 1,
     col = grey, col.axis = grey, cex.axis = 0.8)
tk <- seq(1000, 2050, by = 150)
segments(tk, -40, tk, -41.2, col = grey, xpd = NA)
text(tk, -43.4, tk, cex = 0.72, col = grey, xpd = NA)
mtext("income share minus population share", side = 2, line = 3.2, col = base_blue, cex = 0.85)
title(main = "The great divergence, drawn: Asia's income share minus its population share",
      col.main = base_blue, cex.main = 1.05)
lo <- ov[which.min(ov$gap), ]
points(lo$year, lo$gap, pch = 19, col = accent, cex = 1.1)
text(lo$year - 30, lo$gap - 3.4, sprintf("%d: %.0f points below", lo$year, abs(lo$gap)),
     col = accent, cex = 0.7, font = 2)
text(1230, 7, "income share within a couple of points of population share:\na Malthusian world, where output follows people",
     col = green, cex = 0.68, font = 3)
at <- function(y) ov$gap[which.min(abs(ov$year - y))]
text(1690, -26, "the gap opens", col = accent, cex = 0.74, font = 3, adj = 1)
arrows(1700, -25, 1818, at(1820) - 1.4, length = 0.06, col = accent, lwd = 1.3)
text(2056, -22, "and closes", col = green, cex = 0.74, font = 3, adj = 1)
arrows(2040, -21, 2022, at(2022) - 1.6, length = 0.06, col = green, lwd = 1.3)
mtext(paste("A caution: before 1800 the income estimates are built partly from population,",
            "so the two series are not fully independent there. The break after 1800 is the point."),
      side = 1, line = 2.6, col = grey, cex = 0.62)
dev.off()

cat("wrote cog-asia-shares.png and cog-asia-gap.png\n")

# --------------------------------------------------------------------------------
# Afro-Eurasia as the denominator, 4000 BCE to 1500 CE. Until the Atlantic crossings the
# Americas and Oceania are not part of the same economy, so counting them in the denominator
# measures a world the period's actors were not in. On the right unit, Asia's weight is not
# a rising trend at all -- it is close to flat, and most of the apparent rise on the world
# denominator is the Americas being counted.
mid_blue <- "#4a7fb5"

png("cog-asia-afroeurasia.png", width = 1800, height = 900, res = 150)
par(mar = c(4.4, 5.0, 7.4, 9.6))
plot(NA, xlim = c(-4000, 1500), ylim = c(35, 85), axes = FALSE, xlab = "", ylab = "")
abline(h = seq(40, 80, 10), col = "#e6e6e6")
tk <- c(seq(-4000, 1000, by = 1000), 1500)
segments(tk, 35, tk, 34.0, col = grey, xpd = NA)
text(tk, 32.0, ifelse(tk < 0, paste0(abs(tk), " BCE"), ifelse(tk == 0, "1 CE", tk)),
     cex = 0.74, col = grey, xpd = NA)
axis(2, at = seq(40, 80, 10), labels = paste0(seq(40, 80, 10), "%"), las = 1,
     col = grey, col.axis = grey, cex.axis = 0.82)
mtext("share of the relevant total, population", side = 2, line = 3.4, col = base_blue, cex = 0.88)

w  <- d[!is.na(d$asia_pop_share) & d$year <= 1500, ]
aw <- w[!is.na(w$asia_wa_pop_share_ae), ]

lines(aw$year, 100 * aw$asia_wa_pop_share_ae, col = base_blue, lwd = 3.0)
lines(aw$year, 100 * aw$asia_pop_share_ae,    col = mid_blue,  lwd = 2.6)
lines(w$year,  100 * w$asia_pop_share,        col = grey,      lwd = 2.2, lty = 2)

lab <- function(y, txt, col, font = 2) text(1560, y, txt, col = col, cex = 0.7, adj = 0,
                                            font = font, xpd = NA)
lab(100 * aw$asia_wa_pop_share_ae[nrow(aw)], "Asia + West Asia,\nof Afro-Eurasia", base_blue)
lab(100 * aw$asia_pop_share_ae[nrow(aw)],    "Asia,\nof Afro-Eurasia", mid_blue)
lab(100 * w$asia_pop_share[nrow(w)] - 1.5,   "Asia,\nof the world", grey, 3)

# the distance between the grey line and the blue one is the Americas sitting in the denominator
# The x here must be a year the series actually has, or the arrow ends float off the lines:
# before 1 CE the grid is millennia, so -2500 does not exist and -3000 does.
gx <- -3000
w_at  <- 100 * w$asia_pop_share[w$year == gx]
ae_at <- 100 * aw$asia_pop_share_ae[aw$year == gx]
arrows(gx, w_at + 1.0, gx, ae_at - 1.0, code = 3, length = 0.05, col = "#8a8d91", lwd = 1.5)
# label below the lower end, where nothing else is drawn
text(gx, w_at - 5.0, "this gap is the Americas\nsitting in the denominator",
     col = "#8a8d91", cex = 0.7, font = 3)

title(main = "Asia's weight before 1500, measured against the world it was actually part of",
      col.main = base_blue, cex.main = 1.12, line = 5.4)
mtext(paste("On Afro-Eurasia -- the unit the module works in until the Atlantic crossings --",
            "Asia including West Asia holds about three quarters of the people",
            "\nthroughout, from 74% in 4000 BCE to 77% at 1 CE and 68% in 1500.",
            "The rise from 42% to 64% on the world denominator is largely a",
            "\nstatement about how many people HYDE places in the pre-Columbian Americas, which is the least certain number in the series."),
      side = 3, line = 1.4, col = grey, cex = 0.66, adj = 0)
mtext("Sources: HYDE 3.2 via Our World in Data. West Asia is Anatolia, the Levant, Mesopotamia, Iran and Arabia, split out of Maddison's Middle East and North Africa.",
      side = 1, line = 2.8, col = grey, cex = 0.62)
dev.off()
cat("wrote cog-asia-afroeurasia.png\n")

# --------------------------------------------------------------------------------
# Teaser for the module introduction: population only, one line, one reference line.
# The income series is deliberately withheld -- the point of the teaser is that the
# demographic fact is nearly constant, so that the question "then what changed?" is left
# open for the module to answer. The full two-series chart belongs at the end, not here.
png("cog-asia-teaser.png", width = 1800, height = 820, res = 150)
par(mar = c(4.6, 5.2, 5.6, 2.0))
plot(NA, xlim = c(-4000, 2060), ylim = c(0, 80), axes = FALSE, xlab = "", ylab = "")
abline(h = seq(10, 80, 10), col = "#eeeeee")
rect(-4000, 0, 2060, 50, col = "#f5f7fa", border = NA)
abline(h = seq(10, 40, 10), col = "#eeeeee")
segments(-4000, 50, 2060, 50, col = mid_blue, lwd = 1.4, lty = 2)
text(-3950, 52.2, "half the world's people", col = mid_blue, cex = 0.72, font = 3, adj = 0)

tp  <- d[!is.na(d$pop), c("year", "pop", "pop_kind")]
tph <- tp[tp$pop_kind != "projection", ]
tpp <- tp[tp$year >= 2020 & tp$year <= 2050, ]
lines(tph$year, tph$pop, col = base_blue, lwd = 3.2)
lines(tpp$year, tpp$pop, col = base_blue, lwd = 2.6, lty = 3)

tk <- c(seq(-4000, 1000, by = 1000), 2000)
segments(tk, 0, tk, -1.9, col = grey, xpd = NA)
text(tk, -5.4, ifelse(tk < 0, paste0(abs(tk), " BCE"), ifelse(tk == 0, "1 CE", tk)),
     cex = 0.76, col = grey, xpd = NA)
axis(2, at = seq(0, 80, 20), labels = paste0(seq(0, 80, 20), "%"), las = 1,
     col = grey, col.axis = grey, cex.axis = 0.84)
mtext("Asia's share of the world's people", side = 2, line = 3.4, col = base_blue, cex = 0.92)

pk <- tph[which.max(tph$pop), ]
points(pk$year, pk$pop, pch = 19, col = accent, cex = 1.1)
text(pk$year - 120, pk$pop + 5.5, sprintf("%d: %.0f%%", pk$year, pk$pop),
     col = accent, cex = 0.74, font = 2, adj = 1)
last <- tpp[nrow(tpp), ]
text(last$year + 20, last$pop - 5, sprintf("2050:\n%.0f%%", last$pop),
     col = base_blue, cex = 0.72, font = 2, adj = 1)

title(main = "For the whole of recorded history, most of the world's people have lived in Asia",
      col.main = base_blue, cex.main = 1.2, line = 3.6)
mtext(paste("Between half and two thirds, from the Bronze Age to today, and still about half in 2050.",
            "That much barely changes.",
            "\nSo the module is not about where the people are. It is about what their share of the world's",
            "INCOME did -- which is a very different line."),
      side = 3, line = 0.4, col = grey, cex = 0.72, adj = 0)
mtext("Asia = East, South and South East Asia. Sources: HYDE 3.2, Gapminder and UN World Population Prospects 2024, via Our World in Data. Dotted = projection.",
      side = 1, line = 3.0, col = grey, cex = 0.6)
dev.off()
cat("wrote cog-asia-teaser.png\n")
