Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C739037303A
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 21:03:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71B5F3C79C0
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 21:03:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 074503C17CE
 for <ltp@lists.linux.it>; Tue,  4 May 2021 21:02:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0ADAF100096A
 for <ltp@lists.linux.it>; Tue,  4 May 2021 21:02:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 554ECB286
 for <ltp@lists.linux.it>; Tue,  4 May 2021 19:02:47 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 21:02:39 +0200
Message-Id: <20210504190240.24250-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504190240.24250-1-pvorel@suse.cz>
References: <20210504190240.24250-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/5] docparse: Sort alphabetically tags in table
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/testinfo.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index 2aeee1a17..857278ac8 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -424,8 +424,9 @@ sub content_all_tests
 
 		$tmp2 = undef;
 		my %commits;
+		my @sorted_tags = sort { $a->[0] cmp $b->[0] } @{$json->{'tests'}{$name}{tags}};
 
-		for my $tag (@{$json->{'tests'}{$name}{tags}}) {
+		for my $tag (@sorted_tags) {
 			if (!defined($tmp2)) {
 				$content .= table . "|Tags|Info\n"
 			}
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
