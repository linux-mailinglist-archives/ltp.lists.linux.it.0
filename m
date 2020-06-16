Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D31FABC4
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 11:01:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFBD23C2CFB
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 11:01:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E12ED3C2CE8
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 11:01:36 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 1AA7A101589B
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 11:01:34 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,518,1583164800"; d="scan'208";a="94570331"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Jun 2020 17:01:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 872964CE2E8A
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 17:01:25 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Jun 2020 17:01:24 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 16 Jun 2020 17:01:21 +0800
Message-ID: <1592298082-21792-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 872964CE2E8A.AE15B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/2] libs/libltpnewipc: Add missing libmsgctl.c
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

Add libmsgctl.c into ltp new ipc libs, so the upcoming msgstress cleanup cases
can use its functions.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 libs/libltpnewipc/libmsgctl.c | 134 ++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 libs/libltpnewipc/libmsgctl.c

diff --git a/libs/libltpnewipc/libmsgctl.c b/libs/libltpnewipc/libmsgctl.c
new file mode 100644
index 000000000..6de512d29
--- /dev/null
+++ b/libs/libltpnewipc/libmsgctl.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines  Corp., 2002
+ * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/ipc.h>
+#include <sys/msg.h>
+#include "libmsgctl.h"
+
+int doreader(long key, int tid, long type, int child, int nreps)
+{
+	int i, size;
+	int id;
+	struct mbuffer buffer;
+
+	id = msgget(key, 0);
+	if (id < 0) {
+		printf("msgget() error in the reader of child group %d: %s\n",
+			child, strerror(errno));
+
+		return FAIL;
+	}
+	if (id != tid) {
+		printf("Message queue mismatch in the reader of child group %d for message queue id %d\n",
+			child, id);
+
+		return FAIL;
+	}
+	for (i = 0; i < nreps; i++) {
+		memset(&buffer, 0, sizeof(buffer));
+
+		size = msgrcv(id, &buffer, 100, type, 0);
+		if (size < 0) {
+			printf("msgrcv() error in child %d, read # = %d: %s\n",
+				child, (i + 1), strerror(errno));
+
+			return FAIL;
+		}
+		if (buffer.type != type) {
+			printf("Type mismatch in child %d, read #d = %d: ",
+				child, (i + 1));
+			printf("for message got %ld, expected - %ld\n",
+				buffer.type, type);
+
+			return FAIL;
+		}
+		if (buffer.data.len + 1 != size) {
+			printf("Size mismatch in child %d, read # = %d: ",
+				child, (i + 1));
+			printf("for message got %d, expected - %d\n",
+				buffer.data.len + 1, size);
+
+			return FAIL;
+		}
+		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
+			printf("Verify failed in child %d read # = %d, key = %lx\n",
+				child, (i + 1), key);
+
+			return FAIL;
+		}
+		key++;
+	}
+	return PASS;
+}
+
+int dowriter(long key, int tid, long type, int child, int nreps)
+{
+	int i, size;
+	int id;
+	struct mbuffer buffer;
+
+	id = msgget(key, 0);
+	if (id < 0) {
+		printf("msgget() error in the writer of child group %d: %s\n",
+			child, strerror(errno));
+
+		return FAIL;
+	}
+	if (id != tid) {
+		printf("Message queue mismatch in the reader of child group %d for message queue id %d\n",
+			child, id);
+
+		return FAIL;
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
+		if (msgsnd(id, &buffer, size + 1, 0) < 0) {
+			printf("msgsnd() error in child %d, write # = %d, key = %lx: %s\n",
+				child, nreps, key, strerror(errno));
+
+			return FAIL;
+		}
+		key++;
+	}
+	return PASS;
+}
+
+int fill_buffer(char *buf, char val, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++)
+		buf[i] = val;
+	return 0;
+}
+
+/* Check a buffer for correct values */
+int verify(char *buf, char val, int size, int child)
+{
+	while (size-- > 0) {
+		if (*buf++ != val) {
+			printf("Verify error in child %d, *buf = %x, val = %x, size = %d\n",
+				child, *buf, val, size);
+
+			return FAIL;
+		}
+	}
+	return PASS;
+}
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
