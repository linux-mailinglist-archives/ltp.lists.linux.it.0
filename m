Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C176A493
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 11:09:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2D2E3C1D13
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 11:09:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 555703C1508
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 11:09:11 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B6CBF600EAF
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 11:09:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2F1D7B01E;
 Tue, 16 Jul 2019 09:09:09 +0000 (UTC)
Date: Tue, 16 Jul 2019 11:09:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190716090908.GA12815@rei.lan>
References: <20190715154945.GA28618@rei.lan>
 <1563255457-2336-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563255457-2336-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/prctl06: New test for prctl() with
 PR_{SET, GET}_NO_NEW_PRIVS
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with two changes, thanks.


diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
index eafbedfef..0e1274a2a 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.c
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -81,8 +81,8 @@ static void setup(void)
 
 	SAFE_CP(TESTBIN, TEST_REL_BIN_DIR);
 
-	SAFE_CHMOD(BIN_PATH, SUID_MODE);
 	SAFE_CHOWN(BIN_PATH, 0, 0);
+	SAFE_CHMOD(BIN_PATH, SUID_MODE);

 	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
 	if (TST_RET == 0) {

This is actually important fix, you have to set the SUID bits last since
they are cleared if you change owner of the file.


diff --git a/testcases/kernel/syscalls/prctl/prctl06.h b/testcases/kernel/syscalls/prctl/prctl06.h
index 72f9c4e5a..f5c66e809 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.h
+++ b/testcases/kernel/syscalls/prctl/prctl06.h
@@ -25,12 +25,14 @@
 #define BIN_PATH           MNTPOINT"/"TESTBIN
 #define SUID_MODE          (S_ISUID|S_ISGID|S_IXUSR|S_IXGRP|S_IXOTH)
 
-static int flag = 1;
-
 void check_proc_field(int val, char *name)
 {
+	static int flag = 1;
 	int field = 0;
 
+	if (!flag)
+		return;
+
 	TEST(FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d", &field));
 	if (TST_RET == 1) {
 		tst_res(TCONF,
@@ -57,8 +59,8 @@ void check_no_new_privs(int val, char *name)
 		tst_res(TFAIL,
 			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %ld",
 			name, val, TST_RET);
-	if (flag)
-		check_proc_field(val, name);
+
+	check_proc_field(val, name);
 }
 
 #endif

This is merely cosmetic and moves the flag to the function so that it's
not global.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
