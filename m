Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D62B41BC
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 11:52:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BCED3C4F4C
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 11:52:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E94B83C2419
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 11:52:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7609E1400759
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 11:52:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605523934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3gvtUBO0MdPFZ9MpFMKzn2saZw2sxSRu4ICdpYWh1ZQ=;
 b=FAJmewC0eI/U+AEVNTId9T5+Pg6PKMhRv2N+VW9z3awuE1nv43zAnZJwwtnQ2wxNV4KlmD
 EDNUwzkIpuT3PCDg+qhNCfv2qHdvA7fMsM8YSzbsw6ULfyWSDWVxwMWxLKPwSDX8dJezXz
 +AHl64P06HQzwAVT7JwhwlrBR+LSP/g=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3205AC9A;
 Mon, 16 Nov 2020 10:52:14 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 16 Nov 2020 10:52:09 +0000
Message-Id: <20201116105209.20395-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] madvise06: Allow for kmem and memsw counters being
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

These may be missing and we only access them for printing diagnostic
info.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/madvise/madvise06.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index 2ba2bac6f..dc515d528 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -64,14 +64,16 @@ static void check_path(const char *path)
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
@@ -82,10 +84,14 @@ static void meminfo_diag(const char *point)
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
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
