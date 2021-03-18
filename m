Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA29C340695
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B5663C606D
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 754593C7A82
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:46 +0100 (CET)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2ACBD1001191
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:46 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id g25so3549758wmh.0
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 06:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/6qnBnxktRF5bNz1CSRmtn2RW2Q3ddl8+doC0XsN15o=;
 b=u0LYK3gPcGRQ/6MnjnFQBKVAj+wH9ercyBGMsEHbSOGvl8LHgnMs8l06akyaAk7eNj
 Nf3ibEcWClthPiSHV6c4F/l4n5fxlM1XPikIrBGDDBIy8ON96pAdtmMTXUPcIyDMXdbS
 bXqtCrDu7RaSdThLhdA9iCSnWsSFp+SmnPuXLWBwWqF5nVAw862B82/EnIs/BDAsKCel
 n601Y8zdUkXbV42vyRwpo5zrUDnQ6HgfZwMQ3TrZdn6If0KlvL24tCaBCrymx0kD6HHU
 BkIf9fR04KmZlxcbfPx7yebeS999KytxfdNVtv5eHxg/E9NT5WKhiUfdkYMkYVn9iRjX
 PSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/6qnBnxktRF5bNz1CSRmtn2RW2Q3ddl8+doC0XsN15o=;
 b=MZY9hHGDvlNRzuDDs1d9NGI61IlxPe4MV22snv6Y4VPlZxPOsAxEjKt8DmSjDsXoXL
 kLUX0MxVB0xtoeJclH6xk/yJl1/sM+5qZubTbs0SE60dUHg5q5gMKr8YGWmOXww01sOA
 Y7wUgE6WDiaA9aON/YwROKBmwL3pdCbjsDWOKI4u+ZiupodT2F+ISKiw9DOvJ8W0nRUk
 3iVD44Y9a7sciJL2XLUY3CqNBOCnYe/nVLNV46DvK4DynsdYCzQK/5H1IsxLfTAXR7mc
 HaLqr4scSJQu07XDgfUefYA/78glnLc8gErkMwCeqKE5IP0zSG2dPrIsg3tkQWXAzbpp
 FnqQ==
X-Gm-Message-State: AOAM531t1o6qswRc4gHoHuVP7K6I9QPr5o83oHFLkgMAJ75JpHyLOO1t
 BeUzq40k45w7yfgYexBmTEHX6cUGbQ4=
X-Google-Smtp-Source: ABdhPJwTu/i4da7sRBptSKlE4rif2gLiYe9RPCwqyjdAUJygK6/IP2mqM7xbdRJd3Oy7wTlFArvRrQ==
X-Received: by 2002:a05:600c:214d:: with SMTP id
 v13mr3677114wml.7.1616073105750; 
 Thu, 18 Mar 2021 06:11:45 -0700 (PDT)
Received: from localhost.localdomain ([185.240.141.204])
 by smtp.gmail.com with ESMTPSA id x25sm2792630wmj.14.2021.03.18.06.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:11:45 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 18 Mar 2021 15:11:31 +0200
Message-Id: <20210318131134.3562203-6-amir73il@gmail.com>
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
Subject: [LTP] [PATCH 5/8] syscalls/fanotify05: adjust test to tunable
 max_queued_events
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

Similar to test inotify05, check if there is a system tunable for
/proc/sys/fs/fanotify/max_queued_events and adjust the test according
to the system limit.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify05.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify05.c b/testcases/kernel/syscalls/fanotify/fanotify05.c
index 252f5cbf5..b7028f262 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify05.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify05.c
@@ -33,8 +33,12 @@
 #define FNAME_PREFIX_LEN 6
 #define PATH_PREFIX MOUNT_PATH "/" FNAME_PREFIX
 
-/* Currently this is fixed in kernel... */
-#define MAX_EVENTS 16384
+#define SYSFS_MAX_EVENTS "/proc/sys/fs/fanotify/max_queued_events"
+
+/* In older kernels this limit is fixed in kernel */
+#define DEFAULT_MAX_EVENTS 16384
+
+static int max_events;
 
 static struct tcase {
 	const char *tname;
@@ -100,7 +104,7 @@ static void test_fanotify(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 	int len, nevents = 0, got_overflow = 0;
-	int num_files = MAX_EVENTS + 1;
+	int num_files = max_events + 1;
 	int expect_overflow = !(tc->init_flags & FAN_UNLIMITED_QUEUE);
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
@@ -186,6 +190,13 @@ static void setup(void)
 	/* Check for kernel fanotify support */
 	fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
 	SAFE_CLOSE(fd);
+
+	/* In older kernels this limit is fixed in kernel */
+	if (access(SYSFS_MAX_EVENTS, F_OK) && errno == ENOENT)
+		max_events = DEFAULT_MAX_EVENTS;
+	else
+		SAFE_FILE_SCANF(SYSFS_MAX_EVENTS, "%d", &max_events);
+	tst_res(TINFO, "max_queued_events=%d", max_events);
 }
 
 static void cleanup(void)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
