Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30655373038
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 21:03:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B56B3C589F
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 21:03:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AE94B3C17CE
 for <ltp@lists.linux.it>; Tue,  4 May 2021 21:02:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 169D51400DB8
 for <ltp@lists.linux.it>; Tue,  4 May 2021 21:02:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D58CB264
 for <ltp@lists.linux.it>; Tue,  4 May 2021 19:02:47 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 21:02:37 +0200
Message-Id: <20210504190240.24250-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504190240.24250-1-pvorel@suse.cz>
References: <20210504190240.24250-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/5] docparse: Filter .tags by key
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

i.e. into CVE, linux-git, ... sections.

Flags has already been sorted, but .tags flag has arbitrary key,
further filtering by key improves a lot searching for particular info.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/testinfo.pl | 53 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index 7c74009d7..194365ea3 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -217,21 +217,46 @@ sub get_filters
 {
 	my $json = shift;
 	my %data;
+
 	while (my ($k, $v) = each %{$json->{'tests'}}) {
 		for my $j (keys %{$v}) {
-
 			next if ($j eq 'fname' || $j eq 'doc');
-
 			$data{$j} = () unless (defined($data{$j}));
-			push @{$data{$j}}, $k;
+
+			if ($j eq 'tags') {
+				for my $tags (@{$v}{'tags'}) {
+					for my $tag (@$tags) {
+						my $k2 = $$tag[0];
+						my $v2 = $$tag[1];
+						$data{$j}{$k2} = () unless (defined($data{$j}{$k2}));
+						push @{$data{$j}{$k2}}, $k unless grep{$_ eq $k} @{$data{$j}{$k2}};
+					}
+				}
+			} else {
+				push @{$data{$j}}, $k unless grep{$_ eq $k} @{$data{$j}};
+			}
 		}
 	}
 	return \%data;
 }
 
-# TODO: Handle better .tags (and anything else which contains array)
-# e.g. for .tags there could be separate list for CVE and linux-git
-# (now it's together in single list).
+sub content_filter
+{
+	my $k = $_[0];
+	my $title = $_[1];
+	my $desc = $_[2];
+	my $h = $_[3];
+	my ($letter, $prev_letter, $content);
+
+	$content = label($k);
+	$content .= $title;
+	$content .= paragraph("Tests containing $desc flag.");
+
+	$content .= get_test_names(\@{$h});
+
+	return $content;
+}
+
 sub content_filters
 {
 	my $json = shift;
@@ -240,11 +265,17 @@ sub content_filters
 	my $content;
 
 	for my $k (sort keys %$data) {
-		my $tag = tag2title($k);
-		my ($letter, $prev_letter);
-		$content .= h2($tag);
-		$content .= paragraph("Tests containing $tag flag.");
-		$content .= get_test_names(\@{$h{$k}});
+		my $title = tag2title($k);
+		if (ref($h{$k}) eq 'HASH') {
+			$content .= label($k);
+			$content .= h2($title);
+			for my $k2 (sort keys %{$h{$k}}) {
+				my $title2 = code($k2);
+				$content .= content_filter($k2, h3($title2), "$title $title2", $h{$k}{$k2});
+			}
+		} else {
+			$content .= content_filter($k, h2($title), $title, \@{$h{$k}});
+		}
 	}
 
 	return $content;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
