Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CE5D9228
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 15:15:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9D8F3C2387
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 15:15:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A12273C220D
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 15:15:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 470D4600F27
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 15:15:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F5F9AF11;
 Wed, 16 Oct 2019 13:15:08 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 16 Oct 2019 15:15:06 +0200
Message-Id: <20191016131506.17193-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: tst_taint: Ignore WARN taint flag if already set
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
Cc: Chang Yin <cyin@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This commit changes the library so that it ignores the taint warn flag
if it was set prior to the test run. It turns out that the warn taint
flag is not well defined and could be easily set on a freshly booted
kernel for example when buggy BIOS is detected.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Jan Stancek <jstancek@redhat.com>
CC: Chang Yin <cyin@redhat.com>
---

I haven't tested this, since I don't have a system where the flag is set
at hand, but it's simple enough so that it should work as expected.

 lib/tst_taint.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/tst_taint.c b/lib/tst_taint.c
index a5dbf77d2..3de6d72f4 100644
--- a/lib/tst_taint.c
+++ b/lib/tst_taint.c
@@ -82,8 +82,13 @@ void tst_taint_init(unsigned int mask)
 		tst_res(TCONF, "Kernel is too old for requested mask");
 
 	taint_mask = mask;
-
 	taint = tst_taint_read();
+
+	if (mask & TST_TAINT_W && taint & TST_TAINT_W) {
+		tst_res(TCONF, "Ignoring already set kernel warning taint");
+		mask &= ~TST_TAINT_W;
+	}
+
 	if ((taint & mask) != 0)
 		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
 }
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
