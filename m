Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B757E37FD29
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 20:21:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 748CA3C6421
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 20:21:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11D823C209F
 for <ltp@lists.linux.it>; Thu, 13 May 2021 20:21:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5EE5C601CE6
 for <ltp@lists.linux.it>; Thu, 13 May 2021 20:21:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8556FB156;
 Thu, 13 May 2021 18:21:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 20:20:55 +0200
Message-Id: <20210513182055.31700-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] testinfo.pl: Fix array sort on old perl
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

From: Petr Vorel <petr.vorel@gmail.com>

It fixes failure on perl v5.16.3 (Centos 7):
Can't use an undefined value as an ARRAY reference at docparse/testinfo.pl line 427.

Fixes: 824e34034 ("docparse: Sort alphabetically tags in table")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 docparse/testinfo.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index 857278ac8..31148e3a4 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -424,7 +424,7 @@ sub content_all_tests
 
 		$tmp2 = undef;
 		my %commits;
-		my @sorted_tags = sort { $a->[0] cmp $b->[0] } @{$json->{'tests'}{$name}{tags}};
+		my @sorted_tags = sort { $a->[0] cmp $b->[0] } @{$json->{'tests'}{$name}{tags} // []};
 
 		for my $tag (@sorted_tags) {
 			if (!defined($tmp2)) {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
