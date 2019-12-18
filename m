Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4AF124C22
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 16:49:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E848A3C243C
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 16:49:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 46F4A3C133E
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 16:49:20 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 49E2C1A016D5
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 16:49:19 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIFmvuP122357;
 Wed, 18 Dec 2019 15:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=lI29G1opMewQmmAhP+RZxfC0cxTZuZQnR0n+zI5llKU=;
 b=Ufpxiqe0ZnjHgu3r9yZUvo8bZVirZe+d16f27/DG9YwJZNRzEX2W0RolD8MzBH1yqpzN
 u8TuGoJNia0SRhuq3o3tS5SHwPA6D9AqbDqx6I6HaUgvMo0zRvi9jumb5LwApVMlwScs
 uLRVKezkgM7UF0UWbdbGelfbnq5P7lDU4OGU6VoZ1zbXlJfUr9HnL3dUESTSKOvXhxcW
 gEM2a3qeiQ1MQweLgzC1+858XDGyV2ZCcKzGduI/LkxEud3lt/VMWDxu92keRNN7WQ05
 YZENoc/pSb4kid4UlawBzkY9O5KUXCpgC6VULYWbDrxFjLVOcEJjUFAZluDjK79yeC0p 0A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2wvrcrec9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 15:49:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIFn3Lj130858;
 Wed, 18 Dec 2019 15:49:16 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2wyedp7n6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 15:49:16 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBIFnFXx024127;
 Wed, 18 Dec 2019 15:49:15 GMT
Received: from ak.ru.oracle.com (/10.162.80.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Dec 2019 07:49:15 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191217171918.10237-1-alexey.kodanev@oracle.com>
 <20191217171918.10237-2-alexey.kodanev@oracle.com>
 <20191218084406.GA10966@dell5510>
 <f0aad696-82a5-fb06-0517-a437d95ae2e7@oracle.com>
 <20191218152832.GA26689@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <853a8441-efc3-03e2-4889-1421cbe976b5@oracle.com>
Date: Wed, 18 Dec 2019 18:53:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218152832.GA26689@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912180130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912180130
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] network/iptables: add new test for
 iptables-tranlsate and nft
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

Hi Petr,
On 18.12.2019 18:28, Petr Vorel wrote:
> Hi Alexey,
> 
>> Thanks Petr! Fixed them and applied the patches.
> Thanks for your work.
> 
> BTW even more setup could be moved into iptables_lib.sh.
> If you like this change, I can push it.

No objections. I thought it is better to keep these TST_*
variables per test, in the header, rather than searching
in the lib... but looks like it might save some duplication.

> 
> Kind regards,
> Petr
> 
>  testcases/network/iptables/iptables01.sh   | 3 ---
>  testcases/network/iptables/iptables_lib.sh | 8 ++++++++
>  testcases/network/iptables/nft01.sh        | 3 ---
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/testcases/network/iptables/iptables01.sh b/testcases/network/iptables/iptables01.sh
> index e6ed4afab..96d68e62e 100755
> --- a/testcases/network/iptables/iptables01.sh
> +++ b/testcases/network/iptables/iptables01.sh
> @@ -4,11 +4,8 @@
>  
>  TST_SETUP="init"
>  TST_CLEANUP="cleanup"
> -TST_NEEDS_CMDS="iptables grep ping telnet"
> -TST_NEEDS_DRIVERS="ip_tables"
>  use_iptables=1
>  
>  . iptables_lib.sh
> -. tst_test.sh
>  
>  tst_run
> diff --git a/testcases/network/iptables/iptables_lib.sh b/testcases/network/iptables/iptables_lib.sh
> index b098479e4..87f33dfca 100755
> --- a/testcases/network/iptables/iptables_lib.sh
> +++ b/testcases/network/iptables/iptables_lib.sh
> @@ -12,11 +12,19 @@ TST_NEEDS_TMPDIR=1
>  TST_NEEDS_ROOT=1
>  
>  if [ "$use_iptables" = 1 ]; then
> +	cmds="iptables"
>  	toolname=iptables
> +	TST_NEEDS_DRIVERS="ip_tables"
>  else
> +	cmds="nft iptables-translate"
>  	toolname=nft
> +	TST_NEEDS_DRIVERS="nf_tables"
>  fi
>  
> +TST_NEEDS_CMDS="$cmds grep ping telnet"
> +
> +. tst_test.sh
> +
>  NFRUN()
>  {
>  	local rule
> diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
> index 9bd10a7f5..6cbd7a3a6 100755
> --- a/testcases/network/iptables/nft01.sh
> +++ b/testcases/network/iptables/nft01.sh
> @@ -4,14 +4,11 @@
>  
>  TST_SETUP="do_setup"
>  TST_CLEANUP="do_cleanup"
> -TST_NEEDS_CMDS="nft iptables-translate grep ping telnet"
> -TST_NEEDS_DRIVERS="nf_tables"
>  use_iptables=0
>  cleanup_table=0
>  cleanup_chain=0
>  
>  . iptables_lib.sh
> -. tst_test.sh
>  
>  do_setup()
>  {
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
