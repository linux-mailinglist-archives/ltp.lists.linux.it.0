Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C61B85939
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Sep 2025 17:27:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E508C3CDD12
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Sep 2025 17:27:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 69EEA3CDC82
 for <ltp@lists.linux.it>; Thu, 18 Sep 2025 17:27:10 +0200 (CEST)
Received: from gnu.wildebeest.org (gnu.wildebeest.org [45.83.234.184])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0547F6000FA
 for <ltp@lists.linux.it>; Thu, 18 Sep 2025 17:27:09 +0200 (CEST)
Received: from r6.localdomain (82-217-174-174.cable.dynamic.v4.ziggo.nl
 [82.217.174.174])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gnu.wildebeest.org (Postfix) with ESMTPSA id 4741D3141377;
 Thu, 18 Sep 2025 17:27:08 +0200 (CEST)
Received: by r6.localdomain (Postfix, from userid 1000)
 id E6C7C34068E; Thu, 18 Sep 2025 17:27:07 +0200 (CEST)
From: Mark Wielaard <mark@klomp.org>
To: ltp@lists.linux.it
Date: Thu, 18 Sep 2025 17:26:40 +0200
Message-ID: <20250918152640.1146279-1-mark@klomp.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] mmap04: Make sure the scanf address format is at
 least 8 hex chars
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
Cc: Mark Wielaard <mark@klomp.org>, Martin Cermak <mcermak@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The addresses in /proc/self/maps are at least 8 hex chars. Zeros are
added to the front of the address when shorted (both on 32bit and
64bit systems.

Under valgrind the mmaps used in kernel/syscalls/mmap/mmap04.c come
out very low in the address space and might be shorter than 8 hex
chars. This causes the scanf to fail:
mmap04.c:62: TBROK: Expected 1 conversions got 0 FILE '/proc/self/maps'

Fix this by using "%08" PRIxPTR when creating the fmt used.

Signed-off-by: Mark Wielaard <mark@klomp.org>
---
 testcases/kernel/syscalls/mmap/mmap04.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap04.c b/testcases/kernel/syscalls/mmap/mmap04.c
index 4a050b7b50da..5b28180df29b 100644
--- a/testcases/kernel/syscalls/mmap/mmap04.c
+++ b/testcases/kernel/syscalls/mmap/mmap04.c
@@ -58,7 +58,8 @@ static void run(unsigned int i)
 
 	addr2 = SAFE_MMAP(addr1 + pagesize, pagesize, tc->prot, tc->flags | MAP_FIXED, -1, 0);
 
-	sprintf(fmt, "%" PRIxPTR "-%%*x %%s", (uintptr_t)addr2);
+	/* A /proc/self/maps address is at least 8 hex (left zero padded) */
+	sprintf(fmt, "%08" PRIxPTR "-%%*x %%s", (uintptr_t)addr2);
 	SAFE_FILE_LINES_SCANF("/proc/self/maps", fmt, perms);
 
 	if (!strcmp(perms, tc->exp_perms)) {
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
