Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E362FEBEF
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 14:33:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 584173C638C
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 14:33:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3676A3C3043
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:32:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DD75E1A002E6
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 14:32:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 385DFB7B1;
 Thu, 21 Jan 2021 13:32:43 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 21 Jan 2021 14:32:33 +0100
Message-Id: <20210121133233.29007-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121133233.29007-1-pvorel@suse.cz>
References: <20210121133233.29007-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/3] tst_net.sh: Require veth for netns (again)
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
Cc: kernel-team@android.com, Steve Muckle <smuckle@google.com>,
 Sandeep Patil <sspatil@google.com>
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
