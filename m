Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 414DA298E41
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 14:40:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB0243C313D
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 14:40:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 732B63C23BB
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 14:40:54 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D17241A002C9
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 14:40:53 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09QDd9Yc022474;
 Mon, 26 Oct 2020 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=laL6YZBNj6eDmRn1TXUZN/SXfPZf58o0rhSdMgRoScI=;
 b=G/4BehBCBPhLoKxOFPTDF1l67TtmROBiJ1v4alO1aXBW3PwQvVppXRobrz4gl/cfZWiV
 mERfTN8JLC+SVOvYzO6Qx2jh7Yqt94rX80Czy7c44AZGX2sFpbCGXHgQ8k3S+K88N+gn
 x5AprupMUuJNJjc9se0tHU3jR76J41FM/e1dNB5IAwoZ7g3bYiMpMbYFxp0HQAlJfog9
 Pun8oa95y0vEEbC1RWBpqTALp0NFdooDA7nptGxmr4Wwz+K1+Ho65XHOliEJNPjNoETR
 m+BjjQmGAz4WlKrbYIWLczM2yJsk7hvie65EcJXh1tmQGXD4gj+QzSX5oqgOLhs/hRT4 Cg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 34c9samryn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Oct 2020 13:40:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09QDaL5q110978;
 Mon, 26 Oct 2020 13:40:50 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 34cwuk7xxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 13:40:50 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09QDeldN008696;
 Mon, 26 Oct 2020 13:40:49 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Oct 2020 06:40:47 -0700
To: Petr Vorel <pvorel@suse.cz>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201015122056.20715-4-alexey.kodanev@oracle.com>
 <20201026084939.GE21306@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <34dfc67f-5234-a06b-c824-066bc70ecc8a@oracle.com>
Date: Mon, 26 Oct 2020 16:40:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026084939.GE21306@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260098
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] network/virt: add wireguard01
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 26.10.2020 11:49, Petr Vorel wrote:
> Hi Alexey,
> 
>> * performance tests with TCP traffic
> 
>> * invalid configuration with allowed IPs, public key
> 
>> * emulation of the lossy link for the underlying interface.
> 
> Thanks a lot for supporting wireguard!
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> ...
>> +TST_NEEDS_TMPDIR=1
>> +TST_NEEDS_CMDS="$TST_NEEDS_CMDS wg"
>> +TST_TESTFUNC=${TST_TESTFUNC:-virt_netperf_msg_sizes}
>> +TST_SETUP=${TST_SETUP:-wireguard_lib_setup}
>> +TST_CLEANUP=${TST_CLEANUP:-wireguard_lib_cleanup}
>> +TST_NEEDS_DRIVERS="wireguard"
>> +VIRT_PERF_THRESHOLD_MIN=${VIRT_PERF_THRESHOLD_MIN:-200}
>> +
>> +virt_type="wireguard"
>> +. virt_lib.sh
>> +
>> +# Usage: wireguard_lib_setup [TYPE]
>> +# TYPE: [ default | invalid_allowed_ips | invalid_pub_keys ]
>> +wireguard_lib_setup()
>> +{
>> +	local type="${1:-default}"
>> +	local pub_key0="$(wg genkey | tee wg0.key | wg pubkey)"
>> +	local pub_key1="$(wg genkey | tee wg1.key | wg pubkey)"
>> +
>> +	local port_loc="$(tst_get_unused_port ipv${TST_IPVER} dgram)"
>> +	local port_rmt=$(tst_rhost_run -c "tst_get_unused_port ipv${TST_IPVER} dgram")
>> +
>> +	# copy private key to remote host
>> +	tst_rhost_run -s -c "echo '$(cat wg1.key)' > wg1.key"
>> +
>> +	tst_res TINFO "setup wireguard UDPv${TST_IPVER} tunnel, port $port_loc/$port_rmt"
>> +	tst_res TINFO "lhost[$(tst_ipaddr)] <-> rhost[$(tst_ipaddr rhost)]"
>> +
>> +	virt_setup
>> +
>> +	local ka_opt="persistent-keepalive 1"
>> +	local allow_ip_loc="${ip_virt_local}/32,${ip6_virt_local}/128"
>> +	local allow_ip_rmt="${ip_virt_remote}/32,${ip6_virt_remote}/128"
>> +
>> +	case $type in
>> +	invalid_allowed_ips)
>> +		allow_ip_loc="${ip_virt_remote}/32,${ip6_virt_remote}/128"
>> +		allow_ip_rmt="${ip_virt_local}/32,${ip6_virt_local}/128"
>> +		tst_res TINFO "Allowed IPs are source IPs only"
>> +		;;
>> +	invalid_pub_keys)
>> +		pub_key0="$(wg genkey | wg pubkey)"
>> +		tst_res TINFO "Invalid peer public key of lhost"
>> +		;;
>> +	esac
>> +
>> +	ROD wg set ltp_v0 listen-port $port_loc private-key wg0.key
>> +	ROD wg set ltp_v0 peer $pub_key1 endpoint \
>> +		$(tst_ipaddr rhost):$port_rmt $ka_opt \
>> +		allowed-ips $allow_ip_rmt
>> +
>> +	tst_rhost_run -s -c \
>> +		"wg set ltp_v0 listen-port $port_rmt private-key wg1.key"
>> +	tst_rhost_run -s -c "wg set ltp_v0 peer $pub_key0 \
>> +		endpoint $(tst_ipaddr):$port_loc $ka_opt \
>> +		allowed-ips $allow_ip_loc"
>> +
>> +	tst_net_run -s "ip route add 128.0.0.0/1 dev ltp_v0"
> Out of curiosity: why is IPv4 enough? (we test also IPv6)

Hi Petr,

Looks like no need for additional route table setup, and overriding
default route... tst_netload() uses addresses of wireguard device.
Will remove it.

> 
>> +}
>> +
>> +wireguard_lib_cleanup()
>> +{
>> +	virt_cleanup
>> +}
> 
> Why not use just virt_cleanup() ?

Yes, it's just a wrapper, but it is used in wirguard01/02 tests.
In case we need additional setup/cleanup we would have to change
both tests too.

> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
