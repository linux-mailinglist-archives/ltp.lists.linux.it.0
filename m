Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED3251CED
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 18:07:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBB0F3C2975
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 18:07:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C81CD3C1A4E
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 18:07:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 42D411400B65
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 18:07:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69735B5A9
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 16:08:07 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Aug 2020 18:07:35 +0200
Message-Id: <20200825160735.24602-5-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825160735.24602-1-mdoucha@suse.cz>
References: <20200825160735.24602-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] ioctl_sg01: Loop data leak check 100 times
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

Even with pre-polluted memory, running the test just once might result in
a false negative. Loop it a few times to increase reliability.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- New patch (split)

 testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 21 +++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
index 8c9fd0dae..8ad2ffed5 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
@@ -100,19 +100,22 @@ static void cleanup(void)
 
 static void run(void)
 {
-	size_t i;
+	size_t i, j;
 
 	memset(buffer, 0, BUF_SIZE);
-	TEST(ioctl(devfd, SG_IO, &query));
 
-	if (TST_RET != 0 && TST_RET != -1)
-		tst_brk(TBROK | TTERRNO, "Invalid ioctl() return value");
+	for (i = 0; i < 100; i++) {
+		TEST(ioctl(devfd, SG_IO, &query));
 
-	/* Check the output buffer even if ioctl() failed, just in case. */
-	for (i = 0; i < BUF_SIZE; i++) {
-		if (buffer[i]) {
-			tst_res(TFAIL, "Kernel memory leaked");
-			return;
+		if (TST_RET != 0 && TST_RET != -1)
+			tst_brk(TBROK|TTERRNO, "Invalid ioctl() return value");
+
+		/* Check the buffer even if ioctl() failed, just in case. */
+		for (j = 0; j < BUF_SIZE; j++) {
+			if (buffer[j]) {
+				tst_res(TFAIL, "Kernel memory leaked");
+				return;
+			}
 		}
 	}
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
