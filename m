Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 271416E563
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 14:08:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A92CA3C1D43
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 14:08:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 872713C1C5A
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 14:08:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AA2751401B88
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 14:08:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9293AB92
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 12:08:06 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Jul 2019 14:08:05 +0200
Message-Id: <20190719120806.24214-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH 1/2] syscalls/request_key05: Correct CVE
 number
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

There was an typo in the comment that lists the CVE number.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/request_key/request_key05.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/request_key/request_key05.c b/testcases/kernel/syscalls/request_key/request_key05.c
index aa2f3a7c6..129cc0507 100644
--- a/testcases/kernel/syscalls/request_key/request_key05.c
+++ b/testcases/kernel/syscalls/request_key/request_key05.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2017 Richard Palethorpe <rpalethorpe@suse.com>
  */
 /*
- * Test for CVE-2016-6951, original reproducer can be found here:
+ * Test for CVE-2017-6951, original reproducer can be found here:
  * http://www.spinics.net/lists/keyrings/msg01845.html
  *
  * request_key() is not in glibc, so we just use the syscall directly instead
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
