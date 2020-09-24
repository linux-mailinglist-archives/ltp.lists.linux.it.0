Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBE2277436
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 16:43:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EDE63C5FF3
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 16:43:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B59373C28E2
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 16:42:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0A35A60102B
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 16:42:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A8A6AFEC
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 14:42:51 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 24 Sep 2020 16:42:46 +0200
Message-Id: <20200924144246.12750-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924144246.12750-1-mdoucha@suse.cz>
References: <20200924144246.12750-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] mmap18: Increase minimal stack mapping to 8KB
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
stack mapping

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Note: Increasing initial stack size to 8KB fixes the segfaults but I'm not
entirely sure whether we shouldn't use PTHREAD_STACK_MIN as the minimal size
instead. Pthread man page isn't entirely clear whether PTHREAD_STACK_MIN is
the minimal value for stack size after it grows to the limit, or the minimal
size of the initial stack mapping (before it starts growing).

On x86_64, PTHREAD_STACK_MIN is 4 pages (16KB). On PPC64, it's 2 pages
(128KB).

 testcases/kernel/syscalls/mmap/mmap18.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/syscalls/mmap/mmap18.c
index 966bf673e..8b149fb93 100644
--- a/testcases/kernel/syscalls/mmap/mmap18.c
+++ b/testcases/kernel/syscalls/mmap/mmap18.c
@@ -201,10 +201,11 @@ static void grow_stack_fail(size_t stack_size, size_t mapped_size)
 static void run_test(void)
 {
 	size_t stack_size = 8 * PTHREAD_STACK_MIN;
+	size_t minsize = MAX(page_size, 8192);
 
-	grow_stack_success(stack_size, page_size);
+	grow_stack_success(stack_size, minsize);
 	grow_stack_success(stack_size, stack_size/2);
-	grow_stack_fail(stack_size, page_size);
+	grow_stack_fail(stack_size, minsize);
 	grow_stack_fail(stack_size, stack_size/2);
 }
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
