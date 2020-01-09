Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC21356AC
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:17:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F9B03C24FC
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:17:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 04AE53C23C8
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:17:12 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2B695140200A
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:17:12 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 009ADilr082322;
 Thu, 9 Jan 2020 10:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=vqWSKIWLyGf9SjLKq0b+fYYjOYvME5aXsM1sqTqcnbI=;
 b=qvRvFpOD9nQ+Aqc/VYocG44cSRYpVDL6poSBkpOwbuuzeKUbQmYOLa3bQ2I08TZ2OHBB
 /RuvOBLfhzXE1OjdnpDlzhrBbxNpLii/r7Hc8gcMvtH68oLJzXJsFR9SMpcoD7EFwK2e
 4hizUL+g1LfJu1YzsBAIXS6GKasWL4FvMSzDZtIrmlZpVfv+wu/RCeaZ6GZ/pmKh12OK
 jkcsItW7/MedWKvxbUEw43B8lBVttnnuU5quceH4m4PhD+plzL2Mj8tplD7+zpKGZ7pe
 ESP10rOK4UcdBvhfklRDTZ4jGjU6u4BQB5c4C0IRTMdzcvclpunRANHBg2filA/WHiV7 og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2xajnq9ts3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 10:17:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 009AEKpV038673;
 Thu, 9 Jan 2020 10:17:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2xdsa3xr2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 10:17:08 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 009AH5vo022169;
 Thu, 9 Jan 2020 10:17:07 GMT
Received: from [192.168.1.52] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 Jan 2020 02:17:04 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191226135801.11839-1-alexey.kodanev@oracle.com>
 <20200103124851.GA24603@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <f65c32e4-e426-e6c9-5627-51bed11c31e6@oracle.com>
Date: Thu, 9 Jan 2020 13:17:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103124851.GA24603@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9494
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001090090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9494
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001090090
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/iptables: add ipv6 support
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
On 03.01.2020 15:48, Petr Vorel wrote:
> Hi Alexey,
> 
>> New tests: ip6tables, nft6.
> great idea, just there is a regression in nft01.sh, see below.
> 
>> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
>> --- a/testcases/network/iptables/iptables_lib.sh
> ...
>>  init()
>>  {
>> +	if [ "$use_iptables" = 1 ]; then
>> +		toolname=ip${TST_IPV6}tables
>> +		cmds="$toolname"
>> +		tst_require_drivers ip${TST_IPV6}_tables
>> +	else
>> +		toolname=nft
>> +		cmds="$toolname ip${TST_IPV6}tables-translate"
>> +	fi
>> +
>> +	if [ "$TST_IPV6" ];then
>> +		loc_addr="::1"
>> +		proto="icmpv6"
>> +	else
>> +		loc_addr="127.0.0.1"
>> +		proto="icmp"
>> +	fi
>> +
>> +	ping_cmd="ping$TST_IPV6"
>> +	tst_require_cmds $cmds $ping_cmd
> 
> change to tst_require_cmds() does not catch missing nft:
> 
> nft check broke, original:
> nft01 1 TCONF: 'nft' not found
> 
> now:
> /bin/sh: 1: nft: not found
> nft01 1 TBROK: nft add table ip filter failed

Good catch, what about starting with init() in do_setup()?

diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
index 1ae086678..bf2a53c28 100755
--- a/testcases/network/iptables/nft01.sh
+++ b/testcases/network/iptables/nft01.sh
@@ -13,6 +13,7 @@ cleanup_chain=0
 
 do_setup()
 {
+       init
        local ip_table="ip${TST_IPV6}"
 
        if ! nft list table $ip_table filter > /dev/null 2>&1; then
@@ -23,7 +24,6 @@ do_setup()
                ROD nft add chain $ip_table filter INPUT '{ type filter hook input priority 0; }'
                cleanup_chain=1
        fi
-       init
 }


> 
> one of these fixes it (take whatever you like. Both variants check nft twice,
> I'd ignore it).
> 
> * use TST_NEEDS_CMDS
> diff --git testcases/network/iptables/iptables_lib.sh testcases/network/iptables/iptables_lib.sh
> index ad2a894b6..8d220bc0e 100755
> --- testcases/network/iptables/iptables_lib.sh
> +++ testcases/network/iptables/iptables_lib.sh
> @@ -12,7 +12,7 @@ TST_NEEDS_TMPDIR=1
>  TST_NEEDS_ROOT=1
>  TST_SETUP="${TST_SETUP:-init}"
>  TST_CLEANUP="${TST_CLEANUP:-cleanup}"
> -TST_NEEDS_CMDS="grep telnet"
> +TST_NEEDS_CMDS="$TST_NEEDS_CMDS grep telnet"
>  
>  . tst_net.sh
>  
> diff --git testcases/network/iptables/nft01.sh testcases/network/iptables/nft01.sh
> index 1ae086678..225f59bc5 100755
> --- testcases/network/iptables/nft01.sh
> +++ testcases/network/iptables/nft01.sh
> @@ -5,6 +5,7 @@
>  TST_SETUP="do_setup"
>  TST_CLEANUP="do_cleanup"
>  TST_NEEDS_DRIVERS="nf_tables"
> +TST_NEEDS_CMDS="nft"
>  use_iptables=0
>  cleanup_table=0
>  cleanup_chain=0
> 
> * use tst_require_cmds
> diff --git testcases/network/iptables/nft01.sh testcases/network/iptables/nft01.sh
> index 1ae086678..e5799b918 100755
> --- testcases/network/iptables/nft01.sh
> +++ testcases/network/iptables/nft01.sh
> @@ -15,6 +15,7 @@ do_setup()
>  {
>  	local ip_table="ip${TST_IPV6}"
>  
> +	tst_require_cmds nft
>  	if ! nft list table $ip_table filter > /dev/null 2>&1; then
>  		ROD nft add table $ip_table filter
>  		cleanup_table=1
> 
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
