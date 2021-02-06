Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4814311F8C
	for <lists+linux-ltp@lfdr.de>; Sat,  6 Feb 2021 20:14:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3682E3C70A4
	for <lists+linux-ltp@lfdr.de>; Sat,  6 Feb 2021 20:14:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E4A3D3C6D97
 for <ltp@lists.linux.it>; Sat,  6 Feb 2021 20:14:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 10A6C60074C
 for <ltp@lists.linux.it>; Sat,  6 Feb 2021 20:14:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08F61AC6E
 for <ltp@lists.linux.it>; Sat,  6 Feb 2021 19:14:03 +0000 (UTC)
Date: Sat, 6 Feb 2021 20:14:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YB7qefsNWbCJXUEu@pevik>
References: <20210205151015.7465-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205151015.7465-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] net/multicast: Create mcast_setup_normal()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> +++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
> @@ -8,14 +8,11 @@
>  # a single socket, then receiving a large number of UDP packets at the socket

>  TST_NEEDS_ROOT=1
> +TST_SETUP="mcast_setup_normal"
>  . mcast-lib.sh

> -do_setup()
> -{
> -	mcast_setup $MCASTNUM_NORMAL
> -	MCAST_LCMD=ns-mcast_receiver
> -	MCAST_RCMD=ns-udpsender
> -}
> +MCAST_LCMD="ns-mcast_receiver"
> +MCAST_RCMD="ns-udpsender"
Actually, this is wrong.
Variables must be set after setup has been run.

>  do_test()
>  {
> diff --git a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> index 76d184995..2c356917a 100755
> --- a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> +++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> @@ -9,14 +9,11 @@
>  # packets at each socket

>  TST_NEEDS_ROOT=1
> +TST_SETUP="mcast_setup_normal"
>  . mcast-lib.sh

> -do_setup()
> -{
> -	mcast_setup $MCASTNUM_NORMAL
> -	MCAST_LCMD=ns-mcast_receiver
> -	MCAST_RCMD=ns-udpsender
> -}
> +MCAST_LCMD="ns-mcast_receiver"
> +MCAST_RCMD="ns-udpsender"
And here as well.

Fix is to move it into test function.

Kind regards,
Petr

diff --git testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
index 1db7b0605..1b9fe9d79 100755
--- testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
+++ testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
@@ -11,13 +11,13 @@ TST_NEEDS_ROOT=1
 TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-MCAST_LCMD="ns-mcast_receiver"
-MCAST_RCMD="ns-udpsender"
-
 do_test()
 {
 	tst_res TINFO "joining an IPv${TST_IPVER} multicast group with a single socket, then receiving a large number of UDP packets at the socket in $NS_DURATION seconds"
 
+	MCAST_LCMD="ns-mcast_receiver"
+	MCAST_RCMD="ns-udpsender"
+
 	local addr="$MCAST_IPV4_ADDR"
 	[ "$TST_IPV6" ] && addr="$MCAST_IPV6_ADDR"
 
diff --git testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
index ee62b347e..9b5de60db 100755
--- testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
+++ testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
@@ -12,13 +12,13 @@ TST_NEEDS_ROOT=1
 TST_SETUP="mcast_setup_normal"
 . mcast-lib.sh
 
-MCAST_LCMD="ns-mcast_receiver"
-MCAST_RCMD="ns-udpsender"
-
 do_test()
 {
 	tst_res TINFO "joining $MCASTNUM_NORMAL IPv${TST_IPVER} multicast groups on separate sockets, then receiving a large number of UDP packets at each socket in $NS_DURATION seconds"
 
+	MCAST_LCMD="ns-mcast_receiver"
+	MCAST_RCMD="ns-udpsender"
+
 	local addr port
 	local n=0
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
