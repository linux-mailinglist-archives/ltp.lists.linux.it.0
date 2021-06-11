Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F03A4227
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 14:41:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10DCA3C75DE
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 14:41:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A884B3C307A
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 14:41:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CDB0B600116
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 14:41:04 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F4671FD6D;
 Fri, 11 Jun 2021 12:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623415264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OYPiJLqiu/yGi8piSD1zgRJH+draUvRCPlOxAqY4PZY=;
 b=fhPV3xDE64Mro+6TG9RJEiOHZ+QdCGQ3voY/Fm+4i4Oav+Lv7x75S0RMCU/WcMNk5t86Ut
 qspOsITNAgXURESThykM7tMJjWWuGFt3gUB/L+zchOa9Yl3u7cqBlh56Tyu6xcHloeSBHy
 awZW1sG6C2A3w+Nu5Rme4MfstuXf6zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623415264;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OYPiJLqiu/yGi8piSD1zgRJH+draUvRCPlOxAqY4PZY=;
 b=sov3OKipR7fPsaa2BxEsWTeVryx4WTQxAJ63nEx9MgcjwJjvamN72JihiTnv83Qchws4Qx
 vGtLCroBLd0+orCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DE598118DD;
 Fri, 11 Jun 2021 12:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623415264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OYPiJLqiu/yGi8piSD1zgRJH+draUvRCPlOxAqY4PZY=;
 b=fhPV3xDE64Mro+6TG9RJEiOHZ+QdCGQ3voY/Fm+4i4Oav+Lv7x75S0RMCU/WcMNk5t86Ut
 qspOsITNAgXURESThykM7tMJjWWuGFt3gUB/L+zchOa9Yl3u7cqBlh56Tyu6xcHloeSBHy
 awZW1sG6C2A3w+Nu5Rme4MfstuXf6zk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623415264;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OYPiJLqiu/yGi8piSD1zgRJH+draUvRCPlOxAqY4PZY=;
 b=sov3OKipR7fPsaa2BxEsWTeVryx4WTQxAJ63nEx9MgcjwJjvamN72JihiTnv83Qchws4Qx
 vGtLCroBLd0+orCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id y0KkNN9Zw2AXQwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 11 Jun 2021 12:41:03 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Jun 2021 14:15:17 +0200
Message-Id: <20210611121517.6136-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] Revert "lib/{newlib_,
 }tests: Fix build dependency on lib"
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

This reverts commit 90c6b2eb31106f0766ab2b8e90c97472e4ac3c78.

Unfortunately this change may cause an infinite loop when library
rebuild is triggered from a test directory. E.g.:

$ cd ltp
$ make clean
...
$ cd testcases/kernel/syscalls/abort
$ make
...
make -C "/foo/bar/ltp/lib" -f "/foo/bar/ltp/lib/Makefile" all
make -C "/foo/bar/ltp/lib" -f "/foo/bar/ltp/lib/Makefile" all
make -C "/foo/bar/ltp/lib" -f "/foo/bar/ltp/lib/Makefile" all
make -C "/foo/bar/ltp/lib" -f "/foo/bar/ltp/lib/Makefile" all
make -C "/foo/bar/ltp/lib" -f "/foo/bar/ltp/lib/Makefile" all
make -C "/foo/bar/ltp/lib" -f "/foo/bar/ltp/lib/Makefile" all
...

Looks like some kind of race, so let's revert the commit for now.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Acked-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/Makefile | 2 +-
 lib/tests/Makefile        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
index a263d7db5..30ca6810c 100644
--- a/lib/newlib_tests/Makefile
+++ b/lib/newlib_tests/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 top_srcdir		?= ../..
 
-include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/env_pre.mk
 
 CFLAGS			+= -W -Wall
 LDLIBS			+= -lltp
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index c418202ed..73a0f1655 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -1,6 +1,6 @@
 top_srcdir		?= ../..
 
-include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/env_pre.mk
 
 CFLAGS			+= -W
 LDLIBS			+= -lltp
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
