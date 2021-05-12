Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B637C255
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 17:08:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0261A3C8A8D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 17:08:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DF3243C1D63
 for <ltp@lists.linux.it>; Wed, 12 May 2021 17:08:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6574F1400104
 for <ltp@lists.linux.it>; Wed, 12 May 2021 17:08:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A0F2B11D
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:08:04 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 12 May 2021 17:07:50 +0200
Message-Id: <20210512150750.12152-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] netns_helper.sh: Replace ip version check with
 feature testing
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

ip version check in tst_check_iproute() was broken since iproute2
version v5.7.0-77-gb687d1067169 (released in v5.8.0), there is
new scheme which contains kernel version. Although it'd be trivial to
fix it, check the actual required feature is better.

This fixes error for newest version scheme:
    [: too many arguments

NOTE: required version ss111010 (v3.0.0) is 10 years old (LTP might not
even compile with toolchain from these distros), we might drop this
check after the release.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../kernel/containers/netns/netns_helper.sh   | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
index a5b77a0aa..f25b0c67e 100755
--- a/testcases/kernel/containers/netns/netns_helper.sh
+++ b/testcases/kernel/containers/netns/netns_helper.sh
@@ -45,22 +45,6 @@ NS_HANDLE1=
 # ifconfig <device> $IFCONF_IN6_ARG IP/NETMASK
 IFCONF_IN6_ARG=
 
-tst_check_iproute()
-{
-	local cur_ipver="$(ip -V)"
-	local spe_ipver="$1"
-
-	cur_ipver=${cur_ipver##*s}
-
-	if [ -z "$cur_ipver" -o -z "$spe_ipver" ]; then
-		tst_brk TBROK "failed to obtain valid iproute version"
-	fi
-
-	if [ $cur_ipver -lt $spe_ipver ]; then
-		tst_brk TCONF "too old iproute version"
-	fi
-}
-
 # Sets up global variables which can be used in test cases (documented above),
 # creates two network namespaces and a pair of virtual ethernet devices, each
 # device in one namespace. Each device is then enabled and assigned an IP
@@ -204,7 +188,8 @@ netns_ns_exec_setup()
 # ethernet device is then created for each namespace.
 netns_ip_setup()
 {
-	tst_check_iproute 111010
+	ip netns || tst_brk TCONF "ip without netns support (required iproute2 >= ss111010 - v3.0.0)"
+
 	NS_EXEC="ip netns exec"
 
 	NS_HANDLE0=tst_net_ns0
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
