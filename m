Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D3032371779
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 17:04:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 638363C8031
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 17:04:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A17063C17CE
 for <ltp@lists.linux.it>; Mon,  3 May 2021 17:04:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0F0A81A00CA4
 for <ltp@lists.linux.it>; Mon,  3 May 2021 17:04:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5625CACBF
 for <ltp@lists.linux.it>; Mon,  3 May 2021 15:04:22 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  3 May 2021 17:04:15 +0200
Message-Id: <20210503150415.18835-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] docparse: Make tags in table clickable
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

linked to the section.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

minor but useful improvement.

 docparse/testinfo.pl | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index ccce67be4..76ca7a66c 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -125,7 +125,12 @@ sub paragraph
 
 sub reference
 {
-	return "xref:$_[0]\[$_[0]\]" . (defined($_[1]) ? $_[1] : "") . "\n";
+	my ($link, %args) = @_;
+
+	$args{text} //= $link;
+	$args{delimiter} //= "";
+
+	return "xref:$link\[$args{text}\]$args{delimiter}\n";
 }
 
 sub table
@@ -179,7 +184,7 @@ sub get_test_names
 			$content .= "\n";
 		}
 
-		$content .= reference($name, " ");
+		$content .= reference($name, delimiter => " ");
 		$prev_letter = $letter;
 	}
 	$content .= "\n";
@@ -242,6 +247,7 @@ sub content_filters
 	for my $k (sort keys %$data) {
 		my $tag = tag2title($k);
 		my ($letter, $prev_letter);
+		$content .= label($k);
 		$content .= h2($tag);
 		$content .= paragraph("Tests containing $tag flag.");
 		$content .= get_test_names(\@{$h{$k}});
@@ -357,7 +363,7 @@ sub content_all_tests
 				$content .= table . "|Key|Value\n\n"
 			}
 
-			$content .= "|" . tag2title($k) . "\n|";
+			$content .= "|" . reference($k, text => tag2title($k)) . "\n|";
 
 			if (ref($v) eq 'ARRAY') {
 				# two dimensional array
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
