Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CDD126848
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 18:37:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 434023C23B4
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 18:37:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3BD053C1C90
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 18:37:51 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3415E1A00913
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 18:37:50 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBJGEOYk119737;
 Thu, 19 Dec 2019 17:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=6A/NyTrrH5ecGDlDRd7cNLMoxSq0a0+Cl1oipqz4Nm0=;
 b=jXSB8/KRQG8ia4oXxWRxJn2wCF9zw/D/LnrThQxot5oghO+VfyAWcC2qxAwh9ea2EpD5
 YSBohwJpDOX0sRKQOWlwKR0satPOO07sfOT189D/tT/nE/EM8N4KA96rRvtPx0Z9zEfd
 z4S0BFqag/yFe4CDC3o35GHT/O5UxgcSOMBFRtOgvpVDb4w3vGCVLvXSzF23tWftGvok
 obrxQcijjmNhe6UBKT8S8WnfMMBTNkDcSHP1d3YM4FdrPzhr+dw9DKHtrPK+gAvUx5Bf
 Sk7r+nbvdqS2ngDx6ifzlSIdLSzxBRixYPPoXA+dBX7su/pvxpuXJHP+e/97pIcRLLwh 9A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2x0ag11bq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 17:37:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBJGEQad192753;
 Thu, 19 Dec 2019 17:37:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2x0bgm6kf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Dec 2019 17:37:47 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBJHbgNL003284;
 Thu, 19 Dec 2019 17:37:45 GMT
Received: from [192.168.1.50] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Dec 2019 09:37:42 -0800
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20191219072638.31824-1-pvorel@suse.cz>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <0805dbe9-e769-1073-10e0-ca42c9d06052@oracle.com>
Date: Thu, 19 Dec 2019 20:37:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219072638.31824-1-pvorel@suse.cz>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9476
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912190135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9476
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912190135
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] iptables: Reduce code duplicity
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
On 19.12.2019 10:26, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Alexey,
> 
> feel free to not ack this as not needed syntax optimalization.
> This way the most of variables is set in the library,
> so people would hopefuly search for them there.
> 
> 0 is the default in [ "$foo" = 1 ], but maybe use_iptables=0 in
> nft01.sh is better for readability.
> 

Lgtm, except the removing of the variables, which were initializing
with 0 (including cleanup_ ones). I know, it's very unlikely, but what
if someone use the same name already elsewhere, then we get unexpected
results for the test:

# export use_iptables=1
# nft01.sh 
nft01 1 TINFO: timeout per run is 0h 5m 0s
nft01 1 TINFO: INIT: Flushing all rules
nft01 1 TINFO: iptables -L -t filter will list all rules in table filter
nft01 1 TINFO: iptables -L -t filter lists rules


> Kind regards,
> Petr
> 
>  testcases/network/iptables/iptables01.sh   |  5 -----
>  testcases/network/iptables/iptables_lib.sh | 10 ++++++++++
>  testcases/network/iptables/nft01.sh        |  6 ------
>  3 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/testcases/network/iptables/iptables01.sh b/testcases/network/iptables/iptables01.sh
> index e6ed4afab..b788b919a 100755
> --- a/testcases/network/iptables/iptables01.sh
> +++ b/testcases/network/iptables/iptables01.sh
> @@ -2,13 +2,8 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # Copyright (c) 2018-2019 Oracle and/or its affiliates. All Rights Reserved.
>  
> -TST_SETUP="init"
> -TST_CLEANUP="cleanup"
> -TST_NEEDS_CMDS="iptables grep ping telnet"
> -TST_NEEDS_DRIVERS="ip_tables"
>  use_iptables=1
>  
>  . iptables_lib.sh
> -. tst_test.sh
>  
>  tst_run
> diff --git a/testcases/network/iptables/iptables_lib.sh b/testcases/network/iptables/iptables_lib.sh
> index b098479e4..b029950f9 100755
> --- a/testcases/network/iptables/iptables_lib.sh
> +++ b/testcases/network/iptables/iptables_lib.sh
> @@ -10,13 +10,23 @@ TST_CNT=6
>  TST_TESTFUNC="test"
>  TST_NEEDS_TMPDIR=1
>  TST_NEEDS_ROOT=1
> +TST_SETUP="${TST_SETUP:-init}"
> +TST_CLEANUP="${TST_CLEANUP:-cleanup}"
>  
>  if [ "$use_iptables" = 1 ]; then
>  	toolname=iptables
> +	cmds="$toolname"
> +	TST_NEEDS_DRIVERS="ip_tables"
>  else
>  	toolname=nft
> +	cmds="$toolname iptables-translate"
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
> index 9bd10a7f5..7d3fc4e0d 100755
> --- a/testcases/network/iptables/nft01.sh
> +++ b/testcases/network/iptables/nft01.sh
> @@ -4,14 +4,8 @@
>  
>  TST_SETUP="do_setup"
>  TST_CLEANUP="do_cleanup"
> -TST_NEEDS_CMDS="nft iptables-translate grep ping telnet"
> -TST_NEEDS_DRIVERS="nf_tables"
> -use_iptables=0
> -cleanup_table=0
> -cleanup_chain=0
>  
>  . iptables_lib.sh
> -. tst_test.sh
>  
>  do_setup()
>  {
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
