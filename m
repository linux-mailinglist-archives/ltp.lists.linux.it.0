Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A70649C58
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 11:40:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75C8F3CBE51
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 11:40:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5DC133CBE6A
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 11:39:46 +0100 (CET)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 557BB600664
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 11:39:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1670841583; i=@fujitsu.com;
 bh=Nsp4gY/5nNxAzet9rRgkcdkiWojlLAdjUG9aSIPqUG0=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=VyAnSQxV6kgapcSZlzcpq1k9iqHbT3eYIk7r0QgvSJvxKoOtynEi8SW7pKgrIUr/1
 KTWoPnX1VjkXFLkPdeDL6y6k/Ligiwtc9Ixzvio6Mtxq6TK4UWISIUBeeaq7M/zY5r
 ZKa/uO7Wv/y4wm0BTEP5uccXnyULhUByiljW66SriqWA3pCo5nbHuCNLl3SF/Xe/j/
 KqBm454leu2oGEIAX4WHKz4usi9MhLjbkVIkEmN0Kp5m8DjtimMEHPBLq03vxGpRDr
 Ze8GxWweFeC0GuLKDfrCrK78gTs/jjUE+N3aBj1Mf+E4jN2K/fywl1/JV2lv88MVA5
 AmYXrvzHMnVKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpPuOZXq
 ywcZXBhYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8bP49OYC050MVV8ex7QwPjrMWMXIxeHkMAp
 Rok/k6YzdTFyAjl7mSQa7zlCJPYwSnRfnsUGkmAT0JR41rmAGcQWEZCQ6Gh4yw5iMwuoSyyf9
 AusWVjAW6Kn9SUjiM0ioCpx4eAasHpeAQ+JY7f6wOolBBQkpjx8DxbnFPCU+Hb3EivEYg+JVb
 NmsEDUC0qcnPmEBWK+hMTBFy+YIXoVJS51fGOEsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
 wMq1iNC1OLSpLLdI10UsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
 y0st2cQIDN6UYjafHYz/lv7RO8QoycGkJMqb/mdashBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3
 oAvQDnBotT01Iq0zBxgJMGkJTh4lER4jzFNTxbiLS5IzC3OTIdInWI05ljbcGAvM8fU2f/2Mw
 ux5OXnpUqJ8woxA5UKgJRmlObBDYJF+CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzbQRb
 yZOaVwO17BXQKE9ApUS+ngpxSkoiQkmpgYt2v3lFr399+yMw0bfXf9BsXjKOtWU0333f1u8ic
 myBj8qM/Lnb2gsJv5Tm3it2SLDM1bnnaKHcZyLk55mie6K5z3XGrw/X4OWu7225Jp48t3Z/Ic
 c/LkE05in/O6f5Adt8zPv8E84sUXlhfM3k1N/nKiq5vV+wnZt9SDLgXkJsRZX9t9UapmNL02Q
 4ChVWdmtYivJPtpOa/1ep5vjPYxLTrRtPBtjM2c7/WRcTsmPArv1TulpZ6Gc/Lp5W7H+412jP
 Pof/m8qaQrDfXP23Wa1M5u/kWs7hEapKO8pZah8TvXnPunDJ02/JK5LdFmaD2gQU8OYwV61lf
 /a1OkHfRPtz5YcPc/d9eM7G/2qLEUpyRaKjFXFScCACjRs1eawMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1670841582!310961!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25290 invoked from network); 12 Dec 2022 10:39:42 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
 by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Dec 2022 10:39:42 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6524D1B6
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 10:39:42 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 598DD1AD
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 10:39:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 10:39:40 +0000
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 12 Dec 2022 19:40:29 +0800
Message-ID: <1670845229-1981-4-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670845229-1981-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1670845229-1981-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 4/4] Remove old kernel version check when using
 min_kver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The oldest supported kernel version check is 3.10, so remove them.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 doc/c-test-api.txt                                           | 2 +-
 testcases/cve/cve-2016-10044.c                               | 1 -
 testcases/cve/cve-2016-7117.c                                | 1 -
 testcases/cve/meltdown.c                                     | 1 -
 testcases/kernel/controllers/memcg/regression/memcg_test_3.c | 1 -
 testcases/kernel/logging/kmsg/kmsg01.c                       | 1 -
 testcases/kernel/mem/cpuset/cpuset01.c                       | 1 -
 testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c           | 1 -
 testcases/kernel/mem/ksm/ksm01.c                             | 1 -
 testcases/kernel/mem/ksm/ksm02.c                             | 1 -
 testcases/kernel/mem/ksm/ksm03.c                             | 1 -
 testcases/kernel/mem/ksm/ksm04.c                             | 1 -
 testcases/kernel/mem/ksm/ksm05.c                             | 1 -
 testcases/kernel/syscalls/clone/clone09.c                    | 1 -
 testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c   | 1 -
 testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c            | 1 -
 testcases/kernel/syscalls/fadvise/posix_fadvise04.c          | 1 -
 testcases/kernel/syscalls/fchmodat/fchmodat01.c              | 1 -
 testcases/kernel/syscalls/fcntl/fcntl35.c                    | 1 -
 testcases/kernel/syscalls/futex/futex_wake04.c               | 1 -
 testcases/kernel/syscalls/getrusage/getrusage03.c            | 1 -
 testcases/kernel/syscalls/getxattr/getxattr05.c              | 1 -
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c              | 1 -
 testcases/kernel/syscalls/kcmp/kcmp01.c                      | 1 -
 testcases/kernel/syscalls/kcmp/kcmp02.c                      | 1 -
 testcases/kernel/syscalls/kcmp/kcmp03.c                      | 1 -
 testcases/kernel/syscalls/keyctl/keyctl08.c                  | 1 -
 testcases/kernel/syscalls/madvise/madvise05.c                | 1 -
 testcases/kernel/syscalls/madvise/madvise06.c                | 1 -
 testcases/kernel/syscalls/madvise/madvise07.c                | 1 -
 testcases/kernel/syscalls/madvise/madvise08.c                | 1 -
 testcases/kernel/syscalls/migrate_pages/migrate_pages03.c    | 1 -
 testcases/kernel/syscalls/mlock2/mlock201.c                  | 1 -
 testcases/kernel/syscalls/mlock2/mlock202.c                  | 1 -
 testcases/kernel/syscalls/mlock2/mlock203.c                  | 1 -
 testcases/kernel/syscalls/mmap/mmap12.c                      | 1 -
 testcases/kernel/syscalls/move_pages/move_pages12.c          | 1 -
 testcases/kernel/syscalls/msync/msync04.c                    | 1 -
 testcases/kernel/syscalls/pipe2/pipe2_04.c                   | 1 -
 testcases/kernel/syscalls/preadv/preadv01.c                  | 1 -
 testcases/kernel/syscalls/preadv/preadv02.c                  | 1 -
 testcases/kernel/syscalls/preadv/preadv03.c                  | 1 -
 testcases/kernel/syscalls/pwritev/pwritev01.c                | 1 -
 testcases/kernel/syscalls/pwritev/pwritev02.c                | 1 -
 testcases/kernel/syscalls/pwritev/pwritev03.c                | 1 -
 testcases/kernel/syscalls/recvmsg/recvmsg02.c                | 1 -
 testcases/kernel/syscalls/sendfile/sendfile08.c              | 1 -
 testcases/kernel/syscalls/sendfile/sendfile09.c              | 1 -
 testcases/kernel/syscalls/setsockopt/setsockopt02.c          | 1 -
 testcases/kernel/syscalls/setsockopt/setsockopt03.c          | 1 -
 testcases/kernel/syscalls/socket/socket02.c                  | 1 -
 testcases/kernel/syscalls/socketpair/socketpair02.c          | 1 -
 testcases/kernel/syscalls/splice/splice01.c                  | 1 -
 testcases/kernel/syscalls/splice/splice02.c                  | 1 -
 testcases/kernel/syscalls/splice/splice03.c                  | 1 -
 testcases/kernel/syscalls/splice/splice04.c                  | 1 -
 testcases/kernel/syscalls/splice/splice05.c                  | 1 -
 testcases/kernel/syscalls/switch/endian_switch01.c           | 1 -
 testcases/kernel/syscalls/tee/tee01.c                        | 1 -
 testcases/kernel/syscalls/tee/tee02.c                        | 1 -
 testcases/kernel/syscalls/timerfd/timerfd01.c                | 1 -
 testcases/kernel/syscalls/timerfd/timerfd_gettime01.c        | 1 -
 testcases/kernel/syscalls/timerfd/timerfd_settime01.c        | 1 -
 testcases/kernel/syscalls/timerfd/timerfd_settime02.c        | 1 -
 testcases/kernel/syscalls/unlinkat/unlinkat01.c              | 1 -
 testcases/kernel/syscalls/vmsplice/vmsplice01.c              | 1 -
 testcases/kernel/syscalls/vmsplice/vmsplice02.c              | 1 -
 testcases/kernel/syscalls/vmsplice/vmsplice03.c              | 1 -
 testcases/kernel/syscalls/vmsplice/vmsplice04.c              | 1 -
 69 files changed, 1 insertion(+), 69 deletions(-)

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index e6d121dce..b15321ca2 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -559,7 +559,7 @@ static struct tst_test test = {
 Testcases for newly added kernel functionality require kernel newer than a
 certain version to run. All you need to skip a test on older kernels is to
 set the '.min_kver' string in the 'struct tst_test' to a minimal required
-kernel version, e.g. '.min_kver = "2.6.30"'.
+kernel version, e.g. '.min_kver = "4.10.0"'.
 
 For more complicated operations such as skipping a test for a certain range
 of kernel versions, following functions could be used:
diff --git a/testcases/cve/cve-2016-10044.c b/testcases/cve/cve-2016-10044.c
index b0a329d83..9ac644fc2 100644
--- a/testcases/cve/cve-2016-10044.c
+++ b/testcases/cve/cve-2016-10044.c
@@ -61,7 +61,6 @@ found_mapping:
 static struct tst_test test = {
 	.test_all = run,
 	.cleanup = cleanup,
-	.min_kver = "2.6.8",
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "22f6b4d34fcf"},
 		{"CVE", "2016-10044"},
diff --git a/testcases/cve/cve-2016-7117.c b/testcases/cve/cve-2016-7117.c
index 64bf0a85e..109333985 100644
--- a/testcases/cve/cve-2016-7117.c
+++ b/testcases/cve/cve-2016-7117.c
@@ -149,7 +149,6 @@ static struct tst_test test = {
 	.test_all = run,
 	.setup = setup,
 	.cleanup = cleanup,
-	.min_kver = "2.6.33",
 	.max_runtime = 60,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "a2e2725541fa"},
diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
index cd16b0fb2..398e496a9 100644
--- a/testcases/cve/meltdown.c
+++ b/testcases/cve/meltdown.c
@@ -377,7 +377,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.test_all = run,
 	.cleanup = cleanup,
-	.min_kver = "2.6.32",
 	.supported_archs = (const char *const []) {
 		"x86",
 		"x86_64",
diff --git a/testcases/kernel/controllers/memcg/regression/memcg_test_3.c b/testcases/kernel/controllers/memcg/regression/memcg_test_3.c
index 4bf4270bb..f29c2bea5 100644
--- a/testcases/kernel/controllers/memcg/regression/memcg_test_3.c
+++ b/testcases/kernel/controllers/memcg/regression/memcg_test_3.c
@@ -81,7 +81,6 @@ static void cleanup(void)
 static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
-	.min_kver = "2.6.24",
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = do_test,
diff --git a/testcases/kernel/logging/kmsg/kmsg01.c b/testcases/kernel/logging/kmsg/kmsg01.c
index bf2de5741..ba8179d5a 100644
--- a/testcases/kernel/logging/kmsg/kmsg01.c
+++ b/testcases/kernel/logging/kmsg/kmsg01.c
@@ -573,5 +573,4 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.needs_root = 1,
 	.test_all = test_kmsg,
-	.min_kver = "3.5.0"
 };
diff --git a/testcases/kernel/mem/cpuset/cpuset01.c b/testcases/kernel/mem/cpuset/cpuset01.c
index 6e9691edb..956ac30c8 100644
--- a/testcases/kernel/mem/cpuset/cpuset01.c
+++ b/testcases/kernel/mem/cpuset/cpuset01.c
@@ -175,7 +175,6 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.setup = setup,
 	.test_all = test_cpuset,
-	.min_kver = "2.6.32",
 	.needs_cgroup_ctrls = (const char *const []){ "cpuset", NULL },
 };
 
diff --git a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c
index 91dfa0616..79bea8e8b 100644
--- a/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c
+++ b/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c
@@ -114,7 +114,6 @@ static void do_mmap(unsigned int j LTP_ATTRIBUTE_UNUSED)
 }
 
 static struct tst_test test = {
-	.min_kver = "2.6.32",
 	.needs_root = 1,
 	.tcnt = LOOP,
 	.needs_tmpdir = 1,
diff --git a/testcases/kernel/mem/ksm/ksm01.c b/testcases/kernel/mem/ksm/ksm01.c
index fafa2da71..bcd095865 100644
--- a/testcases/kernel/mem/ksm/ksm01.c
+++ b/testcases/kernel/mem/ksm/ksm01.c
@@ -93,5 +93,4 @@ static struct tst_test test = {
 		NULL
 	},
 	.test_all = verify_ksm,
-	.min_kver = "2.6.32",
 };
diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
index b5c90464e..bce639dce 100644
--- a/testcases/kernel/mem/ksm/ksm02.c
+++ b/testcases/kernel/mem/ksm/ksm02.c
@@ -114,7 +114,6 @@ static struct tst_test test = {
 		NULL
 	},
 	.test_all = verify_ksm,
-	.min_kver = "2.6.32",
 	.max_runtime = 32,
 	.needs_cgroup_ctrls = (const char *const []){ "cpuset", NULL },
 };
diff --git a/testcases/kernel/mem/ksm/ksm03.c b/testcases/kernel/mem/ksm/ksm03.c
index 94029054f..4a733269f 100644
--- a/testcases/kernel/mem/ksm/ksm03.c
+++ b/testcases/kernel/mem/ksm/ksm03.c
@@ -96,6 +96,5 @@ static struct tst_test test = {
 		NULL
 	},
 	.test_all = verify_ksm,
-	.min_kver = "2.6.32",
 	.needs_cgroup_ctrls = (const char *const []){ "memory", NULL },
 };
diff --git a/testcases/kernel/mem/ksm/ksm04.c b/testcases/kernel/mem/ksm/ksm04.c
index 2302a2a1d..4f1f2f721 100644
--- a/testcases/kernel/mem/ksm/ksm04.c
+++ b/testcases/kernel/mem/ksm/ksm04.c
@@ -116,7 +116,6 @@ static struct tst_test test = {
 		NULL
 	},
 	.test_all = verify_ksm,
-	.min_kver = "2.6.32",
 	.max_runtime = 32,
 	.needs_cgroup_ctrls = (const char *const []){
 		"memory", "cpuset", NULL
diff --git a/testcases/kernel/mem/ksm/ksm05.c b/testcases/kernel/mem/ksm/ksm05.c
index c4cb779aa..25f3435b2 100644
--- a/testcases/kernel/mem/ksm/ksm05.c
+++ b/testcases/kernel/mem/ksm/ksm05.c
@@ -87,7 +87,6 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
 	.test_all = test_ksm,
-	.min_kver = "2.6.32",
 	.save_restore = (const struct tst_path_val[]) {
 		{"/sys/kernel/mm/ksm/run", "1", TST_SR_TBROK},
 		{}
diff --git a/testcases/kernel/syscalls/clone/clone09.c b/testcases/kernel/syscalls/clone/clone09.c
index e4691f513..37528e4b6 100644
--- a/testcases/kernel/syscalls/clone/clone09.c
+++ b/testcases/kernel/syscalls/clone/clone09.c
@@ -87,5 +87,4 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
-	.min_kver = "2.6.24",
 };
diff --git a/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c b/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
index ed359d434..6d2bf2a30 100644
--- a/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
+++ b/testcases/kernel/syscalls/epoll_create1/epoll_create1_01.c
@@ -44,7 +44,6 @@ static void run(unsigned int n)
 }
 
 static struct tst_test test = {
-	.min_kver = "2.6.27",
 	.tcnt = ARRAY_SIZE(tc),
 	.test = run,
 };
diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c
index e96960ba9..c92b0b62e 100644
--- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl03.c
@@ -74,5 +74,4 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = run_all,
-	.min_kver = "2.6.17",
 };
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
index f389a219b..8baf91bb0 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
@@ -83,5 +83,4 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test = verify_fadvise,
 	.tcnt = ARRAY_SIZE(defined_advise),
-	.min_kver = "2.6.16",
 };
diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
index 925f397ef..3deff0ebe 100644
--- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
+++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
@@ -97,7 +97,6 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.min_kver = "2.6.16",
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_fchmodat,
 	.setup = setup,
diff --git a/testcases/kernel/syscalls/fcntl/fcntl35.c b/testcases/kernel/syscalls/fcntl/fcntl35.c
index 8eb71486f..2d730377b 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl35.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl35.c
@@ -113,7 +113,6 @@ static void do_test(unsigned int n)
 }
 
 static struct tst_test test = {
-	.min_kver = "2.6.35",
 	.needs_root = 1,
 	.forks_child = 1,
 	.tcnt = ARRAY_SIZE(tcases),
diff --git a/testcases/kernel/syscalls/futex/futex_wake04.c b/testcases/kernel/syscalls/futex/futex_wake04.c
index 110c628c3..176dd4aeb 100644
--- a/testcases/kernel/syscalls/futex/futex_wake04.c
+++ b/testcases/kernel/syscalls/futex/futex_wake04.c
@@ -130,7 +130,6 @@ static struct tst_test test = {
 	.test_all = wakeup_thread2,
 	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
-	.min_kver = "2.6.32",
 	.needs_tmpdir = 1,
 	.hugepages = {1, TST_NEEDS},
 };
diff --git a/testcases/kernel/syscalls/getrusage/getrusage03.c b/testcases/kernel/syscalls/getrusage/getrusage03.c
index 7e7a1f555..fc14e93cf 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage03.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage03.c
@@ -177,7 +177,6 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.child_needs_reinit = 1,
 	.resource_files = resource,
-	.min_kver = "2.6.32",
 	.min_mem_avail = 512,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "1f10206cf8e9"},
diff --git a/testcases/kernel/syscalls/getxattr/getxattr05.c b/testcases/kernel/syscalls/getxattr/getxattr05.c
index 28eb4cbcf..8d1752fd0 100644
--- a/testcases/kernel/syscalls/getxattr/getxattr05.c
+++ b/testcases/kernel/syscalls/getxattr/getxattr05.c
@@ -175,7 +175,6 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = do_getxattr,
-	.min_kver = "3.8",
 };
 
 #else /* HAVE_SYS_XATTR_H && HAVE_LIBACL*/
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
index ebc583b3e..3e461b307 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
@@ -83,7 +83,6 @@ static struct tst_test test = {
 		"CONFIG_CHECKPOINT_RESTORE",
 		NULL
 	},
-	.min_kver = "3.8.0",
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_msgrcv,
 	.setup = setup,
diff --git a/testcases/kernel/syscalls/kcmp/kcmp01.c b/testcases/kernel/syscalls/kcmp/kcmp01.c
index 903525ff0..0e7cc7a22 100644
--- a/testcases/kernel/syscalls/kcmp/kcmp01.c
+++ b/testcases/kernel/syscalls/kcmp/kcmp01.c
@@ -103,6 +103,5 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.forks_child = 1,
 	.test = verify_kcmp,
-	.min_kver = "3.5.0",
 	.needs_tmpdir = 1,
 };
diff --git a/testcases/kernel/syscalls/kcmp/kcmp02.c b/testcases/kernel/syscalls/kcmp/kcmp02.c
index ab07bb866..076b4a723 100644
--- a/testcases/kernel/syscalls/kcmp/kcmp02.c
+++ b/testcases/kernel/syscalls/kcmp/kcmp02.c
@@ -94,6 +94,5 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_kcmp,
-	.min_kver = "3.5.0",
 	.needs_tmpdir = 1
 };
diff --git a/testcases/kernel/syscalls/kcmp/kcmp03.c b/testcases/kernel/syscalls/kcmp/kcmp03.c
index 4b90e6d87..7af5cb150 100644
--- a/testcases/kernel/syscalls/kcmp/kcmp03.c
+++ b/testcases/kernel/syscalls/kcmp/kcmp03.c
@@ -87,5 +87,4 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.forks_child = 1,
 	.test = verify_kcmp,
-	.min_kver = "3.5.0"
 };
diff --git a/testcases/kernel/syscalls/keyctl/keyctl08.c b/testcases/kernel/syscalls/keyctl/keyctl08.c
index bc01192e7..be4b23b14 100644
--- a/testcases/kernel/syscalls/keyctl/keyctl08.c
+++ b/testcases/kernel/syscalls/keyctl/keyctl08.c
@@ -28,7 +28,6 @@ void run(void)
 static struct tst_test test = {
 	.test_all = run,
 	.needs_root = 1,
-	.min_kver = "2.6.13",
 	.tags = (const struct tst_tag[]) {
 		{"CVE", "2016-9604"},
 		{"linux-git", "ee8f844e3c5a"},
diff --git a/testcases/kernel/syscalls/madvise/madvise05.c b/testcases/kernel/syscalls/madvise/madvise05.c
index 3ab4a8749..9b00a1ff0 100644
--- a/testcases/kernel/syscalls/madvise/madvise05.c
+++ b/testcases/kernel/syscalls/madvise/madvise05.c
@@ -46,7 +46,6 @@ static void verify_madvise(void)
 }
 
 static struct tst_test test = {
-	.min_kver = "3.9.0",
 	.test_all = verify_madvise,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "ee53664bda16"},
diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
index c1c55bbc2..c7967ae6f 100644
--- a/testcases/kernel/syscalls/madvise/madvise06.c
+++ b/testcases/kernel/syscalls/madvise/madvise06.c
@@ -235,7 +235,6 @@ static void test_advice_willneed(void)
 static struct tst_test test = {
 	.test_all = test_advice_willneed,
 	.setup = setup,
-	.min_kver = "3.10.0",
 	.needs_tmpdir = 1,
 	.needs_root = 1,
 	.save_restore = (const struct tst_path_val[]) {
diff --git a/testcases/kernel/syscalls/madvise/madvise07.c b/testcases/kernel/syscalls/madvise/madvise07.c
index ca76d237b..d6e2e7d1f 100644
--- a/testcases/kernel/syscalls/madvise/madvise07.c
+++ b/testcases/kernel/syscalls/madvise/madvise07.c
@@ -92,7 +92,6 @@ static void run(void)
 
 static struct tst_test test = {
 	.test_all = run,
-	.min_kver = "2.6.31",
 	.needs_root = 1,
 	.forks_child = 1
 };
diff --git a/testcases/kernel/syscalls/madvise/madvise08.c b/testcases/kernel/syscalls/madvise/madvise08.c
index 0996cf91b..96bcaf159 100644
--- a/testcases/kernel/syscalls/madvise/madvise08.c
+++ b/testcases/kernel/syscalls/madvise/madvise08.c
@@ -208,7 +208,6 @@ static struct tst_test test = {
 	.tcnt = 2,
 	.setup = setup,
 	.cleanup = cleanup,
-	.min_kver = "3.4.0",
 	.needs_tmpdir = 1,
 	.needs_root = 1,
 	.forks_child = 1,
diff --git a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
index f77e47539..4d3299b61 100644
--- a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
+++ b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
@@ -140,7 +140,6 @@ static void migrate_test(void)
 
 static struct tst_test test = {
 	.max_runtime = 300,
-	.min_kver = "2.6.32",
 	.needs_root = 1,
 	.setup = setup,
 	.cleanup = cleanup,
diff --git a/testcases/kernel/syscalls/mlock2/mlock201.c b/testcases/kernel/syscalls/mlock2/mlock201.c
index 1d1f5b7ac..b0e5f12b7 100644
--- a/testcases/kernel/syscalls/mlock2/mlock201.c
+++ b/testcases/kernel/syscalls/mlock2/mlock201.c
@@ -144,5 +144,4 @@ static struct tst_test test = {
 	.test = verify_mlock2,
 	.setup = setup,
 	.needs_root = 1,
-	.min_kver = "2.6.9",
 };
diff --git a/testcases/kernel/syscalls/mlock2/mlock202.c b/testcases/kernel/syscalls/mlock2/mlock202.c
index 630da6568..3b4965065 100644
--- a/testcases/kernel/syscalls/mlock2/mlock202.c
+++ b/testcases/kernel/syscalls/mlock2/mlock202.c
@@ -109,5 +109,4 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
-	.min_kver = "2.6.9",
 };
diff --git a/testcases/kernel/syscalls/mlock2/mlock203.c b/testcases/kernel/syscalls/mlock2/mlock203.c
index 8451b2cd1..0a519ad51 100644
--- a/testcases/kernel/syscalls/mlock2/mlock203.c
+++ b/testcases/kernel/syscalls/mlock2/mlock203.c
@@ -88,5 +88,4 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_root = 1,
-	.min_kver = "2.6.9",
 };
diff --git a/testcases/kernel/syscalls/mmap/mmap12.c b/testcases/kernel/syscalls/mmap/mmap12.c
index 2c0ebfb22..995a2bab0 100644
--- a/testcases/kernel/syscalls/mmap/mmap12.c
+++ b/testcases/kernel/syscalls/mmap/mmap12.c
@@ -135,5 +135,4 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = verify_mmap,
 	.needs_tmpdir = 1,
-	.min_kver = "2.6.25",
 };
diff --git a/testcases/kernel/syscalls/move_pages/move_pages12.c b/testcases/kernel/syscalls/move_pages/move_pages12.c
index df55bbbe9..fd7017d79 100644
--- a/testcases/kernel/syscalls/move_pages/move_pages12.c
+++ b/testcases/kernel/syscalls/move_pages/move_pages12.c
@@ -333,7 +333,6 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.min_kver = "2.6.32",
 	.needs_root = 1,
 	.forks_child = 1,
 	.setup = setup,
diff --git a/testcases/kernel/syscalls/msync/msync04.c b/testcases/kernel/syscalls/msync/msync04.c
index abe8f1659..72ddc27a4 100644
--- a/testcases/kernel/syscalls/msync/msync04.c
+++ b/testcases/kernel/syscalls/msync/msync04.c
@@ -102,5 +102,4 @@ static struct tst_test test = {
 		"tmpfs",
 		NULL
 	},
-	.min_kver = "2.6.25",
 };
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_04.c b/testcases/kernel/syscalls/pipe2/pipe2_04.c
index 45e0f075b..3911f95b4 100644
--- a/testcases/kernel/syscalls/pipe2/pipe2_04.c
+++ b/testcases/kernel/syscalls/pipe2/pipe2_04.c
@@ -97,7 +97,6 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.min_kver = "2.6.35",
 	.test_all = test_pipe2,
 	.setup = setup,
 	.cleanup = cleanup,
diff --git a/testcases/kernel/syscalls/preadv/preadv01.c b/testcases/kernel/syscalls/preadv/preadv01.c
index 4b257968d..62f9296f2 100644
--- a/testcases/kernel/syscalls/preadv/preadv01.c
+++ b/testcases/kernel/syscalls/preadv/preadv01.c
@@ -105,7 +105,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_preadv,
-	.min_kver = "2.6.30",
 	.needs_tmpdir = 1,
 	.bufs = (struct tst_buffers []) {
 		{&rd_iovec, .iov_sizes = (int[]){CHUNK, 0, -1}},
diff --git a/testcases/kernel/syscalls/preadv/preadv02.c b/testcases/kernel/syscalls/preadv/preadv02.c
index 12d93da43..500059e42 100644
--- a/testcases/kernel/syscalls/preadv/preadv02.c
+++ b/testcases/kernel/syscalls/preadv/preadv02.c
@@ -126,6 +126,5 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_preadv,
-	.min_kver = "2.6.30",
 	.needs_tmpdir = 1,
 };
diff --git a/testcases/kernel/syscalls/preadv/preadv03.c b/testcases/kernel/syscalls/preadv/preadv03.c
index 00b25c549..d4595dda6 100644
--- a/testcases/kernel/syscalls/preadv/preadv03.c
+++ b/testcases/kernel/syscalls/preadv/preadv03.c
@@ -131,7 +131,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_direct_preadv,
-	.min_kver = "2.6.30",
 	.mntpoint = MNTPOINT,
 	.mount_device = 1,
 	.all_filesystems = 1,
diff --git a/testcases/kernel/syscalls/pwritev/pwritev01.c b/testcases/kernel/syscalls/pwritev/pwritev01.c
index 1ee783855..66358f7c4 100644
--- a/testcases/kernel/syscalls/pwritev/pwritev01.c
+++ b/testcases/kernel/syscalls/pwritev/pwritev01.c
@@ -103,6 +103,5 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_pwritev,
-	.min_kver = "2.6.30",
 	.needs_tmpdir = 1,
 };
diff --git a/testcases/kernel/syscalls/pwritev/pwritev02.c b/testcases/kernel/syscalls/pwritev/pwritev02.c
index 82792df27..0881b7566 100644
--- a/testcases/kernel/syscalls/pwritev/pwritev02.c
+++ b/testcases/kernel/syscalls/pwritev/pwritev02.c
@@ -117,6 +117,5 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_pwritev,
-	.min_kver = "2.6.30",
 	.needs_tmpdir = 1,
 };
diff --git a/testcases/kernel/syscalls/pwritev/pwritev03.c b/testcases/kernel/syscalls/pwritev/pwritev03.c
index 91a5e3c54..8b91de336 100644
--- a/testcases/kernel/syscalls/pwritev/pwritev03.c
+++ b/testcases/kernel/syscalls/pwritev/pwritev03.c
@@ -130,7 +130,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_direct_pwritev,
-	.min_kver = "2.6.30",
 	.mntpoint = MNTPOINT,
 	.mount_device = 1,
 	.all_filesystems = 1,
diff --git a/testcases/kernel/syscalls/recvmsg/recvmsg02.c b/testcases/kernel/syscalls/recvmsg/recvmsg02.c
index b15b37867..3aac4dd36 100644
--- a/testcases/kernel/syscalls/recvmsg/recvmsg02.c
+++ b/testcases/kernel/syscalls/recvmsg/recvmsg02.c
@@ -94,7 +94,6 @@ static void cleanup(void)
 }
 
 static struct tst_test test = {
-	.min_kver = "2.6.27",
 	.test_all = verify_recvmsg,
 	.cleanup = cleanup,
 	.tags = (const struct tst_tag[]) {
diff --git a/testcases/kernel/syscalls/sendfile/sendfile08.c b/testcases/kernel/syscalls/sendfile/sendfile08.c
index da334f1f5..66fd40cae 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile08.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile08.c
@@ -71,7 +71,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = run,
-	.min_kver = "2.6.33",
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "2cb4b05e76478"},
 		{}
diff --git a/testcases/kernel/syscalls/sendfile/sendfile09.c b/testcases/kernel/syscalls/sendfile/sendfile09.c
index 66d5f31a9..4a2d2083f 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile09.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile09.c
@@ -96,7 +96,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.test = run,
 	.tcnt = ARRAY_SIZE(tc),
-	.min_kver = "2.6.33",
 	.max_runtime = 120,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "5d73320a96fcc"},
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt02.c b/testcases/kernel/syscalls/setsockopt/setsockopt02.c
index f0a2a5ecd..e7621538b 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt02.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt02.c
@@ -96,5 +96,4 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.setup = setup,
 	.cleanup = cleanup,
-	.min_kver = "3.2",
 };
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt03.c b/testcases/kernel/syscalls/setsockopt/setsockopt03.c
index 191c4cdfe..210b75429 100644
--- a/testcases/kernel/syscalls/setsockopt/setsockopt03.c
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt03.c
@@ -74,7 +74,6 @@ static void run(void)
 }
 
 static struct tst_test test = {
-	.min_kver = "2.6.32",
 	.setup = setup,
 	.test_all = run,
 	.needs_root = 1,
diff --git a/testcases/kernel/syscalls/socket/socket02.c b/testcases/kernel/syscalls/socket/socket02.c
index 59fd942d5..51b8cc59c 100644
--- a/testcases/kernel/syscalls/socket/socket02.c
+++ b/testcases/kernel/syscalls/socket/socket02.c
@@ -68,6 +68,5 @@ static void cleanup(void)
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_socket,
-	.min_kver = "2.6.27",
 	.cleanup = cleanup
 };
diff --git a/testcases/kernel/syscalls/socketpair/socketpair02.c b/testcases/kernel/syscalls/socketpair/socketpair02.c
index e23945c53..eb679d5d9 100644
--- a/testcases/kernel/syscalls/socketpair/socketpair02.c
+++ b/testcases/kernel/syscalls/socketpair/socketpair02.c
@@ -81,6 +81,5 @@ static void cleanup(void)
 static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test = verify_socketpair,
-	.min_kver = "2.6.27",
 	.cleanup = cleanup
 };
diff --git a/testcases/kernel/syscalls/splice/splice01.c b/testcases/kernel/syscalls/splice/splice01.c
index f5b2cbe17..508ccdeb7 100644
--- a/testcases/kernel/syscalls/splice/splice01.c
+++ b/testcases/kernel/syscalls/splice/splice01.c
@@ -101,5 +101,4 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = splice_test,
 	.needs_tmpdir = 1,
-	.min_kver = "2.6.17",
 };
diff --git a/testcases/kernel/syscalls/splice/splice02.c b/testcases/kernel/syscalls/splice/splice02.c
index b29415a8a..1da1186b2 100644
--- a/testcases/kernel/syscalls/splice/splice02.c
+++ b/testcases/kernel/syscalls/splice/splice02.c
@@ -155,7 +155,6 @@ static struct tst_test test = {
 	.setup = setup,
 	.needs_tmpdir = 1,
 	.forks_child = 1,
-	.min_kver = "2.6.17",
 	.options = (struct tst_option[]) {
 		{"s:", &sarg, "Size of output file in bytes (default: 16x max pipe size, i.e. 1M on intel)"},
 		{}
diff --git a/testcases/kernel/syscalls/splice/splice03.c b/testcases/kernel/syscalls/splice/splice03.c
index f3c135dee..c054e6c1c 100644
--- a/testcases/kernel/syscalls/splice/splice03.c
+++ b/testcases/kernel/syscalls/splice/splice03.c
@@ -123,5 +123,4 @@ static struct tst_test test = {
 	.test = splice_verify,
 	.tcnt = ARRAY_SIZE(tcases),
 	.needs_tmpdir = 1,
-	.min_kver = "2.6.17",
 };
diff --git a/testcases/kernel/syscalls/splice/splice04.c b/testcases/kernel/syscalls/splice/splice04.c
index 896f45839..5e6e8df05 100644
--- a/testcases/kernel/syscalls/splice/splice04.c
+++ b/testcases/kernel/syscalls/splice/splice04.c
@@ -83,5 +83,4 @@ static struct tst_test test = {
 		{"l:", &str_len_data, "Length of test data (in bytes)"},
 		{}
 	},
-	.min_kver = "2.6.31"
 };
diff --git a/testcases/kernel/syscalls/splice/splice05.c b/testcases/kernel/syscalls/splice/splice05.c
index d77dc887e..501df10f6 100644
--- a/testcases/kernel/syscalls/splice/splice05.c
+++ b/testcases/kernel/syscalls/splice/splice05.c
@@ -108,5 +108,4 @@ static struct tst_test test = {
 		{"l:", &str_len_data, "Length of test data (in bytes)"},
 		{}
 	},
-	.min_kver = "2.6.17"
 };
diff --git a/testcases/kernel/syscalls/switch/endian_switch01.c b/testcases/kernel/syscalls/switch/endian_switch01.c
index f357ff54d..bee35184a 100644
--- a/testcases/kernel/syscalls/switch/endian_switch01.c
+++ b/testcases/kernel/syscalls/switch/endian_switch01.c
@@ -93,7 +93,6 @@ static void endian_test(void)
 
 static struct tst_test test = {
 	.test_all = endian_test,
-	.min_kver = "2.6.26",
 	.forks_child = 1,
 };
 
diff --git a/testcases/kernel/syscalls/tee/tee01.c b/testcases/kernel/syscalls/tee/tee01.c
index 87a7ecd09..d1489d045 100644
--- a/testcases/kernel/syscalls/tee/tee01.c
+++ b/testcases/kernel/syscalls/tee/tee01.c
@@ -106,5 +106,4 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test_all = tee_test,
 	.needs_tmpdir = 1,
-	.min_kver = "2.6.17",
 };
diff --git a/testcases/kernel/syscalls/tee/tee02.c b/testcases/kernel/syscalls/tee/tee02.c
index 885877d1f..5ebb3c3f6 100644
--- a/testcases/kernel/syscalls/tee/tee02.c
+++ b/testcases/kernel/syscalls/tee/tee02.c
@@ -90,5 +90,4 @@ static struct tst_test test = {
 	.test = tee_verify,
 	.tcnt = ARRAY_SIZE(tcases),
 	.needs_tmpdir = 1,
-	.min_kver = "2.6.17",
 };
diff --git a/testcases/kernel/syscalls/timerfd/timerfd01.c b/testcases/kernel/syscalls/timerfd/timerfd01.c
index 9f5694217..4461c4fd4 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd01.c
@@ -158,5 +158,4 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
-	.min_kver = "2.6.25",
 };
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c b/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
index aba77c05d..8dd31f9f0 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_gettime01.c
@@ -101,5 +101,4 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
-	.min_kver = "2.6.25",
 };
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime01.c b/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
index 36577e2c4..7ebcaf4b4 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_settime01.c
@@ -108,5 +108,4 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.needs_tmpdir = 1,
-	.min_kver = "2.6.25",
 };
diff --git a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
index 84ce95538..33d9f7b46 100644
--- a/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
+++ b/testcases/kernel/syscalls/timerfd/timerfd_settime02.c
@@ -110,7 +110,6 @@ static struct tst_test test = {
 	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.cleanup = cleanup,
-	.min_kver = "2.6.25",
 	.taint_check = TST_TAINT_W | TST_TAINT_D,
 	.max_runtime = 150,
 	.tags = (const struct tst_tag[]) {
diff --git a/testcases/kernel/syscalls/unlinkat/unlinkat01.c b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
index cdbb09927..7dba1d641 100644
--- a/testcases/kernel/syscalls/unlinkat/unlinkat01.c
+++ b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
@@ -107,7 +107,6 @@ static void cleanup(void)
 static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.tcnt = ARRAY_SIZE(tc),
-	.min_kver = "2.6.16",
 	.setup = setup,
 	.test = run,
 	.cleanup = cleanup,
diff --git a/testcases/kernel/syscalls/vmsplice/vmsplice01.c b/testcases/kernel/syscalls/vmsplice/vmsplice01.c
index 36ecc08ef..17486179b 100644
--- a/testcases/kernel/syscalls/vmsplice/vmsplice01.c
+++ b/testcases/kernel/syscalls/vmsplice/vmsplice01.c
@@ -121,5 +121,4 @@ static struct tst_test test = {
 		"nfs",
 		NULL
 	},
-	.min_kver = "2.6.17",
 };
diff --git a/testcases/kernel/syscalls/vmsplice/vmsplice02.c b/testcases/kernel/syscalls/vmsplice/vmsplice02.c
index 0135b6f7e..8f1965c2e 100644
--- a/testcases/kernel/syscalls/vmsplice/vmsplice02.c
+++ b/testcases/kernel/syscalls/vmsplice/vmsplice02.c
@@ -103,5 +103,4 @@ static struct tst_test test = {
 		"nfs",
 		NULL
 	},
-	.min_kver = "2.6.17",
 };
diff --git a/testcases/kernel/syscalls/vmsplice/vmsplice03.c b/testcases/kernel/syscalls/vmsplice/vmsplice03.c
index 622c11017..d3a39254b 100644
--- a/testcases/kernel/syscalls/vmsplice/vmsplice03.c
+++ b/testcases/kernel/syscalls/vmsplice/vmsplice03.c
@@ -62,7 +62,6 @@ static void setup(void)
 static struct tst_test test = {
 	.setup = setup,
 	.test_all = vmsplice_test,
-	.min_kver = "2.6.23",
 	.bufs = (struct tst_buffers []) {
 		{&iov, .iov_sizes = (int[]){TEST_BLOCK_SIZE, -1}},
 		{}
diff --git a/testcases/kernel/syscalls/vmsplice/vmsplice04.c b/testcases/kernel/syscalls/vmsplice/vmsplice04.c
index 9aaa0b56f..96c24bc60 100644
--- a/testcases/kernel/syscalls/vmsplice/vmsplice04.c
+++ b/testcases/kernel/syscalls/vmsplice/vmsplice04.c
@@ -88,6 +88,5 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = vmsplice_test,
-	.min_kver = "2.6.17",
 	.forks_child = 1,
 };
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
