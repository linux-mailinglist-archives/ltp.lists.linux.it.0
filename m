Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF86885E
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 13:53:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E6693C1D1D
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 13:53:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 683623C1CE4
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 13:53:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 55CA21A00902
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 13:53:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9ECD8AF0B
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 11:53:41 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 15 Jul 2019 13:53:38 +0200
Message-Id: <20190715115338.15884-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/acct02: Add note about acct()
 kernel bug
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

This test is actually accidental regression test for:

commit 4d9570158b6260f449e317a5f9ed030c2504a615
Author: Oleg Nesterov <oleg@redhat.com>
Date:   Thu Jan 4 16:17:49 2018 -0800

    kernel/acct.c: fix the acct->needcheck check in check_free_space()

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Christian Amann <camann@suse.com>
---
 testcases/kernel/syscalls/acct/acct02.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index 0b2608c71..c2c20668e 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -16,6 +16,9 @@
  * that only the command issued by this test gets written into the accounting
  * file, the contents get parsed until the correct entry is found, or EOF
  * is reached.
+ *
+ * This is also accidental regression test for:
+ * 4d9570158b626 kernel/acct.c: fix the acct->needcheck check in check_free_space()
  */
 
 #include <sys/stat.h>
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
