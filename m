Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5C34068F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:11:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A28343C79CE
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:11:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5D9303C606D
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:41 +0100 (CET)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0B4771000D39
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:41 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso5376788wmi.3
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 06:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqcEfvoHhlsFfDycoPl5vJnZTC4jzYRfMZs1rZPjHSw=;
 b=btLosSAR74ZuIJJ3CXuE/iCPdfjyMCaUrFrEx6/x3cy7nOI6irATQxfV4y1uJRygkk
 9sgRBY6nLZjT/A8xsbUoz2xgRgEeLPcAtpvQiZlGMo0B6dffev3gf6maV4NuzJtSL3hC
 SMxtsoIPjjee1giOwEiFZH1u3lVqmHOmsAxCR4C5BZRJxGoxWGm/EDDlGXlRxlIYsyAs
 ZDySUV7ckT+ZYf4t5X9UOcMw7agAabEveVoMbLeGvIy0RYa32r7mVR9jFTQRSOFURVz6
 MVycjZr75M+2zYX7MtpoXPdkhTxcHLXDNqJdxqPjGtjnZI9/K0c9U8ahpGZlX8PkPc+P
 O6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqcEfvoHhlsFfDycoPl5vJnZTC4jzYRfMZs1rZPjHSw=;
 b=hxv9w5A8rB7kMb5L7kStxYwZLYioPmi6OMElC7Z3OJae3VwTZ5/F9g2XeyC8J7jFVp
 c06rNvq834JNBCkegSFynXN+DJo2eFN3/ZodS/f2WdxdKaxVWgmLjtVIg5D0BxpuCkzs
 O06lSafyB4U9lr12SfV+35zzjjZEG2Tko143lLZKF4C1NJbeTZ5YGA7L703UO5+QqegM
 EMo9VgiJQsZrfqYhmncHPpPc7/ZLOBanzIOWRrAjt8aBvbZBxPJ1y47vj0/msvkqAOA2
 xAZS9xsx8QnGOS+SPUuOwVYPVAQKDfpMiEzBOeXJwUHH+mTWzH68ijS1tPLLu00LQ6rh
 j1rQ==
X-Gm-Message-State: AOAM533sZilMXUVfCEI5rB+d/UXWnGPuXBrtp2m10S2leIkpw75f6iPP
 vTybjx8svdrgnS+gKJO886Y=
X-Google-Smtp-Source: ABdhPJx5uR0WIpy6xY84x2CtawzHU76mrZxUQ2lu//5t5DAd+TB5zueARf4yNM+fpIekqWunYgnARw==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr3635193wml.44.1616073100552; 
 Thu, 18 Mar 2021 06:11:40 -0700 (PDT)
Received: from localhost.localdomain ([185.240.141.204])
 by smtp.gmail.com with ESMTPSA id x25sm2792630wmj.14.2021.03.18.06.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:11:40 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 18 Mar 2021 15:11:27 +0200
Message-Id: <20210318131134.3562203-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318131134.3562203-1-amir73il@gmail.com>
References: <20210318131134.3562203-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/8] syscalls/fanotify05: Fix test output when not
 getting overflow
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

When test does not get an overflow event, errno for empty queue was not
tested correctly and test printed a generic error instead of the intended
message about not getting an overflow event.

Use a helper function to generate events and add info prints about the
time it takes fill up the events queue and number of read events.
---
 .../kernel/syscalls/fanotify/fanotify05.c     | 50 +++++++++++++------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify05.c b/testcases/kernel/syscalls/fanotify/fanotify05.c
index 66ac4cbc3..6be593add 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify05.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify05.c
@@ -21,11 +21,14 @@
 #include <string.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
+#include "tst_timer.h"
 
 #ifdef HAVE_SYS_FANOTIFY_H
 #include "fanotify.h"
 
 #define MOUNT_PATH "fs_mnt"
+#define FNAME_PREFIX "fname_"
+#define PATH_PREFIX MOUNT_PATH "/" FNAME_PREFIX
 
 /* Currently this is fixed in kernel... */
 #define MAX_EVENTS 16384
@@ -36,37 +39,52 @@ static int fd, fd_notify;
 
 struct fanotify_event_metadata event;
 
-void test01(void)
+static void generate_events(int num_files)
 {
+	long long elapsed_ms;
 	int i;
-	int len;
 
-	/*
-	 * generate events
-	 */
-	for (i = 0; i < MAX_EVENTS + 1; i++) {
-		sprintf(fname, MOUNT_PATH"/fname_%d", i);
+	tst_timer_start(CLOCK_MONOTONIC);
+
+	for (i = 0; i < num_files; i++) {
+		sprintf(fname, PATH_PREFIX "%d", i);
 		fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0644);
 		SAFE_CLOSE(fd);
 	}
 
+	tst_timer_stop();
+
+	elapsed_ms = tst_timer_elapsed_ms();
+
+	tst_res(TINFO, "Created %d files in %llims", i, elapsed_ms);
+}
+
+void test01(void)
+{
+	int len, nevents = 0;
+	int num_files = MAX_EVENTS + 1;
+
+	/*
+	 * Generate events on unique files so they won't be merged
+	 */
+	generate_events(num_files);
+
 	while (1) {
 		/*
 		 * get list on events
 		 */
 		len = read(fd_notify, &event, sizeof(event));
 		if (len < 0) {
-			if (errno == -EAGAIN) {
-				tst_res(TFAIL, "Overflow event not "
-					"generated!\n");
-				break;
+			if (errno != EAGAIN) {
+				tst_brk(TBROK | TERRNO,
+					"read of notification event failed");
 			}
-			tst_brk(TBROK | TERRNO,
-				"read of notification event failed");
+			tst_res(TFAIL, "Overflow event not generated!\n");
 			break;
 		}
 		if (event.fd != FAN_NOFD)
 			close(event.fd);
+		nevents++;
 
 		/*
 		 * check events
@@ -92,12 +110,12 @@ void test01(void)
 				break;
 			}
 			tst_res(TPASS,
-				"got event: mask=%llx pid=%u fd=%d",
-				(unsigned long long)event.mask,
+				"Got an overflow event: pid=%u fd=%d",
 				(unsigned)event.pid, event.fd);
-				break;
+			break;
 		}
 	}
+	tst_res(TINFO, "Got %d events", nevents);
 }
 
 static void setup(void)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
