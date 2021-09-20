Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5923F415937
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 09:42:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1A463C8789
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Sep 2021 09:42:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8EB7C3C8120
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 09:42:40 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6B512201020
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 09:42:37 +0200 (CEST)
Received: from dggeml753-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HFRtV1tFfz1DHCF
 for <ltp@lists.linux.it>; Thu, 23 Sep 2021 15:41:22 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 dggeml753-chm.china.huawei.com (10.1.199.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Thu, 23 Sep 2021 15:42:33 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 21 Sep 2021 06:12:12 +0800
Message-ID: <20210920221212.8478-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeml753-chm.china.huawei.com (10.1.199.152)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] open_posix: Add failure handling of fork()
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

When fork() failed and transfer the return value(-1) to kill(),
it would freeze the system, so it is very serious in this
cases and should be avoided.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../conformance/interfaces/clock_nanosleep/1-5.c             | 5 ++++-
 .../conformance/interfaces/nanosleep/3-2.c                   | 5 ++++-
 .../conformance/interfaces/sigaction/10-1.c                  | 5 ++++-
 .../conformance/interfaces/sigaction/11-1.c                  | 5 ++++-
 .../conformance/interfaces/sigaction/9-1.c                   | 5 ++++-
 5 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep/1-5.c b/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep/1-5.c
index 263d98a08..7c09d7599 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep/1-5.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep/1-5.c
@@ -35,7 +35,10 @@ int main(void)
 		return PTS_UNRESOLVED;
 	}

-	if ((pid = fork()) == 0) {
+	if ((pid = fork()) < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
+	} else if (pid == 0) {
 		/* child here */
 		struct timespec tssleep;

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/nanosleep/3-2.c b/testcases/open_posix_testsuite/conformance/interfaces/nanosleep/3-2.c
index 4016fb4e6..bfc271edf 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/nanosleep/3-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/nanosleep/3-2.c
@@ -31,7 +31,10 @@ int main(void)
 		return PTS_UNRESOLVED;
 	}

-	if ((pid = fork()) == 0) {
+	if ((pid = fork()) < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
+	} else if (pid == 0) {
 		/* child here */
 		struct timespec tssleep;

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/10-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/10-1.c
index 02150a150..722cbf2b5 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/10-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/10-1.c
@@ -66,7 +66,10 @@ int main(void)
 	sigemptyset(&act.sa_mask);
 	sigaction(SIGCHLD, &act, 0);

-	if ((pid = fork()) == 0) {
+	if ((pid = fork()) < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
+	} else if (pid == 0) {
 		/* child */
 		while (1) {
 			/* wait forever, or until we are
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/11-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/11-1.c
index 41db84865..fcf5e7837 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/11-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/11-1.c
@@ -51,7 +51,10 @@ int main(void)
 	sigemptyset(&act.sa_mask);
 	sigaction(SIGCHLD, &act, 0);

-	if ((pid = fork()) == 0) {
+	if ((pid = fork()) < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
+	} else if (pid == 0) {
 		/* child */
 		while (1) {
 			/* wait forever, or until we are
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/9-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/9-1.c
index 1d45c09c6..dc3200eae 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/9-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/9-1.c
@@ -51,7 +51,10 @@ int main(void)
 	sigemptyset(&act.sa_mask);
 	sigaction(SIGCHLD, &act, 0);

-	if ((pid = fork()) == 0) {
+	if ((pid = fork()) < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
+	} else if (pid == 0) {
 		/* child */
 		/* wait forever, or until we are
 		   interrupted by a signal */
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
