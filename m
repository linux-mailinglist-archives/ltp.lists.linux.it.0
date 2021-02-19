Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADEB31F587
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 08:59:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 104153C59CC
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 08:59:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1B3DD3C4F09
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 08:59:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C4A4201082
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 08:59:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA209ACCF;
 Fri, 19 Feb 2021 07:59:14 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Feb 2021 08:59:06 +0100
Message-Id: <20210219075906.23914-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] cve-2015-3290: Add -fomit-frame-pointer
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
Cc: Patrick McCarty <patrick.mccarty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Which is not enabled by default on some toolchains.

Fixes: #313

Reported-by: Patrick McCarty <patrick.mccarty@intel.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Tested manually, but sure going through CI as well
https://travis-ci.org/github/pevik/ltp/builds/759603151

 testcases/cve/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
index da44fff60..63b1d7525 100644
--- a/testcases/cve/Makefile
+++ b/testcases/cve/Makefile
@@ -45,6 +45,6 @@ endif
 cve-2017-17052:	CFLAGS += -pthread
 cve-2017-17053:	CFLAGS += -pthread
 
-cve-2015-3290:	CFLAGS += -pthread
+cve-2015-3290:	CFLAGS += -pthread -fomit-frame-pointer
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
