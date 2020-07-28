Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 549812300D0
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 06:40:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12BD03C2677
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 06:40:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5B4BD3C2236
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 06:39:57 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 65FDD1A00FB9
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 06:39:56 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,404,1589212800"; d="scan'208";a="96972742"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jul 2020 12:39:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id F1F484CE506E
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 12:39:44 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Jul 2020 12:39:44 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 28 Jul 2020 12:40:24 +0800
Message-ID: <1595911224-12470-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595911224-12470-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1595911224-12470-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F1F484CE506E.AE38F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/2] libs/libltpnewipc: Add libmsgctl.c into new
 ipc library
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

Add libmsgctl.c into new ipc library, so we can use it
in new api msgstress test case.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/libnewipc.h           |  28 ++++------
 libs/libltpnewipc/libnewipc.c | 101 ++++++++++++++++++++++++++++++++--
 2 files changed, 109 insertions(+), 20 deletions(-)

diff --git a/include/libnewipc.h b/include/libnewipc.h
index 30288cd68..1256c4668 100644
--- a/include/libnewipc.h
+++ b/include/libnewipc.h
@@ -1,21 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2016 Xiao Yang <yangx.jy@cn.fujitsu.com>
  *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.
- */
-
-/*
  * common definitions for the IPC system calls.
  */
 
@@ -56,4 +42,14 @@ void *probe_free_addr(const char *file, const int lineno);
 #define PROBE_FREE_ADDR() \
 	probe_free_addr(__FILE__, __LINE__)
 
-#endif /* newlibipc.h */
+void do_read(const char *file, const int lineno, long key, int tid, \
+	     long type, int child, int nreps);
+#define DO_READ(key, tid, type, child, nreps) \
+	do_read(__FILE__, __LINE__, (key), (tid), (type), (child), (nreps))
+
+void do_writer(const char *file, const int lineno, long key, int tid, \
+	       long type, int child, int nreps);
+#define DO_WRITER(key, tid, type, child, nreps) \
+	do_writer(__FILE__, __LINE__, (key), (tid), (type), (child), (nreps))
+
+#endif /* libnewipc.h */
diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
index 3734040b7..4980ce078 100644
--- a/libs/libltpnewipc/libnewipc.c
+++ b/libs/libltpnewipc/libnewipc.c
@@ -1,10 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2016 Xiao Yang <yangx.jy@cn.fujitsu.com>
- */
-
-/*
- * DESCRIPTION
+ *
  * common routines for the IPC system call tests.
  */
 
@@ -26,6 +23,14 @@
 
 #define BUFSIZE 1024
 
+struct mbuffer {
+	long type;
+	struct {
+		char len;
+		char pbytes[99];
+	} data;
+};
+
 key_t getipckey(const char *file, const int lineno)
 {
 	char buf[BUFSIZE];
@@ -86,3 +91,91 @@ void *probe_free_addr(const char *file, const int lineno)
 
 	return addr;
 }
+
+int verify(char *buf, char val, int size, int child)
+{
+	while (size-- > 0) {
+		if (*buf++ != val) {
+			tst_res(TFAIL, "Verify error in child %d, *buf = %x, "
+				"val = %x, size = %d\n", child, *buf, val,
+				size);
+			return 1;
+		}
+	}
+	return 0;
+}
+
+void do_reader(const char *file, const int lineno, long key, int tid,
+	       long type, int child, int nreps)
+{
+	int i, size;
+	int id;
+	struct mbuffer buffer;
+
+	id = safe_msgget(file, lineno, key, 0);
+	if (id != tid) {
+		tst_res(TFAIL,
+			"Message queue mismatch in the reader of child group"
+			" %d for message queue id %d\n", child, id);
+		return;
+	}
+	for (i = 0; i < nreps; i++) {
+		memset(&buffer, 0, sizeof(buffer));
+
+		size = safe_msgrcv(file, lineno, id, &buffer, 100, type, 0);
+		if (buffer.type != type) {
+			tst_res(TFAIL, "Type mismatch in child %d, read #%d, "
+				"for message got %ld, exected %ld",
+				child, (i + 1), buffer.type, type);
+			return;
+		}
+		if (buffer.data.len + 1 != size) {
+			tst_res(TFAIL, "Size mismatch in child %d, read #%d, "
+				"for message got %d, expected %d",
+				child, (i + 1), buffer.data.len + 1, size);
+			return;
+		}
+		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
+			tst_res(TFAIL, "Verify failed in child %d read # = %d, "
+				"key = %lx\n", child, (i + 1), key);
+			return;
+		}
+		key++;
+	}
+}
+
+void fill_buffer(char *buf, char val, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++)
+		buf[i] = val;
+}
+
+void do_writer(const char *file, const int lineno, long key, int tid,
+	       long type, int child, int nreps)
+{
+	int i, size;
+	int id;
+	struct mbuffer buffer;
+
+	id = safe_msgget(file, lineno, key, 0);
+	if (id != tid) {
+		tst_res(TFAIL, "Message queue mismatch in the reader of child"
+			" group %d for message queue id %d\n", child, id);
+		return;
+	}
+
+	for (i = 0; i < nreps; i++) {
+		memset(&buffer, 0, sizeof(buffer));
+
+		do {
+			size = (lrand48() % 99);
+		} while (size == 0);
+		fill_buffer(buffer.data.pbytes, (key % 255), size);
+		buffer.data.len = size;
+		buffer.type = type;
+		safe_msgsnd(file, lineno, id, &buffer, size + 1, 0);
+		key++;
+	}
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
