Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5752DDED1
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 08:06:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDBC03C2A45
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 08:06:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 28CB93C334A
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 08:06:36 +0100 (CET)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 71EEE1A01534
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 08:06:36 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id h16so1264048edt.7
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 23:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OfGQUSBa5kFhO/pQmyBDlAfpoLUOWm95waI0qN36zBc=;
 b=klZzU8Oi3jg4Xwx/2C07km2e0EJvAQAmn/8JY++980ElLrwxlT4tkQkA5V3ujjD6mX
 7Qdqk+Jv5hgPyNBqmSznLKinGpe+VGUh3uT5402mFTUrkzF41kKDUe+EZp6wpaGYCEVq
 XpPR36WTtIGPk+lYQSXp/kMsDzcJ10haIPBIPWi5ElU00L6lgxgYUFHs6UTwP54JFS8B
 WdZ0L5EKeQpWHZPZ222gHJhKrCcbtO37K4tAknmNxpKqlRxH0BsQd/D28w9I4Kic/Z/T
 7R8pxCVVX3bA/MFH8H9TdgXr5ULcVIHhN86vMHLjOum8dAOq351ABakHcmje83/FRDRb
 PLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OfGQUSBa5kFhO/pQmyBDlAfpoLUOWm95waI0qN36zBc=;
 b=OEagRLqeB2Dq6ONLzjsWXx0uZ0NdLJsmPQvQSuuFGQuCRi1SEuwUj01xevDHjp7NG4
 BFsSunmX06O7zhU4ZFU0Jlj0iRsh8dZe6BVpHquFFxA1M6YbNz2ttqeHYwOLUqKAK3yC
 iqy18A4Sw7m4VYSAmkjYqJDWrokfoxgSywcv/4D+yY5Kh8MneM4iiWm2saq8KJv3KCWO
 JFeYfLgPXxCvVeim1QoaNm8RCowOiztK4ZgtRlgZvh7XrJbH78DVMDassR+kZ8T4DhbU
 Y8MnFI43dI2A6qxin1v9kOf8ql36SP2YvO4h5H94MqzTFbEo3keKYY/7XHnG9DyoXFLA
 7x1w==
X-Gm-Message-State: AOAM531VhQE5d7JmGPZp5UeQ1YOSF2EUSpPYud+udEUHUm60Opi+seEJ
 DcUrvHt/3hWrYXyWdottepA=
X-Google-Smtp-Source: ABdhPJzozJDyPT8cF1EFNk7dVYAA6yDnEf7ck/Ri/hQWiMQu/bL4FBjZY7ZuKPY1vL6YmhugURpIMQ==
X-Received: by 2002:a50:8004:: with SMTP id 4mr2902453eda.329.1608275196070;
 Thu, 17 Dec 2020 23:06:36 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id d13sm10852263edx.27.2020.12.17.23.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 23:06:35 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 18 Dec 2020 09:06:29 +0200
Message-Id: <20201218070631.1182292-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218070631.1182292-1-amir73il@gmail.com>
References: <20201218070631.1182292-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] syscalls/inotify10: Generalize for more test cases
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
Cc: Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Generalize the parent and child watches test to allow adding new
parent and child watch related test cases.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/inotify/inotify10.c | 81 +++++++++++++------
 1 file changed, 55 insertions(+), 26 deletions(-)

diff --git a/testcases/kernel/syscalls/inotify/inotify10.c b/testcases/kernel/syscalls/inotify/inotify10.c
index 1c43915a8..baa955a0a 100644
--- a/testcases/kernel/syscalls/inotify/inotify10.c
+++ b/testcases/kernel/syscalls/inotify/inotify10.c
@@ -5,7 +5,9 @@
  * Started by Amir Goldstein <amir73il@gmail.com>
  *
  * DESCRIPTION
- *     Check that event is reported to both watching parent and watching child
+ *     Check that event is reported to watching parent and watching child
+ *     based on their interest
+ *
  */
 
 #include "config.h"
@@ -37,48 +39,74 @@ struct event_t {
 #define	TEST_DIR	"test_dir"
 #define	TEST_FILE	"test_file"
 
+static struct tcase {
+	const char *tname;
+	unsigned int parent_mask;
+	unsigned int subdir_mask;
+	unsigned int child_mask;
+} tcases[] = {
+	{
+		"Group with parent and child watches",
+		IN_ATTRIB, IN_ATTRIB, IN_ATTRIB,
+	},
+};
+
 struct event_t event_set[EVENT_MAX];
 
 char event_buf[EVENT_BUF_LEN];
 
 int fd_notify;
 
-static void verify_inotify(void)
+static void verify_inotify(unsigned int n)
 {
+	struct tcase *tc = &tcases[n];
 	int i = 0, test_num = 0, len;
-	int wd_parent, wd_dir, wd_file;
+	int wd_parent = 0, wd_subdir = 0, wd_child = 0;
 	int test_cnt = 0;
 
+	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
+
 	fd_notify = SAFE_MYINOTIFY_INIT();
 
-	/* Set watch on both parent dir and children */
-	wd_parent = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, ".", IN_ATTRIB);
-	wd_dir = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_DIR, IN_ATTRIB);
-	wd_file = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_FILE, IN_ATTRIB);
+	/* Setup watches on parent dir and children */
+	if (tc->parent_mask)
+		wd_parent = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, ".", tc->parent_mask);
+	if (tc->subdir_mask)
+		wd_subdir = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_DIR, tc->subdir_mask);
+	if (tc->child_mask)
+		wd_child = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_FILE, tc->child_mask);
 
 	/*
-	 * Generate events on file and subdir that should be reported to parent
-	 * dir with name and to children without name.
+	 * Generate IN_ATTRIB events on file and subdir that should be reported to parent
+	 * dir with name and to children without name if they have IN_ATTRIB in their mask.
 	 */
 	SAFE_CHMOD(TEST_DIR, 0755);
 	SAFE_CHMOD(TEST_FILE, 0644);
 
-	event_set[test_cnt].wd = wd_parent;
-	event_set[test_cnt].mask = IN_ATTRIB | IN_ISDIR;
-	strcpy(event_set[test_cnt].name, TEST_DIR);
-	test_cnt++;
-	event_set[test_cnt].wd = wd_dir;
-	event_set[test_cnt].mask = IN_ATTRIB | IN_ISDIR;
-	strcpy(event_set[test_cnt].name, "");
-	test_cnt++;
-	event_set[test_cnt].wd = wd_parent;
-	event_set[test_cnt].mask = IN_ATTRIB;
-	strcpy(event_set[test_cnt].name, TEST_FILE);
-	test_cnt++;
-	event_set[test_cnt].wd = wd_file;
-	event_set[test_cnt].mask = IN_ATTRIB;
-	strcpy(event_set[test_cnt].name, "");
-	test_cnt++;
+	if (wd_parent && (tc->parent_mask & IN_ATTRIB)) {
+		event_set[test_cnt].wd = wd_parent;
+		event_set[test_cnt].mask = tc->parent_mask | IN_ISDIR;
+		strcpy(event_set[test_cnt].name, TEST_DIR);
+		test_cnt++;
+	}
+	if (wd_subdir && (tc->subdir_mask & IN_ATTRIB)) {
+		event_set[test_cnt].wd = wd_subdir;
+		event_set[test_cnt].mask = tc->subdir_mask | IN_ISDIR;
+		strcpy(event_set[test_cnt].name, "");
+		test_cnt++;
+	}
+	if (wd_parent && (tc->parent_mask & IN_ATTRIB)) {
+		event_set[test_cnt].wd = wd_parent;
+		event_set[test_cnt].mask = tc->parent_mask;
+		strcpy(event_set[test_cnt].name, TEST_FILE);
+		test_cnt++;
+	}
+	if (wd_child && (tc->child_mask & IN_ATTRIB)) {
+		event_set[test_cnt].wd = wd_child;
+		event_set[test_cnt].mask = tc->child_mask;
+		strcpy(event_set[test_cnt].name, "");
+		test_cnt++;
+	}
 
 	len = read(fd_notify, event_buf, EVENT_BUF_LEN);
 	if (len == -1)
@@ -141,7 +169,8 @@ static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.setup = setup,
 	.cleanup = cleanup,
-	.test_all = verify_inotify,
+	.test = verify_inotify,
+	.tcnt = ARRAY_SIZE(tcases),
 };
 
 #else
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
