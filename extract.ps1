# Use Windows PowerShell to extract meta-information about each TIFF file 
# (scans of original pages) that Jack Dunn manually entered into each Windows file Properties
$dirname = "D:\Dropbox\1989-1991-WHAMO"
$dir = $shell.NameSpace($dirname)
Get-ChildItem $dirname -Filter *.tiff | 
Foreach-Object {
  $file = $dir.ParseName($_.Name)
  $_.Name
  $dir.GetDetailsOf($file, 21) # Title
  $dir.GetDetailsOf($file, 22) # Subject
  $dir.GetDetailsOf($file, 24) # Comments
  $dir.GetDetailsOf($file, 20) # Authors
  "---"
}
