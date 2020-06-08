Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0871F12FE
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 08:43:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23A4E3C2E8E
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 08:43:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C9F623C1484
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 08:43:39 +0200 (CEST)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 089D8140119E
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 08:43:39 +0200 (CEST)
Received: by mail-ed1-x542.google.com with SMTP id x93so12413683ede.9
 for <ltp@lists.linux.it>; Sun, 07 Jun 2020 23:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UFKh7yTK9PtVxKPUflP4xaaLO/jfGh5NfQ1OQoQxPQk=;
 b=QCPHnbR2XljgSWxcTqDz7so2wpRtGELXUuBak2YZrzwIvkOU+P3bwePdCsVsWKv9/3
 1Iur1aoMEerU+NPUgT/Kc1idGPb4cRyHT4kBM5qABTvp5eL3SYoBuzzhOe5ylCujoEWk
 eemeKdZh1qRuHFMyeTUf4XBD4JytD67M2GzolFrK2HV3xU3Oz7ttcIGwEwE7P5ZdZeOf
 S9+/XzCmCr7W/fC7ZpJY8I6GSWY64o2Ffy80R4srJh13efPkyCpt3jCMmh7BiyNtK1CP
 eDsUMKqDY6x1SxZVlrIFHbOQon8/S+ciG5O0ukHPtsuRfCKwqa7y0dPm2ZhHsk9kUqru
 mObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UFKh7yTK9PtVxKPUflP4xaaLO/jfGh5NfQ1OQoQxPQk=;
 b=H93g/u1LYRHRB0uZBa3s+GvjfSvTGJHCa+Gc//eLH/uOiBt4W2mW9riuYAjV504Zyy
 qWFQvfruR31zusbwzaFTRAAOMHGXmGv0kl9ZFO4iizOtu7vuAvvGeioRVaN9OzfrVQ9L
 SVrEJuT3EdQsjQHiuRMIF1hdXuWYy/oBQju4ZVWpmMwe6x4iWnsoF31j9DpeBMVXUhXT
 Hva96B/geiBa0j7249fYnx6m00GfnuSYorMQoEToaPiPgZ+5CXm1tYl9XpFoishoSsEq
 iPoNprl3YWSCHCNO/MpH0HOkcJ2WQIsSKzFfes/ZEYvHyvNrjY+51pbKlJd7TOZz8RLW
 yY8A==
X-Gm-Message-State: AOAM533pLfIIlLYg8cSoG6dc84kilXmdU3uH0ZCfv/BOqbHFEWhVuEUz
 LGWjahwL/0BL+mAQ44Ixdxk=
X-Google-Smtp-Source: ABdhPJygtsXSDTcIc1B0VGG69xuikmZd8UXjBmPZli1Cgcb9veBviLf+7QK/sKwVjjsmei/A4w6UUQ==
X-Received: by 2002:aa7:cdda:: with SMTP id h26mr20896556edw.327.1591598618605; 
 Sun, 07 Jun 2020 23:43:38 -0700 (PDT)
Received: from localhost.localdomain ([5.102.204.95])
 by smtp.gmail.com with ESMTPSA id gt26sm9955309ejb.107.2020.06.07.23.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 23:43:38 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon,  8 Jun 2020 09:43:29 +0300
Message-Id: <20200608064329.26243-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fanotify10: Add a test case for ignore mask
 and events on child
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

Add a regression test case for kernel commit 2f02fd3fa13e:

    fanotify: fix ignore mask logic for events on child and on dir

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify10.c     | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index ef0807761..3cdb25a73 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -15,6 +15,10 @@
  * This is a regression test for commit:
  *
  *     9bdda4e9cf2d fsnotify: fix ignore mask logic in fsnotify()
+ *
+ * Test case #16 is a regression test for commit:
+ *
+ *     2f02fd3fa13e fanotify: fix ignore mask logic for events on child...
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -193,7 +197,13 @@ static struct tcase {
 		MNT2_PATH, FANOTIFY_MOUNT,
 		FILE_EXEC_PATH, FAN_OPEN | FAN_OPEN_EXEC,
 		FAN_OPEN | FAN_OPEN_EXEC
-	}
+	},
+	{
+		"ignore child exec events created on a specific mount point",
+		MOUNT_PATH, FANOTIFY_INODE,
+		MOUNT_PATH, FANOTIFY_MOUNT,
+		FILE_EXEC_PATH, FAN_OPEN_EXEC, FAN_OPEN | FAN_OPEN_EXEC
+	},
 };
 
 static int create_fanotify_groups(unsigned int n)
@@ -212,10 +222,16 @@ static int create_fanotify_groups(unsigned int n)
 							     FAN_NONBLOCK,
 							     O_RDONLY);
 
-			/* Add mark for each group */
+			/*
+			 * Add mark for each group.
+			 *
+			 * FAN_EVENT_ON_CHILD has no effect on filesystem/mount
+			 * or inode mark on non-directory.
+			 */
 			ret = fanotify_mark(fd_notify[p][i],
 					    FAN_MARK_ADD | mark->flag,
-					    tc->expected_mask_without_ignore,
+					    tc->expected_mask_without_ignore |
+					    FAN_EVENT_ON_CHILD,
 					    AT_FDCWD, tc->mark_path);
 			if (ret < 0) {
 				if (errno == EINVAL &&
@@ -445,6 +461,7 @@ static struct tst_test test = {
 	.resource_files = resource_files,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "9bdda4e9cf2d"},
+		{"linux-git", "2f02fd3fa13e"},
 		{}
 	}
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
