Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E214091C
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:37:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E13B23C2262
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:37:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 12A753C220B
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:37:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF8C22005E2
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:37:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A274AED8;
 Fri, 17 Jan 2020 11:37:23 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jan 2020 12:37:14 +0100
Message-Id: <20200117113715.22786-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117113715.22786-1-pvorel@suse.cz>
References: <20200117113715.22786-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] tst_device.h: Use lapi/syscalls.h instead of
 <sys/syscall.h>
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

As a fallback for old distros which does not define __NR_syncfs
(the dependency is in the library itself).

This was needed on SLES 11 (kernel 2.6.32).

Fixes: 74aeb88c9 ("tst_device: use raw syscall in the tst_device.h")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index 3db5275c9..13d92ee54 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -19,7 +19,7 @@
 #define TST_DEVICE_H__
 
 #include <unistd.h>
-#include <sys/syscall.h>
+#include "lapi/syscalls.h"
 
 struct tst_device {
 	const char *dev;
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
