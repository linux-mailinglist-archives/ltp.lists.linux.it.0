Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1499240699
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 15:31:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BF993C3155
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 15:31:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 46E0C3C18F7
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 15:31:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A4CD11400510
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 15:31:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 337B2AEE0
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 13:32:13 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 10 Aug 2020 15:32:10 +0200
Message-Id: <20200810133210.19219-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] lapi/fs.h: Include <sys/types.h>
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

To get the loff_t defined.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/lapi/fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/lapi/fs.h b/include/lapi/fs.h
index 430d21f27..8b54afd43 100644
--- a/include/lapi/fs.h
+++ b/include/lapi/fs.h
@@ -10,6 +10,7 @@
 # include <linux/fs.h>
 #endif
 
+#include <sys/types.h>
 #include <sys/user.h>
 #include <limits.h>
 #include "lapi/abisize.h"
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
