use strict;
use warnings;
use Time::HiRes qw/time/;

MAIN: {
  my $size         = $ARGV[0];
  my $iterations   = $ARGV[1];
  my $program      = undef;
  my $results      = {};

  for (my $i = 2; ($program = $ARGV[$i]); $i += 1) {
    my $current_iterations = $iterations;
    $results->{$program} = $results->{$program} || [];
    while ($current_iterations--) {
      my $start = time();
      system('node', "$program.js", $size);
      push $results->{$program}, time() - $start;
    }
  }

  open(OUTPUT, '>' . (join '_', (keys $results)) . '-' . $size . '-' . time() . '.csv');
  my $key;
  foreach $key (keys $results) {
    print OUTPUT $key . ',';
    my $result;
    foreach $result (@{$results->{$key}}) {
      print OUTPUT $result . ',';
    }
    print OUTPUT "\n";
  }
}