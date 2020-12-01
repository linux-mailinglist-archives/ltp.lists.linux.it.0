Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9852CA9EB
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 18:42:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CACC73C6385
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 18:42:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 771043C2BEE
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 18:42:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1636410007EF
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 18:42:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46F01AC2F;
 Tue,  1 Dec 2020 17:42:21 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  1 Dec 2020 18:42:05 +0100
Message-Id: <20201201174214.24625-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201174214.24625-1-pvorel@suse.cz>
References: <20201201174214.24625-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 01/10] fanotify12: Drop incorrect hint
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

hint "CONFIG_FANOTIFY_ACCESS_PERMISSIONS not configured in kernel?"
is wrong here (fanotify12 does not use FAN_ACCESS_PERM).

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Same as v4.

 testcases/kernel/syscalls/fanotify/fanotify12.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify12.c b/testcases/kernel/syscalls/fanotify/fanotify12.c
index fcb7ec0d3..fea7cb607 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify12.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
@@ -146,10 +146,6 @@ static int setup_mark(unsigned int n)
 					"FAN_OPEN_EXEC not supported in "
 					"kernel?");
 				return -1;
-			} else if (errno == EINVAL) {
-				tst_brk(TCONF | TERRNO,
-					"CONFIG_FANOTIFY_ACCESS_PERMISSIONS "
-					"not configured in kernel?");
 			}else {
 				tst_brk(TBROK | TERRNO,
 					"fanotify_mark(%d, FAN_MARK_ADD | %s, "
@@ -173,11 +169,6 @@ static int setup_mark(unsigned int n)
 						"FAN_OPEN_EXEC not supported "
 						"in kernel?");
 					return -1;
-				} else if (errno == EINVAL) {
-					tst_brk(TCONF | TERRNO,
-						"CONFIG_FANOTIFY_ACCESS_"
-						"PERMISSIONS not configured in "
-						"kernel?");
 				} else {
 					tst_brk(TBROK | TERRNO,
 						"fanotify_mark (%d, "
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
