#!/usr/bin/env perl
use warnings;
open($templateFile, '<:encoding(UTF-8)', 'template.html')
	or die 'Couldn\'t open template.html!';
$template .= $_ while (<$templateFile>);
close $templateFile;
foreach $pageFileName (<*.page>) {
	print 'Processing ' . $pageFileName . '...' . "\n";
	open($pageFile, '<:encoding(UTF-8)', $pageFileName);
	$pageTitle = <$pageFile>;
	chomp $pageTitle;
	$page = '';
	$page .= $_ while (<$pageFile>);
	chomp $page;
	close $pageFile;
	$ready = $template;
	$ready =~ s/~~~/$pageTitle/g;
	$ready =~ s/===/$page/g;
	$dirName = $pageFileName;
	$dirName =~ s/\.page$//;
	$dirName = '.' if ($dirName eq 'main');
	die 'Page dir doesn\'t exists' unless (-d $dirName);
	open($readyFile, '>:encoding(UTF-8)', "$dirName/index.html");
	print $readyFile $ready;
	close $readyFile;
}
