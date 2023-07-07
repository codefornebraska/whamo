#! env perl
use 5.38.0;
use Data::Printer;
use FileHandle; 
STDOUT->autoflush(); # So Data::Printer output is inline with our other debugging
# ./pdf_and_ocr.pl 2>&1 | head -60

# Read from sorted.txt. For each issue:
# * squash clustered TIFFs together
# * convert that TIFF to PDF
# * OCR that PDF

open my $in, "<", "sorted.txt";
my %issues;
my $this_issue = [];
my ($tiff, $name, $subject, $comments, $authors);
while (<$in>) {
  chomp;
  # say;
  next if (/^#/); # Ignore comments
  unless (/\w/) {
    # We've hit a blank line, which means a split between issues
    if (@$this_issue) {
      my $date = convert_date($subject);
      my $out_filename;
      if ($name =~ /WHAMO/) {
        $out_filename = "WHAMO-$date";
      } elsif ($name =~ /Observer/) {
        $out_filename = "NebraskaObserver-$date";
      } else {
        $out_filename = "$name-$date";
      }
      # p $this_issue, as => "Issue complete! adding!";
      $issues{$out_filename} = $this_issue;
    }
    $this_issue = [];
    next;
  }
  ($tiff, $name, $subject, $comments, $authors) = split m/\|/;
  # say "  Adding $tiff to \$this_issue";
  push @$this_issue, $tiff;
  # say $tiff;
}

foreach my $i (keys %issues) {
  printf("%s: %s\n\n", $i, (join " + ", @{$issues{$i}}));
}

sub convert_date {
  my ($in) = @_;
  my $rval;
  if ($in =~ /^\w+ \d+,/) {
    # e.g. "February 1, 1989"
    my ($m, $d, $y) = split /\W+/, $subject;
    $rval = "$y-$m-$d";
  } else {
    # e.g. "March, 1988"
    my ($m, $y) = split /, /, $subject;
    $rval = "$y-$m";
  }
  say "Date is $rval";
  return $rval;
}

__END__
Image_20221212_0098-002.tiff|World-Herald Attitude Monitoring Operation (WHAMO)|February 28, 1990|Vol. VI, #3, p.1|Frances Mendenhall, Publisher
Image_20221212_0099-001.tiff|World-Herald Attitude Monitoring Operation (WHAMO)|February 28, 1990|Vol. VI, #3, p.2|Frances Mendenhall, Publisher
Image_20221212_0099-002.tiff|World-Herald Attitude Monitoring Operation (WHAMO)|February 28, 1990|Vol. VI, #3, p.3|Frances Mendenhall, Publisher
Image_20221212_0098-001.tiff|World-Herald Attitude Monitoring Operation (WHAMO)|February 28, 1990|Vol. VI, #3, p.4|Frances Mendenhall, Publisher

Image_20221212_0040-002.tiff|The Nebraska Observer|May 24, 1989|Vol. IV, #5, p.1|Frances Mendenhall, Publisher
Image_20221212_0041-001.tiff|The Nebraska Observer|May 24, 1989|Vol. IV, #5, p.2|Frances Mendenhall, Publisher
Image_20221212_0041-002.tiff|The Nebraska Observer|May 24, 1989|Vol. IV, #5, p.2|Frances Mendenhall, Publisher
Image_20221212_0042-002.tiff|The Nebraska Observer|May 24, 1989|Vol. IV, #5, p.3|Frances Mendenhall, Publisher
Image_20221212_0043-001.tiff|The Nebraska Observer|May 24, 1989|Vol. IV, #5, p.4|Frances Mendenhall, Publisher
Image_20221212_0043-002.tiff|The Nebraska Observer|May 24, 1989|Vol. IV, #5, p.5|Frances Mendenhall, Publisher
Image_20221212_0042-001.tiff|The Nebraska Observer|May 24, 1989|Vol. IV, #5, p.6|Frances Mendenhall, Publisher
