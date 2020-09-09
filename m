Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA3D26352D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01B993C2C31
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3443C3C2C31
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:29 +0200 (CEST)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B0A19600688
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:28 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id a65so3146053wme.5
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t2O37RCqEx+vn37GcxSotW78+DpeKvQ+YAeDwzG1GYc=;
 b=LnYzyhmIHsDZafd0UWfyAMg2TKDUpZAQVqJPf+EydhWG2LtvN1pF9UMsscG215nI+U
 0WgGZAvXADndP7U3SKjS75dm3aO7kH1hJE6aSLdiST9sV+/5fQwb/qh0N4slBpI/4coy
 QMXKbTD215PIGCnDFOI9NohxyXwsrhSUesRRaHYMuj6BkNPisaEAiSJry+bOx3tH7uzS
 6tmKFYyTt5QmEiuWpEhu61CuKtnXKXDpyYRUdF8H4yNRSvO5Qn+yLAZqBI3J6cs9v6eq
 wHd4W+VrUKy6p8tKPBXAd4btMMNQmbT5Nfwow87NQpb5XaJ6C/fyPfVG5FHpbFi1MEQM
 C7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t2O37RCqEx+vn37GcxSotW78+DpeKvQ+YAeDwzG1GYc=;
 b=Tiad/HHBgb1xY7Mg0MlAsoXaz5VoFauCxUmK45ZTL5EgcMk8Mq61ZMFzk46WZs4ewr
 ObQISk4C2NxxJc6Q3yDcY1mQaEGbpzhHdrbKdnm20NP7c/0danvnn7bUiO/eAk4Rc6sX
 6OTXHhN3gIOTtwySiiWJAph+A6o51d1ACCfNT/01ANyu3dOTXP4V5rsJUjDJmRGgDzMz
 Zco04vtftRYO2ULZdBNpSmFlV/R5wM6/L5QoafkZ0SlJPGQ2B1ILjLCTSNRfKBsQNpoL
 w1LoCkVNEHWAAXQPmG0VAA4m8FKKZfRZ+kxgYP3+lJ3f7605uzAsB0zMG2Z42GSgzcxA
 uCKw==
X-Gm-Message-State: AOAM532MfdyUcNRJsNhwZ1FzvWpLlsrm87txQs6uf7N9H5v8XSpxMxw7
 vv6Vr0M+Z/lN0LPKMIOtpwxKNn/52L4=
X-Google-Smtp-Source: ABdhPJzpJ/knGa1ISiMHpqAtN2X9UtZC5WNcbnlHXteLnh8tgIOaJdXGL8fF+XB96TgBjx+WyvmX/g==
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr4781005wml.42.1599674248197; 
 Wed, 09 Sep 2020 10:57:28 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:27 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:57:06 +0300
Message-Id: <20200909175707.10670-10-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 09/10] syscalls/fanotify10: Test with group flag
 FAN_REPORT_NAME
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

The group flag FAN_REPORT_NAME could change the behavior of merging
inode mark mask with sb/mount marks.

Add another group class with flag FAN_REPORT_NAME to see how it affects
merging of events on kernels that support FAN_REPORT_NAME.

On old kernels without FAN_REPORT_NAME support, the new group class is
not tested.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify10.c     | 72 +++++++++++--------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index 3cdb25a73..9ebb6d68f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -45,16 +45,18 @@
 /* reasonable guess as to size of 1024 events */
 #define EVENT_BUF_LEN        (EVENT_MAX * EVENT_SIZE)
 
-static unsigned int fanotify_prio[] = {
+static unsigned int fanotify_class[] = {
 	FAN_CLASS_PRE_CONTENT,
 	FAN_CLASS_CONTENT,
-	FAN_CLASS_NOTIF
+	FAN_CLASS_NOTIF,
+	/* Reporting dfid+name+fid merges events similar to reporting fd */
+	FAN_REPORT_DFID_NAME_FID,
 };
-#define FANOTIFY_PRIORITIES ARRAY_SIZE(fanotify_prio)
+#define NUM_CLASSES ARRAY_SIZE(fanotify_class)
 
 #define GROUPS_PER_PRIO 3
 
-static int fd_notify[FANOTIFY_PRIORITIES][GROUPS_PER_PRIO];
+static int fd_notify[NUM_CLASSES][GROUPS_PER_PRIO];
 
 static char event_buf[EVENT_BUF_LEN];
 
@@ -75,6 +77,7 @@ static char event_buf[EVENT_BUF_LEN];
 
 static pid_t child_pid;
 static int bind_mount_created;
+static unsigned int num_classes = NUM_CLASSES;
 
 enum {
 	FANOTIFY_INODE,
@@ -216,11 +219,23 @@ static int create_fanotify_groups(unsigned int n)
 	mark = &fanotify_mark_types[tc->mark_type];
 	ignore_mark = &fanotify_mark_types[tc->ignore_mark_type];
 
-	for (p = 0; p < FANOTIFY_PRIORITIES; p++) {
+	for (p = 0; p < num_classes; p++) {
 		for (i = 0; i < GROUPS_PER_PRIO; i++) {
-			fd_notify[p][i] = SAFE_FANOTIFY_INIT(fanotify_prio[p] |
-							     FAN_NONBLOCK,
-							     O_RDONLY);
+			fd_notify[p][i] = fanotify_init(fanotify_class[p] |
+							FAN_NONBLOCK, O_RDONLY);
+			if (fd_notify[p][i] == -1) {
+				if (errno == EINVAL &&
+				    fanotify_class[p] & FAN_REPORT_NAME) {
+					tst_res(TCONF,
+						"FAN_REPORT_NAME not supported by kernel?");
+					/* Do not try creating this group again */
+					num_classes--;
+					return -1;
+				}
+
+				tst_brk(TBROK | TERRNO,
+					"fanotify_init(%x, 0) failed", fanotify_class[p]);
+			}
 
 			/*
 			 * Add mark for each group.
@@ -281,7 +296,7 @@ static void cleanup_fanotify_groups(void)
 {
 	unsigned int i, p;
 
-	for (p = 0; p < FANOTIFY_PRIORITIES; p++) {
+	for (p = 0; p < num_classes; p++) {
 		for (i = 0; i < GROUPS_PER_PRIO; i++) {
 			if (fd_notify[p][i] > 0)
 				SAFE_CLOSE(fd_notify[p][i]);
@@ -289,22 +304,23 @@ static void cleanup_fanotify_groups(void)
 	}
 }
 
-static void verify_event(int group, struct fanotify_event_metadata *event,
+static void verify_event(int p, int group, struct fanotify_event_metadata *event,
 			 unsigned long long expected_mask)
 {
 	if (event->mask != expected_mask) {
-		tst_res(TFAIL, "group %d got event: mask %llx (expected %llx) "
-			"pid=%u fd=%u", group, (unsigned long long)event->mask,
+		tst_res(TFAIL, "group %d (%x) got event: mask %llx (expected %llx) "
+			"pid=%u fd=%u", group, fanotify_class[p],
+			(unsigned long long) event->mask,
 			(unsigned long long) expected_mask,
 			(unsigned)event->pid, event->fd);
 	} else if (event->pid != child_pid) {
-		tst_res(TFAIL, "group %d got event: mask %llx pid=%u "
-			"(expected %u) fd=%u", group,
+		tst_res(TFAIL, "group %d (%x) got event: mask %llx pid=%u "
+			"(expected %u) fd=%u", group, fanotify_class[p],
 			(unsigned long long)event->mask, (unsigned)event->pid,
 			(unsigned)getpid(), event->fd);
 	} else {
-		tst_res(TPASS, "group %d got event: mask %llx pid=%u fd=%u",
-			group, (unsigned long long)event->mask,
+		tst_res(TPASS, "group %d (%x) got event: mask %llx pid=%u fd=%u",
+			group, fanotify_class[p], (unsigned long long)event->mask,
 			(unsigned)event->pid, event->fd);
 	}
 }
@@ -357,7 +373,7 @@ static void test_fanotify(unsigned int n)
 		tst_brk(TBROK, "Child process terminated incorrectly");
 
 	/* First verify all groups without matching ignore mask got the event */
-	for (p = 0; p < FANOTIFY_PRIORITIES; p++) {
+	for (p = 0; p < num_classes; p++) {
 		if (p > 0 && !tc->expected_mask_with_ignore)
 			break;
 
@@ -365,9 +381,10 @@ static void test_fanotify(unsigned int n)
 			ret = read(fd_notify[p][i], event_buf, EVENT_BUF_LEN);
 			if (ret < 0) {
 				if (errno == EAGAIN) {
-					tst_res(TFAIL, "group %d (prio %d) "
+					tst_res(TFAIL, "group %d (%x) "
 						"with %s did not get event",
-						i, p, mark->name);
+						i, fanotify_class[p], mark->name);
+					continue;
 				}
 				tst_brk(TBROK | TERRNO,
 					"reading fanotify events failed");
@@ -380,12 +397,12 @@ static void test_fanotify(unsigned int n)
 			}
 			event = (struct fanotify_event_metadata *)event_buf;
 			if (ret > (int)event->event_len) {
-				tst_res(TFAIL, "group %d (prio %d) with %s "
+				tst_res(TFAIL, "group %d (%x) with %s "
 					"got more than one event (%d > %d)",
-					i, p, mark->name, ret,
+					i, fanotify_class[p], mark->name, ret,
 					event->event_len);
 			} else {
-				verify_event(i, event, p == 0 ?
+				verify_event(p, i, event, p == 0 ?
 						tc->expected_mask_without_ignore :
 						tc->expected_mask_with_ignore);
 			}
@@ -394,8 +411,7 @@ static void test_fanotify(unsigned int n)
 		}
 	}
 	/* Then verify all groups with matching ignore mask did got the event */
-	for (p = 1; p < FANOTIFY_PRIORITIES &&
-			!tc->expected_mask_with_ignore; p++) {
+	for (p = 1; p < num_classes && !tc->expected_mask_with_ignore; p++) {
 		for (i = 0; i < GROUPS_PER_PRIO; i++) {
 			ret = read(fd_notify[p][i], event_buf, EVENT_BUF_LEN);
 			if (ret == 0) {
@@ -403,15 +419,15 @@ static void test_fanotify(unsigned int n)
 					"zero length read from fanotify fd");
 			}
 			if (ret > 0) {
-				tst_res(TFAIL, "group %d (prio %d) with %s and "
+				tst_res(TFAIL, "group %d (%x) with %s and "
 					"%s ignore mask got event",
-					i, p, mark->name, ignore_mark->name);
+					i, fanotify_class[p], mark->name, ignore_mark->name);
 				if (event->fd != FAN_NOFD)
 					SAFE_CLOSE(event->fd);
 			} else if (errno == EAGAIN) {
-				tst_res(TPASS, "group %d (prio %d) with %s and "
+				tst_res(TPASS, "group %d (%x) with %s and "
 					"%s ignore mask got no event",
-					i, p, mark->name, ignore_mark->name);
+					i, fanotify_class[p], mark->name, ignore_mark->name);
 			} else {
 				tst_brk(TBROK | TERRNO,
 					"reading fanotify events failed");
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
