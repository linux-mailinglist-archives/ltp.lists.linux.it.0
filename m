Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2148734BE
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Mar 2024 11:46:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1709721984; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=83sIPV1qnjVG9WnG/mymAIb5l9xM1sTtvdKrbwrRGNI=;
 b=bMHmp9W5aZB/6sJ0wCQzuKjnseW7jMlPiyewZEbAUOuBOoRGo5/ciev63ep1g692/Vxag
 aDBFnl2pVSOXJOqGCnAOpKEVlieoJs7Cjfc3ddwMoHL0FiT/vWFgcSKXxGTGj6M4TYry2jP
 4w8WqSfMtdD5lMww+Eh6Xus/r1Zudwc=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BD1E3CE9D6
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Mar 2024 11:46:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C5A723C3320
 for <ltp@lists.linux.it>; Wed,  6 Mar 2024 11:46:16 +0100 (CET)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 04C8B10009B0
 for <ltp@lists.linux.it>; Wed,  6 Mar 2024 11:46:15 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33e17fc5aceso394064f8f.0
 for <ltp@lists.linux.it>; Wed, 06 Mar 2024 02:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1709721975; x=1710326775; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9nLwnPvyUCrFGwJoYff2I8DjZLlyDW95r2uYBKOaYK0=;
 b=azAuVPH9EWbCFFzkGOTrSRBNmyXcj0V+4J7LivtStPoO+5zGPk1RiOf/fb8juTrM0i
 z+8s3NcDMIbhhb2SX1zbhBjdXobvKVjNdZvZ+tAzTc9dgJEicklhHbtqK2ZM7EqGHnwM
 JgOI5SoAKLEA9cS82oU+mU2MER30TFz0rtjwHuGHPlldc+vo1bCyMziNpaA24GyFHDgy
 8QjIs/Q1uFR7dmmZf4MWQogDLUPU+degCIyoUvXFxDdBmFIiWpgtYlpWv5R1IOQf8ou7
 CGBLPOH5W2jCIQW9CvHIksLLS4rXQD1etWpP2xPAvz2op2x5sFfP1Har+ycWWp0DPry3
 72mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709721975; x=1710326775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9nLwnPvyUCrFGwJoYff2I8DjZLlyDW95r2uYBKOaYK0=;
 b=kduDpucNpyix4/NTx1C25LMw65Z5rp3wPnABj2+4Bsl+KhVhfX5fM1HFvtxaoSE+Qu
 W73mc/yCqKOBRKRXA3L1HFWQzG/SDJ2Vn74etdq/1xQ5KTWRNNlieU69Pz7fL1XkeSDV
 r8xu9+Bq2NfEE3rDfbnbD5LoqaUlEorWFF1Gsw0+kGqbnTyB9h9E64XUkydJ/bdJbuLm
 sz6oHDQNn0ea9N1Mj/WLhAkTQoQ5CP/xSNhsWZhtHyYVzBahPUiI8orWzDtvjh+Gq8hg
 jtXmn9eLe2vM5Y+fP3md8KaTihNiBFAnIkMB+XHy6AjzN5fod/troLRGZUnzbX02OmuQ
 ncBA==
X-Gm-Message-State: AOJu0YwJj9ZztN/yQ/1qlsr457S/sfZzKU4fPho9KRH3sccqH+diVbUF
 7wyodFg6IZLwHLNgWyyFCTW3QxNPBhYw77/GgrLL2CFdYhBAJDtAGQjRNj7AXwoFO4U5LIqZh4Q
 =
X-Google-Smtp-Source: AGHT+IG3rcz9kSLNEUwRh3Jv5UE9c96r09soyn1O8mVytBejEXYw1hNpYpNWPIYzpUW3W+4K4Zxiig==
X-Received: by 2002:a5d:4212:0:b0:33e:835:668b with SMTP id
 n18-20020a5d4212000000b0033e0835668bmr4416165wrq.22.1709721975167; 
 Wed, 06 Mar 2024 02:46:15 -0800 (PST)
Received: from localhost ([81.95.8.245]) by smtp.gmail.com with ESMTPSA id
 j3-20020adff003000000b0033e01e397d6sm17172438wro.54.2024.03.06.02.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 02:46:15 -0800 (PST)
To: ltp@lists.linux.it
Date: Wed,  6 Mar 2024 05:46:09 -0500
Message-Id: <20240306104609.17141-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1] chdir01.c: set umask to 0 within setup
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When system's default umask is 0077, this will trigger following issues:
chdir01.c:100: TFAIL: nobody: chdir("subdir") returned unexpected value -1: EACCES (13)

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/syscalls/chdir/chdir01.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/chdir/chdir01.c b/testcases/kernel/syscalls/chdir/chdir01.c
index d50a8f50c..97a707199 100644
--- a/testcases/kernel/syscalls/chdir/chdir01.c
+++ b/testcases/kernel/syscalls/chdir/chdir01.c
@@ -56,12 +56,15 @@ static struct test_case {
 
 static void setup(void)
 {
+	mode_t old_umask = umask(0);
+
+	SAFE_MKFS(tst_device->dev, tst_device->fs_type, NULL, NULL);
+	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, 0);
+
 	char *cwd;
 	int fd;
 	struct stat statbuf;
 
-	umask(0);
-
 	cwd = SAFE_GETCWD(NULL, 0);
 	workdir = SAFE_MALLOC(strlen(cwd) + strlen(MNTPOINT) + 2);
 	sprintf(workdir, "%s/%s", cwd, MNTPOINT);
@@ -89,6 +92,7 @@ static void setup(void)
 
 	if (!ltpuser)
 		ltpuser = SAFE_GETPWNAM(TESTUSER);
+	umask(old_umask);
 }
 
 static void check_result(const char *user, const char *name, int retval,
@@ -146,13 +150,14 @@ static void cleanup(void)
 {
 	SAFE_CHDIR("..");
 	free(workdir);
+	SAFE_UMOUNT(MNTPOINT);
 }
 
 static struct tst_test test = {
 	.needs_root = 1,
-	.mount_device = 1,
 	.mntpoint = MNTPOINT,
 	.all_filesystems = 1,
+	.needs_device = 1,
 	.test = run,
 	.tcnt = ARRAY_SIZE(testcase_list),
 	.setup = setup,
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
