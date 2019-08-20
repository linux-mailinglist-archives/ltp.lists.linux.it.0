Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6FA9625A
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 16:25:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 620F53C1D63
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 16:25:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 270E63C1CE5
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 16:25:36 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 95B1B60067E
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 16:25:35 +0200 (CEST)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7KEPT81027040
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 07:25:30 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Tue, 20 Aug 2019 07:25:29 -0700
From: <zhe.he@windriver.com>
To: <ltp@lists.linux.it>
Date: Tue, 20 Aug 2019 22:25:28 +0800
Message-ID: <1566311128-454547-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] cve: Fix kernel symbol finding for meltdown case
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

From: He Zhe <zhe.he@windriver.com>

meltdown case failed as below.
safe_file_ops.c:219: BROK: Expected 3 conversions got 2 at meltdown.c:272

The case used SAFE_FILE_LINES_SCANF which is a wrapper of vsscanf which cannot
extract the symbol name from the following line pattern of kernel symbol table.

01234567 T SYMBOL_NAME

Also the original format pattern is not correct.

This patch re-writes the symbol extraction process and adds a NULL pointer
check.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 testcases/cve/meltdown.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
index f78c38b..4c3f3b2 100644
--- a/testcases/cve/meltdown.c
+++ b/testcases/cve/meltdown.c
@@ -248,15 +248,34 @@ set_cache_hit_threshold(void)
 static unsigned long
 find_symbol_in_file(const char *filename, const char *symname)
 {
-	unsigned long addr;
-	char type;
-	int ret, read;
-	char fmt[strlen(symname) + 64];
+	unsigned long addr = 0;
+	int found = 0;
+	char line[BUFSIZ] = {0};
+	FILE *fp = NULL;
+	char *p = NULL;
+
+	fp = fopen(filename, "r");
+	if (fp == NULL) {
+		tst_res(TBROK | TERRNO,
+			"Failed to open file:%s for symbol:%s",
+			filename, symname);
+		return 0;
+	}
 
-	sprintf(fmt, "%%lx %%c %s%%c", symname);
+	while (fgets(line, BUFSIZ, fp) != NULL) {
+		p = strstr(line, symname);
+		/* Make sure this line is exactly for this symbol.
+		 * Substract the EOL added by fgets for each line.
+		 */
+		if (p && ((strlen(p) - 1) == strlen(symname))) {
+			found = sscanf(line, "%lx", &addr);
+			if (found == 1)
+				break;
+		}
+	}
+	fclose(fp);
 
-	ret = SAFE_FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
-	if (ret)
+	if (found != 1)
 		return 0;
 
 	return addr;
@@ -322,6 +341,11 @@ static void run(void)
 
 	/* read address of saved_cmdline_addr */
 	addr = saved_cmdline_addr;
+	if (!addr) {
+		tst_res(TBROK | TERRNO, "saved_cmdline_addr is 0\n");
+		return;
+	}
+
 	size = sizeof(addr);
 	for (i = 0; i < size; i++) {
 		ret = readbyte(spec_fd, addr);
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
