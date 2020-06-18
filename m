Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7284F1FEED2
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 11:41:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 390013C2C8D
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 11:41:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 04F453C02EF
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 11:41:48 +0200 (CEST)
Received: from mail-m975.mail.163.com (mail-m975.mail.163.com [123.126.97.5])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2C096200767
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 11:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=UyKyh
 rxxr6gudesJW5hO0s033Nc4XEuKyV3IrU2W2Z8=; b=npYBdjCYHy8nqRIh7XQFL
 W9eitthu7DP80oPFDYMDvx9TgWtmXbd58FmRqkyuKJSUqazfwd+r479l+HIPiAnB
 43//t6KW8jk2WD4ym5iGe/KIDpxYG+Cj40N2bzYxMCbi2wJTUW+Ku20a3r0RSpkC
 hSU5NU3S4C/A9LTtLUv/Es=
Received: from localhost.localdomain (unknown [122.96.44.193])
 by smtp5 (Coremail) with SMTP id HdxpCgCny1jUNuteU4DlAw--.73S2;
 Thu, 18 Jun 2020 17:41:41 +0800 (CST)
From: Yang Xu <xuyang_jy_0410@163.com>
To: ltp@lists.linux.it
Date: Thu, 18 Jun 2020 17:41:38 +0800
Message-Id: <20200618094139.24579-1-xuyang_jy_0410@163.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CM-TRANSID: HdxpCgCny1jUNuteU4DlAw--.73S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF15Jry5JrWDuw4ktw17trb_yoWrGF43pa
 nIkFZ8Kw4kAw1xCF4fWF4rJF1ava1vqa47CrWfuF1DAr4xJw17XrWFgFW7tF1fWan2qFy3
 WrZ8XF45Kw4fXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIoGLUUUUU=
X-Originating-IP: [122.96.44.193]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiyhVHhFQHIoFsVwAAsX
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] libs/libltpnewipc: Add libnewmsgctl.c
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

From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Add libnewmsgctl.c into ltp new ipc libs, so the upcoming msgstress cleanup cases
can use doreader/dowirter functions such as old libmsgctl.c does.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/libnewmsgctl.h           |  22 +++++++
 libs/libltpnewipc/libnewmsgctl.c | 102 +++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 include/libnewmsgctl.h
 create mode 100644 libs/libltpnewipc/libnewmsgctl.c

diff --git a/include/libnewmsgctl.h b/include/libnewmsgctl.h
new file mode 100644
index 000000000..e48a04277
--- /dev/null
+++ b/include/libnewmsgctl.h
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ */
+
+#ifndef __LIBNEWMSGCTL_H__
+#define __LIBNEWMSGCTL_H__
+
+struct mbuffer {
+	long type;
+	struct {
+		char len;
+		char pbytes[99];
+	} data;
+};
+
+void doreader(long key, int tid, long type, int child, int nreps);
+void dowriter(long key, int tid, long type, int child, int nreps);
+void fill_buffer(char *buf, char val, int size);
+int verify(char *buf, char val, int size, int child);
+
+#endif /*__LIBNEWMSGCTL_H__ */
diff --git a/libs/libltpnewipc/libnewmsgctl.c b/libs/libltpnewipc/libnewmsgctl.c
new file mode 100644
index 000000000..1f6eed74a
--- /dev/null
+++ b/libs/libltpnewipc/libnewmsgctl.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
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
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "tst_safe_sysv_ipc.h"
+#include "libnewmsgctl.h"
+
+void doreader(long key, int tid, long type, int child, int nreps)
+{
+	int i, size;
+	int id;
+	struct mbuffer buffer;
+
+	id = SAFE_MSGGET(key, 0);
+	if (id != tid) {
+		tst_res(TFAIL,
+			"Message queue mismatch in the reader of child group %d for message queue id %d\n",
+			child, id);
+		return;
+	}
+	for (i = 0; i < nreps; i++) {
+		memset(&buffer, 0, sizeof(buffer));
+
+		size = SAFE_MSGRCV(id, &buffer, 100, type, 0);
+		if (buffer.type != type) {
+			tst_res(TFAIL, "Type mismatch in child %d, read #%d, for message got %ld, exected %ld",
+				child, (i + 1), buffer.type, type);
+			return;
+		}
+		if (buffer.data.len + 1 != size) {
+			tst_res(TFAIL, "Size mismatch in child %d, read #%d, for message got %d, expected %d",
+				child, (i + 1), buffer.data.len + 1, size);
+			return;
+		}
+		if (verify(buffer.data.pbytes, (key % 255), size - 1, child)) {
+			tst_res(TFAIL, "Verify failed in child %d read # = %d, key = %lx\n",
+				child, (i + 1), key);
+			return;
+		}
+		key++;
+	}
+}
+
+void dowriter(long key, int tid, long type, int child, int nreps)
+{
+	int i, size;
+	int id;
+	struct mbuffer buffer;
+
+	id = SAFE_MSGGET(key, 0);
+	if (id != tid) {
+		tst_res(TFAIL, "Message queue mismatch in the reader of child group %d for message queue id %d\n",
+			child, id);
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
+		SAFE_MSGSND(id, &buffer, size + 1, 0);
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
+/* Check a buffer for correct values */
+int verify(char *buf, char val, int size, int child)
+{
+	while (size-- > 0) {
+		if (*buf++ != val) {
+			tst_res(TFAIL, "Verify error in child %d, *buf = %x, val = %x, size = %d\n",
+				child, *buf, val, size);
+			return 1;
+		}
+	}
+	return 0;
+}
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
