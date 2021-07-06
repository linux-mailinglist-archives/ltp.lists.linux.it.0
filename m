Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D8A3BD7AF
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 15:22:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 801E23C955D
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 15:22:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 57BE13C0F90
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 15:22:03 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4BAC76002EC
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 15:22:03 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58]
 helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <cascardo@canonical.com>)
 id 1m0l1V-0005Zr-Ed; Tue, 06 Jul 2021 13:22:01 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: ltp@lists.linux.it
Date: Tue,  6 Jul 2021 10:21:14 -0300
Message-Id: <20210706132114.204443-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] shmget02: fix EPERM test when RLIMIT_MEMLOCK is large
 enough
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

shmget(..., SHM_HUGETLB) will not fail with EPERM if there is enough space
for RLIMIT_MEMLOCK. If the limit is 0, it will fail with EPERM as expected
when a not enough privileged user calls it.

Set RLIMIT_MEMLOCK to 0 for all calls, as this is the only one which will
fail because of that limit, unless we are talking about very old kernels
(before 2.6.9).

Fixes: 4dc493b44a85 ("syscalls/shmget*: Convert into new api")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 testcases/kernel/syscalls/ipc/shmget/shmget02.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
index 6be8d8157999..8857207cfd3d 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
@@ -64,6 +64,7 @@ static void do_test(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 	pid_t pid;
+	struct rlimit rl = { 0, 0 };
 
 	if (tc->exp_user == 0 && tc->exp_group == 0) {
 		TST_EXP_FAIL2(shmget(*tc->shmkey, tc->size, tc->flags), tc->exp_err,
@@ -78,6 +79,7 @@ static void do_test(unsigned int n)
 			SAFE_SETGID(pw->pw_gid);
 		}
 		SAFE_SETUID(pw->pw_uid);
+		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &rl);
 		TST_EXP_FAIL2(shmget(*tc->shmkey, tc->size, tc->flags), tc->exp_err,
 			"shmget(%i, %lu, %i)", *tc->shmkey, tc->size, tc->flags);
 		exit(0);
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
