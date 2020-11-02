Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D45CA2A24CB
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 07:28:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 702B43C3035
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 07:28:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A6A703C23BB
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 07:28:06 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 95A981A00EAC
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 07:28:04 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,444,1596470400"; d="scan'208";a="100814737"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Nov 2020 14:27:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 53D4E4CE34DE
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 14:27:58 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 2 Nov 2020 14:28:00 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 2 Nov 2020 14:28:03 +0800
Message-ID: <1604298483-18563-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 53D4E4CE34DE.AEB46
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/ptrace08: Add another linux tag
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

Since "syscall/ptrace08: Simplify the test", on older kernels we check that the
POKEUSER to dr7 that enables the breakpoint fails properly after the dr0 has been
set to an address in the kernel range.

on centos7.8GA, it can expose a failure as below:
tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
tst_kernel.c:79: TINFO: uname.machine=x86_64 kernel is 64bit
ptrace08.c:90: TINFO: Trying address 0xffff800000000000
ptrace08.c:120: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL (22)
ptrace08.c:129: TINFO: 0xffff800000000000
ptrace08.c:90: TINFO: Trying address 0xffffffffffffffff
ptrace08.c:116: TFAIL: ptrace() breakpoint with kernel addr succeeded
ptrace08.c:129: TINFO: 0xffffffffffffffff
ptrace08.c:90: TINFO: Trying address 0xffffbfffffffffff
ptrace08.c:120: TPASS: ptrace() breakpoint with kernel addr failed: EINVAL (22)
ptrace08.c:129: TINFO: 0xffffbfffffffffff

It fails because x86 hw_breakpoint code can't parse this 0xffffffffffffffff kernel
address on x86_64 platform.

arch/x86/kernel/hw_breakpoint.c
 int arch_check_bp_in_kernelspace(struct perf_event *bp)
 	return (va >= TASK_SIZE) && ((va + len - 1) >= TASK_SIZE);

TASK_SIZE is small and value will overflow if we use 0xffffffffffffffff address
(va is unsigned long and len is unsigned int).

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/ptrace/ptrace08.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/syscalls/ptrace/ptrace08.c b/testcases/kernel/syscalls/ptrace/ptrace08.c
index 741923e36..870701317 100644
--- a/testcases/kernel/syscalls/ptrace/ptrace08.c
+++ b/testcases/kernel/syscalls/ptrace/ptrace08.c
@@ -29,6 +29,9 @@
  *  Date:   Mon Mar 26 15:39:07 2018 -1000
  *
  *  perf/hwbp: Simplify the perf-hwbp code, fix documentation
+ *
+ * On Centos7, this is also a regression test for
+ * commit 27747f8bc355 ("perf/x86/hw_breakpoints: Fix check for kernel-space breakpoints").
  */
 
 #include <stdlib.h>
@@ -163,6 +166,7 @@ static struct tst_test test = {
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "f67b15037a7a"},
 		{"CVE", "2018-1000199"},
+		{"linux-git", "27747f8bc355"},
 		{}
 	}
 };
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
