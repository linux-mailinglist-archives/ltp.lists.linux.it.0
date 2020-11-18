Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 379492B82A6
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 18:07:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDF1A3C5A0E
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 18:07:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2127B3C30B4
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 18:07:08 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E5C6A1A00984
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 18:07:06 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIH4EHS122254;
 Wed, 18 Nov 2020 17:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=muDaBG7eh1RN2V84XjZvrfS65SxkhuK41sRBz5NcW/c=;
 b=AqNCf77wxqLosLEV9ZP/65qDjrZSQzKvyDW7rehJfayJ0KjJP9oE+esVdjJujKrhpUwx
 gXIM94YrqtTJVSlO2GWlgi781b8YE33P1KtkVbdhVS2y3xVchxnzodJrhrVCXPxoXsjp
 vElxObxkE4TXxFPvrDcQif7qlRPNhzCUKtnc0NFMZZVwUduUgRnm2RkXZJiDWG/l4MsH
 z5rgXwv5s3VHZe0vUtuPl4GDdPUgO90/h4KEf12w/2W+kyoKPu5ntxgKaX2nZEH7g/tO
 2paQfuxGEpM5CaDAwG3RYXB5d2vDD4TIq+YnOB231F8OVMG2Q1P+XmMxo3Tyy8Mi9OCU pQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34t76m1510-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 17:06:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIGpMZr011562;
 Wed, 18 Nov 2020 17:04:51 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34umd0tgxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 17:04:51 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AIH4mwp001180;
 Wed, 18 Nov 2020 17:04:50 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Nov 2020 09:04:48 -0800
To: Joerg Vehlow <lkml@jv-coder.de>, ltp@lists.linux.it
References: <20201117124320.783802-1-lkml@jv-coder.de>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <057bc703-d3b6-5d8a-4831-609e332fdc36@oracle.com>
Date: Wed, 18 Nov 2020 20:04:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117124320.783802-1-lkml@jv-coder.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9809
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011180117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9809
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011180118
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] network/stress/multicast/packet-flood:
 Update to new API
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

On 17.11.2020 15:43, Joerg Vehlow wrote:
> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
...
> --- /dev/null
> +++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld01.sh
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2006 International Business Machines  Corp.
> +# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> +# Author: Mitsuru Chinen <mitch@jp.ibm.com>
> +#
> +# Verify that the kernel is not crashed when joining a multicast group with
> +# a single socket, then receiving a large number of UDP packets at the socket
> +
> +TST_NEEDS_ROOT=1
> +. mcast-lib.sh
> +
> +do_setup()
> +{
> +	mcast_setup $MCASTNUM_NORMAL
> +	MCAST_LCMD=ns-mcast_receiver
> +	MCAST_RCMD=ns-udpsender
> +}
> +
> +do_test()
> +{
> +	local mcast_addr="$MCAST_IPV4_ADDR"
> +	[ "$TST_IPV6" ] && mcast_addr="$MCAST_IPV6_ADDR"
> +
> +	# Find the available consecutive ports
> +	local mcast_port=$(find_portbundle udp 1025 1)

Hi Joerg,

The following command should support both udp/udp6:

local mcast_port=$(tst_get_unused_port ipv${TST_IPVER} dgram)

> +	if [ $? -ne 0 ]; then
> +		tst_brk TBROK "No free udp port available."
> +	fi
> +
> +	# Run a receiver
> +	ns-mcast_receiver -f $TST_IPVER -I $(tst_iface lhost) -m $mcast_addr -p $mcast_port -b
> +	if [ $? -ne 0 ]; then
> +		tst_brk TBROK "Failed to start multicast receiver"
> +	fi

This check can be replaced with

ROD ns-mcast_receiver -f $TST_IPVER -I $(tst_iface lhost) -m $mcast_addr -p $mcast_port -b


> +
> +	# Run a sender
> +	tst_rhost_run -s -c "ns-udpsender -D $mcast_addr -f $TST_IPVER -p $mcast_port -s 32767 -m -I $(tst_iface rhost) -t $NS_DURATION"
> +

What if we swap sender and receiver, i.e.

local ns_opts="-f $TST_IPVER -p $mcast_port"

tst_rhost_run -s -c "ns-mcast_receiver $ns_opts -I $(tst_iface rhost) -m $mcast_addr -b"
EXPECT_PASS ns-udpsender -D $mcast_addr $ns_opts -s 32767 -m -I $(tst_iface) -t $NS_DURATION

By default, ltp is using network namespace, so it's probably better
to run the background service there.


> +	tst_res TPASS "Test finished successfully."

No need for it if using EXPECT_PASS as above.

> +}
> +
> +tst_run
> diff --git a/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> new file mode 100755
> index 000000000..4ffde186b
> --- /dev/null
> +++ b/testcases/network/stress/multicast/packet-flood/mcast-pktfld02.sh
> @@ -0,0 +1,60 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2006 International Business Machines  Corp.
> +# Copyright (c) 2020 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> +# Author: Mitsuru Chinen <mitch@jp.ibm.com>
> +#
> +# Verify that the kernel is not crashed when joining multiple multicast
> +# groups on separate sockets, then receiving a large number of UDP
> +# packets at each socket
> +
> +TST_NEEDS_ROOT=1
> +. mcast-lib.sh
> +
> +do_setup()
> +{
> +	mcast_setup $MCASTNUM_NORMAL
> +	MCAST_LCMD=ns-mcast_receiver
> +	MCAST_RCMD=ns-udpsender
> +}
> +
> +do_test()
> +{
> +	local mcast_port_range=$(find_portbundle udp 1025 $MCASTNUM_NORMAL)
> +	if [ $? -ne 0 ]; then
> +		tst_brk TBROK "Failed to find enough consecutive free udp ports."
> +	fi
> +	local mcast_port_top=$(echo $mcast_port_range | cut -f 1 -d '-')
> +
> +	local mcastnum=0
> +	while [ $mcastnum -lt $MCASTNUM_NORMAL ]; do
> +		local mcast_port=$((mcast_port_top + mcastnum))
                                       ^
I guess it's fine to use $(tst_get_unused_port ipv${TST_IPVER} dgram) here,
and removing getting the port range.

> +
> +		# Define the multicast address
> +		if [ "$TST_IPV6" ]; then
> +    		local mcastnum_hex=$(printf "%x" $mcastnum)
> +    		local mcast_addr=${MCAST_IPV6_ADDR_PREFIX}:${mcastnum_hex}
> +		else
> +			local x=$((mcastnum / 254))
> +			local y=$((mcastnum % 254 + 1))
> +			local mcast_addr=${MCAST_IPV4_ADDR_PREFIX}.${x}.${y}
> +		fi
> +
> +		# Run a receiver
> +		ns-mcast_receiver -f $TST_IPVER -I $(tst_iface lhost) -m $mcast_addr -p $mcast_port -b
> +		if [ $? -ne 0 ]; then
> +			tst_brk TBROK "Failed to start multicast receiver"
> +		fi
> +
> +		# Run a sender
> +		tst_rhost_run -s -c "ns-udpsender -D $mcast_addr -f $TST_IPVER -p $mcast_port -m -I $(tst_iface rhost) -b -t $NS_DURATION"
> +
> +		: $((mcastnum += 1))

The same, better swap sender/receiver.

> +	done
> +
> +	sleep $NS_DURATION


It would be nice to have a small loop instead of a single 'sleep' and
periodically check that the background senders are really running...

> +
> +	tst_res TPASS "Test finished successfully."
> +}
> +
> +tst_run

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
