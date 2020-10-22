Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3214229606D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 15:52:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C244C3C3193
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 15:52:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id DE3FA3C263E
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 15:52:46 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 184461401202
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 15:52:45 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09MDilpN042768;
 Thu, 22 Oct 2020 13:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=rkJIoGkqtVTi3MPf0+mpD0s5Ksd1t8eOP+ZIL8ydRIs=;
 b=Z4JnLhAV0vaDJhDuLrpbsJaVsKm6+0nEZwcGCZKpG63nzpjv8ddUsc6TXNcK93x9ViFs
 WfqyKcx6wue0C3aSlMysvdVHGy9apHrgWj90PQ6i8lqOjOQRn8SKlLqExOO07YB13Hmu
 W3sm08Pzs4o20DugApdJMOccnkwG+SRc4q+t3JkGI0bDM+JTgzSrBDSZrLNMj5C64Y7C
 nS1zRvPQ7R7LJnrE4zEkINqbYrx2ajrhA3sKTrwSLHgvtQGBtk5mkOpVmef4DgwBK/n3
 oz71B+MVL0yFaN0nBCmfk4ijiSOwnnIG5yJRhzQ/ltI4fA1TkWi5x61aV2n1zRdjFfI7 nQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 349jrpx4r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 22 Oct 2020 13:52:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09MDo13O013643;
 Thu, 22 Oct 2020 13:52:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 34ak19vpq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Oct 2020 13:52:27 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09MDqKHG029212;
 Thu, 22 Oct 2020 13:52:25 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Oct 2020 06:52:20 -0700
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, ltp@lists.linux.it
References: <1603361548-1534-1-git-send-email-zhufy.jy@cn.fujitsu.com>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <e0bdc892-6ade-f694-7c14-ca7ef7cb052f@oracle.com>
Date: Thu, 22 Oct 2020 16:52:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1603361548-1534-1-git-send-email-zhufy.jy@cn.fujitsu.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220094
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] route{4,6}-rmmod: Filter out ":" and fix typos
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

On 22.10.2020 13:12, Feiyu Zhu wrote:
> Reported-by: Jin Cao <caoj.fnst@cn.fujitsu.com>
> Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
> ---
>  testcases/network/stress/route/route4-rmmod | 4 ++--
>  testcases/network/stress/route/route6-rmmod | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/network/stress/route/route4-rmmod b/testcases/network/stress/route/route4-rmmod
> index 7aa1958..1ba255e 100644
> --- a/testcases/network/stress/route/route4-rmmod
> +++ b/testcases/network/stress/route/route4-rmmod
> @@ -164,14 +164,14 @@ do_setup()
>      lhost_module=`ethtool -i $lhost_ifname | grep driver | sed "s/driver:[[:blank:]]*//"`
>  
>      # Chack the other active interface uses the same driver
> -    for ifname in `ifconfig | grep ^eth | awk '{ print $1}'`; do
> +    for ifname in `ifconfig | grep ^eth | awk '{print $1}' | sed "s/://"`; do

Thanks for fixing it, but it is not enough here. This command is wrong,
not only does it use obsolete tool, but also assumes that interface
names start with 'eth'. So it skips the check for active connections
that already in use with the driver (it is going to remove) for all
modern systems.

I think we should at least remove this test from the runtest file
until the proper fix. Also this test and route4{6}-redirect are
really need to be rewritten with new test API, please have a look
at route-change-*.sh.


>  	if [ $lhost_ifname = $ifname ]; then
>  	    continue
>  	fi
>  
>  	module=`ethtool -i $ifname | grep driver | sed "s/driver:[[:blank:]]*//"`
>  	if [ $lhost_module = $module ]; then
> -	    tst_resm TBROK "An active interface $ifname uses the same network deriver $module with the test intreface."
> +	    tst_resm TBROK "An active interface $ifname uses the same network driver $module with the test interface."
>  	    exit $TST_TOTAL
>  	fi
>      done
> diff --git a/testcases/network/stress/route/route6-rmmod b/testcases/network/stress/route/route6-rmmod
> index 765a57a..146fa77 100644
> --- a/testcases/network/stress/route/route6-rmmod
> +++ b/testcases/network/stress/route/route6-rmmod
> @@ -160,14 +160,14 @@ do_setup()
>      lhost_module=`ethtool -i $lhost_ifname | grep driver | sed "s/driver:[[:blank:]]*//"`
>  
>      # Chack the other active interface uses the same driver
> -    for ifname in `ifconfig | grep ^eth | awk '{ print $1}'`; do
> +    for ifname in `ifconfig | grep ^eth | awk '{print $1}' | sed "s/://"`; do
>  	if [ $lhost_ifname = $ifname ]; then
>  	    continue
>  	fi
>  
>  	module=`ethtool -i $ifname | grep driver | sed "s/driver:[[:blank:]]*//"`
>  	if [ $lhost_module = $module ]; then
> -	    tst_resm TBROK "An active interface $ifname uses the same network deriver $module with the test intreface."
> +	    tst_resm TBROK "An active interface $ifname uses the same network driver $module with the test interface."
>  	    exit $TST_TOTAL
>  	fi
>      done
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
