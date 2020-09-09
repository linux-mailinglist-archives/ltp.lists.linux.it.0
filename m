Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D841026352E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B8523C2C24
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7DCB93C2C76
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:30 +0200 (CEST)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 155BA10007FB
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:30 +0200 (CEST)
Received: by mail-wm1-x343.google.com with SMTP id x23so3154332wmi.3
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=21Zy1L9tHSGDp1oGrb0BsRsR967+gvxo/SCNq6Va0kM=;
 b=oOLOVlFc10WjNrhbR0FeFRA2AZ4yU+/kwMPjZs/tcQ7gTU8tdJ/OHOevoicYZGAfP1
 0MYvnrxpxF3W/zM3se8/OYYWNMiW9kOQ24VTHdm0ipoaNy+n0Dg/Lh55FmWPBtUtwlco
 xcNGwWW0DCpOCJPxJGwV3MzyfloTPIxzWf4898kZW6s7grF+gh9vFd0avsLCDUfOXW2g
 PokW4ntUTW5xs7a5rBAFVj4OgFoU/Y8W7JlFj42NPLpnwPaBBze+7BKXt81VEBLhxpzA
 mWojASUoMJngFnwyydjz2ua9fBssrnASAOXcf7NGJN0g+1qsdeZb1Qgbf2MCEYz6KZjj
 YdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=21Zy1L9tHSGDp1oGrb0BsRsR967+gvxo/SCNq6Va0kM=;
 b=qINx8BV0svVP3F35o+v2BkryFnq5F7dBJNBSdcHwG+O/D3CBJxdp1qjKE1jHv8TMju
 fI4Koj4PyRxS58MDxo7V6O7KBenUrKLGzjlhNsukno+7N6akxjLB0ZvNgfSv4phjhFW6
 VQAB/gXyZ14YV2f/zqTd6kC3VEfQ0AP+e41rd/3Zs4NAZyX8a1DejhXp6c0m1sBbL/Vh
 VzZeXsU7fO13JbTuNHiCmx1a+IvnhTeeDIDw6Md3eFdjuSsh3mAXul9LmEdm/8/Iy5U5
 INi+/YX78WZpQ3B77TAKZ228jcaeg7RMGS6Y7RP9YAA0531vk4s6KK07DRtI45rEre3W
 6vsg==
X-Gm-Message-State: AOAM530fzK6P6HLfafL0tt54eqddxiDV6sbHX82lUlN0O1wIt2JfPycV
 OYwgzeP46WRjmG261dv88ifJ/kgDjMs=
X-Google-Smtp-Source: ABdhPJwLPF3u6uyXEzZcjNlbCrsFFoZVS776PFGaQU2bTogTB3n9yesfOZCRfoPF/BhgVJzbS/iiUQ==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr4680065wmc.188.1599674249610; 
 Wed, 09 Sep 2020 10:57:29 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:29 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:57:07 +0300
Message-Id: <20200909175707.10670-11-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 10/10] syscalls/fanotify10: Add test cases for merge
 with ignored mask on directory
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Pre kernel v5.9, a child mark with ignored mask would not prevent the
delivery of events to a watching parent of that child.

This was fixed by kernel commit eca4784cbb18 ("fsnotify: send event to
parent and child with single callback").

We add test cases for combination of mark of a directory with ignored
mask either watching children or not.

Verified that existing test cases still fail on old kernels without the
relevant fix commits.

In current kernel, there is a limitation that requires setting the event
also in the parent's mask for ignore mask to be correctly merged with
other marks. This is a temporary workaround that could be removed in
the future when the correct behavior could be tested.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify10.c     | 109 ++++++++++++++++--
 1 file changed, 99 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index 9ebb6d68f..17d2f7578 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -19,6 +19,10 @@
  * Test case #16 is a regression test for commit:
  *
  *     2f02fd3fa13e fanotify: fix ignore mask logic for events on child...
+ *
+ * Test cases #17-#23 are regression tests for commit:
+ *
+ *     eca4784cbb18 fsnotify: send event to parent and child with single...
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -97,6 +101,7 @@ static struct tcase {
 	int mark_type;
 	const char *ignore_path;
 	int ignore_mark_type;
+	unsigned int ignored_onchild;
 	const char *event_path;
 	unsigned long long expected_mask_with_ignore;
 	unsigned long long expected_mask_without_ignore;
@@ -105,24 +110,28 @@ static struct tcase {
 		"ignore mount events created on a specific file",
 		MOUNT_PATH, FANOTIFY_MOUNT,
 		FILE_MNT2, FANOTIFY_INODE,
+		0,
 		FILE_PATH, 0, FAN_OPEN
 	},
 	{
 		"ignore exec mount events created on a specific file",
 		MOUNT_PATH, FANOTIFY_MOUNT,
 		FILE_EXEC_PATH2, FANOTIFY_INODE,
+		0,
 		FILE_EXEC_PATH, FAN_OPEN_EXEC, FAN_OPEN | FAN_OPEN_EXEC
 	},
 	{
 		"don't ignore mount events created on another file",
 		MOUNT_PATH, FANOTIFY_MOUNT,
 		FILE_PATH, FANOTIFY_INODE,
+		0,
 		FILE2_PATH, FAN_OPEN, FAN_OPEN
 	},
 	{
 		"don't ignore exec mount events created on another file",
 		MOUNT_PATH, FANOTIFY_MOUNT,
 		FILE_EXEC_PATH, FANOTIFY_INODE,
+		0,
 		FILE2_EXEC_PATH, FAN_OPEN | FAN_OPEN_EXEC,
 		FAN_OPEN | FAN_OPEN_EXEC
 	},
@@ -130,24 +139,28 @@ static struct tcase {
 		"ignore inode events created on a specific mount point",
 		FILE_PATH, FANOTIFY_INODE,
 		MNT2_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_MNT2, 0, FAN_OPEN
 	},
 	{
 		"ignore exec inode events created on a specific mount point",
 		FILE_EXEC_PATH, FANOTIFY_INODE,
 		MNT2_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_EXEC_PATH2, FAN_OPEN_EXEC, FAN_OPEN | FAN_OPEN_EXEC
 	},
 	{
 		"don't ignore inode events created on another mount point",
 		FILE_MNT2, FANOTIFY_INODE,
 		MNT2_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_PATH, FAN_OPEN, FAN_OPEN
 	},
 	{
 		"don't ignore exec inode events created on another mount point",
 		FILE_EXEC_PATH2, FANOTIFY_INODE,
 		MNT2_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_EXEC_PATH, FAN_OPEN | FAN_OPEN_EXEC,
 		FAN_OPEN | FAN_OPEN_EXEC
 	},
@@ -155,24 +168,28 @@ static struct tcase {
 		"ignore fs events created on a specific file",
 		MOUNT_PATH, FANOTIFY_FILESYSTEM,
 		FILE_PATH, FANOTIFY_INODE,
+		0,
 		FILE_PATH, 0, FAN_OPEN
 	},
 	{
 		"ignore exec fs events created on a specific file",
 		MOUNT_PATH, FANOTIFY_FILESYSTEM,
 		FILE_EXEC_PATH, FANOTIFY_INODE,
+		0,
 		FILE_EXEC_PATH, FAN_OPEN_EXEC, FAN_OPEN | FAN_OPEN_EXEC
 	},
 	{
 		"don't ignore mount events created on another file",
 		MOUNT_PATH, FANOTIFY_FILESYSTEM,
 		FILE_PATH, FANOTIFY_INODE,
+		0,
 		FILE2_PATH, FAN_OPEN, FAN_OPEN
 	},
 	{
 		"don't ignore exec mount events created on another file",
 		MOUNT_PATH, FANOTIFY_FILESYSTEM,
 		FILE_EXEC_PATH, FANOTIFY_INODE,
+		0,
 		FILE2_EXEC_PATH, FAN_OPEN | FAN_OPEN_EXEC,
 		FAN_OPEN | FAN_OPEN_EXEC
 	},
@@ -180,24 +197,28 @@ static struct tcase {
 		"ignore fs events created on a specific mount point",
 		MOUNT_PATH, FANOTIFY_FILESYSTEM,
 		MNT2_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_MNT2, 0, FAN_OPEN
 	},
 	{
 		"ignore exec fs events created on a specific mount point",
 		MOUNT_PATH, FANOTIFY_FILESYSTEM,
 		MNT2_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_EXEC_PATH2, FAN_OPEN_EXEC, FAN_OPEN | FAN_OPEN_EXEC
 	},
 	{
 		"don't ignore fs events created on another mount point",
 		MOUNT_PATH, FANOTIFY_FILESYSTEM,
 		MNT2_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_PATH, FAN_OPEN, FAN_OPEN
 	},
 	{
 		"don't ignore exec fs events created on another mount point",
 		MOUNT_PATH, FANOTIFY_FILESYSTEM,
 		MNT2_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_EXEC_PATH, FAN_OPEN | FAN_OPEN_EXEC,
 		FAN_OPEN | FAN_OPEN_EXEC
 	},
@@ -205,14 +226,65 @@ static struct tcase {
 		"ignore child exec events created on a specific mount point",
 		MOUNT_PATH, FANOTIFY_INODE,
 		MOUNT_PATH, FANOTIFY_MOUNT,
+		0,
 		FILE_EXEC_PATH, FAN_OPEN_EXEC, FAN_OPEN | FAN_OPEN_EXEC
 	},
+	{
+		"ignore events on children of directory created on a specific file",
+		MNT2_PATH, FANOTIFY_INODE,
+		FILE_PATH, FANOTIFY_INODE,
+		FAN_EVENT_ON_CHILD,
+		FILE_PATH, 0, FAN_OPEN
+	},
+	{
+		"ignore events on file created inside a parent watching children",
+		FILE_PATH, FANOTIFY_INODE,
+		MNT2_PATH, FANOTIFY_INODE,
+		FAN_EVENT_ON_CHILD,
+		FILE_PATH, 0, FAN_OPEN
+	},
+	{
+		"don't ignore events on file created inside a parent not watching children",
+		FILE_PATH, FANOTIFY_INODE,
+		MNT2_PATH, FANOTIFY_INODE,
+		0,
+		FILE_PATH, FAN_OPEN, FAN_OPEN
+	},
+	{
+		"ignore mount events created inside a parent watching children",
+		FILE_PATH, FANOTIFY_MOUNT,
+		MNT2_PATH, FANOTIFY_INODE,
+		FAN_EVENT_ON_CHILD,
+		FILE_PATH, 0, FAN_OPEN
+	},
+	{
+		"don't ignore mount events created inside a parent not watching children",
+		FILE_PATH, FANOTIFY_MOUNT,
+		MNT2_PATH, FANOTIFY_INODE,
+		0,
+		FILE_PATH, FAN_OPEN, FAN_OPEN
+	},
+	{
+		"ignore fs events created inside a parent watching children",
+		FILE_PATH, FANOTIFY_FILESYSTEM,
+		MNT2_PATH, FANOTIFY_INODE,
+		FAN_EVENT_ON_CHILD,
+		FILE_PATH, 0, FAN_OPEN
+	},
+	{
+		"don't ignore fs events created inside a parent not watching children",
+		FILE_PATH, FANOTIFY_FILESYSTEM,
+		MNT2_PATH, FANOTIFY_INODE,
+		0,
+		FILE_PATH, FAN_OPEN, FAN_OPEN
+	},
 };
 
 static int create_fanotify_groups(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 	struct fanotify_mark_type *mark, *ignore_mark;
+	unsigned int mark_ignored, mask;
 	unsigned int p, i;
 	int ret;
 
@@ -272,20 +344,36 @@ static int create_fanotify_groups(unsigned int n)
 			/* Add ignore mark for groups with higher priority */
 			if (p == 0)
 				continue;
+
+			mask = FAN_OPEN;
+			mark_ignored = FAN_MARK_IGNORED_MASK |
+					FAN_MARK_IGNORED_SURV_MODIFY;
+add_mark:
 			ret = fanotify_mark(fd_notify[p][i],
-					    FAN_MARK_ADD | ignore_mark->flag |
-					    FAN_MARK_IGNORED_MASK |
-					    FAN_MARK_IGNORED_SURV_MODIFY,
-					    FAN_OPEN, AT_FDCWD,
-					    tc->ignore_path);
+					    FAN_MARK_ADD | ignore_mark->flag | mark_ignored,
+					    mask, AT_FDCWD, tc->ignore_path);
 			if (ret < 0) {
 				tst_brk(TBROK | TERRNO,
-					"fanotify_mark(%d, FAN_MARK_ADD | %s | "
-					"FAN_MARK_IGNORED_MASK | "
-					"FAN_MARK_IGNORED_SURV_MODIFY, "
-					"FAN_OPEN, AT_FDCWD, %s) failed",
+					"fanotify_mark(%d, FAN_MARK_ADD | %s | %s, "
+					"%x, AT_FDCWD, %s) failed",
 					fd_notify[p][i], ignore_mark->name,
-					tc->ignore_path);
+					mark_ignored ? "FAN_MARK_IGNORED_MASK | "
+					"FAN_MARK_IGNORED_SURV_MODIFY" : "",
+					mask, tc->ignore_path);
+			}
+
+			/*
+			 * If ignored mask is on a parent watching children,
+			 * also set the flag FAN_EVENT_ON_CHILD in mark mask.
+			 * This is needed to indicate that parent ignored mask
+			 * should be applied to events on children.
+			 */
+			if (tc->ignored_onchild && mark_ignored) {
+				mask = tc->ignored_onchild;
+				/* XXX: temporary hack may be removed in the future */
+				mask |= FAN_OPEN;
+				mark_ignored = 0;
+				goto add_mark;
 			}
 		}
 	}
@@ -478,6 +566,7 @@ static struct tst_test test = {
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "9bdda4e9cf2d"},
 		{"linux-git", "2f02fd3fa13e"},
+		{"linux-git", "eca4784cbb18"},
 		{}
 	}
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
