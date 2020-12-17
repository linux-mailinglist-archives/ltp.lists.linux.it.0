Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E22DD25D
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 14:46:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3BEE3C57BF
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 14:46:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 054C43C3358
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 14:46:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 88C131A013D4
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 14:46:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C445CAD29;
 Thu, 17 Dec 2020 13:46:25 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 17 Dec 2020 14:46:20 +0100
Message-Id: <20201217134620.10128-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_net.sh: Require veth for netns
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

new error message is more informative:
tcp_fastopen_run 1 TCONF: veth driver not available

then the old one:
Error: Unknown device type.
tcp_fastopen_run 1 TBROK: ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2 failed

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index ef9354903..1ddef2fea 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -106,6 +106,7 @@ init_ltp_netspace()
 		tst_require_cmds ip
 		tst_require_root
 
+		tst_require_drivers veth
 		ROD ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2
 		pid="$(ROD ns_create net,mnt)"
 		mkdir -p /var/run/netns
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
