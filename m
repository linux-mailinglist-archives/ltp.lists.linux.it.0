Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCEF1C729F
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 16:18:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAF913C57AA
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 16:18:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4AE443C260F
 for <ltp@lists.linux.it>; Wed,  6 May 2020 16:18:35 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 029B7140172B
 for <ltp@lists.linux.it>; Wed,  6 May 2020 16:18:33 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 046EDC91100155;
 Wed, 6 May 2020 14:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=O7RQHxuFf8POfzoQg57kFAV/Az5VWDx5s5+G+jlVDyY=;
 b=QioGpxThj690DzgSi03qrUFgNCi7Vq2L4tN8P4X/6ZBJkDz4JzyDeVSLuCHrQa0q09FR
 kJQ03Sy2R9vwNQfBzeKFiJFf5G5Xj67lsrX5TiQgRbGsqw/HCatfovCPNpAjJXF9URYM
 nnRQoBRiaaHFkMd5yWqBTUKUnRi8QJZFuVtgHrakZIuhBoKOXbkvI72y9kC9deuGG1cl
 m+n0Nuk72//mqM1sDcT2gD7VxzUs2eaemuGFz5ISnKICJe5m1mLPoTOO4DaX1KpVbyuP
 mx1/OTDCeUv+Tq0tHCVvSbNWx0u75PpAxGtrSz6bJxzdJBF53/FkXOREps/22Fudq2Ao xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 30usgq1q61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 14:18:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 046EGnDW054341;
 Wed, 6 May 2020 14:18:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 30sjdvm9xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 May 2020 14:18:30 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 046EIQou023171;
 Wed, 6 May 2020 14:18:26 GMT
Received: from [192.168.1.34] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 May 2020 07:18:25 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200429192340.14252-1-pvorel@suse.cz>
 <20200429192340.14252-4-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <c408ffc1-9ba6-ac01-0de9-1726ee72d4a4@oracle.com>
Date: Wed, 6 May 2020 17:18:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429192340.14252-4-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9612
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9612
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005060114
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/3] route: Increase default loop values
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

On 29.04.2020 22:23, Petr Vorel wrote:
> by introducing $ROUTE_CHANGE_IP for shell based tests (only these
> rewritten into new shell API) and $ROUTE_CHANGE_NETLINK with C Netlink
> API based tests.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh                               |  2 ++
>  testcases/network/stress/route/route-change-dst.sh     |  4 ++--
>  testcases/network/stress/route/route-change-gw.sh      | 10 ++++++++--
>  testcases/network/stress/route/route-change-if.sh      | 10 ++++++++--
>  .../network/stress/route/route-change-netlink-dst.sh   |  2 +-
>  .../network/stress/route/route-change-netlink-gw.sh    |  2 ++
>  .../network/stress/route/route-change-netlink-if.sh    |  1 +
>  testcases/network/stress/route/route-lib.sh            |  8 ++------
>  8 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 1ec03c738..011b62267 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -913,6 +913,8 @@ export UPLOAD_BIGFILESIZE="${UPLOAD_BIGFILESIZE:-2147483647}"
>  export UPLOAD_REGFILESIZE="${UPLOAD_REGFILESIZE:-1024}"
>  export MCASTNUM_NORMAL="${MCASTNUM_NORMAL:-20}"
>  export MCASTNUM_HEAVY="${MCASTNUM_HEAVY:-4000}"
> +export ROUTE_CHANGE_IP="${ROUTE_CHANGE_IP:-100}"
> +export ROUTE_CHANGE_NETLINK="${ROUTE_CHANGE_NETLINK:-10000}"

Hi Petr,

The changes are fine.

Perhaps for further improvements, ROUTE_CHANGE_NETLINK is limited by
"NUM_LOOPS_MAX 65535", it looks unnecessary. Can we limit the setup
only and iterate (adding and deleting) from the beginning or use -i
option with -c?

>  
>  # Warning: make sure to set valid interface names and IP addresses below.
>  # Set names for test interfaces, e.g. "eth0 eth1"
> diff --git a/testcases/network/stress/route/route-change-dst.sh b/testcases/network/stress/route/route-change-dst.sh
> index dcd2898a8..2d88b5f73 100755
> --- a/testcases/network/stress/route/route-change-dst.sh
> +++ b/testcases/network/stress/route/route-change-dst.sh
> @@ -12,11 +12,11 @@ TST_SETUP="setup"
>  TST_CLEANUP="route_cleanup"
>  TST_TESTFUNC="test_dst"
>  . route-lib.sh
> -TST_CNT=$NS_TIMES
> +TST_CNT=$ROUTE_CHANGE_IP
>  
>  setup()
>  {
> -	tst_res TINFO "change IPv$TST_IPVER route destination $NS_TIMES times"
> +	tst_res TINFO "change IPv$TST_IPVER route destination $ROUTE_CHANGE_IP times"
>  }
>  
>  test_dst()
> diff --git a/testcases/network/stress/route/route-change-gw.sh b/testcases/network/stress/route/route-change-gw.sh
> index cfbc331ac..6c650befd 100755
> --- a/testcases/network/stress/route/route-change-gw.sh
> +++ b/testcases/network/stress/route/route-change-gw.sh
> @@ -8,11 +8,17 @@
>  # Change route gateway
>  # lhost: 10.23.1.1, gw (on rhost): 10.23.1.x, rhost: 10.23.0.1
>  
> -TST_SETUP="setup_gw"
> +TST_SETUP="setup"
>  TST_CLEANUP="route_cleanup"
>  TST_TESTFUNC="test_gw"
>  . route-lib.sh
> -TST_CNT=$NS_TIMES
> +TST_CNT=$ROUTE_CHANGE_IP
> +
> +setup()
> +{
> +	tst_res TINFO "change IPv$TST_IPVER route gateway $ROUTE_CHANGE_IP times"
> +	setup_gw
> +}
>  
>  test_gw()
>  {
> diff --git a/testcases/network/stress/route/route-change-if.sh b/testcases/network/stress/route/route-change-if.sh
> index a32f5f3d9..7e9c15fe4 100755
> --- a/testcases/network/stress/route/route-change-if.sh
> +++ b/testcases/network/stress/route/route-change-if.sh
> @@ -8,11 +8,17 @@
>  # Change route interface
>  # lhost: 10.23.x.2, gw (on rhost): 10.23.x.1, rhost: 10.23.0.1, switching ifaces on lhost
>  
> -TST_SETUP="setup_if"
> +TST_SETUP="setup"
>  TST_CLEANUP="cleanup_if"
>  TST_TESTFUNC="test_if"
>  . route-lib.sh
> -TST_CNT=$NS_TIMES
> +TST_CNT=$ROUTE_CHANGE_IP
> +
> +setup()
> +{
> +	tst_res TINFO "change IPv$TST_IPVER route interface $ROUTE_CHANGE_IP times"
> +	setup_if
> +}
>  
>  test_if()
>  {
> diff --git a/testcases/network/stress/route/route-change-netlink-dst.sh b/testcases/network/stress/route/route-change-netlink-dst.sh
> index de558949d..0740d0963 100755
> --- a/testcases/network/stress/route/route-change-netlink-dst.sh
> +++ b/testcases/network/stress/route/route-change-netlink-dst.sh
> @@ -13,7 +13,7 @@ TST_TESTFUNC="test_netlink"
>  
>  setup()
>  {
> -	tst_res TINFO "change IPv$TST_IPVER route destination $NS_TIMES times"
> +	tst_res TINFO "change IPv$TST_IPVER route destination $ROUTE_CHANGE_NETLINK times"
>  
>  	local cnt=0
>  	local gw rhost rhost_all rt
> diff --git a/testcases/network/stress/route/route-change-netlink-gw.sh b/testcases/network/stress/route/route-change-netlink-gw.sh
> index 46e544ef0..3119a1b31 100755
> --- a/testcases/network/stress/route/route-change-netlink-gw.sh
> +++ b/testcases/network/stress/route/route-change-netlink-gw.sh
> @@ -15,6 +15,8 @@ setup()
>  {
>  	local cnt=0
>  
> +	tst_res TINFO "change IPv$TST_IPVER route gateway $ROUTE_CHANGE_NETLINK times"
> +
>  	check_max_ip
>  	setup_gw
>  
> diff --git a/testcases/network/stress/route/route-change-netlink-if.sh b/testcases/network/stress/route/route-change-netlink-if.sh
> index ad4e3712c..d1e64a40e 100755
> --- a/testcases/network/stress/route/route-change-netlink-if.sh
> +++ b/testcases/network/stress/route/route-change-netlink-if.sh
> @@ -16,6 +16,7 @@ setup()
>  	local gw gw_all iface iface_all
>  	local cnt=0
>  
> +	tst_res TINFO "change IPv$TST_IPVER route interface $ROUTE_CHANGE_NETLINK times"
>  	setup_if
>  
>  	while [ $cnt -lt $(tst_get_ifaces_cnt) ]; do
> diff --git a/testcases/network/stress/route/route-lib.sh b/testcases/network/stress/route/route-lib.sh
> index 51803056a..a5bb96c12 100644
> --- a/testcases/network/stress/route/route-lib.sh
> +++ b/testcases/network/stress/route/route-lib.sh
> @@ -45,7 +45,7 @@ check_max_ip()
>  
>  	tst_is_int "$ROUTE_MAX_IP" || tst_brk TBROK "\$ROUTE_MAX_IP not int ($ROUTE_MAX_IP)"
>  	[ $ROUTE_MAX_IP -gt $max_ip_limit ] && ROUTE_MAX_IP=$max_ip_limit
> -	[ $ROUTE_MAX_IP -gt $NS_TIMES ] && ROUTE_MAX_IP=$NS_TIMES
> +	[ $ROUTE_MAX_IP -gt $ROUTE_CHANGE_NETLINK ] && ROUTE_MAX_IP=$ROUTE_CHANGE_NETLINK
>  }
>  
>  cleanup_if()
> @@ -63,8 +63,6 @@ route_cleanup()
>  
>  setup_gw()
>  {
> -	tst_res TINFO "change IPv$TST_IPVER route gateway $NS_TIMES times"
> -
>  	rt="$(tst_ipaddr_un -p 0 0)"
>  	lhost="$(tst_ipaddr_un 1 1)"
>  	rhost="$(tst_ipaddr_un 0 1)"
> @@ -74,8 +72,6 @@ setup_gw()
>  
>  setup_if()
>  {
> -	tst_res TINFO "change IPv$TST_IPVER route interface $NS_TIMES times"
> -
>  	rt="$(tst_ipaddr_un -p 0)"
>  	rhost="$(tst_ipaddr_un 0 1)"
>  	tst_add_ipaddr -s -q -a $rhost rhost
> @@ -99,7 +95,7 @@ test_netlink()
>  	local cmd ip_flag
>  	[ "$TST_IPV6" ] && ip_flag="-6"
>  
> -	cmd="route-change-netlink -c $NS_TIMES $ip_flag -p $ROUTE_RHOST_PORT $ROUTE_CHANGE_NETLINK_PARAMS"
> +	cmd="route-change-netlink -c $ROUTE_CHANGE_NETLINK $ip_flag -p $ROUTE_RHOST_PORT $ROUTE_CHANGE_NETLINK_PARAMS"
>  	tst_res TINFO "running $cmd"
>  	$cmd || ret=$?
>  	if [ "$ret" -ne 0 ]; then
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
