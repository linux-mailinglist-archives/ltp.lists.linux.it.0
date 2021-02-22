Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC7321C0A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 17:03:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 135763C6186
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 17:03:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0FE863C2C91
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:02:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7C36C1000A6B
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:02:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2038CAFB5;
 Mon, 22 Feb 2021 16:02:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 22 Feb 2021 17:02:42 +0100
Message-Id: <20210222160243.507-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222160243.507-1-pvorel@suse.cz>
References: <20210222160243.507-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] io_uring02: Add linux-stable-git tag
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/io_uring/io_uring02.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/testcases/kernel/syscalls/io_uring/io_uring02.c b/testcases/kernel/syscalls/io_uring/io_uring02.c
index cd90fbdc3..5127ff980 100644
--- a/testcases/kernel/syscalls/io_uring/io_uring02.c
+++ b/testcases/kernel/syscalls/io_uring/io_uring02.c
@@ -19,6 +19,12 @@
  *  Date:   Fri Feb 7 16:05:21 2020 -0700
  *
  *  io_uring: grab ->fs as part of async preparation
+ *
+ * stable 5.4 specific backport:
+ *
+ *  commit c4a23c852e80a3921f56c6fbc851a21c84a6d06b
+ *  Author: Nicolai Stange <nstange@suse.de>
+ *  Date:   Wed Jan 27 14:34:43 2021 +0100
  */
 
 #include <stdio.h>
@@ -252,6 +258,7 @@ static struct tst_test test = {
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "9392a27d88b9"},
 		{"linux-git", "ff002b30181d"},
+		{"linux-stable-git", "c4a23c852e80"},
 		{"CVE", "2020-29373"},
 		{}
 	}
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
