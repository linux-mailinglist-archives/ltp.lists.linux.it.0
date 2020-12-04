Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF832CEB87
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:00:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A5363C2413
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:00:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4C4753C6329
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:39 +0100 (CET)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 704B210011A0
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:39 +0100 (CET)
Received: by mail-ej1-x642.google.com with SMTP id n26so7820233eju.6
 for <ltp@lists.linux.it>; Fri, 04 Dec 2020 01:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YM/jk+yHn1iKSieqhtotMht3S5NyPNM+ANvhTKQrMY=;
 b=n5Sqku2eVbHvjjw7TE5MO74Ch3h9KxImDFVfxDSFzcnH5g5WDLPC1Eg0yUhhyC6KVM
 u+lS2Mia7K3rAjEBl6Wq7W4Dytt+3Heu3BI5kNMBFpf1FOIr6K5WPUXH74zHbNUoKbFg
 rjv+jZu7oB5jDBOzpFAFM9KufRZGcT7lbjDAuetEHtRXKzVSaLetp3hCzYXKjOqWBFoI
 lcRRD42oYbf3Cs0Cl4Hjo8RocuOd3N3r6rD8+ybQkqxOLqJYNTOeY2HigpvvakMUsUdr
 O9ljqMrB6XG/uemK8mbPmhZ+uZDrvFUf6Szw/pX8/pOOJmqC5M1XSEywNvLvWfE1EbTP
 95Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YM/jk+yHn1iKSieqhtotMht3S5NyPNM+ANvhTKQrMY=;
 b=mvK3fjNF550u1XL9JRScqIGoWWygo3QMfVNDK9uvMLUNJMyQgh/KtG5mHfl+V7h9+1
 RFpP9crvK8i0Kycza7sESH0/jzucInIa8iJitPH7T7iinvSIoL07oVuRzlcSm8Uiytt1
 OB4qF9szcYN+Ju/cXdDd+a4jj3B0PnkoyGmrZACmVooNqIFuGH8twBDMOJ+pWTSY+NBH
 RDsK5QVckihWsbEZJQSUHhF+s7HBBLOZtzUVk6B1tFpvoUM/QsnSASmYW50hScUEo0XZ
 y28Lfm+n3N15WMMRGw9tYg054yhk+WFN5TUpk441+1JLk4q4ysv1iR75Vn3UMYklTX0z
 SEwQ==
X-Gm-Message-State: AOAM530g+PO9esnVXNbvVA3qiy4tj/R5VaqIIsXVPiGq4wHIURQjmaV7
 kiDvHneMt6v5itZstcOsWcZaLzudo1A=
X-Google-Smtp-Source: ABdhPJzbQ5qBu6hHmVOfMnRiVM2rIyhb1rCPU3X/wsRwuM5A44m34HN0haPY+VpKotPQgKy443XXgg==
X-Received: by 2002:a17:907:3e17:: with SMTP id
 hp23mr6223965ejc.545.1607075979027; 
 Fri, 04 Dec 2020 01:59:39 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id qp16sm2701811ejb.74.2020.12.04.01.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:59:38 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri,  4 Dec 2020 11:59:29 +0200
Message-Id: <20201204095930.866421-5-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204095930.866421-1-amir73il@gmail.com>
References: <20201204095930.866421-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] syscalls/fanotify09: Add test case with two
 non-dir children
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The existing test cases generate FAN_MODIFY event on a non-dir child
and FAN_CLOSE_NOWRITE event the parent or sibling subdir.

Add a test case that generates FAN_CLOSE_NOWRITE on a sibling non-dir
child.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify09.c     | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index 7bb901cf3..0f1923981 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -55,13 +55,14 @@ static char event_buf[EVENT_BUF_LEN];
 
 #define MOUNT_NAME "mntpoint"
 #define DIR_NAME "testdir"
+#define FILE2_NAME "testfile"
 static int mount_created;
 
 static struct tcase {
 	const char *tname;
 	struct fanotify_mark_type mark;
 	unsigned int ondir;
-	const char *testdir;
+	const char *close_nowrite;
 	int nevents;
 } tcases[] = {
 	{
@@ -92,6 +93,13 @@ static struct tcase {
 		DIR_NAME,
 		2,
 	},
+	{
+		"Events on non-dir children with both parent and mount marks",
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		0,
+		FILE2_NAME,
+		2,
+	},
 };
 
 static void create_fanotify_groups(struct tcase *tc)
@@ -112,7 +120,7 @@ static void create_fanotify_groups(struct tcase *tc)
 		SAFE_FANOTIFY_MARK(fd_notify[i],
 				    FAN_MARK_ADD | mark->flag,
 				    FAN_CLOSE_NOWRITE | onchild,
-				    AT_FDCWD, tc->testdir);
+				    AT_FDCWD, tc->close_nowrite);
 
 		/*
 		 * Add inode mark on parent for each group with MODIFY event,
@@ -216,9 +224,9 @@ static void test_fanotify(unsigned int n)
 	 */
 	SAFE_FILE_PRINTF(fname, "1");
 	/*
-	 * generate FAN_CLOSE_NOWRITE event on a testdir (subdir or ".")
+	 * generate FAN_CLOSE_NOWRITE event on a child, subdir or "."
 	 */
-	dirfd = SAFE_OPEN(tc->testdir, O_RDONLY);
+	dirfd = SAFE_OPEN(tc->close_nowrite, O_RDONLY);
 	if (dirfd >= 0)
 		SAFE_CLOSE(dirfd);
 
@@ -243,7 +251,7 @@ static void test_fanotify(unsigned int n)
 	event = (struct fanotify_event_metadata *)event_buf;
 	verify_event(0, event, FAN_MODIFY, "");
 	event = FAN_EVENT_NEXT(event, ret);
-	if (tc->ondir) {
+	if (tc->nevents > 1) {
 		verify_event(0, event, FAN_CLOSE_NOWRITE, "");
 		event = FAN_EVENT_NEXT(event, ret);
 	}
@@ -260,14 +268,23 @@ static void test_fanotify(unsigned int n)
 
 	/*
 	 * Then verify the rest of the groups did not get the MODIFY event and
-	 * did not get the FAN_CLOSE_NOWRITE event on testdir.
+	 * got the FAN_CLOSE_NOWRITE event only on a non-directory.
 	 */
 	for (i = 1; i < NUM_GROUPS; i++) {
-		ret = read(fd_notify[i], event_buf, FAN_EVENT_METADATA_LEN);
+		ret = read(fd_notify[i], event_buf, EVENT_BUF_LEN);
 		if (ret > 0) {
-			event_res(TFAIL, i, event, "");
-			if (event->fd != FAN_NOFD)
-				SAFE_CLOSE(event->fd);
+			uint32_t expect = 0;
+
+			if (tc->nevents > 1 && !tc->ondir)
+				expect = FAN_CLOSE_NOWRITE;
+
+			event = (struct fanotify_event_metadata *)event_buf;
+			verify_event(i, event, expect, "");
+
+			for (; FAN_EVENT_OK(event, ret); FAN_EVENT_NEXT(event, ret)) {
+				if (event->fd != FAN_NOFD)
+					SAFE_CLOSE(event->fd);
+			}
 			continue;
 		}
 
@@ -295,6 +312,7 @@ static void setup(void)
 
 	sprintf(fname, "tfile_%d", getpid());
 	SAFE_FILE_PRINTF(fname, "1");
+	SAFE_FILE_PRINTF(FILE2_NAME, "1");
 }
 
 static void cleanup(void)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
