Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDFA5B0250
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Sep 2022 13:03:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF7463CA9A6
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Sep 2022 13:03:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1F263C0162
 for <ltp@lists.linux.it>; Wed,  7 Sep 2022 13:03:37 +0200 (CEST)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B5DDD1400B78
 for <ltp@lists.linux.it>; Wed,  7 Sep 2022 13:03:36 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id bj14so6523321wrb.12
 for <ltp@lists.linux.it>; Wed, 07 Sep 2022 04:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=FXnJvv0ybdSm6+LJ/ZO6kob9483zBepJmQm6OMinjug=;
 b=GGZSFc3us4ragP4t3JlhZMEiQxFlDcfAMbX3AleD7rjN4i6bG+timRBUVb7R6Skv3I
 Cv6Mpqj8aSB0u2wEq1dwz+mmMsEI9iJy3SCQDU3YERfLqYB9ocKP32DV16hT+2ciHM/G
 i92KL2CXCjy8a3Zj6BHUEHsGDZ4ljKSmeVPu6QqGQBrMg/FJLuXUZzcuLCrgEmqEGF2Y
 3+GpEMlUsfpjyIwA4mCj1foEXAz4fu/yXkBh9BI3zgvZt1MI+G2OGt0Egsy49dYwjCK7
 ajqKIGeJ7HsGOxsZRZhMMIxf0nFzIs+++Erwlb6fQU0dQJxo1PLu35XygfFTCb818J0x
 GTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=FXnJvv0ybdSm6+LJ/ZO6kob9483zBepJmQm6OMinjug=;
 b=xJe6Vfx/28HhEiICNfGusiP1q3naMl9H1iJ5GyYpxUqKrTI/FmFZe3Eh4TwDr3AgTi
 h7S5ZLBcsfWEqOTeXNFtIRxtz1V1QL+4CHzPUyYeKPbcK+yKyb2r93fAqSLmVX/ArCHw
 t52wX/+Yu5bVK8/kE80JupZbH3NgH+NtebON+MwArh9SA4xVRQnBhWCF7Rmsvr4EWqYR
 tE2iCG/SAPUy9WzIGad/1cGaUDIEXiWfkrs5EGMjb9tMkWhmzTKwhsyl9z5NtguTa/yJ
 TIBx+dh31ALdTj7pzSYdY/YGv9BEtQHUTB1S6ifQ0pXXGD0U+Mc+J1S7K2axHL+nDwxe
 zbWA==
X-Gm-Message-State: ACgBeo1G035H+MlgfZzXGBH/xHqj5itEGU7iB2vywp2zb51KGcoAlJtH
 93Pj2Ejd1oPlFzHUvH8UWrAx+VkQEr4=
X-Google-Smtp-Source: AA6agR4/1YkkenakJObAXdPcNHwudthSgk9fonqQJroKYGl7WU57fsWStVGgBbtdoy3woSJwFXmeLA==
X-Received: by 2002:a5d:4d0a:0:b0:228:d9c0:5abe with SMTP id
 z10-20020a5d4d0a000000b00228d9c05abemr1801786wrt.693.1662548616068; 
 Wed, 07 Sep 2022 04:03:36 -0700 (PDT)
Received: from localhost.localdomain ([77.137.66.49])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c465600b003a839b9ba0asm23552953wmo.40.2022.09.07.04.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 04:03:35 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  7 Sep 2022 14:03:26 +0300
Message-Id: <20220907110326.2915779-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fanotify09: Make test case definitions more
 readable
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
Cc: Matthew Bobrowski <repnop@google.com>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use explicit field members to initialize test cases and omit
fields initialized to zero to make the definitions more compact
and more readable.

Rename the field s/close_nowrite/event_path to make its meaning
less obscure.

Suggested-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---

Hi Petr,

Here is the cleanup you proposed.
Please check that I did not make any mistakes...

Thanks,
Amir.

 .../kernel/syscalls/fanotify/fanotify09.c     | 203 ++++++++----------
 1 file changed, 94 insertions(+), 109 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index e40916c08..3f2db4709 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -82,145 +82,130 @@ static struct tcase {
 	unsigned int ignore;
 	unsigned int ignore_flags;
 	unsigned int report_name;
-	const char *close_nowrite;
+	const char *event_path;
 	int nevents;
 	unsigned int nonfirst_event;
 } tcases[] = {
 	{
-		"Events on non-dir child with both parent and mount marks",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		0,
-		0, 0,
-		0,
-		DIR_NAME,
-		1, 0,
+		.tname = "Events on non-dir child with both parent and mount marks",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.event_path = DIR_NAME,
+		.nevents = 1,
 	},
 	{
-		"Events on non-dir child and subdir with both parent and mount marks",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		FAN_ONDIR,
-		0, 0,
-		0,
-		DIR_NAME,
-		2, 0,
+		.tname = "Events on non-dir child and subdir with both parent and mount marks",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ondir = FAN_ONDIR,
+		.event_path = DIR_NAME,
+		.nevents = 2,
 	},
 	{
-		"Events on non-dir child and parent with both parent and mount marks",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		FAN_ONDIR,
-		0, 0,
-		0,
-		".",
-		2, 0
+		.tname = "Events on non-dir child and parent with both parent and mount marks",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ondir = FAN_ONDIR,
+		.event_path = ".",
+		.nevents = 2,
 	},
 	{
-		"Events on non-dir child and subdir with both parent and subdir marks",
-		INIT_FANOTIFY_MARK_TYPE(INODE),
-		FAN_ONDIR,
-		0, 0,
-		0,
-		DIR_NAME,
-		2, 0,
+		.tname = "Events on non-dir child and subdir with both parent and subdir marks",
+		.mark = INIT_FANOTIFY_MARK_TYPE(INODE),
+		.ondir = FAN_ONDIR,
+		.event_path = DIR_NAME,
+		.nevents = 2,
 	},
 	{
-		"Events on non-dir children with both parent and mount marks",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		0,
-		0, 0,
-		0,
-		FILE2_NAME,
-		2, FAN_CLOSE_NOWRITE,
+		.tname = "Events on non-dir children with both parent and mount marks",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.event_path = FILE2_NAME,
+		.nevents = 2,
+		.nonfirst_event = FAN_CLOSE_NOWRITE,
 	},
 	{
-		"Events on non-dir child with both parent and mount marks and filename info",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		0,
-		0, 0,
-		FAN_REPORT_DFID_NAME,
-		FILE2_NAME,
-		2, FAN_CLOSE_NOWRITE,
+		.tname = "Events on non-dir child with both parent and mount marks and filename info",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.report_name = FAN_REPORT_DFID_NAME,
+		.event_path = FILE2_NAME,
+		.nevents = 2,
+		.nonfirst_event = FAN_CLOSE_NOWRITE,
 	},
 	{
-		"Events on non-dir child with ignore mask on parent",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		0,
-		FAN_MARK_IGNORED_MASK, 0,
-		0,
-		DIR_NAME,
-		1, 0,
+		.tname = "Events on non-dir child with ignore mask on parent",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ignore = FAN_MARK_IGNORED_MASK,
+		.event_path = DIR_NAME,
+		.nevents = 1,
 	},
 	{
-		"Events on non-dir children with surviving ignore mask on parent",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		0,
-		FAN_MARK_IGNORED_MASK | FAN_MARK_IGNORED_SURV_MODIFY, 0,
-		0,
-		FILE2_NAME,
-		2, FAN_CLOSE_NOWRITE,
+		.tname = "Events on non-dir children with surviving ignore mask on parent",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ignore = FAN_MARK_IGNORED_MASK | FAN_MARK_IGNORED_SURV_MODIFY,
+		.event_path = FILE2_NAME,
+		.nevents = 2,
+		.nonfirst_event = FAN_CLOSE_NOWRITE,
 	},
 	/* FAN_MARK_IGNORE test cases: */
 	{
-		"Events on dir with ignore mask that does not apply to dirs",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		FAN_ONDIR,
-		FAN_MARK_IGNORE_SURV, 0,
-		0,
-		".",
-		2, FAN_CLOSE_NOWRITE,
+		.tname = "Events on dir with ignore mask that does not apply to dirs",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ondir = FAN_ONDIR,
+		.ignore = FAN_MARK_IGNORE_SURV,
+		.event_path = ".",
+		.nevents = 2,
+		.nonfirst_event = FAN_CLOSE_NOWRITE,
 	},
 	{
-		"Events on dir with ignore mask that does apply to dirs",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		FAN_ONDIR,
-		FAN_MARK_IGNORE_SURV, FAN_ONDIR,
-		0,
-		".",
-		2, 0,
+		.tname = "Events on dir with ignore mask that does apply to dirs",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ondir = FAN_ONDIR,
+		.ignore = FAN_MARK_IGNORE_SURV,
+		.ignore_flags = FAN_ONDIR,
+		.event_path = ".",
+		.nevents = 2,
 	},
 	{
-		"Events on child with ignore mask on parent that does not apply to children",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		0,
-		FAN_MARK_IGNORE_SURV, 0,
-		0,
-		FILE2_NAME,
-		2, FAN_CLOSE_NOWRITE,
+		.tname = "Events on child with ignore mask on parent that does not apply to children",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ignore = FAN_MARK_IGNORE_SURV,
+		.event_path = FILE2_NAME,
+		.nevents = 2,
+		.nonfirst_event = FAN_CLOSE_NOWRITE,
 	},
 	{
-		"Events on child with ignore mask on parent that does apply to children",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		0,
-		FAN_MARK_IGNORE_SURV, FAN_EVENT_ON_CHILD,
-		0,
-		FILE2_NAME,
-		2, 0,
+		.tname = "Events on child with ignore mask on parent that does apply to children",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ignore = FAN_MARK_IGNORE_SURV,
+		.ignore_flags = FAN_EVENT_ON_CHILD,
+		.event_path = FILE2_NAME,
+		.nevents = 2,
 	},
 	{
-		"Events on subdir with ignore mask on parent that does not apply to children",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		FAN_ONDIR,
-		FAN_MARK_IGNORE_SURV, FAN_ONDIR,
-		0,
-		DIR_NAME,
-		2, FAN_CLOSE_NOWRITE,
+		.tname = "Events on subdir with ignore mask on parent that does not apply to children",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ondir = FAN_ONDIR,
+		.ignore = FAN_MARK_IGNORE_SURV,
+		.ignore_flags = FAN_ONDIR,
+		.event_path = DIR_NAME,
+		.nevents = 2,
+		.nonfirst_event = FAN_CLOSE_NOWRITE,
 	},
 	{
-		"Events on subdir with ignore mask on parent that does not apply to dirs",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		FAN_ONDIR,
-		FAN_MARK_IGNORE_SURV, FAN_EVENT_ON_CHILD,
-		0,
-		DIR_NAME,
-		2, FAN_CLOSE_NOWRITE,
+		.tname = "Events on subdir with ignore mask on parent that does not apply to dirs",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ondir = FAN_ONDIR,
+		.ignore = FAN_MARK_IGNORE_SURV,
+		.ignore_flags = FAN_EVENT_ON_CHILD,
+		.event_path = DIR_NAME,
+		.nevents = 2,
+		.nonfirst_event = FAN_CLOSE_NOWRITE,
 	},
 	{
-		"Events on subdir with ignore mask on parent that does apply to subdirs",
-		INIT_FANOTIFY_MARK_TYPE(MOUNT),
-		FAN_ONDIR,
-		FAN_MARK_IGNORE_SURV, FAN_EVENT_ON_CHILD | FAN_ONDIR,
-		0,
-		DIR_NAME,
-		2, 0,
+		.tname = "Events on subdir with ignore mask on parent that does apply to subdirs",
+		.mark = INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		.ondir = FAN_ONDIR,
+		.ignore = FAN_MARK_IGNORE_SURV,
+		.ignore_flags = FAN_EVENT_ON_CHILD | FAN_ONDIR,
+		.event_path = DIR_NAME,
+		.nevents = 2,
 	},
 };
 
@@ -261,7 +246,7 @@ static void create_fanotify_groups(struct tcase *tc)
 		SAFE_FANOTIFY_MARK(fd_notify[i],
 				    FAN_MARK_ADD | mark->flag,
 				    FAN_CLOSE_NOWRITE | mask_flags,
-				    AT_FDCWD, tc->close_nowrite);
+				    AT_FDCWD, tc->event_path);
 
 		/*
 		 * Add inode mark on parent for each group with MODIFY event,
@@ -415,7 +400,7 @@ static void test_fanotify(unsigned int n)
 	/*
 	 * generate FAN_CLOSE_NOWRITE event on a child, subdir or "."
 	 */
-	dirfd = SAFE_OPEN(tc->close_nowrite, O_RDONLY);
+	dirfd = SAFE_OPEN(tc->event_path, O_RDONLY);
 	SAFE_CLOSE(dirfd);
 
 	/*
@@ -443,7 +428,7 @@ static void test_fanotify(unsigned int n)
 	}
 	if (tc->nevents > 1 && FAN_EVENT_OK(event, ret)) {
 		verify_event(0, event, FAN_CLOSE_NOWRITE,
-			     tc->report_name ? (tc->ondir ? "." : tc->close_nowrite) : "");
+			     tc->report_name ? (tc->ondir ? "." : tc->event_path) : "");
 		event = FAN_EVENT_NEXT(event, ret);
 	}
 	if (ret > 0) {
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
