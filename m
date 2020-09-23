Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB0275BD6
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 17:29:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A8F5D3C5A09
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 17:29:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id C02B73C1D97
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 17:29:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7B7F01400044
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 17:29:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BE20AA35;
 Wed, 23 Sep 2020 15:29:45 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 23 Sep 2020 17:29:02 +0200
Message-Id: <20200923152902.8738-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] sendto: Add PACKET_VNET_HDR to lapi and use it
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

to fix build on CentOS 6

Fixme: b59c66210 ("Add test for CVE 2020-14386")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
* actually add lapi header

 include/lapi/if_packet.h                    | 4 ++++
 testcases/kernel/syscalls/sendto/sendto03.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/lapi/if_packet.h b/include/lapi/if_packet.h
index 81110217d..902489b57 100644
--- a/include/lapi/if_packet.h
+++ b/include/lapi/if_packet.h
@@ -25,6 +25,10 @@
 # define PACKET_RESERVE 12
 #endif
 
+#ifndef PACKET_VNET_HDR
+#define PACKET_VNET_HDR	15
+#endif
+
 #ifndef PACKET_FANOUT
 #define PACKET_FANOUT	18
 #endif
diff --git a/testcases/kernel/syscalls/sendto/sendto03.c b/testcases/kernel/syscalls/sendto/sendto03.c
index a6332ec52..3ecb574a1 100644
--- a/testcases/kernel/syscalls/sendto/sendto03.c
+++ b/testcases/kernel/syscalls/sendto/sendto03.c
@@ -23,13 +23,13 @@
 #include <sys/types.h>
 #include <sys/socket.h>
 #include <sys/ioctl.h>
-#include <linux/if_packet.h>
 #include <net/if.h>
 #include <net/ethernet.h>
 #include <sched.h>
 
 #include "tst_test.h"
 #include "tst_net.h"
+#include "lapi/if_packet.h"
 
 #define BUFSIZE 1024
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
