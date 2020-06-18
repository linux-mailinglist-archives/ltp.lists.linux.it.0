Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AA91FF2EF
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 15:24:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDA133C2C8C
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 15:24:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 77B0B3C1C9A
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 15:24:55 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3EA3B1000412
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 15:24:54 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05IDLuHI039698;
 Thu, 18 Jun 2020 13:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=dOS+9HjwvYZNFjNiTeYIjF6dZ3jOKuMV9YWINdK7T5o=;
 b=c2xKuaYstTb8UwKYN/aCcTwBRsi1qfIHE8jpjzm3VKIVu40fW1eoDNH4p+ZTb+td4Y3L
 58VmVPWkr3VYJctsUeWJSHHAotFn2v4avzf9Zn6lYQmTj8W8v5B9YmuagnUcbQU22Rej
 7cX4T3ztvUMi4zkarlLiAd2TEu7Vr1xI8yX3R135ZD4xlVlkqDybMypJL1qoJ7nfj3xn
 1eh8qtl6rMT8mWqMl5qUdBY9z8LUotZ8rFNAYrBK75BaCCW1TDBdGN19zZUZbNdAmKAd
 zTqLPgVzZolbWNEsELgITAXEPQ/z73teBgGcar3rCAN4a7ag+OP+QU5k5rokybJQudlX xQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 31q66015g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 18 Jun 2020 13:24:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05IDNGIT068333;
 Thu, 18 Jun 2020 13:24:51 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 31q66s7h8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 13:24:51 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05IDOonV000426;
 Thu, 18 Jun 2020 13:24:51 GMT
Received: from [192.168.1.39] (/91.247.148.3)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 18 Jun 2020 06:24:50 -0700
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
References: <20200617154926.32588-1-alexey.kodanev@oracle.com>
 <CAEemH2dOxAnaaMXhKyj36FqmYDQ_p_kfi-=pMQhrE3O9oQO8LA@mail.gmail.com>
 <20200618055105.GA42990@x230> <20200618093646.GA11962@dell5510>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <8b5eef18-1c3e-d89c-9af2-b27828f3cb02@oracle.com>
Date: Thu, 18 Jun 2020 16:24:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618093646.GA11962@dell5510>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9655
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006180102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9655
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 impostorscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006180102
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/nsf_lib.sh: TCONF on mount (udp/udp6)
 failure for Linux v5.6+
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 18.06.2020 12:36, Petr Vorel wrote:
> Hi Li, Alexey, Cyril,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
>>>> +++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
>>>> @@ -87,11 +87,17 @@ nfs_mount()
> 
>>>>         tst_res TINFO "Mounting NFS: $mnt_cmd"
>>>>         if [ -n "$LTP_NETNS" ] && [ -z "$LTP_NFS_NETNS_USE_LO" ]; then
>>>> -               tst_rhost_run -s -c "$mnt_cmd"
> 
> 
>>> Or, maybe we can have a new function naming as 'tst_kconifg_check' to parse
>>> kernel .config in shell library as well?
>> +1, I was thinking about it for a long time.
> Thinking about the balance between base TCONF decision on kernel version vs.
> require kernel config to be presented I think for cases like this I'd prefer
> kernel version based check (i.e. the original patch).
> 
> Requiring kernel config is ok for traditional distros (and even here is
> sometimes readable only for root, e.g. Debian/Ubuntu), but it's still rare on
> arm (other embedded archs). I guess it'd be nice to have some variable, which
> would turn kernel config based requirement into warning.
> 

Also the option's name can be renamed in new releases, so the decision
should be made only if the option is found (i.e. if we check without the
the kernel version).

tst_check_kconfig - will be really nice to have. Then, we will tconf
earlier in the setup if this option is found.

What about TCONF_IF_KCONFIG, in addition to NEEDS_KCONFIG?

> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
