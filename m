Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01433CAED
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 02:34:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 031113C6453
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 02:34:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 5F03F3C088E
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 02:34:50 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 136911000B26
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 02:34:49 +0100 (CET)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dzwkt0CLYzPjjP
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 09:32:22 +0800 (CST)
Received: from huawei.com (10.67.174.209) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Tue, 16 Mar 2021
 09:34:35 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 16 Mar 2021 09:34:24 +0800
Message-ID: <20210316013424.196511-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] kernel/syscalls: Use TERRNO because we're not using
 the TEST() macro.
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
  testcases/kernel/syscalls/fallocate/fallocate01.c
  testcases/kernel/syscalls/memfd_create/memfd_create01.c
  testcases/kernel/syscalls/perf_event_open/perf_event_open01.c

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 testcases/kernel/syscalls/fallocate/fallocate01.c           | 4 ++--
 testcases/kernel/syscalls/memfd_create/memfd_create01.c     | 2 +-
 .../kernel/syscalls/perf_event_open/perf_event_open01.c     | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/fallocate/fallocate01.c b/testcases/kernel/syscalls/fallocate/fallocate01.c
index 02aa33100..c60e160f4 100644
--- a/testcases/kernel/syscalls/fallocate/fallocate01.c
+++ b/testcases/kernel/syscalls/fallocate/fallocate01.c
@@ -247,14 +247,14 @@ void runtest(int mode, int fd, loff_t expected_size)
 		tst_resm(TFAIL | TERRNO, "fstat failed after fallocate()");

 	if (file_stat.st_size != expected_size)
-		tst_resm(TFAIL | TTERRNO,
+		tst_resm(TFAIL | TERRNO,
 			 "fstat test fails on fallocate (%d, %d, %" PRId64 ", %"
 			 PRId64 ") Failed on mode", fd, mode, offset, len);

 	write_offset = random() % len;
 	lseek_offset = lseek(fd, write_offset, SEEK_CUR);
 	if (lseek_offset != offset + write_offset) {
-		tst_resm(TFAIL | TTERRNO,
+		tst_resm(TFAIL | TERRNO,
 			 "lseek fails in fallocate(%d, %d, %" PRId64 ", %"
 			 PRId64 ") failed on mode", fd, mode, offset, len);
 		return;
diff --git a/testcases/kernel/syscalls/memfd_create/memfd_create01.c b/testcases/kernel/syscalls/memfd_create/memfd_create01.c
index e0db69dff..bdc0c8512 100644
--- a/testcases/kernel/syscalls/memfd_create/memfd_create01.c
+++ b/testcases/kernel/syscalls/memfd_create/memfd_create01.c
@@ -258,7 +258,7 @@ static void setup(void)
 	 * is this flag is missing.
 	 */
 	if (!MFD_FLAGS_AVAILABLE(MFD_ALLOW_SEALING)) {
-		tst_brk(TCONF | TTERRNO,
+		tst_brk(TCONF | TERRNO,
 			"memfd_create(%u) not implemented", MFD_ALLOW_SEALING);
 	}
 }
diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open01.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open01.c
index 5568035d9..6286d415d 100644
--- a/testcases/kernel/syscalls/perf_event_open/perf_event_open01.c
+++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open01.c
@@ -165,19 +165,19 @@ static void verify(struct test_case_t *tc)
 	fd = TEST_RETURN;

 	if (ioctl(fd, PERF_EVENT_IOC_RESET, 0) == -1) {
-		tst_brkm(TFAIL | TTERRNO, cleanup,
+		tst_brkm(TFAIL | TERRNO, cleanup,
 			 "ioctl set PERF_EVENT_IOC_RESET failed");
 	}

 	if (ioctl(fd, PERF_EVENT_IOC_ENABLE, 0) == -1) {
-		tst_brkm(TFAIL | TTERRNO, cleanup,
+		tst_brkm(TFAIL | TERRNO, cleanup,
 			 "ioctl set PERF_EVENT_IOC_ENABLE failed");
 	}

 	do_work();

 	if (ioctl(fd, PERF_EVENT_IOC_DISABLE, 0) == -1) {
-		tst_brkm(TFAIL | TTERRNO, cleanup,
+		tst_brkm(TFAIL | TERRNO, cleanup,
 			 "ioctl set PERF_EVENT_IOC_RESET failed");
 	}

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
