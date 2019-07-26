Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D361761B8
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 11:21:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82BA33C1D18
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 11:21:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9D6023C1C8A
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 11:21:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5446A1A00E73
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 11:21:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CD74B609;
 Fri, 26 Jul 2019 09:21:24 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 26 Jul 2019 11:21:10 +0200
Message-Id: <20190726092110.13116-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/mprotect04: Fix compilation error for ia64
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

Fixes: 94f5be719 ("syscalls/mprotect04: align exec_func to 64 bytes")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

or should we drop ia64 support as the architecture is obsolete?
Since we don't test this arch, there are some other build failures
(at least on old SLES I tested the patch).

Kind regards,
Petr

 testcases/kernel/syscalls/mprotect/mprotect04.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/mprotect/mprotect04.c b/testcases/kernel/syscalls/mprotect/mprotect04.c
index a014ab6b4..d1991a2db 100644
--- a/testcases/kernel/syscalls/mprotect/mprotect04.c
+++ b/testcases/kernel/syscalls/mprotect/mprotect04.c
@@ -141,7 +141,7 @@ struct func_desc {
 	uint64_t glob_pointer;
 };
 
-static __attribute__((noinline)) void *get_func(void *mem)
+static __attribute__((noinline)) void *get_func(void *mem, uintptr_t *func_page_offset LTP_ATTRIBUTE_UNUSED)
 {
 	static struct func_desc fdesc;
 
@@ -275,11 +275,13 @@ static void testfunc_protexec(void)
 	if (!func)
 		goto out;
 
+#ifndef __ia64__
 	if (func_page_offset + 64 > page_sz) {
 		SAFE_MUNMAP(cleanup, p, page_sz);
 		tst_brkm(TCONF, cleanup, "func too close to page boundary, "
 			"maybe your compiler ignores -falign-functions?");
 	}
+#endif
 
 	/* Change the protection to PROT_EXEC. */
 	TEST(mprotect(p, page_sz, PROT_EXEC));
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
