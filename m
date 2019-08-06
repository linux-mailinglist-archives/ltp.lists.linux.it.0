Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FF3832C9
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 15:35:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C12F23C1C97
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 15:35:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 664A03C1441
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 15:35:32 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5F87514013A7
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 15:35:31 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x76DY4AX156766;
 Tue, 6 Aug 2019 13:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=FtKuDSrkxzOX3m1OsLWwffHcxCcq+vj19tmMNx/K/JI=;
 b=ZeIF4Npn9UiU7MLrH7u2AcD+NokkuLOnN4kWsGShE50x1I/z/ISmQu50AuYEpfockveH
 UEOIMFcxcK1yBsn0wlR0Ng9clzL8rclBju7DeOoB+fR/WGK0ZS+eMuAwJyMDQRX5Rjy6
 KVqHPgvuVvGgGMfPgzgkUVwssLzCTFqImApKJY04CdmgrUiFMhIFKpiSlkgpTCQrR4E5
 /4cRFUVPF1Yi40jsoyRCgQY+PTXrrHu1OJc+Aj4Z640E7VL1hKrsi3aYhLZxj5tt2Xxd
 fsb8k0B9RWwRF0Kp9DEmdw/NecMQfsv6Sch+8u0FqqPds35kzg61uCBKp2dkn7BCVF/C tA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2u527pp3dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Aug 2019 13:35:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x76DXJmt167236;
 Tue, 6 Aug 2019 13:35:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2u7666m2ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Aug 2019 13:35:27 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x76DZN34005877;
 Tue, 6 Aug 2019 13:35:25 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 06 Aug 2019 06:35:23 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20190725111027.18716-1-pvorel@suse.cz>
 <20190725111027.18716-5-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Organization: Oracle Corporation
Message-ID: <89188a02-2213-bea7-5273-d0077de5878e@oracle.com>
Date: Tue, 6 Aug 2019 16:38:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725111027.18716-5-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9340
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908060138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9340
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908060138
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/5] network/route: Rewrite route-change-gw
 into new API
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

Hi Petr,
On 7/25/19 2:10 PM, Petr Vorel wrote:
> * Drop route command (use just ip command), support both IPv4 and IPv6
> * Use unused network range to avoid clash with real network
> * Add verification with ping (previous version sent UDP datagram with
> ns-udpsender, but didn't verify receiving it on rhost and didn't setup
> rhost ip at all)
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  runtest/net_stress.route                      |   4 +-
>  .../network/stress/route/00_Descriptions.txt  |  18 +-
>  .../network/stress/route/route-change-gw      |  38 +++
>  .../network/stress/route/route4-change-gw     | 292 ------------------
>  .../network/stress/route/route6-change-gw     | 292 ------------------
>  5 files changed, 43 insertions(+), 601 deletions(-)
>  create mode 100755 testcases/network/stress/route/route-change-gw
>  delete mode 100644 testcases/network/stress/route/route4-change-gw
>  delete mode 100644 testcases/network/stress/route/route6-change-gw
> 
> ...
> +
> +# Change route gateway
> +# lhost: 10.23.x.2, gw (on rhost): 10.23.x.1, rhost: 10.23.0.1
> +
> +TST_TESTFUNC="test_gw"
> +. route-lib.sh
> +
> +setup()
> +{
> +	tst_res TINFO "change IPv$TST_IPVER route gateway $NS_TIMES times"
> +
> +	rt="$(tst_ipaddr_un -m 0 0)"
> +	lhost="$(tst_ipaddr_un 1 1)"
> +	rhost="$(tst_ipaddr_un 0 1)"
> +	tst_add_ipaddr -s -a $lhost
> +	tst_add_ipaddr -s -a $rhost rhost
> +}
> +
> +test_gw()
> +{
> +	local gw="$(tst_ipaddr_un 1 $(($1 + 1)))"

We should keep $(($1 + 1)) within the valid range except already added IP address
($lhost), i.e. for IPv4 the range is 2..254 for host id:

    local gw="$(tst_ipaddr_un 1 $(($1 % 253 + 2)))"

Either we could limit the value here or in the tst_ipaddr_un(). Looks like
route-change-if needs a similar fix for net id?


> +	local iface="$(tst_iface)"
> +
> +	tst_res TINFO "testing route over gateway '$gw'"
> +
> +	tst_add_ipaddr -s -a $gw rhost
> +	ROD ip route replace $rt dev $iface via $gw

May be it would be cleaner to use "add" instead of "replace" since we remove it
and it shouldn't exist before a test start.

> +	EXPECT_PASS ping$TST_IPV6 -c1 -I $lhost $rhost

It is better to redirect stdout to null:

EXPECT_PASS ping$TST_IPV6 -c1 -I $lhost $rhost \>/dev/null

The same for *-if and *-dst.

The rest in the patch-set looks good to me.

> +	ROD ip route del $rt dev $iface via $gw
> +	tst_del_ipaddr -s -a $gw rhost
> +}
> +
> +tst_run

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
