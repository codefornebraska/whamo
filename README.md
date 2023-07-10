# WHAMO

Digitizing an independent newspaper 1989-1991.

WHAMO: World Herald Attitude Monitoring Operation (the period when the Franklin Credit Union Scandal erupted)

In 1989 the newpaper rebranded to "Nebraska Observer."

## Collating TIFs and OCRing them

1. Used `extract.ps1` (Windows PowerShell) to extract Windows file metadata out of the original TIF files.

2. Used `sort.pl` to rough out a list of which TIFs should be which PDFs.

3. Tons of manual fixing of errors in `sorted.txt`.

4. `pdf_and_ocr.pl` merges multiple TIFs into a single TIF, converts that TIF to PDF, and then OCRs that PDF.

## Uploading to archive.org

[Browse](https://archive.org/search?query=creator%3A%22Frances+Mendenhall%22) the archive.
Upload [documentation](https://archive.org/developers/internetarchive/cli.html#upload).

```
export DATE=1989-02-01; ./ia upload NebraskaObserver-$DATE NebraskaObserver-$DATE.pdf \
  --metadata="date:$DATE" \
  --metadata="title:Nebraska Observer $DATE" \
  --metadata="creator:Frances Mendenhall" \
  --metadata="description:Nebraska Observer. A citizen's organization providing an alternative voice." \
  --metadata="subject:newspaper; Omaha; Nebraska; Nebraska Observer" \
  --metadata="language:English" \
  --metadata="mediatype:texts"

export DATE=1987-09-01; ./ia upload WHAMO-$DATE WHAMO-$DATE.pdf \
  --metadata="date:$DATE" \
  --metadata="title:WHAMO $DATE" \
  --metadata="creator:Frances Mendenhall" \
  --metadata="description:WHAMO. A citizen's organization providing an alternative voice." \
  --metadata="subject:newspaper; Omaha; Nebraska; WHAMO" \
  --metadata="language:English" \
  --metadata="mediatype:texts"
```

