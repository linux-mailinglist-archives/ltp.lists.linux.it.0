Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2DC18EE8B
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 04:34:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B77AC3C4F29
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 04:34:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EA6643C03CC
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 04:34:23 +0100 (CET)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CD13260076E
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 04:34:22 +0100 (CET)
Received: by mail-pg1-x542.google.com with SMTP id z72so6500565pgz.3
 for <ltp@lists.linux.it>; Sun, 22 Mar 2020 20:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bKLyWQBorb17CQY5pI0SkW/jQ2qEKd9n2jxIzZKTm0=;
 b=Ch21XVbD+dwp4gF07qvRleDF2nWHYyjdd4Iqj+276gSxlYcQjLeQ56M86YY9TTyDKT
 Nu56DfsZal2T9R4j3U2EAohASJtufHlge70VZQ0Lf7qbjUiu8Wz/SEfipRvaHNSYhWkg
 7sRC9z2OHXOw1l2e2sbTivxJR9z5c+OrCG4/QhkMmuSQ5qtv/uEKDchYn8PudMKEvv0u
 s/5CJ1OvNihn4NGHd9QCXklmYyYMz/UvhJR2aPqVSSJ/ipRglLG4fIFota8BFU1l+JU/
 MWMjHiYdmiBOSWhj59Cp3NpUOmu5b3CUi4KvUZT7TORAzZgy0leX42GqvmpdIqudm29U
 u+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bKLyWQBorb17CQY5pI0SkW/jQ2qEKd9n2jxIzZKTm0=;
 b=EXDoPVVWIShjHneiA8aks+5rn+BTYgnvXukcoWnL/zvSSAfPmCkG1fN1ApVQw2nXDR
 DgHQ2tc/mwjwAl6hMVDckIANoRFca0uYSP1mo0x1Wu/NEZn8Bl1YzaBpr9VVnkNwfT1f
 H80z6fdomvId9048P2ErOebcxgR+cvZd3vOMep+Me2B75QILgXOUfUdXOSvqMq1PLvLP
 p2gJ+uXZDc8EJE43NnTim02oywymKSWIpm1ELvTFONXcv+eO3FzpRR3NeNjBTpoQSy/q
 Z5Litu/j4fv/2+YZbDnAp8MtQRimTKAfj9gQOSJaFxNaacs7CJ5nhmge5Y20yLTpi+To
 Ld1g==
X-Gm-Message-State: ANhLgQ32cmeNmakFQbQ4n6DT/5o0lZZ48sMcsL1RNwPMlprSIgHLsx8K
 WFfUl4Gb7zRQpIEhsRKrIBvYkQrHQq0=
X-Google-Smtp-Source: ADFU+vuGijj252K24DTT2utH3vq+9AIyVooSqYgujhvwlTCEWkCQsCUsTggunkAXITBRoePHqcdNZA==
X-Received: by 2002:a63:8148:: with SMTP id t69mr19597563pgd.187.1584934460759; 
 Sun, 22 Mar 2020 20:34:20 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id q185sm11206213pfb.154.2020.03.22.20.34.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Mar 2020 20:34:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 23 Mar 2020 09:04:15 +0530
Message-Id: <3a3774a67f143fd250ea6ebe0daff29beffa7cfd.1584934420.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/fsconfig: Improve print messages by adding
 fsconfig command name
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add fsconfig command name to the print messages to improve readability.

Suggested-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/fsconfig/fsconfig01.c      | 18 +++++++++---------
 testcases/kernel/syscalls/fsmount/fsmount01.c  |  4 ++--
 testcases/kernel/syscalls/fsmount/fsmount02.c  |  4 ++--
 testcases/kernel/syscalls/fsopen/fsopen01.c    |  4 ++--
 testcases/kernel/syscalls/fspick/fspick.h      |  4 ++--
 testcases/kernel/syscalls/fspick/fspick01.c    |  6 +++---
 .../kernel/syscalls/move_mount/move_mount01.c  |  4 ++--
 .../kernel/syscalls/move_mount/move_mount02.c  |  4 ++--
 .../kernel/syscalls/open_tree/open_tree01.c    |  4 ++--
 .../kernel/syscalls/open_tree/open_tree02.c    |  4 ++--
 10 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig01.c b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
index 34f5481e479a..47941136d502 100644
--- a/testcases/kernel/syscalls/fsconfig/fsconfig01.c
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
@@ -28,39 +28,39 @@ static void run(void)
 
 	TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
 	if (TST_RET == -1)
-		tst_brk(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_brk(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_FLAG) failed");
 
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1)
-		tst_brk(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_brk(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 
 	TEST(fsconfig(fd, FSCONFIG_SET_PATH, "sync", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		if (TST_ERR == EOPNOTSUPP)
-			tst_res(TCONF, "fsconfig(): FSCONFIG_SET_PATH not supported");
+			tst_res(TCONF, "fsconfig(FSCONFIG_SET_PATH) not supported");
 		else
-			tst_brk(TFAIL | TTERRNO, "fsconfig() failed");
+			tst_brk(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_PATH) failed");
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_SET_PATH_EMPTY, "sync", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		if (TST_ERR == EOPNOTSUPP)
-			tst_res(TCONF, "fsconfig(): FSCONFIG_SET_PATH_EMPTY not supported");
+			tst_res(TCONF, "fsconfig(FSCONFIG_SET_PATH_EMPTY) not supported");
 		else
-			tst_brk(TFAIL | TTERRNO, "fsconfig() failed");
+			tst_brk(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_PATH_EMPTY) failed");
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_SET_FD, "sync", NULL, 0));
 	if (TST_RET == -1) {
 		if (TST_ERR == EOPNOTSUPP)
-			tst_res(TCONF, "fsconfig(): FSCONFIG_SET_FD not supported");
+			tst_res(TCONF, "fsconfig(FSCONFIG_SET_FD) not supported");
 		else
-			tst_brk(TFAIL | TTERRNO, "fsconfig() failed");
+			tst_brk(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_FD) failed");
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1)
-		tst_brk(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_brk(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 
 	TEST(fsmfd = fsmount(fd, 0, 0));
 	if (fsmfd == -1)
diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 34d9365d4680..e8198187145b 100644
--- a/testcases/kernel/syscalls/fsmount/fsmount01.c
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -52,14 +52,14 @@ static void run(unsigned int n)
 	if (TST_RET == -1) {
 		SAFE_CLOSE(sfd);
 		tst_res(TFAIL | TTERRNO,
-			"fsconfig() failed to set source to %s", tst_device->dev);
+			"fsconfig(FSCONFIG_SET_STRING) failed to set source to %s", tst_device->dev);
 		return;
 	}
 
 	TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(sfd);
-		tst_res(TFAIL | TTERRNO, "fsconfig() created superblock");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 		return;
 	}
 
diff --git a/testcases/kernel/syscalls/fsmount/fsmount02.c b/testcases/kernel/syscalls/fsmount/fsmount02.c
index 6f90519ff5f7..effc863516b6 100644
--- a/testcases/kernel/syscalls/fsmount/fsmount02.c
+++ b/testcases/kernel/syscalls/fsmount/fsmount02.c
@@ -39,11 +39,11 @@ static void setup(void)
 
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "fsconfig() failed");
+		tst_brk(TBROK | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "fsconfig() failed");
+		tst_brk(TBROK | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 }
 
 static void run(unsigned int n)
diff --git a/testcases/kernel/syscalls/fsopen/fsopen01.c b/testcases/kernel/syscalls/fsopen/fsopen01.c
index 02e6d270eff3..8dabd6814a93 100644
--- a/testcases/kernel/syscalls/fsopen/fsopen01.c
+++ b/testcases/kernel/syscalls/fsopen/fsopen01.c
@@ -33,13 +33,13 @@ static void run(unsigned int n)
 
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 		goto out;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 		goto out;
 	}
 
diff --git a/testcases/kernel/syscalls/fspick/fspick.h b/testcases/kernel/syscalls/fspick/fspick.h
index ca84269ee7a9..4be296ee79da 100644
--- a/testcases/kernel/syscalls/fspick/fspick.h
+++ b/testcases/kernel/syscalls/fspick/fspick.h
@@ -29,13 +29,13 @@ static void setup(void)
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+		tst_brk(TBROK | TERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TERRNO, "fsconfig() failed");
+		tst_brk(TBROK | TERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 	}
 
 	TEST(fsmfd = fsmount(fd, 0, 0));
diff --git a/testcases/kernel/syscalls/fspick/fspick01.c b/testcases/kernel/syscalls/fspick/fspick01.c
index b5a35bf61e2c..c84723805cb9 100644
--- a/testcases/kernel/syscalls/fspick/fspick01.c
+++ b/testcases/kernel/syscalls/fspick/fspick01.c
@@ -33,19 +33,19 @@ static void run(unsigned int n)
 
 	TEST(fsconfig(fspick_fd, FSCONFIG_SET_STRING, "sync", "false", 0));
 	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 		goto out;
 	}
 
 	TEST(fsconfig(fspick_fd, FSCONFIG_SET_FLAG, "ro", NULL, 0));
 	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_FLAG) failed");
 		goto out;
 	}
 
 	TEST(fsconfig(fspick_fd, FSCONFIG_CMD_RECONFIGURE, NULL, NULL, 0));
 	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_RECONFIGURE) failed");
 		goto out;
 	}
 
diff --git a/testcases/kernel/syscalls/move_mount/move_mount01.c b/testcases/kernel/syscalls/move_mount/move_mount01.c
index ede88946ad4c..fd785da02b14 100644
--- a/testcases/kernel/syscalls/move_mount/move_mount01.c
+++ b/testcases/kernel/syscalls/move_mount/move_mount01.c
@@ -37,14 +37,14 @@ static void run(unsigned int n)
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 		return;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 		return;
 	}
 
diff --git a/testcases/kernel/syscalls/move_mount/move_mount02.c b/testcases/kernel/syscalls/move_mount/move_mount02.c
index 74c287b0a6fb..f75991a3f5d2 100644
--- a/testcases/kernel/syscalls/move_mount/move_mount02.c
+++ b/testcases/kernel/syscalls/move_mount/move_mount02.c
@@ -41,14 +41,14 @@ static void run(unsigned int n)
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 		return;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 		return;
 	}
 
diff --git a/testcases/kernel/syscalls/open_tree/open_tree01.c b/testcases/kernel/syscalls/open_tree/open_tree01.c
index 905d16a03697..ddaabed810bd 100644
--- a/testcases/kernel/syscalls/open_tree/open_tree01.c
+++ b/testcases/kernel/syscalls/open_tree/open_tree01.c
@@ -49,14 +49,14 @@ static void run(unsigned int n)
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 		return;
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_res(TFAIL | TTERRNO, "fsconfig() failed");
+		tst_res(TFAIL | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 		return;
 	}
 
diff --git a/testcases/kernel/syscalls/open_tree/open_tree02.c b/testcases/kernel/syscalls/open_tree/open_tree02.c
index 58c71da20e74..76a750ae412b 100644
--- a/testcases/kernel/syscalls/open_tree/open_tree02.c
+++ b/testcases/kernel/syscalls/open_tree/open_tree02.c
@@ -42,13 +42,13 @@ static void setup(void)
 	TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TTERRNO, "fsconfig() failed");
+		tst_brk(TBROK | TTERRNO, "fsconfig(FSCONFIG_SET_STRING) failed");
 	}
 
 	TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
 	if (TST_RET == -1) {
 		SAFE_CLOSE(fd);
-		tst_brk(TBROK | TTERRNO, "fsconfig() failed");
+		tst_brk(TBROK | TTERRNO, "fsconfig(FSCONFIG_CMD_CREATE) failed");
 	}
 
 	TEST(fsmfd = fsmount(fd, 0, 0));
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
