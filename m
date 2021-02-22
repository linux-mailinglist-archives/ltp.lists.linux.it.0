Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A4321C14
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 17:03:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A399F3C7208
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 17:03:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1ED243C6100
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:02:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5BFC0600843
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:02:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5066AFD5;
 Mon, 22 Feb 2021 16:02:48 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 22 Feb 2021 17:02:41 +0100
Message-Id: <20210222160243.507-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222160243.507-1-pvorel@suse.cz>
References: <20210222160243.507-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] testinfo.pl: Update parsing more git trees
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

to reflect changes in previous commit.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

agree that using $constant::declared() is really ugly, I'm ok to just
put constants there.

Kind regards,
Petr

 docparse/testinfo.pl | 102 +++++++++++++++++++++++++++----------------
 lib/tst_test.c       |   2 +
 2 files changed, 66 insertions(+), 38 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index b5ab02bc1..e3f84a4cb 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -1,7 +1,7 @@
 #!/usr/bin/perl
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2019 Cyril Hrubis <chrubis@suse.cz>
-# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2020-2021 Petr Vorel <pvorel@suse.cz>
 
 use strict;
 use warnings;
@@ -12,6 +12,15 @@ use File::Basename qw(dirname);
 
 use constant OUTDIR => dirname(abs_path($0));
 
+# tags which expect git tree, also need constant for URL
+our @TAGS_GIT = ("linux-git", "linux-stable-git", "glibc-git");
+
+# tags should map these in lib/tst_test.c
+use constant LINUX_GIT_URL => "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=";
+use constant LINUX_STABLE_GIT_URL => "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=";
+use constant GLIBC_GIT_URL => "https://sourceware.org/git/?p=glibc.git;a=commit;h=";
+use constant CVE_DB_URL => "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-";
+
 sub load_json
 {
 	my ($fname, $mode) = @_;
@@ -51,15 +60,21 @@ EOL
 sub tag_url {
 	my ($tag, $value, $scm_url_base) = @_;
 
-    if ($tag eq "CVE") {
-        return "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-" . $value;
+	if ($tag eq "fname") {
+		return $scm_url_base . $value;
 	}
-    if ($tag eq "linux-git") {
-        return "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=" . $value;
+
+	if ($tag eq "CVE") {
+		return CVE_DB_URL . $value;
 	}
-    if ($tag eq "fname") {
-        return $scm_url_base . $value;
+
+	# *_GIT_URL
+	my $key = tag2env($tag) . "_URL";
+	if (defined($constant::declared{"main::$key"})) {
+		return eval("main::$key") . $value;
 	}
+
+	die("unknown constant '$key' for tag $tag, define it!");
 }
 
 sub bold
@@ -235,34 +250,46 @@ sub content_filters
 	return $content;
 }
 
+sub tag2env
+{
+	my $tag = shift;
+	$tag =~ s/-/_/g;
+	return uc($tag);
+}
+
 sub detect_git
 {
-	unless (defined $ENV{'LINUX_GIT'} && $ENV{'LINUX_GIT'}) {
-		log_warn("kernel git repository not defined. Define it in \$LINUX_GIT");
-		return 0;
-	}
+	my %data;
 
-	unless (-d $ENV{'LINUX_GIT'}) {
-		log_warn("\$LINUX_GIT does not exit ('$ENV{'LINUX_GIT'}')");
-		return 0;
-	}
+	for my $tag (@TAGS_GIT) {
+		my $env = tag2env($tag);
 
-	my $ret = 0;
-	if (system("which git >/dev/null")) {
-		log_warn("git not in \$PATH ('$ENV{'PATH'}')");
-		return 0;
-	}
+		unless (defined $ENV{$env} && $ENV{$env}) {
+			log_warn("git repository $tag not defined. Define it in \$$env");
+			next;
+		}
+
+		unless (-d $ENV{$env}) {
+			log_warn("\$$env does not exit ('$ENV{$env}')");
+			next;
+		}
 
-	chdir($ENV{'LINUX_GIT'});
-	if (!system("git log -1 > /dev/null")) {
-		log_info("using '$ENV{'LINUX_GIT'}' as kernel git repository");
-		$ret = 1;
-	} else {
-		log_warn("git failed, git not installed or \$LINUX_GIT is not a git repository? ('$ENV{'LINUX_GIT'}')");
+		if (system("which git >/dev/null")) {
+			log_warn("git not in \$PATH ('$ENV{'PATH'}')");
+			next;
+		}
+
+		chdir($ENV{$env});
+		if (!system("git log -1 > /dev/null")) {
+			log_info("using '$ENV{$env}' as $env repository");
+			$data{$tag} = $ENV{$env};
+		} else {
+			log_warn("git failed, git not installed or \$$env is not a git repository? ('$ENV{$env}')");
+		}
+		chdir(OUTDIR);
 	}
-	chdir(OUTDIR);
 
-	return $ret;
+	return \%data;
 }
 
 sub content_all_tests
@@ -270,15 +297,11 @@ sub content_all_tests
 	my $json = shift;
 	my @names = sort keys %{$json->{'tests'}};
 	my $letters = paragraph(get_test_letters(\@names));
-	my $has_kernel_git = detect_git();
+	my $git_url = detect_git();
 	my $tmp = undef;
 	my $printed = "";
 	my $content;
 
-	unless ($has_kernel_git) {
-		log_info("Parsing git messages from linux git repository skipped due previous error");
-	}
-
 	$content .= paragraph("Total $#names tests.");
 	$content .= $letters;
 	$content .= get_test_names(\@names);
@@ -370,15 +393,18 @@ sub content_all_tests
 			my $v = @$tag[1];
 			my $text = $k;
 
-            if ($has_kernel_git && $k eq "linux-git") {
+			if (defined($$git_url{$k})) {
 				$text .= "-$v";
-				unless (defined($commits{$v})) {
-					chdir($ENV{'LINUX_GIT'});
-					$commits{$v} = `git log --pretty=format:'%s' -1 $v`;
+
+				$commits{$k} = () unless (defined($commits{$k}));
+				unless (defined($commits{$k}{$v})) {
+					chdir($$git_url{$k});
+					$commits{$k}{$v} = `git log --pretty=format:'%s' -1 $v`;
 					chdir(OUTDIR);
 				}
-				$v = $commits{$v};
+				$v = $commits{$k}{$v};
 			}
+
 			my $a = html_a(tag_url($k, @$tag[1]), $text);
 			$content .= "\n|$a\n|$v\n";
 			$tmp2 = 1;
diff --git a/lib/tst_test.c b/lib/tst_test.c
index be6bf3e2a..ea89ab78a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -38,6 +38,7 @@
  */
 const char *TCID __attribute__((weak));
 
+/* update also docparse/testinfo.pl */
 #define LINUX_GIT_URL "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id="
 #define LINUX_STABLE_GIT_URL "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id="
 #define GLIBC_GIT_URL "https://sourceware.org/git/?p=glibc.git;a=commit;h="
@@ -701,6 +702,7 @@ static void print_failure_hint(const char *tag, const char *hint,
 	}
 }
 
+/* update also docparse/testinfo.pl */
 static void print_failure_hints(void)
 {
 	print_failure_hint("linux-git", "missing kernel fixes", LINUX_GIT_URL);
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
