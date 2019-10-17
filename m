Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C11DAB6D
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 13:47:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF8ED3C233E
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 13:47:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5829C3C2292
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 13:47:11 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 619746011A5
 for <ltp@lists.linux.it>; Thu, 17 Oct 2019 13:47:10 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9HBiOmT188376;
 Thu, 17 Oct 2019 11:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=PjCqQQUkq/rL47kw62S/qBHLbwBIt4wHaAGUJdoTJm8=;
 b=G+sFycxzxzt6PV042Ac0tihWyxIEzIhA4Gt1iFPFJMEfxQJeJxZRNn2vwyJu1a5xAl4p
 SxqSN/7TKDb87LfMNBHLn75t9RgslYUafDII8PmzvK0XcwoBOrcwxtH/exC4u9bQNXMQ
 6h8Si10/udJkhuNpWKT7HDbKmT3ZiEduobDgZHINLTCO40TzAkZD3pyR2St+jfAbm4BB
 MmtyeW8kTDQ1OycYIaywicRj/iCyzcAROzbZsqzMKvt1VXP0vhkM8x74MldmlFzaxeqS
 pmL2NHd1fykLZ/S3gq0UZj0jDZJWVBsLXvh/7OWztyOmS+g/3iPUs2z3nDJoBT+Mwmem 3w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2vk6sqwsfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Oct 2019 11:47:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9HBiFFK082829;
 Thu, 17 Oct 2019 11:47:06 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2vp3bkjfgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Oct 2019 11:47:05 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9HBl0EZ015315;
 Thu, 17 Oct 2019 11:47:00 GMT
Received: from [192.168.1.111] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Oct 2019 11:46:59 +0000
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20191011132433.24197-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <f5b4a42f-fb20-e085-1250-c0e2b171c01f@oracle.com>
Date: Thu, 17 Oct 2019 14:46:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011132433.24197-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9412
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910170108
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9412
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910170109
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/8] net/route: rewrite route-change-{dst, gw,
 if} into new API
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

On 11.10.2019 16:24, Petr Vorel wrote:
> Hi,
> 
> changes v4->v5:
> addressed these Alexey's requests:
> * tst_ipadd_un() now handles both host_id and net_id, with
> -h MIN,MAX, -n MIN,MAX
> (instead of -b, -f, -n which handled only host_id)
> 
> * add -q to tst_add_ipaddr() (silence test output)
> 
> * introduce EXPECT_{FAIL,PASS}_BRK() to shell API and use it to stop
> test on first error.

The patches look great, thanks Petr!

> 
> @Cyril the only commit for you: "shell: Introduce EXPECT_{FAIL,PASS}_BRK()"
> 
> Kind regards,
> Petr
> 
> Petr Vorel (8):
>   tst_net.sh: enhance tst_add_ipaddr(), add tst_del_ipaddr()
>   tst_net.sh: Add -p option to return prefix in tst_ipaddr_un()
>   tst_net.sh: Add -h -n options to tst_ipaddr_un()
>   net: Add tst_ipaddr_un.sh test
>   shell: Introduce EXPECT_{FAIL,PASS}_BRK()
>   network/route: Rewrite route{4,6}-change-dst into new shell API
>   network/route: Rewrite route{4,6}-change-gw into new shell API
>   network/route: Rewrite route{4,6}-change-if into new API
> 
>  doc/test-writing-guidelines.txt               |   5 +-
>  lib/newlib_tests/shell/net/tst_ipaddr_un.sh   | 167 +++++++++
>  runtest/net_stress.route                      |  15 +-
>  testcases/lib/tst_net.sh                      | 173 +++++++---
>  testcases/lib/tst_test.sh                     |  34 +-
>  .../network/stress/route/00_Descriptions.txt  |  54 +--
>  .../network/stress/route/route-change-dst.sh  |  34 ++
>  .../network/stress/route/route-change-gw.sh   |  39 +++
>  .../network/stress/route/route-change-if.sh   |  90 +++++
>  testcases/network/stress/route/route-lib.sh   |  17 +
>  .../network/stress/route/route4-change-dst    | 276 ---------------
>  .../network/stress/route/route4-change-gw     | 292 ----------------
>  .../network/stress/route/route4-change-if     | 324 ------------------
>  .../network/stress/route/route6-change-dst    | 272 ---------------
>  .../network/stress/route/route6-change-gw     | 292 ----------------
>  .../network/stress/route/route6-change-if     | 323 -----------------
>  16 files changed, 528 insertions(+), 1879 deletions(-)
>  create mode 100755 lib/newlib_tests/shell/net/tst_ipaddr_un.sh
>  create mode 100755 testcases/network/stress/route/route-change-dst.sh
>  create mode 100755 testcases/network/stress/route/route-change-gw.sh
>  create mode 100755 testcases/network/stress/route/route-change-if.sh
>  create mode 100644 testcases/network/stress/route/route-lib.sh
>  delete mode 100644 testcases/network/stress/route/route4-change-dst
>  delete mode 100644 testcases/network/stress/route/route4-change-gw
>  delete mode 100644 testcases/network/stress/route/route4-change-if
>  delete mode 100644 testcases/network/stress/route/route6-change-dst
>  delete mode 100644 testcases/network/stress/route/route6-change-gw
>  delete mode 100644 testcases/network/stress/route/route6-change-if
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
