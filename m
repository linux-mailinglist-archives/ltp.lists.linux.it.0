Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C813C36A
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 14:43:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C3253C1CA1
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jan 2020 14:43:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EFBD03C1840
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 14:43:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6516C600A64
 for <ltp@lists.linux.it>; Wed, 15 Jan 2020 14:43:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A2846ABF5;
 Wed, 15 Jan 2020 13:43:12 +0000 (UTC)
Date: Wed, 15 Jan 2020 14:43:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200115134311.GE14046@rei.lan>
References: <20200109124101.GE31981@rei.lan>
 <1578651702-19486-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578651702-19486-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] syscalls/capset02: Cleanup & convert to
 new library
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
Pushed with minor changes, thanks.

The diff is:

diff --git a/testcases/kernel/syscalls/capset/capset02.c b/testcases/kernel/syscalls/capset/capset02.c
index 15589d462..a6c4f29a0 100644
--- a/testcases/kernel/syscalls/capset/capset02.c
+++ b/testcases/kernel/syscalls/capset/capset02.c
@@ -28,10 +28,11 @@
 #define CAP1 (1 << CAP_NET_RAW | 1 << CAP_CHOWN  | 1 << CAP_SETPCAP)
 #define CAP2 (CAP1 | 1 << CAP_KILL)
 
-static int drop_flag;
 static struct __user_cap_header_struct *header;
 static struct __user_cap_data_struct *data;
 
+static void *bad_addr;
+
 static struct tcase {
        int version;
        int pid;
@@ -63,8 +64,8 @@ static void verify_capset(unsigned int n)
 
        tst_res(TINFO, "%s", tc->message);
 
-       TEST(tst_syscall(__NR_capset, tc->flag - 1 ? header : NULL,
-                               tc->flag - 2 ? data : NULL));
+       TEST(tst_syscall(__NR_capset, tc->flag - 1 ? header : bad_addr,
+                               tc->flag - 2 ? data : bad_addr));
        if (TST_RET == 0) {
                tst_res(TFAIL, "capset() succeed unexpectedly");
                return;
@@ -97,9 +98,9 @@ static void setup(void)
 
        TEST(prctl(PR_CAPBSET_DROP, CAP_KILL));
        if (TST_RET == -1)
-               tst_res(TFAIL | TTERRNO, "drop CAP_KILL failed");
-       else
-               drop_flag = 1;
+               tst_brk(TBROK | TTERRNO, "drop CAP_KILL failed");
+
+       bad_addr = tst_get_bad_addr(NULL);
 }


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
