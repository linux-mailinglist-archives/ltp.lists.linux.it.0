Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F38C2B5CB4
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 11:17:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69F293C5A21
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 11:17:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C7D473C4AE7
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 11:17:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 515AA140116B
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 11:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605608246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nf83TEOpol/fF4zajPSPC9lfNzr0kPhXoghxGoQ+9MM=;
 b=NEA5gODSp+9bypHHpCz+v7PAqCFKMFQkqYg2jSvk4uMSZ8CXUfgbiwCCJb6ccauR/6bDot
 xttwNTAc3n80IKT1O3WWlHgnFE3kzQAi4mlfOC2msCRwmmrYUezTiCzQdm63Bus1g0tV6q
 8W/OCiVu+ygorCyvwcU16BqRo7QclyU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97397AB3D;
 Tue, 17 Nov 2020 10:17:26 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 17 Nov 2020 10:17:17 +0000
Message-Id: <20201117101717.30478-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116105209.20395-1-rpalethorpe@suse.com>
References: <20201116105209.20395-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] madvise06: Allow for kmem and memsw counters being
 disabled
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

These may be missing in which case we can not read them for diagnostic
info or set the swap limit to a value which is known to be large
enough. However if there is no swap counter then there is no swap
limit, so we just try to set the limit if the counter exists.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Li Wang <liwang@redhat.com>
---

V2: Check if the memsw limit exists before writing to it. This
    replaces another patch which removed it altogether.

 testcases/kernel/syscalls/madvise/madvise06.c | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 817faae39..7e9e9ef84 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -65,14 +65,16 @@ static void check_path(const char *path)
 }
 
 #define READ_CGMEM(item)						\
-	({long tst_rval;						\
-	  SAFE_FILE_LINES_SCANF(MNT_NAME"/"GROUP_NAME"/memory."item, 	\
-				"%ld",					\
-				&tst_rval);				\
+	({long tst_rval = 0;						\
+	  const char *cgpath = MNT_NAME"/"GROUP_NAME"/memory."item;	\
+	  if (!access(cgpath, R_OK))					\
+		  SAFE_FILE_LINES_SCANF(cgpath, "%ld", &tst_rval);	\
 	  tst_rval;})
 
 static void meminfo_diag(const char *point)
 {
+	long rval;
+
 	FILE_PRINTF("/proc/sys/vm/stat_refresh", "1");
 	tst_res(TINFO, "%s", point);
 	tst_res(TINFO, "\tSwap: %ld Kb",
@@ -83,10 +85,14 @@ static void meminfo_diag(const char *point)
 		SAFE_READ_MEMINFO("Cached:") - init_cached);
 	tst_res(TINFO, "\tcgmem.usage_in_bytes: %ld Kb",
 		READ_CGMEM("usage_in_bytes") / 1024);
-	tst_res(TINFO, "\tcgmem.memsw.usage_in_bytes: %ld Kb",
-		READ_CGMEM("memsw.usage_in_bytes") / 1024);
-	tst_res(TINFO, "\tcgmem.kmem.usage_in_bytes: %ld Kb",
-		READ_CGMEM("kmem.usage_in_bytes") / 1024);
+
+	rval = READ_CGMEM("memsw.usage_in_bytes") / 1024;
+	if (rval)
+		tst_res(TINFO, "\tcgmem.memsw.usage_in_bytes: %ld Kb", rval);
+
+	rval = READ_CGMEM("kmem.usage_in_bytes") / 1024;
+	if (rval)
+		tst_res(TINFO, "\tcgmem.kmem.usage_in_bytes: %ld Kb", rval);
 }
 
 static void setup(void)
@@ -124,8 +130,11 @@ static void setup(void)
 	SAFE_FILE_PRINTF("/proc/self/oom_score_adj", "%d", -1000);
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.limit_in_bytes", "%ld\n",
 			 MEM_LIMIT);
-	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.memsw.limit_in_bytes", "%ld\n",
-			 MEMSW_LIMIT);
+
+	if (!access(MNT_NAME"/"GROUP_NAME"/memory.memsw.limit_in_bytes", W_OK)) {
+		SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.memsw.limit_in_bytes",
+				 "%ld\n", MEMSW_LIMIT);
+	}
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/memory.swappiness", "60");
 	SAFE_FILE_PRINTF(MNT_NAME"/"GROUP_NAME"/tasks", "%d\n", getpid());
 
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
