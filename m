Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F29402917
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Sep 2021 14:41:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC0953C9391
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Sep 2021 14:41:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5CE7F3C23B8
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 14:41:21 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 563761401127
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 14:41:18 +0200 (CEST)
Received: from dggeml753-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H3lCG6F4yzblvn
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 20:37:14 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 dggeml753-chm.china.huawei.com (10.1.199.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Tue, 7 Sep 2021 20:41:14 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Sun, 5 Sep 2021 11:11:13 +0800
Message-ID: <20210905031113.2740-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeml753-chm.china.huawei.com (10.1.199.152)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] open_posix: Add failure handling of fork()
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
kill(-1, SIGSTOP) would freeze the system, so it is very serious
in this cases and should be avoided.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../conformance/interfaces/clock_nanosleep/1-5.c               | 3 +++
 .../conformance/interfaces/nanosleep/3-2.c                     | 3 +++
 .../conformance/interfaces/sigaction/10-1.c                    | 3 +++
 .../conformance/interfaces/sigaction/11-1.c                    | 3 +++
 .../conformance/interfaces/sigaction/9-1.c                     | 3 +++
 5 files changed, 15 insertions(+)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep/1-5.c b/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep/1-5.c
index 46f26163d..a87585884 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep/1-5.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep/1-5.c
@@ -48,6 +48,9 @@ int main(void)
 			return CHILDFAIL;
 		}
 		return CHILDFAIL;
+	} else if (pid < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
 	} else {
 		/* parent here */
 		int i;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/nanosleep/3-2.c b/testcases/open_posix_testsuite/conformance/interfaces/nanosleep/3-2.c
index 4016fb4e6..472dd48ba 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/nanosleep/3-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/nanosleep/3-2.c
@@ -45,6 +45,9 @@ int main(void)
 			return CHILDFAIL;
 		}
 		return CHILDFAIL;
+	} else if ( pid < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
 	} else {
 		/* parent here */
 		int i;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/10-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/10-1.c
index 02150a150..2212c98f0 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/10-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/10-1.c
@@ -76,6 +76,9 @@ int main(void)
 			select(0, NULL, NULL, NULL, &tv);
 		}
 		return 0;
+	} else if (pid < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
 	} else {
 		/* parent */
 		int s;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/11-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/11-1.c
index 41db84865..a88e969dc 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/11-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/11-1.c
@@ -61,6 +61,9 @@ int main(void)
 			select(0, NULL, NULL, NULL, &tv);
 		}
 		return 0;
+	} else if (pid < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
 	} else {
 		/* parent */
 		int s;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/9-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/9-1.c
index 1d45c09c6..70df68332 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sigaction/9-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sigaction/9-1.c
@@ -57,6 +57,9 @@ int main(void)
 		   interrupted by a signal */
 		select(0, NULL, NULL, NULL, NULL);
 		return 0;
+	} else if (pid < 0) {
+		printf("fork() did not return success\n");
+		return PTS_UNRESOLVED;
 	} else {
 		/* parent */
 		int s;
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
