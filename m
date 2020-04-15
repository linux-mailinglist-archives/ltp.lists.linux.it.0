Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEBC1A9C32
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:27:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 946313C2B30
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:27:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3F6323C2B04
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8F65320111D
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E6CCAD89;
 Wed, 15 Apr 2020 11:26:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 13:26:29 +0200
Message-Id: <20200415112635.14144-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415112635.14144-1-pvorel@suse.cz>
References: <20200415112635.14144-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/9] controllers: Simplify fullpath definition
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

PATH_MAX has been in <limits.h> in all libc for a long time.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/controllers/libcontrollers/libcontrollers.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.h b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
index cdde9f9e6..f999f705e 100644
--- a/testcases/kernel/controllers/libcontrollers/libcontrollers.h
+++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
@@ -42,11 +42,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
-#ifdef PATH_MAX
 char fullpath[PATH_MAX];
-#else
-char fullpath[1024]; /* Guess */
-#endif
 
 int FLAG;
 volatile int timer_expired;
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
