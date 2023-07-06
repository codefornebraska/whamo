#! env perl
use 5.38.0;

# Read from extract.txt, figure out what order TIFF files should be in, which
# should be merged with which for complete issues in a single PDF.

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

