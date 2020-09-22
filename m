Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD62274022
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Sep 2020 12:56:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAAEF3C5BB2
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Sep 2020 12:56:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C694D3C28E5
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 12:56:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 56D921A00F4E
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 12:56:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 506BCB22E
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 10:57:01 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 22 Sep 2020 12:55:07 +0200
Message-Id: <20200922105507.18079-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix top_srcdir handling in numa/sound test Makefiles
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/numa/Makefile  | 18 ++----------------
 testcases/kernel/sound/Makefile |  2 +-
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/testcases/kernel/numa/Makefile b/testcases/kernel/numa/Makefile
index 48494e456..2c6a7c6a1 100644
--- a/testcases/kernel/numa/Makefile
+++ b/testcases/kernel/numa/Makefile
@@ -1,22 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 #  Copyright (c) International Business Machines  Corp., 2007
-#
-#  This program is free software;  you can redistribute it and/or modify
-#  it under the terms of the GNU General Public License as published by
-#  the Free Software Foundation; either version 2 of the License, or
-#  (at your option) any later version.
-#
-#  This program is distributed in the hope that it will be useful,
-#  but WITHOUT ANY WARRANTY;  without even the implied warranty of
-#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
-#  the GNU General Public License for more details.
-#
-#  You should have received a copy of the GNU General Public License
-#  along with this program;  if not, write to the Free Software
-#  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-#
 
-top_srcdir		:= ../../..
+top_srcdir		?= ../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
diff --git a/testcases/kernel/sound/Makefile b/testcases/kernel/sound/Makefile
index 022e69197..5c728ef36 100644
--- a/testcases/kernel/sound/Makefile
+++ b/testcases/kernel/sound/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-top_srcdir		:= ../../..
+top_srcdir		?= ../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
