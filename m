Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D632DDED2
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 08:06:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E46AA3C2A3B
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 08:06:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 76A213C57A6
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 08:06:38 +0100 (CET)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D25EE14013A5
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 08:06:37 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id cw27so1278886edb.5
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 23:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=haxeh3xOqc5wSCRbJ8DDbvZHMlJyW0a+kvxyE3r4l1o=;
 b=fbidFJjuPh3k8jQWZWDU3ZPfGkBZEu6P0H3qfcAJOHE/tc7aa661XRQQi0JcCvt4Nd
 PU6xfmOQHRZIG3oXofbemDUvz7lYzTDhwlwu4f9cd/A1BEzQ3WYtKxyYAuz5xiiZGk/5
 nBBK+HvFI8xHqcPHK3Sh7Uhi9watBw2EG2OdsKFsmcZYeT7mjcZD6x45snv0yFTUBv/b
 +8T1ikDtLaWC/0qvuSwqGcA7Y66x3W84g6zC/cIYakq0D7jBLgqdt7fXj7rFOgfQuR7T
 etEOORpy1f6wNj808jGSOFwtMcp7CVGqO/pN4870JBDmjmEy7MISRDBYMYB7RjUrwbV7
 Jq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=haxeh3xOqc5wSCRbJ8DDbvZHMlJyW0a+kvxyE3r4l1o=;
 b=ommHj5V6X3qAkT0ur3YTb8lPa0csN78j4kVIqeWW/EdiYrrW0mHMXT0pevPhNEqJ8U
 s9DsUVaK5ArGnTO3HWgmsrzzsUm7O/JPBIdRwn07jRbFW+oYVJLR+0Tv0hhN0Q9uvEip
 Sq+Gz3c3uWAZ0YUYCAUfB7ns8KX+RwE4jZEeYwEgsvE87VTGfSpynwZxqM3v45CjPBH0
 64xKz1abtHYaxGc3CWGO7SiN86KqikBLHhaQ12Av6QgyKHCBueMke21Z9U19BycD01Jc
 hb+sTQZLwJhzJzxppeDBrkcnDB6dXDPCBb8sA57SuS3jh93J9kcKwaKosiCqDQtn5/21
 ZVbw==
X-Gm-Message-State: AOAM530F/lL7UNMgHkDaMLDymvjNkIdlz7tyq1ZoCpFoDCUOSeAUnnWv
 rb8AcVYYbB93+s/etmWkzMw4yeLJMzU=
X-Google-Smtp-Source: ABdhPJzCzcgTozMC7ghwHmF9ryuS3VI7ocHTw9uIu95llVgRYH0gBwyY+7RhG5Y2qZFG1+SlJbq6eQ==
X-Received: by 2002:a05:6402:1765:: with SMTP id
 da5mr3023214edb.27.1608275197493; 
 Thu, 17 Dec 2020 23:06:37 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id d13sm10852263edx.27.2020.12.17.23.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 23:06:36 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 18 Dec 2020 09:06:30 +0200
Message-Id: <20201218070631.1182292-3-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218070631.1182292-1-amir73il@gmail.com>
References: <20201218070631.1182292-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] syscalls/inotify10: Add test cases with two groups
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

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/inotify/inotify10.c | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/inotify/inotify10.c b/testcases/kernel/syscalls/inotify/inotify10.c
index baa955a0a..17aafc773 100644
--- a/testcases/kernel/syscalls/inotify/inotify10.c
+++ b/testcases/kernel/syscalls/inotify/inotify10.c
@@ -44,10 +44,24 @@ static struct tcase {
 	unsigned int parent_mask;
 	unsigned int subdir_mask;
 	unsigned int child_mask;
+	unsigned int parent_mask_other;
+	unsigned int subdir_mask_other;
+	unsigned int child_mask_other;
 } tcases[] = {
 	{
 		"Group with parent and child watches",
 		IN_ATTRIB, IN_ATTRIB, IN_ATTRIB,
+		0, 0, 0,
+	},
+	{
+		"Group with child watches and other group with parent watch",
+		0, IN_ATTRIB, IN_ATTRIB,
+		IN_ATTRIB, 0, 0,
+	},
+	{
+		"Group with parent watch and other group with child watches",
+		IN_ATTRIB, 0, 0,
+		0, IN_ATTRIB, IN_ATTRIB,
 	},
 };
 
@@ -55,7 +69,7 @@ struct event_t event_set[EVENT_MAX];
 
 char event_buf[EVENT_BUF_LEN];
 
-int fd_notify;
+int fd_notify, fd_notify_other;
 
 static void verify_inotify(unsigned int n)
 {
@@ -67,6 +81,7 @@ static void verify_inotify(unsigned int n)
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
 
 	fd_notify = SAFE_MYINOTIFY_INIT();
+	fd_notify_other = SAFE_MYINOTIFY_INIT();
 
 	/* Setup watches on parent dir and children */
 	if (tc->parent_mask)
@@ -75,6 +90,16 @@ static void verify_inotify(unsigned int n)
 		wd_subdir = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_DIR, tc->subdir_mask);
 	if (tc->child_mask)
 		wd_child = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_FILE, tc->child_mask);
+	/*
+	 * Setup watches on "other" group to verify no intereferecne with our group.
+	 * We do not check events reported to the "other" group.
+	 */
+	if (tc->parent_mask_other)
+		SAFE_MYINOTIFY_ADD_WATCH(fd_notify_other, ".", tc->parent_mask_other);
+	if (tc->subdir_mask_other)
+		SAFE_MYINOTIFY_ADD_WATCH(fd_notify_other, TEST_DIR, tc->subdir_mask_other);
+	if (tc->child_mask_other)
+		SAFE_MYINOTIFY_ADD_WATCH(fd_notify_other, TEST_FILE, tc->child_mask_other);
 
 	/*
 	 * Generate IN_ATTRIB events on file and subdir that should be reported to parent
@@ -151,6 +176,7 @@ static void verify_inotify(unsigned int n)
 	}
 
 	SAFE_CLOSE(fd_notify);
+	SAFE_CLOSE(fd_notify_other);
 }
 
 static void setup(void)
@@ -163,6 +189,8 @@ static void cleanup(void)
 {
 	if (fd_notify > 0)
 		SAFE_CLOSE(fd_notify);
+	if (fd_notify_other > 0)
+		SAFE_CLOSE(fd_notify_other);
 }
 
 static struct tst_test test = {
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
