Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 620292AF3D3
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 15:40:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0775C3C5282
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 15:40:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 780CD3C2F19
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 15:40:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EDCE52005D9
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 15:40:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C4E5AD20;
 Wed, 11 Nov 2020 14:40:07 +0000 (UTC)
Date: Wed, 11 Nov 2020 15:40:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kory Maincent <kory.maincent@bootlin.com>,
 Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201111144005.GA3358@pevik>
References: <20201110180533.28595-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110180533.28595-1-kory.maincent@bootlin.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Kory, Alexey,

> The ping from busybox does not have -f parameter, use -i parameter instead.
> BusyBox does not accept pattern longer than 2 bytes.
> BusyBox support -i option since version 1.30

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>

LGTM.

I suggest to merge with few changes below.

* more precise message "ping from old busybox?"
* use just $(tst_ipaddr rhost) instead of $ipaddr
(some time ago we've started to use function calls for these simple evaluations)
* upper case for global variable (ugly, but easily recognizable

Kind regards,
Petr

diff --git testcases/network/tcp_cmds/ping/ping02.sh testcases/network/tcp_cmds/ping/ping02.sh
index d4290c873..acf2737bf 100755
--- testcases/network/tcp_cmds/ping/ping02.sh
+++ testcases/network/tcp_cmds/ping/ping02.sh
@@ -17,13 +17,12 @@ do_setup()
 
 	tst_require_cmds $PING
 
-	ping_opts="-f -p 000102030405060708090a0b0c0d0e0f"
-	ipaddr=$(tst_ipaddr rhost)
+	PING_OPTS="-f -p 000102030405060708090a0b0c0d0e0f"
 
-	if ! $PING -c 1 -f $ipaddr >/dev/null 2>&1; then
-		ping_opts="-i 0.01 -p aa"
+	if ! $PING -c 1 -f $(tst_ipaddr rhost) >/dev/null 2>&1; then
+		PING_OPTS="-i 0.01 -p aa"
 		if $PING -i 2>&1 | grep -q "invalid option"; then
-			tst_brk TCONF "unsupported ping version (old busybox?)"
+			tst_brk TCONF "unsupported ping version (ping from old busybox?)"
 		fi
 	fi
 }
@@ -32,10 +31,10 @@ do_test()
 {
 	local s
 
-	tst_res TINFO "flood $PING: ICMP packets with options '$ping_opts'"
+	tst_res TINFO "flood $PING: ICMP packets with options '$PING_OPTS'"
 
 	for s in $PACKETSIZES; do
-		EXPECT_PASS $PING -c $COUNT -s $s $ipaddr $ping_opts \>/dev/null
+		EXPECT_PASS $PING -c $COUNT -s $s $(tst_ipaddr rhost) $PING_OPTS \>/dev/null
 	done
 }
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
