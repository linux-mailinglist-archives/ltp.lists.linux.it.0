Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF205275B96
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 17:22:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 189283C5A0B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 17:22:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9CB643C4D53
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 17:22:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 50BE41000741
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 17:22:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E765CAA35;
 Wed, 23 Sep 2020 15:23:09 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 23 Sep 2020 17:22:27 +0200
Message-Id: <20200923152227.6045-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] lapi: Add PACKET_VNET_HDR
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

required for sendto03

Fixme: b59c66210 ("Add test for CVE 2020-14386")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/lapi/if_packet.h | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
