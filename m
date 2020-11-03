Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F124D2A4FCD
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:15:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 795293C6122
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:15:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B9FCD3C300B
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 08FB9601238
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D10F9AF26;
 Tue,  3 Nov 2020 19:13:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 20:13:27 +0100
Message-Id: <20201103191327.11081-12-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201103191327.11081-1-pvorel@suse.cz>
References: <20201103191327.11081-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 11/11] docparse: Generate html and pdf using
 asciidoc{, tor}
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Rewrite testinfo.pl to generate *.txt pages in asciidoc format which is
then regenerated to html (and pdf if enabled) using asciidoc,{tor}.

Replace getting Linux kernel git commit messages from local git
repository (needed after having all tests in single page, because API
has access limits; it's also better to generate everything once thus
don't depend on network connection).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/.gitignore  |   5 +
 docparse/Makefile    |  58 +++++++
 docparse/testinfo.pl | 406 +++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 458 insertions(+), 11 deletions(-)

diff --git a/docparse/.gitignore b/docparse/.gitignore
index f636ed847..7a87b4234 100644
--- a/docparse/.gitignore
+++ b/docparse/.gitignore
@@ -1,2 +1,7 @@
+/*.txt
+/docbook-xsl.css
 /docparse
 /metadata.json
+/metadata.html
+/metadata.pdf
+/metadata.chunked/
diff --git a/docparse/Makefile b/docparse/Makefile
index 94ba83ffe..e2defad38 100644
--- a/docparse/Makefile
+++ b/docparse/Makefile
@@ -1,19 +1,77 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
+# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
 
 top_srcdir		?= ..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 include $(top_srcdir)/include/mk/functions.mk
 
+ifeq ($(METADATA_GENERATOR),asciidoctor)
+METADATA_GENERATOR_CMD := asciidoctor
+METADATA_GENERATOR_PARAMS := -d book metadata.txt
+METADATA_GENERATOR_PARAMS_HTML := -b xhtml
+METADATA_GENERATOR_PARAMS_PDF := -b pdf -r asciidoctor-pdf
+else ifeq ($(METADATA_GENERATOR),asciidoc)
+METADATA_GENERATOR_CMD := a2x
+METADATA_GENERATOR_PARAMS := --xsltproc-opts "--stringparam toc.section.depth 1" -d book -L  --resource="$(PWD)" metadata.txt
+METADATA_GENERATOR_PARAMS_HTML := -f xhtml
+METADATA_GENERATOR_PARAMS_PDF := -f pdf
+METADATA_GENERATOR_PARAMS_HTML_CHUNKED := -f chunked
+else ifeq ($(METADATA_GENERATOR),)
+$(error 'METADATA_GENERATOR' not not configured, run ./configure in the root directory)
+else
+$(error '$(METADATA_GENERATOR)' not supported, only asciidoctor and asciidoc are supported)
+endif
+
+ifdef VERBOSE
+METADATA_GENERATOR_PARAMS += -v
+endif
+
+CLEAN_TARGETS		:= *.css *.js *.txt
 MAKE_TARGETS		:= metadata.json
+
+ifeq ($(WITH_METADATA_HTML),yes)
+MAKE_TARGETS		+= metadata.html
+ifneq ($(METADATA_GENERATOR_PARAMS_HTML_CHUNKED),)
+MAKE_TARGETS		+= metadata.chunked
+endif
+endif
+
+ifeq ($(WITH_METADATA_PDF),yes)
+MAKE_TARGETS		+= metadata.pdf
+endif
+
 HOST_MAKE_TARGETS	:= docparse
 
 INSTALL_DIR = metadata
+INSTALL_TARGETS = *.css *.js
+
+ifndef METADATA_GENERATOR
+METADATA_GENERATOR := asciidoctor
+endif
 
 .PHONY: metadata.json
 
 metadata.json: docparse
 	$(abs_srcdir)/parse.sh > metadata.json
 
+txt: metadata.json
+	$(abs_srcdir)/testinfo.pl metadata.json
+
+ifeq ($(WITH_METADATA_HTML),yes)
+metadata.html: txt
+	$(METADATA_GENERATOR_CMD) $(METADATA_GENERATOR_PARAMS) $(METADATA_GENERATOR_PARAMS_HTML)
+
+ifneq ($(METADATA_GENERATOR_PARAMS_HTML_CHUNKED),)
+metadata.chunked: txt
+	$(METADATA_GENERATOR_CMD) $(METADATA_GENERATOR_PARAMS) $(METADATA_GENERATOR_PARAMS_HTML_CHUNKED)
+endif
+endif
+
+ifeq ($(WITH_METADATA_PDF),yes)
+metadata.pdf: txt
+	$(METADATA_GENERATOR_CMD) $(METADATA_GENERATOR_PARAMS) $(METADATA_GENERATOR_PARAMS_PDF)
+endif
+
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index d93d7d701..d8d9ea663 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -1,16 +1,21 @@
 #!/usr/bin/perl
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
+# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
 
 use strict;
 use warnings;
 
 use JSON;
-use Data::Dumper;
+use LWP::Simple;
+use Cwd qw(abs_path);
+use File::Basename qw(dirname);
+
+use constant OUTDIR => dirname(abs_path($0));
 
 sub load_json
 {
-	my ($fname) = @_;
+	my ($fname, $mode) = @_;
 	local $/;
 
 	open(my $fh, '<', $fname) or die("Can't open $fname $!");
@@ -18,23 +23,402 @@ sub load_json
 	return <$fh>;
 }
 
-sub query_flag
+sub log_info
+{
+	my $msg = shift;
+	print STDERR "INFO: $msg\n";
+}
+
+sub log_warn
+{
+	my $msg = shift;
+	print STDERR "WARN: $msg\n";
+}
+
+sub print_asciidoc_page
+{
+	my ($fh, $json, $title, $content) = @_;
+
+	print $fh <<EOL;
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+$title
+
+$content
+EOL
+}
+
+sub tag_url {
+	my ($tag, $value, $scm_url_base) = @_;
+
+    if ($tag eq "CVE") {
+        return "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-" . $value;
+	}
+    if ($tag eq "linux-git") {
+        return "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=" . $value;
+	}
+    if ($tag eq "fname") {
+        return $scm_url_base . $value;
+	}
+}
+
+sub bold
+{
+	return "*$_[0]*";
+}
+
+sub code
+{
+	return "+$_[0]+";
+}
+
+sub hr
+{
+	return "\n\n'''\n\n";
+}
+
+sub html_a
+{
+	my ($url, $text) = @_;
+	return "$url\[$text\]";
+}
+
+sub h1
+{
+	return "== $_[0]\n";
+}
+
+sub h2
+{
+	return "=== $_[0]\n";
+}
+
+sub h3
+{
+	return "==== $_[0]\n";
+}
+
+sub label
+{
+	return "[[$_[0]]]\n";
+}
+
+sub paragraph
+{
+	return "$_[0]\n\n";
+}
+
+sub reference
+{
+	return "xref:$_[0]\[$_[0]\]" . (defined($_[1]) ? $_[1] : "") . "\n";
+}
+
+sub table
+{
+	return "|===\n";
+}
+
+sub print_defined
+{
+	my ($key, $val, $val2) = @_;
+
+	if (defined($val)) {
+		return paragraph(bold($key) . ": " . $val . (defined($val2) ? " $val2" : ""));
+	}
+}
+
+sub content_about
+{
+	my $json = shift;
+	my $content;
+
+	$content .= print_defined("URL", $json->{'url'});
+	$content .= print_defined("Version", $json->{'version'});
+	$content .= print_defined("Default timeout", $json->{'timeout'}, "seconds");
+
+	return $content;
+}
+
+sub uniq {
+	my %seen;
+	grep !$seen{$_}++, @_;
+}
+
+sub get_test_names
+{
+	my @names = @{$_[0]};
+	my ($letter, $prev_letter);
+	my $content;
+
+	for my $name (sort @names) {
+		$letter = substr($name, 0, 1);
+		if (defined($prev_letter) && $letter ne $prev_letter) {
+			$content .= "\n";
+		}
+
+		$content .= reference($name, " ");
+		$prev_letter = $letter;
+	}
+	$content .= "\n";
+
+	return $content;
+}
+
+sub get_test_letters
+{
+	my @names = @{$_[0]};
+	my $letter;
+	my $prev_letter = "";
+	my $content;
+
+	for (@names) {
+		$_ = substr($_, 0, 1);
+	}
+	@names = uniq(@names);
+
+	for my $letter (@names) {
+		$content .= reference($letter);
+	}
+	$content .= "\n";
+
+	return $content;
+}
+
+sub tag2title
 {
-	my ($json, $flag) = @_;
+	my $tag = shift;
+	return code(".$tag");
+}
+
+sub get_filters
+{
+	my $json = shift;
+	my %data;
+	while (my ($k, $v) = each %{$json->{'tests'}}) {
+		for my $j (keys %{$v}) {
+
+			next if ($j eq 'fname' || $j eq 'doc');
+
+			$data{$j} = () unless (defined($data{$j}));
+			push @{$data{$j}}, $k;
+		}
+	}
+	return \%data;
+}
+
+# TODO: Handle better .tags (and anything else which contains array)
+# e.g. for .tags there could be separate list for CVE and linux-git
+# (now it's together in single list).
+sub content_filters
+{
+	my $json = shift;
+	my $data = get_filters($json);
+	my %h = %$data;
+	my $content;
+
+	for my $k (sort keys %$data) {
+		my $tag = tag2title($k);
+		my ($letter, $prev_letter);
+		$content .= h2($tag);
+		$content .= paragraph("Tests containing $tag flag.");
+		$content .= get_test_names(\@{$h{$k}});
+	}
+
+	return $content;
+}
+
+sub detect_git
+{
+	unless (defined $ENV{'LINUX_GIT'} && $ENV{'LINUX_GIT'}) {
+		log_warn("kernel git repository not defined. Define it in \$LINUX_GIT");
+		return 0;
+	}
+
+	unless (-d $ENV{'LINUX_GIT'}) {
+		log_warn("\$LINUX_GIT does not exit ('$ENV{'LINUX_GIT'}')");
+		return 0;
+	}
+
+	my $ret = 0;
+	if (system("which git >/dev/null")) {
+		log_warn("git not in \$PATH ('$ENV{'PATH'}')");
+		return 0;
+	}
+
+	chdir($ENV{'LINUX_GIT'});
+	if (!system("git log -1 > /dev/null")) {
+		log_info("using '$ENV{'LINUX_GIT'}' as kernel git repository");
+		$ret = 1;
+	} else {
+		log_warn("git failed, git not installed or \$LINUX_GIT is not a git repository? ('$ENV{'LINUX_GIT'}')");
+	}
+	chdir(OUTDIR);
+
+	return $ret;
+}
+
+sub content_all_tests
+{
+	my $json = shift;
+	my @names = sort keys %{$json->{'tests'}};
+	my $letters = paragraph(get_test_letters(\@names));
+	my $has_kernel_git = detect_git();
+	my $tmp = undef;
+	my $printed = "";
+	my $content;
+
+	unless ($has_kernel_git) {
+		log_info("Parsing git messages from linux git repository skipped due previous error");
+	}
+
+	$content .= paragraph("Total $#names tests.");
+	$content .= $letters;
+	$content .= get_test_names(\@names);
+
+	for my $name (@names) {
+		my $letter = substr($name, 0, 1);
 
-	my $tests = $json->{'tests'};
+		if ($printed ne $letter) {
+			$content .= label($letter);
+			$content .= h2($letter);
+			$printed = $letter;
+		}
+
+		$content .= hr() if (defined($tmp));
+		$content .= label($name);
+		$content .= h3($name);
+		$content .= $letters;
+
+		if (defined($json->{'scm_url_base'}) &&
+			defined($json->{'tests'}{$name}{fname})) {
+			$content .= paragraph(html_a(tag_url("fname", $json->{'tests'}{$name}{fname},
+					$json->{'scm_url_base'}), "source"));
+		}
+
+		if (defined $json->{'tests'}{$name}{doc}) {
+			for my $doc (@{$json->{'tests'}{$name}{doc}}) {
 
-	foreach my $key (sort(keys %$tests)) {
-		if ($tests->{$key}->{$flag}) {
-			if ($tests->{$key}->{$flag} eq "1") {
-				print("$key\n");
+				# fix formatting for asciidoc [DOCUMENTATION] => *DOCUMENTATION*
+				if ($doc =~ s/^\[(.*)\]$/$1/) {
+					$doc = paragraph(bold($doc));
+				}
+
+				$content .= "$doc\n";
+			}
+			$content .= "\n";
+		}
+
+		if ($json->{'tests'}{$name}{timeout}) {
+			if ($json->{'tests'}{$name}{timeout} eq -1) {
+				$content .= paragraph("Test timeout is disabled");
 			} else {
-				print("$key:\n" . Dumper($tests->{$key}->{$flag}) . "\n");
+				$content .= paragraph("Test timeout is $json->{'tests'}{$name}{timeout} seconds");
 			}
+		} else {
+			$content .= paragraph("Test timeout defaults to $json->{'timeout'} seconds");
 		}
+
+		my $tmp2 = undef;
+		for my $k (sort keys %{$json->{'tests'}{$name}}) {
+			my $v = $json->{'tests'}{$name}{$k};
+			next if ($k eq "tags" || $k eq "fname" || $k eq "doc");
+			if (!defined($tmp2)) {
+				$content .= table . "|Key|Value\n\n"
+			}
+
+			$content .= "|" . tag2title($k) . "\n|";
+			if (ref($v) eq 'ARRAY') {
+				$content .= join(', ', @$v),
+			} else {
+				$content .= $v;
+			}
+			$content .= "\n";
+
+			$tmp2 = 1;
+		}
+		if (defined($tmp2)) {
+			$content .= table . "\n";
+		}
+
+		$tmp2 = undef;
+		my %commits;
+
+		for my $tag (@{$json->{'tests'}{$name}{tags}}) {
+			if (!defined($tmp2)) {
+				$content .= table . "|Tags|Info\n"
+			}
+			my $k = @$tag[0];
+			my $v = @$tag[1];
+			my $text = $k;
+
+            if ($has_kernel_git && $k eq "linux-git") {
+				$text .= "-$v";
+				unless (defined($commits{$v})) {
+					chdir($ENV{'LINUX_GIT'});
+					$commits{$v} = `git log --pretty=format:'%s' -1 $v`;
+					chdir(OUTDIR);
+				}
+				$v = $commits{$v};
+			}
+			my $a = html_a(tag_url($k, @$tag[1]), $text);
+			$content .= "\n|$a\n|$v\n";
+			$tmp2 = 1;
+		}
+		if (defined($tmp2)) {
+			$content .= table . "\n";
+		}
+
+		$tmp = 1;
 	}
+
+	return $content;
 }
 
+
 my $json = decode_json(load_json($ARGV[0]));
 
-query_flag($json, $ARGV[1]);
+my $config = [
+    {
+		file => "about.txt",
+		title => h2("About $json->{'testsuite'}"),
+		content => \&content_about,
+    },
+    {
+		file => "filters.txt",
+		title => h1("Test filtered by used flags"),
+		content => \&content_filters,
+    },
+    {
+		file => "all-tests.txt",
+		title => h1("All tests"),
+		content => \&content_all_tests,
+    },
+];
+
+sub print_asciidoc_main
+{
+	my $config = shift;
+	my $file = "metadata.txt";
+	my $content;
+
+	open(my $fh, '>', $file) or die("Can't open $file $!");
+
+	$content = <<EOL;
+:doctype: inline
+:sectanchors:
+:toc:
+
+EOL
+	for my $c (@{$config}) {
+		$content .= "include::$c->{'file'}\[\]\n";
+	}
+	print_asciidoc_page($fh, $json, h1($json->{'testsuite_short'} . " test catalog"), $content);
+}
+
+for my $c (@{$config}) {
+	open(my $fh, '>', $c->{'file'}) or die("Can't open $c->{'file'} $!");
+	print_asciidoc_page($fh, $json, $c->{'title'}, $c->{'content'}->($json));
+}
+
+print_asciidoc_main($config);
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
