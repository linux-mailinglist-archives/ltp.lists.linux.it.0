Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7D23BAFA
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 15:18:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 476423C3326
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 15:18:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id EA4963C13E1
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 15:18:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 14262600B60
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 15:18:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AD39AB3D
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 13:18:27 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 Aug 2020 15:18:10 +0200
Message-Id: <20200804131811.26515-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] Add N_HDLC constant to lapi/tty.h
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

Changes since v1:
- patch split off from the CVE test

 include/lapi/tty.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/lapi/tty.h b/include/lapi/tty.h
index 353a103f1..6122145f3 100644
--- a/include/lapi/tty.h
+++ b/include/lapi/tty.h
@@ -10,6 +10,10 @@
 # include <linux/tty.h>
 #endif
 
+#ifndef N_HDLC
+# define N_HDLC 13
+#endif
+
 #ifndef N_SLCAN
 # define N_SLCAN		17	/* Serial / USB serial CAN Adaptors */
 #endif
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
