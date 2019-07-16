Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E6D6AA75
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 16:16:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CD483C1D38
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 16:16:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 771183C1D02
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 16:16:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4B91D1000F2E
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 16:16:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56933AF7D
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 14:16:21 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 16 Jul 2019 16:16:19 +0200
Message-Id: <20190716141619.31427-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] lapi/securebits.h: Fix.
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

I managed to break the original file when applying and made the fallback
definition depend on the existence of the file, which is indeed wrong,
sorry everyone.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/lapi/securebits.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/lapi/securebits.h b/include/lapi/securebits.h
index 6207c06cd..2da137c3a 100644
--- a/include/lapi/securebits.h
+++ b/include/lapi/securebits.h
@@ -5,9 +5,13 @@
  */
 #ifndef LAPI_SECUREBITS_H
 #define LAPI_SECUREBITS_H
+
 # ifdef HAVE_LINUX_SECUREBITS_H
 #  include <linux/securebits.h>
-# else
+# endif
+
+# ifndef SECBIT_NO_CAP_AMBIENT_RAISE
 #  define SECBIT_NO_CAP_AMBIENT_RAISE  6
-# endif /* HAVE_LINUX_SECUREBITS_H*/
+# endif
+
 #endif /* LAPI_SECUREBITS_H */
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
