weasyprint output/index.html output/paper.pdf
cp -r output/* docs/.
git commit -m "." docs/* output/*
git push
