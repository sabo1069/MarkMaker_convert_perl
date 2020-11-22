#!/usr/bin/perl

use strict;
use warnings;
my $file = $ARGV[0];
my $out_file_name="_primer3_recipe.txt";
open OUTPUT_mma, ">mma$out_file_name\n" or die "cannnot open output";
open OUTPUT_mmc, ">mmc$out_file_name\n" or die "cannnot open output";

open (FILE1, $file) or die "cannot open file1";

###########################################################
my $split_on=0;
while (<FILE1>){
    chomp;

    if($split_on==1){
        my @option_value = split (/,/, $_);
        print OUTPUT_mmc "PRIMER_MIN_SIZE=$option_value[0]\n";
        print OUTPUT_mmc "PRIMER_OPT_SIZE=$option_value[1]\n";
        print OUTPUT_mmc "PRIMER_MAX_SIZE=$option_value[2]\n";

        print OUTPUT_mma "PRIMER_MIN_SIZE=$option_value[0]\n";
        print OUTPUT_mma "PRIMER_OPT_SIZE=$option_value[1]\n";
        print OUTPUT_mma "PRIMER_MAX_SIZE=$option_value[2]\n";

        $split_on=0;
    }

    if($_=~/set1/){
          print OUTPUT_mmc "SEQUENCE_ID=mmc_set1\n";
          print OUTPUT_mmc "SEQUENCE_TEMPLATE=mmc_set2\n";
          print OUTPUT_mmc "SEQUENCE_TARGET=mmc_set3\n";
          print OUTPUT_mmc "PRIMER_TASK=generic\n";
          print OUTPUT_mmc "PRIMER_PICK_LEFT_PRIMER=1\n";
          print OUTPUT_mmc "PRIMER_PICK_RIGHT_PRIMER=1\n";


          print OUTPUT_mma "SEQUENCE_ID=snp_set1\n";
          print OUTPUT_mma "SEQUENCE_TEMPLATE=snp_set2\n";
          print OUTPUT_mma "PRIMER_TASK=generic\n";
          print OUTPUT_mma "PRIMER_PICK_LEFT_PRIMER=1\n";
          print OUTPUT_mma "PRIMER_PICK_RIGHT_PRIMER=1\n";

          $split_on=1;
    }

    if($split_on==2){
        my @option_value = split (/,/, $_);
        print OUTPUT_mmc "PRIMER_MIN_TM=$option_value[0]\n";
        print OUTPUT_mmc "PRIMER_OPT_TM=$option_value[1]\n";
        print OUTPUT_mmc "PRIMER_MAX_TM=$option_value[2]\n";

        print OUTPUT_mma "PRIMER_MIN_TM=$option_value[0]\n";
        print OUTPUT_mma "PRIMER_OPT_TM=$option_value[1]\n";
        print OUTPUT_mma "PRIMER_MAX_TM=$option_value[2]\n";
        $split_on=0;
    }

    if($_=~/set2/){
          $split_on=2;
    }


    if($split_on==3){
        my @option_value = split (/,/, $_);
        print OUTPUT_mmc "PRIMER_MIN_GC=$option_value[0]\n";
        print OUTPUT_mmc "PRIMER_OPT_GC_PERCENT=$option_value[1]\n";
        print OUTPUT_mmc "PRIMER_MAX_GC=$option_value[2]\n";
        print OUTPUT_mmc "PRIMER_MAX_NS_ACCEPTED=1\n";
        print OUTPUT_mmc "PRIMER_PRODUCT_SIZE_RANGE=700-1200\n";
        print OUTPUT_mmc "P3_FILE_FLAG=1\n";
        print OUTPUT_mmc "SEQUENCE_INTERNAL_EXCLUDED_REGION=mmc_set3\n";
        print OUTPUT_mmc "PRIMER_EXPLAIN_FLAG=1\n";
        print OUTPUT_mmc "=\n";



        print OUTPUT_mma "PRIMER_MIN_GC=$option_value[0]\n";
        print OUTPUT_mma "PRIMER_OPT_GC_PERCENT=$option_value[1]\n";
        print OUTPUT_mma "PRIMER_MAX_GC=$option_value[2]\n";
        print OUTPUT_mma "PRIMER_MAX_NS_ACCEPTED=1\n";
        print OUTPUT_mma "P3_FILE_FLAG=1\n";
        print OUTPUT_mma "PRIMER_EXPLAIN_FLAG=1\n";
        print OUTPUT_mma "=\n";
        $split_on=0;
    }

    if($_=~/set3/){
          $split_on=3;
    }


}
close (FILE1);
