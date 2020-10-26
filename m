Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D462299121
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 16:35:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F027C3C5618
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 16:35:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A687E3C093E
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:35:53 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7B0261A009A2
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:35:52 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09QFJBoD045389;
 Mon, 26 Oct 2020 15:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=5vmcb0u/eDPqDAySuJtQ+FqFrxFZ2HNvCjrcKWIHwbI=;
 b=Y2zXNzOfydW9WLFc3oV1hsQhj+i+XO2xtShrJja57FngnuSbtI8C9+OkN07n7I/ipJpB
 bTwmKk9wTmDxaFUA9OGDBeOtxwsE4TdCyFzLN3dwDszIUaokDelTP9t85IHPHlqroZzj
 35faEokJvoTFoLNgeKCanjvTNBcXeIxoSlwuXImD9FaAAmgNU/WNj+1A49EN99NSIriA
 Y9Rs6Gv2ndFhmyTAnG/JBu9JKweFVviEKZvQKeQF4pyPuO0zzi7w5n2sz2rzBYbAHAIN
 f739SIMtmnqLQf6JXTJQVKdI/Uls6WNopdxpSJodYeFoEMmTqbZNBJVG3M5zAD54unQJ Ww== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34cc7kn9u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Oct 2020 15:35:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09QFKFWN124015;
 Mon, 26 Oct 2020 15:35:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 34cx5w33gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 15:35:36 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09QFZYge005640;
 Mon, 26 Oct 2020 15:35:34 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Oct 2020 08:35:34 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20201026070006.25298-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <006134e8-4e18-b4d5-e8a5-c24aa39cd9a1@oracle.com>
Date: Mon, 26 Oct 2020 18:35:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026070006.25298-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260108
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net: Remove legacy tests from runtest
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

On 26.10.2020 10:00, Petr Vorel wrote:
> Remove all network stress tests which haven't been rewritten to the new
> API yet from the runtest file (mostly multicast tests + some route tests).
> These tests use check_envval and other deprecated tools.
> 
> See also:
> https://urldefense.com/v3/__https://github.com/linux-test-project/ltp/issues/310__;!!GqivPVa7Brio!MvVbMbVUxZVNN5X25o3dg_mCzHyf7VivMPlPoQu9cDCSBdlu03MeKdnTdBUphVfiS-QT$ 
> https://urldefense.com/v3/__https://github.com/linux-test-project/ltp/issues/440__;!!GqivPVa7Brio!MvVbMbVUxZVNN5X25o3dg_mCzHyf7VivMPlPoQu9cDCSBdlu03MeKdnTdBUpheD5F6hF$ 
> 
> Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  runtest/net_stress.multicast | 16 ----------------
>  runtest/net_stress.route     |  4 ----
>  2 files changed, 20 deletions(-)
> 
> diff --git a/runtest/net_stress.multicast b/runtest/net_stress.multicast
> index d2288df62..463fe17ab 100644
> --- a/runtest/net_stress.multicast
> +++ b/runtest/net_stress.multicast
> @@ -6,24 +6,8 @@ mcast4-group-single-socket mcast-group-single-socket
>  mcast4-group-multiple-socket mcast-group-multiple-socket
>  mcast4-group-same-group mcast-group-same-group
>  mcast4-group-source-filter mcast-group-source-filter
> -mcast4-pktfld01 mcast4-pktfld01
> -mcast4-pktfld02 mcast4-pktfld02
> -mcast4-queryfld01 mcast4-queryfld01
> -mcast4-queryfld02 mcast4-queryfld02
> -mcast4-queryfld03 mcast4-queryfld03
> -mcast4-queryfld04 mcast4-queryfld04
> -mcast4-queryfld05 mcast4-queryfld05
> -mcast4-queryfld06 mcast4-queryfld06
>  
>  mcast6-group-single-socket mcast-group-single-socket -6
>  mcast6-group-multiple-socket mcast-group-multiple-socket -6
>  mcast6-group-same-group mcast-group-same-group -6
>  mcast6-group-source-filter mcast-group-source-filter -6
> -mcast6-pktfld01 mcast6-pktfld01
> -mcast6-pktfld02 mcast6-pktfld02
> -mcast6-queryfld01 mcast6-queryfld01
> -mcast6-queryfld02 mcast6-queryfld02
> -mcast6-queryfld03 mcast6-queryfld03
> -mcast6-queryfld04 mcast6-queryfld04
> -mcast6-queryfld05 mcast6-queryfld05
> -mcast6-queryfld06 mcast6-queryfld06
> diff --git a/runtest/net_stress.route b/runtest/net_stress.route
> index 8755ef0be..b60e55bd6 100644
> --- a/runtest/net_stress.route
> +++ b/runtest/net_stress.route
> @@ -5,8 +5,6 @@ route4-change-if route-change-if.sh
>  route4-change-netlink-dst route-change-netlink-dst.sh
>  route4-change-netlink-gw route-change-netlink-gw.sh
>  route4-change-netlink-if route-change-netlink-if.sh
> -route4-redirect route4-redirect
> -route4-rmmod route4-rmmod
>  
>  route6-change-dst route-change-dst.sh -6
>  route6-change-gw route-change-gw.sh -6
> @@ -14,5 +12,3 @@ route6-change-if route-change-if.sh -6
>  route6-change-netlink-dst route-change-netlink-dst.sh -6
>  route6-change-netlink-gw route-change-netlink-gw.sh -6
>  route6-change-netlink-if route-change-netlink-if.sh -6
> -route6-redirect route6-redirect
> -route6-rmmod route6-rmmod
> 

Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
