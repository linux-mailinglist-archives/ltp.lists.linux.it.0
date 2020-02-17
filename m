Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3B160DBA
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:47:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B38D3C25D5
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:47:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9B9FD3C23B0
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:47:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1AF8E1000CD2
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:47:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DAF0B313;
 Mon, 17 Feb 2020 08:47:01 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 17 Feb 2020 09:46:19 +0100
Message-Id: <20200217084622.11199-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217084622.11199-1-pvorel@suse.cz>
References: <20200217084622.11199-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v7 1/4] tst_umount: Fail immediately when errno !=
 EBUSY
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Only on EBUSY makes sense to keep trying in a loop.
This helps to use tst_umount() in safe_umount() (next commit).

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Reported-by: Jan Stancek <jstancek@redhat.com>
Acked-by: Li Wang <liwang@redhat.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_device.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/tst_device.c b/lib/tst_device.c
index 89b9c96de..8b5459def 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -363,10 +363,17 @@ int tst_umount(const char *path)
 		if (!ret)
 			return 0;
 
+		if (err != EBUSY) {
+			tst_resm(TWARN, "umount('%s') failed with %s",
+		         path, tst_strerrno(err));
+			errno = err;
+			return ret;
+		}
+
 		tst_resm(TINFO, "umount('%s') failed with %s, try %2i...",
 		         path, tst_strerrno(err), i+1);
 
-		if (i == 0 && err == EBUSY) {
+		if (i == 0) {
 			tst_resm(TINFO, "Likely gvfsd-trash is probing newly "
 			         "mounted fs, kill it to speed up tests.");
 		}
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
