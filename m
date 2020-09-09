Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC61D26352C
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 818E13C267D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BDE003C3228
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:27 +0200 (CEST)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6A537140074B
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:27 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id w2so3163028wmi.1
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PzJEgBHJwFG7cam8Xnz7ZG0KIsjKVA8HlbRTsFKM5HI=;
 b=WcBGDD8p44TOAXzx7mtSdlNQSDz1TSAL9IEpk2Rdno6rB5U7K2nSlU52TFOqNmitli
 /tANCzoZ+7NzxL3PHkxxwtZbXdQFnbsY4mRFM8GQYNcP/5+aQhtFqAWFe5PGgpwhquAL
 tRpI2m3GNXdeESWS52O5Eg5HRcq5gMNWVAbqdfQitv2Qgy2rIfuCSwOGleXxvhaUQmsP
 564t88KFntDXZEipnEFNl508X4swVFNolOBmmsOnZ1u6sgLT3rbfyEZeRPb3982Lah4c
 ybZHzQdp2wd1KjRlsvqENSlPJGO5+Im9ymwKVG8eOd7IAWTLGWfRPaUT9qtV2rvGiDNH
 o5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PzJEgBHJwFG7cam8Xnz7ZG0KIsjKVA8HlbRTsFKM5HI=;
 b=hSs+rN9FnR6A10gDqHcm4x6ff6Eg2r9yv4U/MW+gZ1i2avmazCInd1o19LLYLlNIG+
 f66y1Lumjsbh4sLGpl5ufEKaJY/wbgIeniJ2lmLvhRqrnU9TG7CAfYj4BTaZRx5Ifi/6
 Oqm73ExqHZaIw9kldAyolT7mKBZE4LzsyqfEm/6EyU8p/vBh7/jvcyJnzmNkGD9XPVUa
 C7rECV6n1NTTt6bQGHwftfkQdggIzUsDkAi47Svl2MX/Hc02z/bUvYSTvIg8DmnuajZJ
 tT1WUZRJTu1f8gbxjbfj4FHw1/HT+bAWIda62Y+dxmicJX8quqKjMRdMzjc08sRrgzaT
 Ejaw==
X-Gm-Message-State: AOAM531sHn5B7hXmDFf/EeDxGoHPgrn9/4MasS2DPBFS8ib38iKCwxFl
 6mNKDF1CdsMTf3SDGoIfWfE=
X-Google-Smtp-Source: ABdhPJwK02q/NwLB5HBM4GiyRVUeTTksuEwtPv4ivdC+9wyABYH3fomqIa5NCWPih+J2dKZZFfQNQg==
X-Received: by 2002:a7b:c241:: with SMTP id b1mr4658439wmj.98.1599674246910;
 Wed, 09 Sep 2020 10:57:26 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:26 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:57:05 +0300
Message-Id: <20200909175707.10670-9-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 08/10] syscalls/fanotify09: Add test case with parent
 and subdir marks
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

This test checks handling of events with both parent and mount marks.
Generalize the test, and add test case of both parent and subdir marks.

Verified that existing test cases still fail on old kernels without the
relevant fix commits.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify09.c     | 57 ++++++++++++-------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index 4336f498f..83210bc1c 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -6,17 +6,17 @@
  *
  * DESCRIPTION
  *     Check that fanotify handles events on children correctly when
- *     both inode and mountpoint marks exist.
+ *     both parent and subdir or mountpoint marks exist.
  *
  * This is a regression test for commit 54a307ba8d3c:
  *
  *      fanotify: fix logic of events on child
  *
- * Test case #2 is a regression test for commit b469e7e47c8a:
+ * Test case #1 is a regression test for commit b469e7e47c8a:
  *
  *      fanotify: fix handling of events on child sub-directory
  *
- * Test case #3 is a regression test for commit 55bf882c7f13:
+ * Test case #2 is a regression test for commit 55bf882c7f13:
  *
  *      fanotify: fix merging marks masks with FAN_ONDIR
  */
@@ -60,33 +60,45 @@ static int mount_created;
 
 static struct tcase {
 	const char *tname;
+	struct fanotify_mark_type mark;
 	unsigned int ondir;
 	const char *testdir;
 	int nevents;
 } tcases[] = {
 	{
-		"Events on children with both inode and mount marks",
+		"Events on non-dir child with both parent and mount marks",
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
 		0,
 		DIR_NAME,
 		1,
 	},
 	{
-		"Events on children and subdirs with both inode and mount marks",
+		"Events on non-dir child and subdir with both parent and mount marks",
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
 		FAN_ONDIR,
 		DIR_NAME,
 		2,
 	},
 	{
-		"Events on files and dirs with both inode and mount marks",
+		"Events on non-dir child and parent with both parent and mount marks",
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
 		FAN_ONDIR,
 		".",
 		2,
 	},
+	{
+		"Events on non-dir child and subdir with both parent and subdir marks",
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_ONDIR,
+		DIR_NAME,
+		2,
+	},
 };
 
-static void create_fanotify_groups(unsigned int ondir)
+static void create_fanotify_groups(struct tcase *tc)
 {
-	unsigned int i, onchild;
+	struct fanotify_mark_type *mark = &tc->mark;
+	unsigned int i, onchild, ondir = tc->ondir;
 	int ret;
 
 	for (i = 0; i < NUM_GROUPS; i++) {
@@ -94,22 +106,25 @@ static void create_fanotify_groups(unsigned int ondir)
 						  FAN_NONBLOCK,
 						  O_RDONLY);
 
-		/* Add mount mark for each group without MODIFY event */
+		/*
+		 * Add subdir or mount mark for each group with CLOSE event,
+		 * but only the first group requests events on dir.
+		 */
 		onchild = (i == 0) ? FAN_EVENT_ON_CHILD | ondir : 0;
 		ret = fanotify_mark(fd_notify[i],
-				    FAN_MARK_ADD | FAN_MARK_MOUNT,
+				    FAN_MARK_ADD | mark->flag,
 				    FAN_CLOSE_NOWRITE | onchild,
-				    AT_FDCWD, ".");
+				    AT_FDCWD, tc->testdir);
 		if (ret < 0) {
 			tst_brk(TBROK | TERRNO,
-				"fanotify_mark(%d, FAN_MARK_ADD | "
-				"FAN_MARK_MOUNT, FAN_MODIFY%s, AT_FDCWD,"
-				" '.') failed", fd_notify[i],
-				ondir ? " | FAN_ONDIR" : "");
+				"fanotify_mark(%d, FAN_MARK_ADD | %s, "
+				"%x, AT_FDCWD, '%s') failed",
+				fd_notify[i], mark->name,
+				FAN_CLOSE_NOWRITE | ondir, tc->testdir);
 		}
 		/*
-		 * Add inode mark on parent for each group with MODIFY
-		 * event, but only one group requests events on child.
+		 * Add inode mark on parent for each group with MODIFY event,
+		 * but only the first group requests events on child.
 		 * The one mark with FAN_EVENT_ON_CHILD is needed for
 		 * setting the DCACHE_FSNOTIFY_PARENT_WATCHED dentry
 		 * flag.
@@ -120,10 +135,8 @@ static void create_fanotify_groups(unsigned int ondir)
 		if (ret < 0) {
 			tst_brk(TBROK | TERRNO,
 				"fanotify_mark(%d, FAN_MARK_ADD, "
-				"FAN_MODIFY%s%s, AT_FDCWD, '.') failed",
-				fd_notify[i],
-				ondir ? " | FAN_ONDIR" : "",
-				onchild ? " | FAN_EVENT_ON_CHILD" : "");
+				"%x, AT_FDCWD, '.') failed",
+				fd_notify[i], FAN_MODIFY | ondir | onchild);
 		}
 	}
 }
@@ -179,7 +192,7 @@ static void test_fanotify(unsigned int n)
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
 
-	create_fanotify_groups(tc->ondir);
+	create_fanotify_groups(tc);
 
 	/*
 	 * generate MODIFY event and no FAN_CLOSE_NOWRITE event.
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
