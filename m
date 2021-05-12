Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B957337BFC6
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 16:21:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 504253C8A83
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 16:21:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D5403C1C23
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:21:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C69B31401159
 for <ltp@lists.linux.it>; Wed, 12 May 2021 16:21:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D6BBADA2
 for <ltp@lists.linux.it>; Wed, 12 May 2021 14:21:19 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 12 May 2021 15:54:58 +0200
Message-Id: <20210512135458.12444-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] Revert "docparse: Fix heading levels"
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

This reverts commit 04a7608fe4f7fe2c267216d8b90acf019bdea824.

Fixes build with asciidoc that otherwise failed with:

...
asciidoc: ERROR: filters.txt: line 4: only book doctypes can contain level 0 sections
...
asciidoc: ERROR: all-tests.txt: line 4: only book doctypes can contain level 0 sections

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/testinfo.pl | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index 8bc4623b6..857278ac8 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -87,6 +87,11 @@ sub code
 	return "+$_[0]+";
 }
 
+sub hr
+{
+	return "\n\n'''\n\n";
+}
+
 sub html_a
 {
 	my ($url, $text) = @_;
@@ -99,17 +104,17 @@ sub html_a
 
 sub h1
 {
-	return "= $_[0]\n";
+	return "== $_[0]\n";
 }
 
 sub h2
 {
-	return "== $_[0]\n";
+	return "=== $_[0]\n";
 }
 
 sub h3
 {
-	return "=== $_[0]\n";
+	return "==== $_[0]\n";
 }
 
 sub label
@@ -350,6 +355,7 @@ sub content_all_tests
 			$printed = $letter;
 		}
 
+		$content .= hr() if (defined($tmp));
 		$content .= label($name);
 		$content .= h3($name);
 		$content .= $letters;
-- 
2.26.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
