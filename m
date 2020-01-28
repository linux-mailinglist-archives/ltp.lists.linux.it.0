Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AEB14BC7C
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 15:59:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 241793C2469
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 15:59:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4ABCB3C2364
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 15:59:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 25D0C1000DA1
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 15:59:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD3EEAEBA
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 14:59:45 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Jan 2020 15:59:44 +0100
Message-Id: <20200128145944.30957-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] pty03: Remove termio.h
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

Apparently termio.h is backward compatibility header that just includes
termios.h and sys/ioctl.h. Moreover it's not present on Alpine at least
which broke the build.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/pty/pty03.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/pty/pty03.c b/testcases/kernel/pty/pty03.c
index d0dd908da..8514aa43d 100644
--- a/testcases/kernel/pty/pty03.c
+++ b/testcases/kernel/pty/pty03.c
@@ -27,7 +27,6 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <errno.h>
-#include <termio.h>
 #include <termios.h>
 #include <sys/ioctl.h>
 
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
