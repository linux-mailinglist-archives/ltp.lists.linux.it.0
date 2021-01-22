Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458F30063E
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 15:55:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5B673C84F4
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 15:55:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A6B423C6369
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 15:55:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AF8B914010F6
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 15:55:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B584AEE0;
 Fri, 22 Jan 2021 14:55:11 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 22 Jan 2021 15:54:58 +0100
Message-Id: <20210122145458.27964-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210122145458.27964-1-pvorel@suse.cz>
References: <20210122145458.27964-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/3] tst_net.sh: Require veth for netns (again)
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
Cc: kernel-team@android.com, Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

new error message is more informative:
tcp_fastopen_run 1 TCONF: veth driver not available

then the old one:
Error: Unknown device type.
tcp_fastopen_run 1 TBROK: ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2 failed

NOTE: originally added in 305a78e4c and temporarily reverted in
7fe2ad11d due problems which were fixed in commit
"lib: Fix kernel module detection on BusyBox".

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
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
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
