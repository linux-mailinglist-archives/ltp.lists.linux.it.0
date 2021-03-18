Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF38340690
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:11:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 155DD3C79CC
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:11:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4A70E3C8265
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:42 +0100 (CET)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 76499200FCF
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:42 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so6902924wmq.1
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x5aes04PWP0ATwq1/SkHYMpSaje0mLgNEdJyHtzwu04=;
 b=tBWYZwEck0sS0OIxStsOl8R4/mj0szIOnOs7jZmJaWWSvZqPyT1v+uR2uboicC0YCu
 ma11gBLtSAaGFS32S7n4OCKD5VGgzIRZAl0xrLR8KegqQyA3F9m2ctVamrlES/vgaYoH
 f5y5Dr+vlHYQ+Fo/HbG68jBk51WuMnCCB+esznsmb5YWUvUSdxzDmKCCuFHA72qWlmot
 SnWBZYylI7xrbntWzhK5rfQ+h/45ohcALGvEH6QCMGSdKavtZK3rWlix5j2lA8XweLBj
 YCYROjZqvy5uldDCvI9uptdIQ0ZHu/84YFhrS27iLP06P+AXFzY+gYfFF6fwcAbIJKNO
 2odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x5aes04PWP0ATwq1/SkHYMpSaje0mLgNEdJyHtzwu04=;
 b=bvKgi5SzuXuhfdMc3Gda63lgRxdXRLvf+vhLDxhQFFqNIN4RuWP++/lVoHm94Ij6bz
 Fb5dywiwE6JygLl3PjKIStWS3k6Sphk6xrFP9MiIMQ64fdEY9Ar9NpSGreTmbpIk8A14
 Oq9j7ijtoZO53wAYhwPoeicjGd9zcNQYPxT4JFj+o+oxFAxbAHZcT7uIgQz317/B/Fa/
 0Pk+lWj5LgvLg7TjajSO2e4ZwO6gPqYAkLBGFQeYUlB0s78qulNLVdYDkCHJ4gXWkMK/
 csr/gz9HW4GD/v0xVw7WtUvTe3Ac5SQjaweYHpgjF4+wxwa1RExSeqNzZ7AX9F6q/rD2
 hHdg==
X-Gm-Message-State: AOAM531oCxz3ZJzSVFDznxh6JSbkQs/22J/Upb70pSQiPgR2hXSURTZL
 d7deisMvfKpa20qjHKVokvY=
X-Google-Smtp-Source: ABdhPJx+6E5A03eZ2MlVxceg/+kHoCYPPhZJ4PHPgJ+e3XEDHqlJfuCDsKpGqq+MBrruYPWH3MNGzA==
X-Received: by 2002:a1c:3d8a:: with SMTP id k132mr3566138wma.71.1616073101911; 
 Thu, 18 Mar 2021 06:11:41 -0700 (PDT)
Received: from localhost.localdomain ([185.240.141.204])
 by smtp.gmail.com with ESMTPSA id x25sm2792630wmj.14.2021.03.18.06.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:11:41 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 18 Mar 2021 15:11:28 +0200
Message-Id: <20210318131134.3562203-3-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318131134.3562203-1-amir73il@gmail.com>
References: <20210318131134.3562203-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/8] syscalls/fanotify05: Verify events are received
 by queue order
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When all events are generated on unique objects, re-ordering no
events are expected to be merged and therefore no event re-order
is expected. Verify that events are received in the order that
they were generated.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify05.c     | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify05.c b/testcases/kernel/syscalls/fanotify/fanotify05.c
index 6be593add..1ca427caa 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify05.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify05.c
@@ -18,6 +18,8 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <errno.h>
+#include <libgen.h>
+#include <stdlib.h>
 #include <string.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
@@ -28,6 +30,7 @@
 
 #define MOUNT_PATH "fs_mnt"
 #define FNAME_PREFIX "fname_"
+#define FNAME_PREFIX_LEN 6
 #define PATH_PREFIX MOUNT_PATH "/" FNAME_PREFIX
 
 /* Currently this is fixed in kernel... */
@@ -35,10 +38,29 @@
 
 #define BUF_SIZE 256
 static char fname[BUF_SIZE];
+static char symlnk[BUF_SIZE];
+static char fdpath[BUF_SIZE];
 static int fd, fd_notify;
 
 struct fanotify_event_metadata event;
 
+static void event_res(struct fanotify_event_metadata *event, int i)
+{
+	int len = 0;
+	const char *filename;
+	sprintf(symlnk, "/proc/self/fd/%d", event->fd);
+	len = readlink(symlnk, fdpath, sizeof(fdpath));
+	if (len < 0)
+		len = 0;
+	fdpath[len] = 0;
+	filename = basename(fdpath);
+	if (len > FNAME_PREFIX_LEN && atoi(filename + FNAME_PREFIX_LEN) != i) {
+		tst_res(TFAIL, "Got event #%d out of order filename=%s", i, filename);
+	} else if (i == 0) {
+		tst_res(TINFO, "Got event #%d filename=%s", i, filename);
+	}
+}
+
 static void generate_events(int num_files)
 {
 	long long elapsed_ms;
@@ -82,8 +104,15 @@ void test01(void)
 			tst_res(TFAIL, "Overflow event not generated!\n");
 			break;
 		}
-		if (event.fd != FAN_NOFD)
+		if (event.fd != FAN_NOFD) {
+			/*
+			 * Verify that events generated on unique files
+			 * are received by the same order they were generated.
+			 */
+			if (nevents < num_files)
+				event_res(&event, nevents);
 			close(event.fd);
+		}
 		nevents++;
 
 		/*
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
