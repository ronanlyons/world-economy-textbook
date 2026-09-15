# Downsize heavy JPEGs for the web (no ImageMagick available; use the jpeg package).
if (!requireNamespace("jpeg", quietly = TRUE)) { cat("jpeg package NOT available\n"); quit(status = 0) }
library(jpeg)
target_w <- 1400
files <- c("cave_monastery.jpg","roman_banquet.jpg","coin_wuzhu.jpg","tamil_brahmi.jpg")
for (f in files) {
  if (!file.exists(f)) next
  img <- readJPEG(f)
  w <- dim(img)[2]
  if (w <= target_w) { cat(f, "already small\n"); next }
  step <- ceiling(w / target_w)
  idx_c <- seq(1, dim(img)[2], by = step)
  idx_r <- seq(1, dim(img)[1], by = step)
  small <- if (length(dim(img)) == 3) img[idx_r, idx_c, , drop = FALSE] else img[idx_r, idx_c]
  writeJPEG(small, f, quality = 0.82)
  cat(f, "->", dim(small)[2], "px\n")
}
cat("done\n")
