Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C744630B9
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Nov 2021 11:10:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A1E83C5DF0
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Nov 2021 11:10:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 922313C3171
 for <ltp@lists.linux.it>; Tue, 30 Nov 2021 11:09:59 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DE5E1201091
 for <ltp@lists.linux.it>; Tue, 30 Nov 2021 11:09:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C3F91FD54;
 Tue, 30 Nov 2021 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1638266998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9RnJpezOyHwPQ/zqyruwzLO1WkrxKVvA1BuuMK74jGI=;
 b=oaT8F2dwJnjpeIk4cnO1FnyQTE2dY7XqtElJsS3eBjtpFm6YMhzmWKntd2gH9y41miYn8u
 lesjVU4WlLxAHCXKiBxrs6aCj78Vn/xTUeaYFlSHJOu8g4/yGJc8QvBqHgOv7QHTxk+uZ5
 A1rzp7A1IauzoGjre0WGF7trPU7hnck=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE37413D2F;
 Tue, 30 Nov 2021 10:09:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2Y5vLHX4pWH2LQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 30 Nov 2021 10:09:57 +0000
To: ltp@lists.linux.it
Date: Tue, 30 Nov 2021 11:09:34 +0100
Message-Id: <20211130100934.1674-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Add common.h utilities for aiodio tests
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/io/ltp-aiodio/common.h | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 testcases/kernel/io/ltp-aiodio/common.h

diff --git a/testcases/kernel/io/ltp-aiodio/common.h b/testcases/kernel/io/ltp-aiodio/common.h
new file mode 100644
index 000000000..230d9d392
--- /dev/null
+++ b/testcases/kernel/io/ltp-aiodio/common.h
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Common utilities for aiodio tests.
+ */
+
+#include <stdlib.h>
+#include "tst_test.h"
+
+static char *check_zero(char *buf, int size)
+{
+	char *p;
+
+	p = buf;
+
+	while (size > 0) {
+		if (*buf != 0) {
+			tst_res(TINFO,
+				"non zero buffer at buf[%lu] => 0x%02x,%02x,%02x,%02x",
+				buf - p, (unsigned int)buf[0],
+				size > 1 ? (unsigned int)buf[1] : 0,
+				size > 2 ? (unsigned int)buf[2] : 0,
+				size > 3 ? (unsigned int)buf[3] : 0);
+			tst_res(TINFO, "buf %p, p %p", buf, p);
+			return buf;
+		}
+		buf++;
+		size--;
+	}
+
+	return 0;
+}
+
+static void io_append(const char *path, char pattern, int flags, size_t bs, size_t bcount)
+{
+	int fd;
+	size_t i;
+	char *bufptr;
+
+	bufptr = SAFE_MEMALIGN(getpagesize(), bs);
+	memset(bufptr, pattern, bs);
+
+	fd = SAFE_OPEN(path, flags, 0666);
+
+	for (i = 0; i < bcount; i++)
+		SAFE_WRITE(1, fd, bufptr, bs);
+
+	free(bufptr);
+	SAFE_CLOSE(fd);
+}
-- 
2.34.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
