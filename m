Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A941C7755
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 19:04:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B40673C57A9
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 19:04:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0455B3C261B
 for <ltp@lists.linux.it>; Wed,  6 May 2020 19:04:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5D6B51001125
 for <ltp@lists.linux.it>; Wed,  6 May 2020 19:04:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DAF1AB76;
 Wed,  6 May 2020 17:04:26 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed,  6 May 2020 18:04:07 +0100
Message-Id: <20200506170407.5562-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] pty04: Correct struct member sizes and add to CVE
 runtest file
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Also remove min_kver because it is arbitrary. We know this test works on much
older kernels, but it will probably hit bugs that have been fixed for a long
time.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 runtest/cve                  |  1 +
 testcases/kernel/pty/pty04.c | 11 +++++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/runtest/cve b/runtest/cve
index c2e9e8c89..b9ab49c3b 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -50,3 +50,4 @@ cve-2018-1000199 ptrace08
 cve-2018-1000204 ioctl_sg01
 cve-2018-18559 bind06
 cve-2018-19854 crypto_user01
+cve-2020-11494 pty04
diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 239d2a870..2b9ff7e45 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -58,11 +58,11 @@ typedef uint32_t canid_t;
 
 struct can_frame {
 	canid_t can_id;
-	uint32_t can_dlc;
-	uint32_t __pad;
-	uint32_t __res0;
-	uint32_t __res1;
-	uint32_t data[CAN_MAX_DLEN] __attribute__((aligned(8)));
+	uint8_t can_dlc;
+	uint8_t __pad;
+	uint8_t __res0;
+	uint8_t __res1;
+	uint8_t data[CAN_MAX_DLEN] __attribute__((aligned(8)));
 };
 
 #include <stddef.h>
@@ -366,7 +366,6 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.needs_checkpoints = 1,
 	.needs_root = 1,
-	.min_kver = "4.10",
 	.tags = (const struct tst_tag[]){
 		{"linux-git", "b9258a2cece4ec1f020715fe3554bc2e360f6264"},
 		{"CVE", "CVE-2020-11494"},
-- 
2.26.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
