Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FD68A44
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 15:13:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 897AF3C1D17
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 15:13:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 172CF3C1CE4
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 14:37:23 +0200 (CEST)
Received: from agrajag.zerfleddert.de (agrajag.zerfleddert.de [88.198.237.222])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7B1D3140121D
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 14:37:22 +0200 (CEST)
Received: by agrajag.zerfleddert.de (Postfix, from userid 1000)
 id 281175B203CE; Mon, 15 Jul 2019 14:37:21 +0200 (CEST)
Date: Mon, 15 Jul 2019 14:37:21 +0200
From: Tobias Jordan <knilch-ltp@cdqe.de>
To: ltp@lists.linux.it
Message-ID: <20190715123721.gnsrcu6xpjrdng6p@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 15 Jul 2019 15:13:00 +0200
Subject: [LTP] [PATCH] syscalls/chdir/chdir04.c: fix out-of-bounds write
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
Cc: knilch-ltp@cdqe.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When UCLINUX is defined, line 156 will write to the TC[2].dname:
    #ifdef UCLINUX
        [...]
        TC[2].dname = bad_addr;
    #endif

However, TC[2] won't exist as it's only initialized when UCLINUX is
not defined and length of TC is implicit. Remove "#ifndef UCLINUX"
around initializer for TC[2].

Signed-off-by: Tobias Jordan <knilch-ltp@cdqe.de>
---
original posted as github PR:
https://github.com/linux-test-project/ltp/pull/543

 testcases/kernel/syscalls/chdir/chdir04.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/testcases/kernel/syscalls/chdir/chdir04.c b/testcases/kernel/syscalls/chdir/chdir04.c
index 9e0a9e9d0..f0420e4c9 100644
--- a/testcases/kernel/syscalls/chdir/chdir04.c
+++ b/testcases/kernel/syscalls/chdir/chdir04.c
@@ -83,14 +83,12 @@ struct test_case_t {
 	     */
 	{
 	noexist_dir, ENOENT},
-#ifndef UCLINUX
 	    /*
 	     * to test whether chdir() is setting EFAULT if the
 	     * directory is an invalid address.
 	     */
 	{
 	(void *)-1, EFAULT}
-#endif
 };
 
 int TST_TOTAL = ARRAY_SIZE(TC);
-- 
2.11.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
