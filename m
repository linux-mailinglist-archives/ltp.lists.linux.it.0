Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D934746C
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 10:21:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BE573C9422
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Mar 2021 10:21:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B2EB73C93F8
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 10:21:20 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4B738600816
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 10:21:17 +0100 (CET)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F52jG4kHBzPlkJ
 for <ltp@lists.linux.it>; Wed, 24 Mar 2021 17:18:42 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 17:21:06 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Wed, 24 Mar 2021 17:20:59 +0800
Message-ID: <20210324092059.8503-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/bind: Use safe_macros to check the return
 value of the close() & bind().
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

For those:
  testcases/kernel/syscalls/bind/bind03.c
  testcases/kernel/syscalls/bind/bind06.c

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/bind/bind03.c | 4 ++--
 testcases/kernel/syscalls/bind/bind06.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/bind/bind03.c b/testcases/kernel/syscalls/bind/bind03.c
index c39e8f197..ebde19591 100644
--- a/testcases/kernel/syscalls/bind/bind03.c
+++ b/testcases/kernel/syscalls/bind/bind03.c
@@ -66,8 +66,8 @@ void run(void)

 static void cleanup(void)
 {
-	close(sock1);
-	close(sock2);
+	SAFE_CLOSE(sock1);
+	SAFE_CLOSE(sock2);
 }

 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/bind/bind06.c b/testcases/kernel/syscalls/bind/bind06.c
index e971a8940..017e0fc89 100644
--- a/testcases/kernel/syscalls/bind/bind06.c
+++ b/testcases/kernel/syscalls/bind/bind06.c
@@ -60,8 +60,8 @@ static void cleanup(void)

 static void do_bind(void)
 {
-	bind(fd, (struct sockaddr *)&addr1, sizeof(addr1));
-	bind(fd, (struct sockaddr *)&addr2, sizeof(addr2));
+	SAFE_BIND(fd, (struct sockaddr *)&addr1, sizeof(addr1));
+	SAFE_BIND(fd, (struct sockaddr *)&addr2, sizeof(addr2));
 }

 static void *thread_run(void *arg)
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
