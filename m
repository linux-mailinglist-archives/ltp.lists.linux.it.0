Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D75FB135B31
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 15:16:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7322C3C26B3
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 15:16:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 170003C26A9
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 15:16:25 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F1E46201085
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 15:16:24 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 009EDRnb091855;
 Thu, 9 Jan 2020 14:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=txmZqA+5+N03nCs0DYaCsBwhS7qejz8uQVNYhuCvsAM=;
 b=blOoEskexwYIlpJvYS47YocClFHOzwCEqtv/YpEJEbRRDDP4eCjKpRiZIhBJbwzzUcMO
 gbQgeiXMTutSzeriiFQSyeO7OHKmoub7pR/pyZXbJ8tUmLkQhKh/CnwI3sM0C/RYFoJR
 VRYn1vzz8fVvfIX9BgZ6Jrjm7EQ7C1ioan+VWD1/1Y1KIXIvzeTjYUNsZN8tDfIv4yNf
 9/vHztSZkZqHEaB1AoD5IzewAoxWuLQ63Sr4UKNMa/jyBwgd0QjlNPwtPdySDKskRRkj
 rVQBYiLE/8s7QHldRAaaCSgXLu8tUE17jODwwGlwnIhG36AxLpXx+myZmYFCFvccr/UQ Tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2xakbr2xtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 14:16:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 009EERX8095919;
 Thu, 9 Jan 2020 14:16:22 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2xdj4qsmph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 14:16:22 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 009EGLJS011841;
 Thu, 9 Jan 2020 14:16:21 GMT
Received: from [192.168.1.52] (/95.161.223.113)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 09 Jan 2020 06:16:21 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20191226135801.11839-1-alexey.kodanev@oracle.com>
 <20200103124851.GA24603@dell5510>
 <f65c32e4-e426-e6c9-5627-51bed11c31e6@oracle.com>
 <20200109105101.GA30367@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <b7290545-f106-3605-7a82-7854383ad3f8@oracle.com>
Date: Thu, 9 Jan 2020 17:16:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109105101.GA30367@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9494
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001090124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9494
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001090124
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On 09.01.2020 13:51, Petr Vorel wrote:
> Hi Alexey,
> 
>>> now:
>>> /bin/sh: 1: nft: not found
>>> nft01 1 TBROK: nft add table ip filter failed
> 
>> Good catch, what about starting with init() in do_setup()?
> 
>> diff --git a/testcases/network/iptables/nft01.sh b/testcases/network/iptables/nft01.sh
>> index 1ae086678..bf2a53c28 100755
>> --- a/testcases/network/iptables/nft01.sh
>> +++ b/testcases/network/iptables/nft01.sh
>> @@ -13,6 +13,7 @@ cleanup_chain=0
> 
>>  do_setup()
>>  {
>> +       init
>>         local ip_table="ip${TST_IPV6}"
> 
>>         if ! nft list table $ip_table filter > /dev/null 2>&1; then
>> @@ -23,7 +24,6 @@ do_setup()
>>                 ROD nft add chain $ip_table filter INPUT '{ type filter hook input priority 0; }'
>>                 cleanup_chain=1
>>         fi
>> -       init
>>  }
> 
> Great, what a simple fix :).
> 

Applied with this change, thanks for your review Petr!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
