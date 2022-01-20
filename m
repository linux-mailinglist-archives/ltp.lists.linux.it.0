Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3D49505F
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jan 2022 15:38:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBFA23C96CC
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jan 2022 15:38:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C69093C9174
 for <ltp@lists.linux.it>; Thu, 20 Jan 2022 15:38:27 +0100 (CET)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A976414010CA
 for <ltp@lists.linux.it>; Thu, 20 Jan 2022 15:38:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=CcWR2hXbTCRYjGaHTbUJWNkAQTshI2gm4b1FiCpxtjo=; b=jfaCNTuXOuTR
 OGtbIYROpugcBSBlsKGIrzq1PfY9s+E/veYBSt3FIVY+3m3z9n8W3rMbkGlxiDn3IBZdIdh+8BhXw
 G7O75yGiK1Cawt+qH5POnnBUxdXWi52G0UNDcxQdNDPEbtGTukZjOFeadl/Mc9/w57LzCKhK08vQx
 vsRyQ=;
Received: from [192.168.15.98] (helo=cobook.home)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <nikita.yushchenko@virtuozzo.com>)
 id 1nAYa0-00777m-Ic; Thu, 20 Jan 2022 17:38:24 +0300
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 20 Jan 2022 17:37:28 +0300
Message-Id: <20220120143727.27057-1-nikita.yushchenko@virtuozzo.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] rpc_lib.sh: fix portmapper detection in case of
 socket activation
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
From: Nikita Yushchenko via ltp <ltp@lists.linux.it>
Reply-To: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Cc: kernel@openvz.org, ltp@lists.linux.it,
 Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On systemd-based linux hosts, rpcbind service is typically started via
socket activation, when the first client connects. If no client has
connected before LTP rpc test starts, rpcbind process will not be
running at the time of check_portmap_rpcbind() execution, causing
check_portmap_rpcbind() to report TCONF error.

Fix that by adding a quiet invocation of 'rpcinfo' before checking for
rpcbind.

For portmap, similar step is likely not needed, because portmap is used
only on old systemd and those don't use systemd.

Signed-off-by: Nikita Yushchenko <nikita.yushchenko@virtuozzo.com>
---
 testcases/network/rpc/basic_tests/rpc_lib.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/network/rpc/basic_tests/rpc_lib.sh b/testcases/network/rpc/basic_tests/rpc_lib.sh
index c7c868709..e882e41b3 100644
--- a/testcases/network/rpc/basic_tests/rpc_lib.sh
+++ b/testcases/network/rpc/basic_tests/rpc_lib.sh
@@ -8,6 +8,12 @@ check_portmap_rpcbind()
 	if pgrep portmap > /dev/null; then
 		PORTMAPPER="portmap"
 	else
+		# In case of systemd socket activation, rpcbind could be
+		# not started until somebody tries to connect to it's socket.
+		#
+		# To handle that case properly, run a client now.
+		rpcinfo >/dev/null 2>&1
+
 		pgrep rpcbind > /dev/null && PORTMAPPER="rpcbind" || \
 			tst_brk TCONF "portmap or rpcbind is not running"
 	fi
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
