Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 106822B3F3D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 09:59:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE4CF3C4F43
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 09:59:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id DF98E3C20D7
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 09:59:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7CA8860049E
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 09:59:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605517148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oxciUtEOdIFNjUmHNUS8raRDo8nPWzthQEfnbtLjIBE=;
 b=d09WTLXqjg2hYTZHB4w8JRuxiPRsUkrHah91cUFYdXbjz+RPioDOT3xB5TLiDkUFA/bhgj
 t4pkJDUC0gWIG9LJ0d3W6wgFTCDabAwwCgqa1Li2iWXjkkdgQGND6+/lQPumye7XHrU8/G
 aWIzWY9brDTgv9yKOgGTKPx0ZAt9gHc=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 987FAAFBE;
 Mon, 16 Nov 2020 08:59:08 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 16 Nov 2020 08:58:44 +0000
Message-Id: <20201116085844.29499-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] madvise06: Do no set swap limit
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Setting the swap limit is unnecessary for this test. By default it
appears to be set to some large value which is OK. Setting it may fail
for reasons unrelated to the test's purpose making the test less
reliable.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

I should not have included this in the first update to the test. It
appears that it fails with EACCES on at least one configuration, where
the test ran previously. Also it could fail with EBUSY in theory.

I don't know why limit_in_bytes can be set, but memsw.limit_in_bytes
results in EACCES. This is interesting, however should be the focus of
a different test IMO.

 testcases/kernel/syscalls/madvise/madvise06.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 817faae39..2ba2bac6f 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -46,7 +46,6 @@
 
 #define CHUNK_SZ (400*1024*1024L)
 #define MEM_LIMIT (CHUNK_SZ / 2)
-#define MEMSW_LIMIT (2 * CHUNK_SZ)
 #define PASS_THRESHOLD (CHUNK_SZ / 4)
 #define PASS_THRESHOLD_KB (PASS_THRESHOLD / 1024)
 
@@ -124,8 +123,6 @@ static void setup(void)
 	SAFE_FILE_PRINTF("/proc/self/oom_score_adj", "%d", -1000);
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.limit_in_bytes", "%ld\n",
 			 MEM_LIMIT);
-	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.memsw.limit_in_bytes", "%ld\n",
-			 MEMSW_LIMIT);
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.swappiness", "60");
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/tasks", "%d\n", getpid());
 
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
