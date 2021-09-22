Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7341414C
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 07:40:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA4593CA207
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 07:40:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 441E83C6A0B
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 07:40:04 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BAD8210011A4
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 07:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1632289201; i=@fujitsu.com;
 bh=y8nha+kmcoTHOEeA+4OKV6R6gKvF2JZOuhloUP3k0ks=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=qv/M1M40eN95xbJsZJgZ3nCht0ywwIIfwL3gdnJseSYmYd8n8PxVJ2egJMiwdckQ5
 53r7DiDkSo5/Y37DHBHfO9sDF0dFtM5d0zpmQVnhtpvnbkQFORNpG3DSbYuY3+FXjf
 tG7IUfVnaBxLM2VAqYPkp4OD/WnJjQV3CkW1CBLPBMcyIcfmcZ+29zty9U41A64gNp
 +zR6TugiEDor8w0RwjQ/LMSvpfsIz86r8CUYlx5W8/iuVBr9Btpb+zHPxwJyqfONEC
 oQzpw1EEJTyY5R1bx8PVArKHDuCQIWcaJVHUKu7ITLcQSN7NEKiqH6WKaEBVOaiUSC
 wNJKju1Sb6BgQ==
Received: from [100.113.4.108] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 3F/22-23595-1B1CA416;
 Wed, 22 Sep 2021 05:40:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MRqrvxoFe
 iwYaZ7BYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8bWjrtMBZ8EKt5/nsrawLiZr4uRi0NIoIVJ
 4v+VT8wQzh5Gib+TPjF2MXJysAloSjzrXMAMYosISEh0NLxlB7GZBdQllk/6xQRiCwt4Sxw5f
 xLMZhFQlZj3dhGYzSvgITF7WQNYr4SAgsSUh+/BbE4BT4l3L/aCzRcCqjnx/zobRL2gxMmZT1
 gg5ktIHHzxAqpXUeJSxzdGCLtCYtasNqYJjPyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6hgYG
 uoaGxrqmukYmhXmKVbpJeaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzAkUwpZP+5gPPT6
 g94hRkkOJiVRXndtr0QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxn9wPlBItS01Mr0jJzgPEBk
 5bg4FES4RXYBZTmLS5IzC3OTIdInWLU5WietHw7sxBLXn5eqpQ4b8kBoCIBkKKM0jy4EbBYvc
 QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPftPqApPJl5JXCbXgEdwQR0BP9KD5AjShIRUlI
 NTNMkElm+r3yYd4t75ykZMYdbnmLcYW4fwq2K8j+HPf+UuqPy4f1jicmxFTMYQuo2/mKa25Hd
 s3hZ2PwNtnYZGRN8Apt9t/3i+f9j1VVWhcwQFb3w+4tbJ35a+uYms22sHW/brKCc7rrQmpNsL
 /p/nN3sqJIfeiDJ4ItYrEj5/Ci/lPyCttPB5XUOqkIvjpvcPKvmFnGl3qyy9d7Cvh8xYq9b7F
 z2PAsoe96l9uzSae2LEkWh38KPV5cwSQgt7LvE8OPDl97UZ6Z8Mye/krn9UVRqqzarUg6H0JN
 V8xiFvLd1RegFv1g/Nf3y/U8/Pcy9/t9tPsobcXDp/AdvP2WeOWEyqcfyhCuvsXpDBV+JEktx
 RqKhFnNRcSIA00TIM1ADAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-20.tower-238.messagelabs.com!1632289200!116927!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24024 invoked from network); 22 Sep 2021 05:40:01 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-20.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Sep 2021 05:40:01 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18M5dthE005296
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 06:40:00 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 22 Sep 2021 06:39:56 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 22 Sep 2021 13:39:41 +0800
Message-ID: <1632289182-2191-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632289182-2191-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1632289182-2191-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/3] syscalls/dup206: Add a test when newfd equals
 oldfd
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

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                          |  1 +
 testcases/kernel/syscalls/dup2/.gitignore |  1 +
 testcases/kernel/syscalls/dup2/dup206.c   | 51 +++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 testcases/kernel/syscalls/dup2/dup206.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 29d7752c7..068fba456 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -153,6 +153,7 @@ dup202 dup202
 dup203 dup203
 dup204 dup204
 dup205 dup205
+dup206 dup206
 
 dup3_01 dup3_01
 dup3_02 dup3_02
diff --git a/testcases/kernel/syscalls/dup2/.gitignore b/testcases/kernel/syscalls/dup2/.gitignore
index 6c4685b80..e2e008b58 100644
--- a/testcases/kernel/syscalls/dup2/.gitignore
+++ b/testcases/kernel/syscalls/dup2/.gitignore
@@ -3,3 +3,4 @@
 /dup203
 /dup204
 /dup205
+/dup206
diff --git a/testcases/kernel/syscalls/dup2/dup206.c b/testcases/kernel/syscalls/dup2/dup206.c
new file mode 100644
index 000000000..e5074ea83
--- /dev/null
+++ b/testcases/kernel/syscalls/dup2/dup206.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * If oldfd is a valid file descriptor, and newfd has the same value as oldfd,
+ * then dup2() does nothing, and returns newfd.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include "tst_test.h"
+
+static int fd = -1;
+
+static void verify_dup2(void)
+{
+	TST_EXP_FD_SILENT(dup2(fd, fd), "dup2(%d, %d)", fd, fd);
+
+	if (TST_RET != fd) {
+		tst_res(TFAIL, "dup2(%d, %d) returns wrong newfd(%ld)", fd, fd, TST_RET);
+		SAFE_CLOSE(TST_RET);
+		return;
+	}
+	tst_res(TPASS, "dup2(%d, %d) returns newfd(%d)", fd, fd, fd);
+}
+
+static void setup(void)
+{
+	char testfile[40];
+
+	sprintf(testfile, "dup206.%d", getpid());
+	fd = SAFE_OPEN(testfile, O_RDWR | O_CREAT, 0666);
+}
+
+static void cleanup(void)
+{
+	if (fd > -1)
+		SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_dup2,
+};
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
