Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59827E5DD
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 12:00:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60E5E3C4C0F
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 12:00:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id BFBB63C2824
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 12:00:18 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C161200BCE
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 12:00:17 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08U9xxOr084554;
 Wed, 30 Sep 2020 10:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=+m72YGea024DevYEeATpbYlrLuhaeVUXdmryMEYfz4c=;
 b=pskYF8XCxFG2Sj43JgvQuid0Nlt1f7mA9EdVGrq5D+yrUgDcpPY8GLyLkdb1ys1E/DxU
 Cx6qMwVE3vwkVpEL9ednfSfoyEPO0VKuSBxLkuOA5HCzWGReIs1PUGKANlaDjlREyvrq
 /+BSanHhkXnuqrYWhCFH/QTflYzZ+s24cRzPTwbfAf9QtikZi1XWvT2BGC8bCY8ihmiQ
 ksfNar8D5a+mYNz0q7jDm2xPIB+R0mES1A5WR4oWzITS8BdlCW5hplO2nhY9Av3gpkDq
 keATx3c/rSEE4xMab3R/j36PZZyDILasL6K/gb6JtXxtljf8foHO3wFuUmdYmD6dADwt cA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 33su5ayq1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 10:00:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08U9tk9E035640;
 Wed, 30 Sep 2020 10:00:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 33tfjycvat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 10:00:14 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08UA0C7l017883;
 Wed, 30 Sep 2020 10:00:13 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 30 Sep 2020 03:00:12 -0700
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200930085851.21455-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <446ff67b-bf6f-8755-7c14-f9c0b6d9569f@oracle.com>
Date: Wed, 30 Sep 2020 13:00:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930085851.21455-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300078
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] virt_lib.sh: Remove checks for tst_ipaddr()
 output
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

On 30.09.2020 11:58, Petr Vorel wrote:
> + now unused $ip_local and $ip_remote variables.
> 
> These checks were originally (before f275363d7) in tests which use
> virt_compare_netperf also with variables.
> 
> It should be safe to expect tst_ipaddr() output to be safe even for SSH
> based setup ("two host" configuration) due various checks in tst_net.sh.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> This can wait after the release.
> 
>  testcases/network/virt/virt_lib.sh | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/testcases/network/virt/virt_lib.sh b/testcases/network/virt/virt_lib.sh
> index 827829633..cb2b2ba97 100644
> --- a/testcases/network/virt/virt_lib.sh
> +++ b/testcases/network/virt/virt_lib.sh
> @@ -61,11 +61,9 @@ virt_lib_setup()
>  TST_NEEDS_ROOT=1
>  . tst_net.sh
>  
> -ip_local=$(tst_ipaddr)
>  ip_virt_local="$(TST_IPV6= tst_ipaddr_un)"
>  ip6_virt_local="$(TST_IPV6=6 tst_ipaddr_un)"
>  
> -ip_remote=$(tst_ipaddr rhost)
>  ip_virt_remote="$(TST_IPV6= tst_ipaddr_un rhost)"
>  ip6_virt_remote="$(TST_IPV6=6 tst_ipaddr_un rhost)"
>  
> @@ -376,10 +374,6 @@ virt_gre_setup()
>  	[ "$TST_IPV6" ] && virt_type="ip6gre"
>  	virt_lib_setup
>  
> -	if [ -z $ip_local -o -z $ip_remote ]; then
> -		tst_brk TBROK "you must specify IP address"
> -	fi
> -

Petr,

There are other tests that have the same check, i.e. in vxlan03,
vxlan04, vlan03 and geneve01. Otherwise, looks good.


>  	tst_res TINFO "test $virt_type"
>  	virt_setup "local $(tst_ipaddr) remote $(tst_ipaddr rhost) dev $(tst_iface)" \
>  	"local $(tst_ipaddr rhost) remote $(tst_ipaddr) dev $(tst_iface rhost)"
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
