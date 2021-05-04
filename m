Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B88373036
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 21:02:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DDA93C6867
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 21:02:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 765343C17CE
 for <ltp@lists.linux.it>; Tue,  4 May 2021 21:02:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F01EE600946
 for <ltp@lists.linux.it>; Tue,  4 May 2021 21:02:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F829B27F
 for <ltp@lists.linux.it>; Tue,  4 May 2021 19:02:47 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 21:02:38 +0200
Message-Id: <20210504190240.24250-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504190240.24250-1-pvorel@suse.cz>
References: <20210504190240.24250-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/5] docparse: Make tags in table clickable
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

Acked-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/testinfo.pl | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index 194365ea3..2aeee1a17 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -95,6 +95,10 @@ sub hr
 sub html_a
 {
 	my ($url, $text) = @_;
+
+	# escape ]
+	$text =~ s/([]])/\\$1/g;
+
 	return "$url\[$text\]";
 }
 
@@ -125,7 +129,12 @@ sub paragraph
 
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
@@ -179,7 +188,7 @@ sub get_test_names
 			$content .= "\n";
 		}
 
-		$content .= reference($name, " ");
+		$content .= reference($name, delimiter => " ");
 		$prev_letter = $letter;
 	}
 	$content .= "\n";
@@ -388,7 +397,7 @@ sub content_all_tests
 				$content .= table . "|Key|Value\n\n"
 			}
 
-			$content .= "|" . tag2title($k) . "\n|";
+			$content .= "|" . reference($k, text => tag2title($k)) . "\n|";
 
 			if (ref($v) eq 'ARRAY') {
 				# two dimensional array
@@ -434,7 +443,7 @@ sub content_all_tests
 			}
 
 			$v = html_a(tag_url($k, @$tag[1]), $v);
-			$content .= "\n|$k\n|$v\n";
+			$content .= "\n|" . reference($k) . "\n|$v\n";
 			$tmp2 = 1;
 		}
 		if (defined($tmp2)) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
