Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7318340694
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 792853C90C5
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 14:12:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 57E413C6079
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:45 +0100 (CET)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 04836200FCF
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 14:11:45 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id g25so3549729wmh.0
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCSo7iQ4ETM0GSeJNqCfkHG63dp9PxcFgfjvBYHe5Rw=;
 b=TFdgt8zXM9RdhIftGu3swb3XHuuFx8NRbx7vVfx3Psksyzqh04Ou3ha8PccdPyihuP
 a1TU0KmGB/NlKMl3dPCtDynOJA6IrqDg80dLMF/aepvIvqDXR54mh8HHHTE0fuZFrgbc
 2W3j/T32TQO6efLnBy3BfM0cwWP8AUoTicRWCxd87lL9iHryvEMecBDeoBhDJDcrke0D
 1HkvH6fhX6NckCnSsS2Qi01okXWmYZo9U1U7nFI5H0lkjyxbA0DN+t1qCCGJlwKjlEYL
 rsm5G8USKff9qYO7lgVHnGk/2nbar2YHZB5rejpZ/GVKhm6ODsQIl2SX5bDNiDnlCHN9
 G2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CCSo7iQ4ETM0GSeJNqCfkHG63dp9PxcFgfjvBYHe5Rw=;
 b=gmlcyB3TksFZDksfcofQz/gFAs+XJvw9tYgfWBocU8tjJKR0zqM/P3I0PxXabqsiPy
 HbUDiv5gZnljJE3jrIwT7t1FP7BHObC+PDe3Vxk912hOTk3EfuqAB9VORG6GwQoyUm8W
 SxkYqU/LLxAZefHxL9XCxW2/CXe2yCXMX0R9hlWLGbJCYCINpxbPbmK9urS3f/wsdxCo
 pajpJo/xrZr7y8mqNdyugjZyZA74zmO9L/J3tXAzljEpY4OLTOlKm9z2vZVlloXbcvls
 GhdJzLvbrOB3YJdlE7yrdhNfuGpaHX8T1olHJyeN8+lX7274psGtI+2+gY/YrNhU3+bI
 UD5w==
X-Gm-Message-State: AOAM530Dh9hYz57ABMwqn2DOySx2/RD07AsNHmhU27r13xYJsPakF82x
 SJ6cQSXsGhit5n8t1lilmeo=
X-Google-Smtp-Source: ABdhPJxfdBhk5QiNW9n+Ryt/f6A9n6HFL0L3GrlY312LNoysPXq74aBGZrrBlPqniK/HNM4Uh6l2Lw==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr3754392wmi.153.1616073104512; 
 Thu, 18 Mar 2021 06:11:44 -0700 (PDT)
Received: from localhost.localdomain ([185.240.141.204])
 by smtp.gmail.com with ESMTPSA id x25sm2792630wmj.14.2021.03.18.06.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:11:44 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 18 Mar 2021 15:11:30 +0200
Message-Id: <20210318131134.3562203-5-amir73il@gmail.com>
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
Subject: [LTP] [PATCH 4/8] syscalls/fanotify05: Add a test case for
 unlimited queue
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

The existing test case verifies getting an overflow event when
events cannot fit in events queue.

Add a test case to verify that no overflow is generated when
events queue size is unlimited.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify05.c     | 41 +++++++++++++++----
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify05.c b/testcases/kernel/syscalls/fanotify/fanotify05.c
index 60bcb4774..252f5cbf5 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify05.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify05.c
@@ -36,6 +36,20 @@
 /* Currently this is fixed in kernel... */
 #define MAX_EVENTS 16384
 
+static struct tcase {
+	const char *tname;
+	unsigned int init_flags;
+} tcases[] = {
+	{
+		"Limited queue",
+		FAN_CLASS_NOTIF,
+	},
+	{
+		"Unlimited queue",
+		FAN_CLASS_NOTIF | FAN_UNLIMITED_QUEUE,
+	},
+};
+
 #define BUF_SIZE 256
 static char fname[BUF_SIZE];
 static char symlnk[BUF_SIZE];
@@ -82,10 +96,19 @@ static void generate_events(int open_flags, int num_files)
 		(open_flags & O_CREAT) ? "Created" : "Opened", i, elapsed_ms);
 }
 
-void test01(void)
+static void test_fanotify(unsigned int n)
 {
+	struct tcase *tc = &tcases[n];
 	int len, nevents = 0, got_overflow = 0;
 	int num_files = MAX_EVENTS + 1;
+	int expect_overflow = !(tc->init_flags & FAN_UNLIMITED_QUEUE);
+
+	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
+
+	fd_notify = SAFE_FANOTIFY_INIT(tc->init_flags | FAN_NONBLOCK, O_RDONLY);
+
+	SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_MOUNT | FAN_MARK_ADD, FAN_OPEN,
+			   AT_FDCWD, MOUNT_PATH);
 
 	/*
 	 * Generate events on unique files so they won't be merged
@@ -108,7 +131,7 @@ void test01(void)
 					"read of notification event failed");
 			}
 			if (!got_overflow)
-				tst_res(TFAIL, "Overflow event not generated!\n");
+				tst_res(expect_overflow ? TFAIL : TPASS, "Overflow event not generated!\n");
 			break;
 		}
 		if (event.fd != FAN_NOFD) {
@@ -146,22 +169,23 @@ void test01(void)
 					event.fd);
 				break;
 			}
-			tst_res(TPASS,
+			tst_res(expect_overflow ? TPASS : TFAIL,
 				"Got an overflow event: pid=%u fd=%d",
 				(unsigned)event.pid, event.fd);
 			got_overflow = 1;
 		}
 	}
 	tst_res(TINFO, "Got %d events", nevents);
+	SAFE_CLOSE(fd_notify);
 }
 
 static void setup(void)
 {
-	fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF | FAN_NONBLOCK,
-			O_RDONLY);
+	int fd;
 
-	SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_MOUNT | FAN_MARK_ADD, FAN_OPEN,
-			  AT_FDCWD, MOUNT_PATH);
+	/* Check for kernel fanotify support */
+	fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
+	SAFE_CLOSE(fd);
 }
 
 static void cleanup(void)
@@ -171,7 +195,8 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.test_all = test01,
+	.test = test_fanotify,
+	.tcnt = ARRAY_SIZE(tcases),
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
