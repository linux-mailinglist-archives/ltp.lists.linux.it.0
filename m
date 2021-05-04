Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5446C37303E
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 21:03:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B6A83C17CE
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 21:03:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F3333C17CE
 for <ltp@lists.linux.it>; Tue,  4 May 2021 21:02:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CE74860029A
 for <ltp@lists.linux.it>; Tue,  4 May 2021 21:02:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76CC3B289
 for <ltp@lists.linux.it>; Tue,  4 May 2021 19:02:47 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 21:02:40 +0200
Message-Id: <20210504190240.24250-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504190240.24250-1-pvorel@suse.cz>
References: <20210504190240.24250-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 5/5] docparse: Fix headers
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

headers started from tag <h2> instead of <h1>. This results in bigger
font size for headers thus removing horizontal ruler (<hr />).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/testinfo.pl | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index 857278ac8..8bc4623b6 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -87,11 +87,6 @@ sub code
 	return "+$_[0]+";
 }
 
-sub hr
-{
-	return "\n\n'''\n\n";
-}
-
 sub html_a
 {
 	my ($url, $text) = @_;
@@ -104,17 +99,17 @@ sub html_a
 
 sub h1
 {
-	return "== $_[0]\n";
+	return "= $_[0]\n";
 }
 
 sub h2
 {
-	return "=== $_[0]\n";
+	return "== $_[0]\n";
 }
 
 sub h3
 {
-	return "==== $_[0]\n";
+	return "=== $_[0]\n";
 }
 
 sub label
@@ -355,7 +350,6 @@ sub content_all_tests
 			$printed = $letter;
 		}
 
-		$content .= hr() if (defined($tmp));
 		$content .= label($name);
 		$content .= h3($name);
 		$content .= $letters;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
