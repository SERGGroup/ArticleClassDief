# Elsevier journal style
@input_directories = ('./0 - resources', './0 - resources/0 - classes', './0 - resources/0 - classes/elsarticle');

foreach my $dir (@input_directories) {
    $ENV{'TEXINPUTS'} .= ":$dir";
    $ENV{'BIBINPUTS'} .= ":$dir";
    $ENV{'BSTINPUTS'} .= ":$dir";
    $ENV{'FIGINPUTS'} .= ":$dir";
}