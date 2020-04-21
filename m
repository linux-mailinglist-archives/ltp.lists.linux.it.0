Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 718511B25B8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 14:16:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC6AC3C6297
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 14:16:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 58A403C0131
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 14:16:03 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 86E181A00642
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 14:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587471360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SPu236u6AEc14mJdOqP1s++Z/x4P5XVOQe2vf8kbqlg=;
 b=H9P6G75lf71TwnJxVDqBSLUkMrncVrQTDqejy0vQOu65wVfmlIdKF8zIUZDBk639guQDv9
 FwQ4uJr3u98Io9x7he2MYX4gFft4bxxdkWd/34inLJmb9xUanQqi5kWGAr1q436vXaUWeu
 hev4GrbblTNKy5Pf+9Q4juSSJ643Zes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-nQTqD8w5NXKsaHDHAmCV2g-1; Tue, 21 Apr 2020 08:15:57 -0400
X-MC-Unique: nQTqD8w5NXKsaHDHAmCV2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E733102CE14;
 Tue, 21 Apr 2020 12:15:56 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC645DA66;
 Tue, 21 Apr 2020 12:15:51 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Tue, 21 Apr 2020 14:15:48 +0200
Message-Id: <7dd91d5aa2d64bcd0223120916c202f19c327237.1587471007.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] lib: tst_taint: Ignore WARN taint flag if already
 set
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
Cc: cyin@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This commit changes the library so that it ignores the taint warn flag
if it was set prior to the test run. It turns out that the warn taint
flag is not well defined and could be easily set on a freshly booted
kernel for example when buggy BIOS is detected.

Other recent example is disabling ip forward on kvm guests:
  https://github.com/containers/libpod/issues/5815
  https://lore.kernel.org/netdev/a47b6a3b-c064-2f53-7cf6-d0d0720e9d99@redhat.com/

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Jan Stancek <jstancek@redhat.com>
CC: Chang Yin <cyin@redhat.com>
CC: Li Wang <liwang@redhat.com>
---
 lib/tst_taint.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/tst_taint.c b/lib/tst_taint.c
index a5dbf77d2941..49146aacbbe9 100644
--- a/lib/tst_taint.c
+++ b/lib/tst_taint.c
@@ -82,9 +82,14 @@ void tst_taint_init(unsigned int mask)
 		tst_res(TCONF, "Kernel is too old for requested mask");
 
 	taint_mask = mask;
-
 	taint = tst_taint_read();
-	if ((taint & mask) != 0)
+
+	if (taint & TST_TAINT_W) {
+		tst_res(TCONF, "Ignoring already set kernel warning taint");
+		taint_mask &= ~TST_TAINT_W;
+	}
+
+	if ((taint & taint_mask) != 0)
 		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
 }
 
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
