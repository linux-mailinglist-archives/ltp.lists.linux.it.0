Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B053838B2F4
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 17:21:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39E553C8736
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 17:21:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0EA483C1932
 for <ltp@lists.linux.it>; Thu, 20 May 2021 17:21:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6EB7F601C6A
 for <ltp@lists.linux.it>; Thu, 20 May 2021 17:21:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87E25AD6C
 for <ltp@lists.linux.it>; Thu, 20 May 2021 15:21:46 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 20 May 2021 17:21:38 +0200
Message-Id: <20210520152138.23772-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] docparse: Fix parsing URL containing '|' in links
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

That fixes formatting for commit in close_range01:
fec8a6a69103 ("close_range: unshare all fds for CLOSE_RANGE_UNSHARE | CLOSE_RANGE_CLOEXEC")

Reported-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

hope this is enough to be escaped.
I tested various:
== \|= # - ## -- ___

Also one day I wrote docparser test :).

Kind regards,
Petr

 docparse/testinfo.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docparse/testinfo.pl b/docparse/testinfo.pl
index 31148e3a4..6e05982e5 100755
--- a/docparse/testinfo.pl
+++ b/docparse/testinfo.pl
@@ -96,8 +96,8 @@ sub html_a
 {
 	my ($url, $text) = @_;
 
-	# escape ]
-	$text =~ s/([]])/\\$1/g;
+	# escape: ] |
+	$text =~ s/([]|])/\\$1/g;
 
 	return "$url\[$text\]";
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
