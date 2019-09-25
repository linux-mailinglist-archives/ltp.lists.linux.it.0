Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA474BDB5D
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 11:47:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9782E3C2097
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 11:47:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 935723C2079
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 11:47:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 68E8D14016E5
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 11:47:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6DBDAED6
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 09:47:22 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Sep 2019 11:47:21 +0200
Message-Id: <20190925094721.18932-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/acct02: Check read size.
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

This is just a minor adjustements that checks that we get correct size
from read before we attempt to validate the data we read in order to
print more meaningful failure message.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/acct/acct02.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index 110d99359..bdb7c1194 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -171,10 +171,21 @@ static void run(void)
 	acct(NULL);
 
 	do {
-		tst_res(TINFO, "== entry %d ==", ++i);
-
 		read_bytes = SAFE_READ(0, fd, &acct_struct, acct_size);
 
+		if (i == 0 && read_bytes == 0) {
+			tst_res(TFAIL, "acct file is empty");
+			goto exit;
+		}
+
+		if (read_bytes != acct_size) {
+			tst_res(TFAIL, "incomplete read %i bytes, expected %i",
+			        read_bytes, acct_size);
+			goto exit;
+		}
+
+		tst_res(TINFO, "== entry %d ==", ++i);
+
 		if (v3)
 			ret = verify_acct(&acct_struct.v3, acct_struct.v3.ac_etime);
 		else
@@ -192,6 +203,7 @@ static void run(void)
 	else
 		tst_res(TPASS, "acct() wrote correct file contents!");
 
+exit:
 	SAFE_CLOSE(fd);
 }
 
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
