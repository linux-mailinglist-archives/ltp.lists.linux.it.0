Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6FD596FED
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 15:39:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DF1D3C9BA4
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 15:39:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1AC5B3C9F2C
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 15:38:47 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 12FD01400DB4
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 15:38:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF556113E;
 Wed, 17 Aug 2022 06:38:45 -0700 (PDT)
Received: from e129169.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52DEB3F67D;
 Wed, 17 Aug 2022 06:38:44 -0700 (PDT)
From: Tudor Cretu <tudor.cretu@arm.com>
To: ltp@lists.linux.it
Date: Wed, 17 Aug 2022 14:39:44 +0100
Message-Id: <20220817133946.234985-3-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817133946.234985-1-tudor.cretu@arm.com>
References: <20220817133946.234985-1-tudor.cretu@arm.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] syscalls/mprotect01: Invoke the syscall directly
 instead of the libc wrapper
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

per POSIX: The mprotect() function shall change the access protections
to be that specified by prot for those whole pages containing any part
of the address space of the process starting at address addr and
continuing for len bytes.

Issue 6 of POSIX introduces: The implementation may require that addr
be a multiple of the page size as returned by sysconf().

Therefore it's not strictly required that addr is a multiple of the page
size. Some libcs (e.g. Musl) indeed don't have this requirement, so calling
the C standard library function doesn't fail in their case. As the
testsuite focuses on mprotect(2), the testcases should call the syscall
directly instead of the libc function.

Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
---
 testcases/kernel/syscalls/mprotect/mprotect01.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/mprotect/mprotect01.c b/testcases/kernel/syscalls/mprotect/mprotect01.c
index be4d982ea..aa4685258 100644
--- a/testcases/kernel/syscalls/mprotect/mprotect01.c
+++ b/testcases/kernel/syscalls/mprotect/mprotect01.c
@@ -43,6 +43,7 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include "test.h"
+#include "lapi/syscalls.h"
 #include "safe_macros.h"
 
 char *TCID = "mprotect01";
@@ -97,7 +98,7 @@ int main(int ac, char **av)
 			if (TC[i].setupfunc != NULL)
 				TC[i].setupfunc(&TC[i]);
 
-			TEST(mprotect(TC[i].addr, TC[i].len, TC[i].prot));
+			TEST(tst_syscall(__NR_mprotect, TC[i].addr, TC[i].len, TC[i].prot));
 
 			if (TEST_RETURN != -1) {
 				tst_resm(TFAIL, "call succeeded unexpectedly");
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
