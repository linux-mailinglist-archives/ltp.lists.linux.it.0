Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EC2D2968
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 12:00:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96ED73C2CB7
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 12:00:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 15D503C2BB7
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 12:00:01 +0100 (CET)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9A807600656
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 12:00:00 +0100 (CET)
Received: by mail-pf1-x444.google.com with SMTP id t7so13568916pfh.7
 for <ltp@lists.linux.it>; Tue, 08 Dec 2020 03:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OnBAhUWXVPbKRuOdPDNfxmua8ihVaNzcsVwgx0gdm4=;
 b=uix80hQrKK1iltlRqf+E6y4mAFKrVXBHUoKJL2MJRIkLcW5dcHXJp04xp5Qm8hmYiv
 3TXWtEYKPNFBw2MMJlU6MBmdcnPzXvwA9QjyP2tiaXQOyBhGuZYJ7TqQchbeb7uIlAr2
 Iuy2qDu9q4g0tRDJkvT++xI7kcOjJDE9vnl0nqJkg/Ya0krBbw/72VqywFNRdCKbmLo+
 5KZ0FzrRBhXHFxBaqA3gtMkSObt+u4Fa2VjHfhxk534hsY1xWVEYFc/vyZ40WlyPwhc6
 MxDa3mvVGAmcRCZaL50tCFrXIArrOmi74j2VK/UiWGW5zlrKioqH+CxOf78BeP9hPI6q
 qGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2OnBAhUWXVPbKRuOdPDNfxmua8ihVaNzcsVwgx0gdm4=;
 b=FbZeAfDk2EWOOuqkWCvqAirJyvtSviBqX8OhF+XT49XqbHMZPMBpuT3u4sJrxDy66N
 9iHNW2RG+fBCq4QKPO2+SpCLSk50Qu+GhlDBz713XGw32jbafBTDdHZI6Sx5q3YCFLA7
 d0wGVFeRsNz9sqpI2faN3sc1nyW6G/Tm/oktmkugbaId6PzHbFmpWDjwOQ+u6X6h0GFg
 OOzEZqzNm+CuyDsNf5pQnqZuH3omeX5URXrof2sR2JKOKOGhWVH8LiAOHcVPgVQU7fC1
 EG1bdRhvSvw+VUITTqH3bcknsdAWAP9s5imyKAM40fDhM6qk7RVjReBUGh6YoXJQFEWG
 kG6g==
X-Gm-Message-State: AOAM5308wpLHY5VmFixKD1wVDRm9n9hUVmJjXvJZC/tVM7HNgAeVYgZF
 414B4ZoIsVjpN/ZgHaSjHITjxvIsz45p+w==
X-Google-Smtp-Source: ABdhPJxf0hfixcuaRfKGaO9GXcTu4hfIBrRAUm7EwOYyolBEsk7gUJfx8aUDkUI2tSk9igTJnR2cHg==
X-Received: by 2002:a17:90a:b794:: with SMTP id
 m20mr2425848pjr.47.1607425198660; 
 Tue, 08 Dec 2020 02:59:58 -0800 (PST)
Received: from localhost ([122.172.136.109])
 by smtp.gmail.com with ESMTPSA id p15sm13363606pgi.40.2020.12.08.02.59.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Dec 2020 02:59:58 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Dec 2020 16:29:53 +0530
Message-Id: <ca094a13188d52cca6cfb913c2341429d3967bfb.1607425101.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <20201124152446.GC12878@yuki.lan>
References: <20201124152446.GC12878@yuki.lan>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: Allocate handles at setup time only
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

Move the allocation of handles to setup time only, so the run() helper
can focus on the syscall to test.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
Cyril, I think you merged the patch for open_by_handle_at by mistake,
and that too without your signed-off.

commit 81e0821e1fc1 ("syscalls: Add tests for open_by_handle_at()")

Here is what you asked for in your earlier email.

 .../open_by_handle_at/open_by_handle_at01.c   | 83 +++++++++----------
 1 file changed, 41 insertions(+), 42 deletions(-)

diff --git a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
index 35597a13c182..2583bc3a186d 100644
--- a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
+++ b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
@@ -21,42 +21,23 @@
 #define TEST_DIR "test_dir"
 
 static int dir_fd, fd_atcwd = AT_FDCWD, file_fd;
-static struct file_handle *fhp;
+static struct file_handle *f_fhp, *d_fhp, *at_fhp;
+static struct file_handle *f_fhp, *d_fhp, *at_fhp;
 
 static struct tcase {
 	int *dfd;
-	const char *pathname;
-	int name_flags;
+	struct file_handle **fhp;
 	int flags;
 } tcases[] = {
-	{&dir_fd, TEST_FILE, 0, O_RDWR},
-	{&dir_fd, TEST_FILE, 0, O_RDONLY},
-	{&dir_fd, TEST_FILE, 0, O_WRONLY},
-	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
-	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
-	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
-	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
-	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
-	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
-	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
-	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
-	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
-	{&dir_fd, "", AT_EMPTY_PATH, O_RDONLY},
-	{&file_fd, "", AT_EMPTY_PATH, O_RDONLY},
-
-	{&fd_atcwd, TEST_FILE, 0, O_RDWR},
-	{&fd_atcwd, TEST_FILE, 0, O_RDONLY},
-	{&fd_atcwd, TEST_FILE, 0, O_WRONLY},
-	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
-	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
-	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
-	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
-	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
-	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
-	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
-	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
-	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
-	{&fd_atcwd, "", AT_EMPTY_PATH, O_RDONLY},
+	{&dir_fd, &d_fhp, O_RDWR},
+	{&dir_fd, &d_fhp, O_RDONLY},
+	{&dir_fd, &d_fhp, O_WRONLY},
+	{&file_fd, &f_fhp, O_RDWR},
+	{&file_fd, &f_fhp, O_RDONLY},
+	{&file_fd, &f_fhp, O_WRONLY},
+	{&fd_atcwd, &at_fhp, O_RDWR},
+	{&fd_atcwd, &at_fhp, O_RDONLY},
+	{&fd_atcwd, &at_fhp, O_WRONLY},
 };
 
 static void cleanup(void)
@@ -67,28 +48,46 @@ static void cleanup(void)
 
 static void setup(void)
 {
+	int mount_id;
+
 	SAFE_MKDIR(TEST_DIR, 0700);
 	dir_fd = SAFE_OPEN(TEST_DIR, O_DIRECTORY);
 	SAFE_CHDIR(TEST_DIR);
 	SAFE_TOUCH(TEST_FILE, 0600, NULL);
 	file_fd = SAFE_OPEN("foo_file", O_RDWR | O_CREAT);
-	fhp = allocate_file_handle(AT_FDCWD, TEST_FILE);
+
+	f_fhp = allocate_file_handle(AT_FDCWD, TEST_FILE);
+	d_fhp = allocate_file_handle(AT_FDCWD, TEST_FILE);
+	at_fhp = allocate_file_handle(AT_FDCWD, TEST_FILE);
+
+	TEST(name_to_handle_at(file_fd, "", f_fhp, &mount_id, AT_EMPTY_PATH));
+	if (TST_RET) {
+		tst_res(TFAIL | TTERRNO, "name_to_handle_at() failed");
+		return;
+	}
+
+	TEST(name_to_handle_at(dir_fd, TEST_FILE, d_fhp, &mount_id,
+			       AT_EMPTY_PATH | AT_SYMLINK_FOLLOW));
+	if (TST_RET) {
+		tst_res(TFAIL | TTERRNO, "name_to_handle_at() failed");
+		return;
+	}
+
+	TEST(name_to_handle_at(AT_FDCWD, TEST_FILE, at_fhp, &mount_id,
+			       AT_EMPTY_PATH | AT_SYMLINK_FOLLOW));
+	if (TST_RET) {
+		tst_res(TFAIL | TTERRNO, "name_to_handle_at() failed");
+		return;
+	}
 }
 
 static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 	struct stat file_stat;
-	int fd, mount_id;
-
-	TEST(name_to_handle_at(*tc->dfd, tc->pathname, fhp, &mount_id,
-			       tc->name_flags));
-	if (TST_RET) {
-		tst_res(TFAIL | TTERRNO, "name_to_handle_at() failed (%d)", n);
-		return;
-	}
+	int fd;
 
-	TEST(fd = open_by_handle_at(*tc->dfd, fhp, tc->flags));
+	TEST(fd = open_by_handle_at(*tc->dfd, *tc->fhp, tc->flags));
 	if (fd < 0) {
 		tst_res(TFAIL | TTERRNO, "open_by_handle_at() failed (%d)", n);
 		return;
@@ -97,7 +96,7 @@ static void run(unsigned int n)
 	SAFE_FSTAT(fd, &file_stat);
 
 	/* Don't check stats when pathname is empty */
-	if (file_stat.st_size == 0 || !tc->pathname[0])
+	if (file_stat.st_size == 0 || (tc->fhp == &f_fhp))
 		tst_res(TPASS, "open_by_handle_at() passed (%d)", n);
 	else
 		tst_res(TFAIL, "fstat() didn't work as expected (%d)", n);
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
