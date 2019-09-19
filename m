Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6FB7592
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 10:59:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E339E3C2115
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 10:59:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 342CD3C20D2
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 10:59:01 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D05631000927
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 10:58:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3524AC0C
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 08:58:57 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 19 Sep 2019 10:58:56 +0200
Message-Id: <20190919085856.18758-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/fstat03: Fix bad fd
 initialization
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

passing unused pid as bad fd is wrong and slipped in during a review.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/fstat/fstat03.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/fstat/fstat03.c b/testcases/kernel/syscalls/fstat/fstat03.c
index acefa2529..68fae43df 100644
--- a/testcases/kernel/syscalls/fstat/fstat03.c
+++ b/testcases/kernel/syscalls/fstat/fstat03.c
@@ -25,7 +25,7 @@
 #define TESTFILE	"test_file"
 
 static int fd_ok;
-static int fd_ebadf;
+static int fd_ebadf = -1;
 static struct stat stat_buf;
 
 static struct tcase {
@@ -83,7 +83,6 @@ static void run(unsigned int tc_num)
 
 static void setup(void)
 {
-	fd_ebadf = tst_get_unused_pid();
 	fd_ok = SAFE_OPEN(TESTFILE, O_RDWR | O_CREAT, 0644);
 }
 
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
