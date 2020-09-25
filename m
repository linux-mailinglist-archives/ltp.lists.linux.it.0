Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F84627895C
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 15:21:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC99C3C3046
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 15:21:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D5ABA3C101E
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 15:21:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7D5D21A00FC7
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 15:21:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC668AF3D
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 13:21:30 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 25 Sep 2020 15:21:25 +0200
Message-Id: <20200925132125.22955-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] mmap18: Increase minimal stack mapping to
 PTHREAD_STACK_MIN
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

The first testcase keeps segfaulting on older kernels with only 4KB initial
stack mapping. Pthread man pages say that stack must be at least
PTHREAD_STACK_MIN bytes in size but they're not clear how that relates
to growing stacks. Let's be on the safe side.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: Use PTHREAD_STACK_MIN as the minimum instead of 8KB

 testcases/kernel/syscalls/mmap/mmap18.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/syscalls/mmap/mmap18.c
index 966bf673e..dc2926454 100644
--- a/testcases/kernel/syscalls/mmap/mmap18.c
+++ b/testcases/kernel/syscalls/mmap/mmap18.c
@@ -202,9 +202,9 @@ static void run_test(void)
 {
 	size_t stack_size = 8 * PTHREAD_STACK_MIN;
 
-	grow_stack_success(stack_size, page_size);
+	grow_stack_success(stack_size, PTHREAD_STACK_MIN);
 	grow_stack_success(stack_size, stack_size/2);
-	grow_stack_fail(stack_size, page_size);
+	grow_stack_fail(stack_size, PTHREAD_STACK_MIN);
 	grow_stack_fail(stack_size, stack_size/2);
 }
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
