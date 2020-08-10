Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 757B72405CC
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 14:24:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3E3A3C3157
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 14:24:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 208AB3C076F
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 14:24:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9FE08601BEF
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 14:24:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F62AAC7F;
 Mon, 10 Aug 2020 12:24:39 +0000 (UTC)
Date: Mon, 10 Aug 2020 14:24:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200810122436.GA11869@yuki.lan>
References: <af2744945213682a2e378a275bd73ad174e2896a.1596799223.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af2744945213682a2e378a275bd73ad174e2896a.1596799223.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V9 1/2] syscalls/utimensat: Migrate to new test
 framework
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with a minor change, thanks.

I have moved the errno update to the setup with:

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 617565e52..7e4fb9f25 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -104,12 +104,6 @@ static inline int sys_utimensat(int dirfd, const char *pathname,
 	return tst_syscall(__NR_utimensat, dirfd, pathname, times, flags);
 }
 
-static void setup(void)
-{
-	bad_addr = tst_get_bad_addr(NULL);
-	SAFE_MKDIR(TEST_DIR, 0700);
-}
-
 static void update_error(struct test_case *tc)
 {
 	if (tc->exp_err != -1)
@@ -171,8 +165,6 @@ static void run(unsigned int i)
 	void *tsp = NULL;
 	struct stat sb;
 
-	update_error(tc);
-
 	if (tc->dirfd != AT_FDCWD)
 		dfd = SAFE_OPEN(TEST_DIR, tc->oflags);
 
@@ -242,6 +234,17 @@ close:
 		SAFE_CLOSE(fd);
 }
 
+static void setup(void)
+{
+	size_t i;
+
+	bad_addr = tst_get_bad_addr(NULL);
+	SAFE_MKDIR(TEST_DIR, 0700);
+
+	for (i = 0; i < ARRAY_SIZE(tcase); i++)
+		update_error(&tcase[i]);
+}
+
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tcase),

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
