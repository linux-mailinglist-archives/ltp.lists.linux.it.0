Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1B21CF728
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 16:28:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 993333C2B50
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 16:28:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 860B43C2410
 for <ltp@lists.linux.it>; Tue, 12 May 2020 16:28:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7C5E71A009AE
 for <ltp@lists.linux.it>; Tue, 12 May 2020 16:28:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8D5F2B01D;
 Tue, 12 May 2020 14:28:32 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Tue, 12 May 2020 15:28:23 +0100
Message-Id: <20200512142824.13063-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] pty04: Remove unnecessary volatile and style fix
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/pty/pty04.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 252babe92..bfda08b2b 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -92,7 +92,7 @@ static struct ldisc_info ldiscs[] = {
 	{N_SLCAN, "N_SLCAN", CAN_MTU},
 };
 
-static volatile int ptmx, pts, sk, mtu, no_check;
+static int ptmx, pts, sk, mtu, no_check;
 
 static int set_ldisc(int tty, const struct ldisc_info *ldisc)
 {
@@ -173,13 +173,15 @@ static void write_pty(const struct ldisc_info *ldisc)
 
 
 	written = 0;
-	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written), TST_RETVAL_NOTNULL);
+	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
+			     TST_RETVAL_NOTNULL);
 	if (ret < 0)
 		tst_brk(TBROK | TERRNO, "Failed 1st write to PTY");
 	tst_res(TPASS, "Wrote PTY 1");
 
 	written = 0;
-	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written), TST_RETVAL_NOTNULL);
+	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
+			     TST_RETVAL_NOTNULL);
 	if (ret < 0)
 		tst_brk(TBROK | TERRNO, "Failed 2nd write to PTY");
 
-- 
2.26.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
