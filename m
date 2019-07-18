Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E0B6CAFF
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 10:40:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03AAD3C1D4C
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 10:40:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 73FBC3C1CE5
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 10:39:58 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E6BAE6011D2
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 10:39:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03AE6ACB8;
 Thu, 18 Jul 2019 08:39:57 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 18 Jul 2019 10:39:43 +0200
Message-Id: <20190718083943.7687-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190718083943.7687-1-pvorel@suse.cz>
References: <20190718083943.7687-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] c: Use $LTP_TIMEOUT_MUL also in retry functions
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

in TST_RETRY_FN_EXP_BACKOFF() and thus in TST_RETRY_FUNC() in new C API.
This sync C API with shell API (added in previous commit).

+ mention LTP_TIMEOUT_MUL use in wiki.
+ use SPDX, add copyright

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/test-writing-guidelines.txt |  2 ++
 include/tst_common.h            | 26 +++++++++++---------------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 782e14f32..3548d6043 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2064,6 +2064,8 @@ Sometimes LTP test needs retrying a function for many times to get success.
 This achievement makes that possible via keeping it retrying if the return
 value of the function is NOT as we expected. After exceeding a limited time,
 test will break from the retries immediately.
+NOTE: both 'TST_RETRY_FUNC()' and 'TST_RETRY_FN_EXP_BACKOFF()' use 'LTP_TIMEOUT_MUL'
+environment variable.
 
 [source,c]
 -------------------------------------------------------------------------------
diff --git a/include/tst_common.h b/include/tst_common.h
index c21505450..454a166e8 100644
--- a/include/tst_common.h
+++ b/include/tst_common.h
@@ -1,21 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) Linux Test Project, 2017-2019
  * Copyright (c) 2016 Cyril Hrubis <chrubis@suse.cz>
  * Copyright (c) 2013 Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
  * Copyright (c) 2010 Ngie Cooper <yaneurabeya@gmail.com>
  * Copyright (c) 2008 Mike Frysinger <vapier@gmail.com>
- *
- * This program is free software: you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation, either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef TST_COMMON_H__
@@ -51,15 +40,22 @@
 
 #define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)	\
 ({	int tst_delay_ = 1;						\
+	float m = 1;	\
+	char *mul = getenv("LTP_TIMEOUT_MUL");	\
+	if (mul) {	\
+		m = atof(mul); \
+		if (m < 1) \
+			tst_brk(TBROK, "Invalid timeout multiplier '%s'", mul); \
+	}	\
 	for (;;) {							\
 		typeof(FUNC) tst_ret_ = FUNC;				\
 		if (tst_ret_ == ERET)					\
 			break;						\
-		if (tst_delay_ < MAX_DELAY * 1000000) {			\
+		if (tst_delay_ < MAX_DELAY * m * 1000000) {			\
 			usleep(tst_delay_);				\
 			tst_delay_ *= 2;				\
 		} else {						\
-			tst_brk(TBROK, #FUNC" timed out");		\
+			tst_brk(TBROK, #FUNC" timed out! If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"); \
 		}							\
 	}								\
 	ERET;								\
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
