Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 529FB372A5F
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 14:50:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1FC53C5834
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 14:50:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C6D33C57EB
 for <ltp@lists.linux.it>; Tue,  4 May 2021 14:50:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B74691A00E0F
 for <ltp@lists.linux.it>; Tue,  4 May 2021 14:50:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6EE1AE20;
 Tue,  4 May 2021 12:50:51 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 14:50:46 +0200
Message-Id: <20210504125046.12621-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] dhcp: TCONF for wicked on IPv6
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

wicked requires proper radvd setup. which is beyond DHCP tests.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/dhcp/dhcp_lib.sh | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/testcases/network/dhcp/dhcp_lib.sh b/testcases/network/dhcp/dhcp_lib.sh
index 634d6ab43..730bdad87 100755
--- a/testcases/network/dhcp/dhcp_lib.sh
+++ b/testcases/network/dhcp/dhcp_lib.sh
@@ -37,6 +37,12 @@ stop_dhcp()
 
 dhcp_lib_setup()
 {
+	if [ $HAVE_SYSTEMCTL -eq 1 ] && \
+		systemctl --no-pager -p Id show network.service | grep -q Id=wicked.service; then
+		[ $TST_IPV6 ] && tst_brk TCONF "wicked not supported on IPv6"
+		is_wicked=1
+	fi
+
 	[ -z "$log" ] && log="$PWD/$(basename $0 '.sh').log"
 
 	if [ $TST_IPV6 ]; then
@@ -129,8 +135,7 @@ test01()
 		tst_brk TBROK "Failed to start $dhcp_name"
 	fi
 
-	if [ $HAVE_SYSTEMCTL -eq 1 ] && \
-		systemctl --no-pager -p Id show network.service | grep -q Id=wicked.service; then
+	if [ "$is_wicked" ]; then
 		tst_res TINFO "wicked is running, don't start dhclient"
 		if [ ! -f "$wicked_cfg" ]; then
 			cat <<EOF > $wicked_cfg
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
