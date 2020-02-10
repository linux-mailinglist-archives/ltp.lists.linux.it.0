Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF06A157570
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 13:41:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 739AD3C25BE
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 13:41:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3B8423C207E
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 13:40:51 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B6DF560094B
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 13:40:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E5FAACA4;
 Mon, 10 Feb 2020 12:40:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 10 Feb 2020 13:40:42 +0100
Message-Id: <20200210124043.14425-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] tst_umount: Fail immediately when errno !=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Only on EBUSY makes sense to keep trying in a loop.
This helps to use tst_umount() in safe_umount() (next commit).

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Reported-by: Jan Stancek <jstancek@redhat.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_device.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/tst_device.c b/lib/tst_device.c
index 89b9c96de..6cad9bd4d 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -363,6 +363,13 @@ int tst_umount(const char *path)
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
 
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
