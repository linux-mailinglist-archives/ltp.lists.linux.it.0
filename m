Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3592B6762
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 15:30:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 440A53C5D20
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 15:30:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CB18E3C4F0B
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 15:30:23 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 013871A00E28
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 15:30:22 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AHEOraW061724;
 Tue, 17 Nov 2020 14:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=AMtGl0PUskR5I2a81IpYTbo4UNJCd18SbkG9Pw2f7s0=;
 b=ES1cy06lRSSi/NsMNBxVcSI52n91gRJnyliHvcYh4ovQrU5huYWTwoPxx10ueWQ6OiPw
 N1L1+Y3Iqqodn11xrD3E+Fpv66eX5IH7HWb3lXP1GcfFhSesDWnH06WRjC8SgRQKt/wq
 5O3lrtD6C8ftplZwbMvqz4mLNcF/r07r6XslRqXXdQ+MysNPN6cUynIIR+pFhLeOiqMW
 MRAMfd2E+iGZmU/WsNWeP+uvQ9UyRaZELrfZQQ4s0WIXfg/t2/HauLAYf2EeekCKzQWc
 Z0aoZDV0IjtI73oQUmtKGaWugwzEeK7up3EHSSRLeiMpxF7rppvwZVfGSYgOMscfffrG og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34t76ktq2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Nov 2020 14:30:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AHEPFUQ136003;
 Tue, 17 Nov 2020 14:30:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 34umcy8aam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 14:30:11 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AHEU992031512;
 Tue, 17 Nov 2020 14:30:09 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Nov 2020 06:30:09 -0800
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20201116220325.413764-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <689bea29-9717-1b2a-a53f-4b3a7f9f4e9b@oracle.com>
Date: Tue, 17 Nov 2020 17:30:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116220325.413764-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170108
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/route: Rewrite route-rmmod to new API
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

On 17.11.2020 01:03, Petr Vorel wrote:
> Use network namespaces and veth only, therefore no need to use ethtool for
> defining a driver.
> 
> Add reset_ltp_netspace() in tst_net.sh.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  runtest/net_stress.route                      |   2 +
>  testcases/lib/tst_net.sh                      |  12 +-
>  testcases/network/stress/route/route-rmmod.sh |  46 +++
>  testcases/network/stress/route/route4-rmmod   | 283 ------------------
>  testcases/network/stress/route/route6-rmmod   | 279 -----------------
>  5 files changed, 59 insertions(+), 563 deletions(-)
>  create mode 100644 testcases/network/stress/route/route-rmmod.sh
>  delete mode 100644 testcases/network/stress/route/route4-rmmod
>  delete mode 100644 testcases/network/stress/route/route6-rmmod
> 
> diff --git a/runtest/net_stress.route b/runtest/net_stress.route
> index b60e55bd6..9e1343e0f 100644
> --- a/runtest/net_stress.route
> +++ b/runtest/net_stress.route
> @@ -5,6 +5,7 @@ route4-change-if route-change-if.sh
>  route4-change-netlink-dst route-change-netlink-dst.sh
>  route4-change-netlink-gw route-change-netlink-gw.sh
>  route4-change-netlink-if route-change-netlink-if.sh
> +route4-rmmod route-rmmod.sh
>  
>  route6-change-dst route-change-dst.sh -6
>  route6-change-gw route-change-gw.sh -6
> @@ -12,3 +13,4 @@ route6-change-if route-change-if.sh -6
>  route6-change-netlink-dst route-change-netlink-dst.sh -6
>  route6-change-netlink-gw route-change-netlink-gw.sh -6
>  route6-change-netlink-if route-change-netlink-if.sh -6
> +route6-rmmod route-rmmod.sh -6
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 46d3fb88e..30514ebaf 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # Copyright (c) 2014-2017 Oracle and/or its affiliates. All Rights Reserved.
> -# Copyright (c) 2016-2019 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2016-2020 Petr Vorel <pvorel@suse.cz>
>  # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
>  
>  [ -n "$TST_LIB_NET_LOADED" ] && return 0
> @@ -130,6 +130,16 @@ init_ltp_netspace()
>  	tst_restore_ipaddr rhost
>  }
>  
> +reset_ltp_netspace()
> +{
> +	tst_require_cmds pkill
> +
> +	rm -f /var/run/netns/ltp_ns
> +	pkill ns_create
> +	unset LTP_NETNS
> +	init_ltp_netspace
> +}
> +
>  # Run command on remote host.
>  # tst_rhost_run -c CMD [-b] [-s] [-u USER]
>  # Options:
> diff --git a/testcases/network/stress/route/route-rmmod.sh b/testcases/network/stress/route/route-rmmod.sh
> new file mode 100644
> index 000000000..8067d9094
> --- /dev/null
> +++ b/testcases/network/stress/route/route-rmmod.sh
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) International Business Machines Corp., 2006
> +# Author: Mitsuru Chinen <mitch@jp.ibm.com>
> +# Rewrite into new shell API: Petr Vorel
> +
> +TST_SETUP="setup"
> +TST_CLEANUP="cleanup"
> +TST_TESTFUNC="do_test"
> +
> +module='veth'
> +TST_NEEDS_DRIVERS="$module"
> +
> +. route-lib.sh
> +TST_CNT=$ROUTE_CHANGE_IP
> +
> +setup()
> +{
> +	tst_res TINFO "adding IPv$TST_IPVER route destination and delete network driver $ROUTE_CHANGE_IP times"
> +}

It is probably unsafe to go straight to the do_test() and removing
the veth... it would be nice to check that it is indeed using default
ltp netns, and veth not used for other interfaces, TCONF otherwise...

Perhaps in init_ltp_netspace(), create a special symlink in the if block,
where the default ltp netns created:

if [ ! -f /var/run/netns/ltp_ns -a -z "$LTP_NETNS" ]; then
   ...
   ROD ln -s /var/run/netns/ltp_ns /var/run/netns/ltp_ns_default
   ...
}

then check via this function:

is_ltp_ns_default()
{
	test -f /var/run/netns/ltp_ns_default
}


BTW, why not using add_macvlan() in route_lib.sh (or gre, vxlan, etc.)
and remove that driver, so that this test can be run with custom setup, and
with remote host setup?


> +
> +cleanup()
> +{
> +	modprobe $module
> +	route_cleanup> +}
> +
> +do_test()
> +{
> +	local iface="$(tst_iface)"
> +	local rt="$(tst_ipaddr_un -p $1)"
> +	local rhost="$(tst_ipaddr_un $1 1)"
> +
> +	tst_res TINFO "testing route '$rt'"
> +
> +	tst_add_ipaddr -s -q -a $rhost rhost
> +	ROD ip route add $rt dev $iface
> +	EXPECT_PASS_BRK ping$TST_IPV6 -c1 -I $(tst_ipaddr) $rhost \>/dev/null
> +
> +	ROD rmmod $module

ROD modprobe -r $module

> +	ROD modprobe $module
> +	reset_ltp_netspace

should be in cleanup too, in case of test timeout or TBROK?

> +}
> +
> +tst_run
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
