Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBDC1D49A8
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:32:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4372A3C53E5
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 11:32:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 93F3B3C53A3
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:32:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DCC7E1001351
 for <ltp@lists.linux.it>; Fri, 15 May 2020 11:32:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 42AA2B1A3;
 Fri, 15 May 2020 09:32:28 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 15 May 2020 11:32:16 +0200
Message-Id: <20200515093216.829-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515093216.829-1-pvorel@suse.cz>
References: <20200515093216.829-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 4/4] doc: Remove links to README.mk-devel
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

It was removed in f7f66820c ("Update some docs."),
mention doc/build-system-guide.txt instead.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 INSTALL                 | 3 ++-
 include/mk/config.mk.in | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/INSTALL b/INSTALL
index 89ee81e8d..120f030b5 100644
--- a/INSTALL
+++ b/INSTALL
@@ -241,7 +241,8 @@ LDFLAGS  - linker flags, e.g. "-L$SYSROOT/usr/lib" "-L$SYSROOT/lib". DO NOT
 LDLIBS   - libraries listed after objects during link, e.g. -lc, -lpthread,
 	   -lltp.
 
-See README.mk-devel for a more terse description of what's available.
+For other variables and more info about the build systems see
+doc/build-system-guide.txt.
 
 Common Issues
 ----------------------
diff --git a/include/mk/config.mk.in b/include/mk/config.mk.in
index 87b2c833d..427608a17 100644
--- a/include/mk/config.mk.in
+++ b/include/mk/config.mk.in
@@ -62,7 +62,7 @@ LDFLAGS			:= @LDFLAGS@
 
 DEBUG_CFLAGS		?= -g
 
-# Please see README.mk-devel about -fstrict-aliasing.
+# for -fstrict-aliasing see doc/build-system-guide.txt
 OPT_CFLAGS		?= -O2 -fno-strict-aliasing -pipe
 
 WCFLAGS			?= -Wall -W @GCC_WARN_OLDSTYLE@
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
