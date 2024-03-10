# author: Jordan Bourak & Tiffany Timbers
# date: 2021-11-22

all: docs/horse_pop_plot_largest_sd.png \
	docs/horse_pops_plot.png \
	docs/horses_spread.csv \
	docs/qmd_example.html \
	docs/qmd_example.pdf \
	docs/index.html



# generate figures and objects for report
docs/horse_pop_plot_largest_sd.png docs/horse_pops_plot.png docs/horses_spread.csv: source/generate_figures.py
	python source/generate_figures.py --input_dir="data/00030067-eng.csv" \
		--out_dir="docs"

# render quarto report in HTML and PDF
docs/qmd_example.html: docs docs/qmd_example.qmd
	quarto render docs/qmd_example.qmd --to html

docs/qmd_example.pdf: docs docs/qmd_example.qmd
	quarto render docs/qmd_example.qmd --to pdf

docs/index.html: docs docs/qmd_example.qmd
	quarto render docs/qmd_example.qmd --to html

# clean
clean:
	rm -rf docs
	rm -rf docs/qmd_example.html \
		docs/index.html \
		docs/qmd_example.pdf \
		docs/qmd_example_files 
