#! env perl
use 5.38.0;

# uhh... orginally this was going to sort and PDF and OCR, but I ended up with a big manual 
# sort phase to clean up a bunch of typos etc., so what's left in this sort phase is trivial:
#
# ./sort.pl | sort -t\| +1 +2 +3 > sorted.txt

open my $in, "<", "extract.txt";
while (<$in>) {
  my $tiff = $_;        chomp $tiff;
  my $name     = <$in>; chomp $name;
  my $subject  = <$in>; chomp $subject;
  my $comments = <$in>; chomp $comments;
  my $authors  = <$in>; chomp $authors;
  <$in>; # skip seperator
  say join "|", $tiff, $name, $subject, $comments, $authors;
}


__END__
Image_20221208_0007-001.tiff
World-Herald Attitude Monitoring Operation (WHAMO)
September, 1987
Vol II, No. 7, p. 8
Frances Mendenhall, Publisher
---

