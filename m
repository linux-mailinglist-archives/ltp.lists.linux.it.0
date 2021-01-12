Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 799082F261F
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 03:13:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14A533C6C90
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 03:13:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C48CC3C6C5A
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 03:12:50 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id EB4896014E5
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 03:12:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; d="scan'208";a="103381975"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 10:12:48 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 744AC4CE6033;
 Tue, 12 Jan 2021 10:12:44 +0800 (CST)
Received: from G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 10:12:44 +0800
Received: from Fedora-30.g08.fujitsu.local (10.167.220.106) by
 G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 12 Jan 2021 10:12:44 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Tue, 12 Jan 2021 10:02:27 +0800
Message-ID: <20210112020227.11775-3-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210112020227.11775-1-yangx.jy@cn.fujitsu.com>
References: <20210112020227.11775-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 744AC4CE6033.A7266
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/3] syscalls: Take use of TST_EXP_PASS_SILENT
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

Current TST_EXP_PASS macro reports the double passed for
one subtest, for example:
--------------------------------------------
tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
access02.c:62: TPASS: access(file_f, F_OK) as root passed
access02.c:141: TPASS: access(file_f, F_OK) as root behaviour is correct.
access02.c:62: TPASS: access(file_f, F_OK) as nobody passed
access02.c:141: TPASS: access(file_f, F_OK) as nobody behaviour is correct.
access02.c:62: TPASS: access(file_r, R_OK) as root passed
...

Summary:
passed   32
failed   0
broken   0
skipped  0
warnings 0
--------------------------------------------

It is just a minor cleanup rather than a fix.

Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/access/access02.c | 2 +-
 testcases/kernel/syscalls/bind/bind04.c     | 2 +-
 testcases/kernel/syscalls/bind/bind05.c     | 2 +-
 testcases/kernel/syscalls/brk/brk01.c       | 6 +++++-
 testcases/kernel/syscalls/capget/capget01.c | 4 +++-
 5 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/access/access02.c b/testcases/kernel/syscalls/access/access02.c
index ff3e7b6f4..bf636f9f4 100644
--- a/testcases/kernel/syscalls/access/access02.c
+++ b/testcases/kernel/syscalls/access/access02.c
@@ -59,7 +59,7 @@ static void access_test(struct tcase *tc, const char *user)
 	struct stat stat_buf;
 	char command[64];
 
-	TST_EXP_PASS(access(tc->pathname, tc->mode),
+	TST_EXP_PASS_SILENT(access(tc->pathname, tc->mode),
 	             "access(%s, %s) as %s", tc->pathname, tc->name, user);
 
 	if (!TST_PASS)
diff --git a/testcases/kernel/syscalls/bind/bind04.c b/testcases/kernel/syscalls/bind/bind04.c
index 49e784ccd..de43b6c13 100644
--- a/testcases/kernel/syscalls/bind/bind04.c
+++ b/testcases/kernel/syscalls/bind/bind04.c
@@ -118,7 +118,7 @@ static void test_bind(unsigned int n)
 	listen_sock = SAFE_SOCKET(tc->address->sa_family, tc->type,
 		tc->protocol);
 
-	TST_EXP_PASS(bind(listen_sock, tc->address, tc->addrlen), "bind()");
+	TST_EXP_PASS_SILENT(bind(listen_sock, tc->address, tc->addrlen), "bind()");
 
 	if (!TST_PASS) {
 		SAFE_CLOSE(listen_sock);
diff --git a/testcases/kernel/syscalls/bind/bind05.c b/testcases/kernel/syscalls/bind/bind05.c
index 3b384cf1b..c43593fe1 100644
--- a/testcases/kernel/syscalls/bind/bind05.c
+++ b/testcases/kernel/syscalls/bind/bind05.c
@@ -131,7 +131,7 @@ static void test_bind(unsigned int n)
 	tst_res(TINFO, "Testing %s", tc->description);
 	sock = SAFE_SOCKET(tc->address->sa_family, tc->type, tc->protocol);
 
-	TST_EXP_PASS(bind(sock, tc->address, tc->addrlen), "bind()");
+	TST_EXP_PASS_SILENT(bind(sock, tc->address, tc->addrlen), "bind()");
 
 	if (!TST_PASS) {
 		SAFE_CLOSE(sock);
diff --git a/testcases/kernel/syscalls/brk/brk01.c b/testcases/kernel/syscalls/brk/brk01.c
index 3f8606375..a9b89bce5 100644
--- a/testcases/kernel/syscalls/brk/brk01.c
+++ b/testcases/kernel/syscalls/brk/brk01.c
@@ -31,7 +31,9 @@ void verify_brk(void)
 		break;
 		}
 
-		TST_EXP_PASS(brk((void *)new_brk), "brk()");
+		TST_EXP_PASS_SILENT(brk((void *)new_brk), "brk()");
+		if (!TST_PASS)
+			return;
 
 		cur_brk = (uintptr_t)sbrk(0);
 
@@ -46,6 +48,8 @@ void verify_brk(void)
 		if (i % 3 == 0)
 			*((char *)cur_brk) = 0;
 	}
+
+	tst_res(TPASS, "brk() works fine");
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/capget/capget01.c b/testcases/kernel/syscalls/capget/capget01.c
index 6c17a7c7c..af088e2fc 100644
--- a/testcases/kernel/syscalls/capget/capget01.c
+++ b/testcases/kernel/syscalls/capget/capget01.c
@@ -32,8 +32,10 @@ static void verify_capget(unsigned int n)
 	hdr->version = tc->version;
 	hdr->pid = pid;
 
-	TST_EXP_PASS(tst_syscall(__NR_capget, hdr, data),
+	TST_EXP_PASS_SILENT(tst_syscall(__NR_capget, hdr, data),
 	             "capget() with %s", tc->message);
+	if (!TST_PASS)
+		return;
 
 	if (data[0].effective & 1 << CAP_NET_RAW)
 		tst_res(TFAIL, "capget() gets CAP_NET_RAW unexpectedly in pE");
-- 
2.21.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
