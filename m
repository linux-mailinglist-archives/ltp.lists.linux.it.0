Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A42D5D0720
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:23:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 107843C228F
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 08:23:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E170E3C2074
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:23:07 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 592C914016AD
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 08:23:07 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4F9D59F979;
 Wed,  9 Oct 2019 06:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570602186; bh=z2ALTI/lCFPI7bmy2H5mOzxRdQt6N51vM08E2WoDoUQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=qLEkfMwqPbqKRK0N1XDn70ODwxGqxirwNxmxCd4EpwhKTKbmtgGqj9MCUSGDHtPU7
 og7FFBViWwqqdf1lBbEIx9EctxA+eJeaTYqVewyNz1TVXXy1RoaAOEHSOAdjw7Tx9k
 ucGHdDWDtGAtS9QxIlF7RoSvUzyamAhOO2N3w1K4=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Wed,  9 Oct 2019 08:23:00 +0200
Message-Id: <20191009062300.50219-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] tst_net.sh: Allow execution if xfrm is disabled
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

If the kernel is configured without xfrm support, the setup of the
interfaces for communication between local and remote host fails,
because it tries to flush xfrm state and policy.
There is no need to flush, if the system doesn't even support xfrm.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/lib/tst_net.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 6c3ae708d..3aaf21cb5 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -430,8 +430,10 @@ tst_init_iface()
 	tst_res_ TINFO "initialize '$type' '$iface' interface"
 
 	if [ "$type" = "lhost" ]; then
-		ip xfrm policy flush || return $?
-		ip xfrm state flush || return $?
+		if ip xfrm state 1>/dev/null 2>&1; then
+			ip xfrm policy flush || return $?
+			ip xfrm state flush || return $?
+		fi
 		ip link set $iface down || return $?
 		ip route flush dev $iface || return $?
 		ip addr flush dev $iface || return $?
@@ -439,8 +441,10 @@ tst_init_iface()
 		return $?
 	fi
 
-	tst_rhost_run -c "ip xfrm policy flush" || return $?
-	tst_rhost_run -c "ip xfrm state flush" || return $?
+	if tst_rhost_run -c "ip xfrm state 1>/dev/null 2>&1"; then
+		tst_rhost_run -c "ip xfrm policy flush" || return $?
+		tst_rhost_run -c "ip xfrm state flush" || return $?
+	fi
 	tst_rhost_run -c "ip link set $iface down" || return $?
 	tst_rhost_run -c "ip route flush dev $iface" || return $?
 	tst_rhost_run -c "ip addr flush dev $iface" || return $?
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
