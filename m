Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F566711D
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 16:15:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D16853C1D05
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 16:15:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7256E3C03AD
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 16:15:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2E9541A000B0
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 16:15:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C8F9CAFF1
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 14:15:32 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 12 Jul 2019 16:15:30 +0200
Message-Id: <20190712141530.22195-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190712141530.22195-1-chrubis@suse.cz>
References: <20190712141530.22195-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/acct02: Fix failures with nearly full FS
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

While process accounting is running the kernel checks the percentage of
available space on disk. If the accounting is enabled and the free space
drops below 2% the accounting is disabled until we reach at least 4% of
free space. Which especially means that we have to have more than 4% of
free space when we start the accounting because we are starting in
disabled state. And when accounting is disabled the data are dropped
silently instead of being written to the file, which makes this test
fail because we end up with an empty file.

So this patch checks if there is at least 4.1% of free space before we
start the test and exit with TCONF otherwise.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: Christian Amann <camann@suse.com>
---
 testcases/kernel/syscalls/acct/acct02.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index f61faf206..6c375d5cb 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -146,8 +146,20 @@ static void run(void)
 
 static void setup(void)
 {
+	struct statfs buf;
+
 	clock_ticks = SAFE_SYSCONF(_SC_CLK_TCK);
 
+	SAFE_STATFS(".", &buf);
+
+	float avail = (100.00 * buf.f_bavail) / buf.f_blocks;
+
+	if (avail < 4.1) {
+		tst_brk(TCONF,
+			"Less than 4.1%% (%.2f) of free space on filesystem",
+			avail);
+	}
+
 	TEST(acct(NULL));
 	if (TST_RET == -1)
 		tst_brk(TBROK | TTERRNO,
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
