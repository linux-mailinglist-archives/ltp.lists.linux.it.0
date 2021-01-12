Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A682F2BFD
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 10:58:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9143D3C5FBB
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 10:58:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EFF603C26C0
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:58:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AF5E81A00E66
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:58:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3FE74AF19
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 09:58:00 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 Jan 2021 10:57:59 +0100
Message-Id: <20210112095759.11910-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112095759.11910-1-mdoucha@suse.cz>
References: <20210112095759.11910-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v6 3/3] syscalls/iopl02,
 ioperm02: Skip when kernel is locked down
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

The iopl() and ioperm() syscalls are blocked when the kernel is locked down.
The order of sanity checks is not guaranteed so it's better to skip these
tests even if they accidentally work.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v3:
- new patch

 testcases/kernel/syscalls/ioperm/ioperm02.c | 4 ++++
 testcases/kernel/syscalls/iopl/iopl02.c     | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/testcases/kernel/syscalls/ioperm/ioperm02.c b/testcases/kernel/syscalls/ioperm/ioperm02.c
index 1808191bf..80dcb992e 100644
--- a/testcases/kernel/syscalls/ioperm/ioperm02.c
+++ b/testcases/kernel/syscalls/ioperm/ioperm02.c
@@ -45,6 +45,10 @@ static struct tcase_t {
 
 static void setup(void)
 {
+	/* ioperm() is restricted under kernel lockdown. */
+	if (tst_lockdown_enabled())
+		tst_brk(TCONF, "Kernel is locked down, skip this test");
+
 	/*
 	 * The value of IO_BITMAP_BITS (include/asm-i386/processor.h) changed
 	 * from kernel 2.6.8 to permit 16-bits (65536) ioperm
diff --git a/testcases/kernel/syscalls/iopl/iopl02.c b/testcases/kernel/syscalls/iopl/iopl02.c
index 6a817cf2d..a6135ddf3 100644
--- a/testcases/kernel/syscalls/iopl/iopl02.c
+++ b/testcases/kernel/syscalls/iopl/iopl02.c
@@ -52,6 +52,11 @@ static void verify_iopl(unsigned int i)
 static void setup(void)
 {
 	struct passwd *pw;
+
+	/* iopl() is restricted under kernel lockdown. */
+	if (tst_lockdown_enabled())
+		tst_brk(TCONF, "Kernel is locked down, skip this test");
+
 	pw = SAFE_GETPWNAM("nobody");
 	SAFE_SETEUID(pw->pw_uid);
 }
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
