Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E2255795
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 11:27:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D9053C2E4B
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 11:27:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8000E3C1410
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 11:27:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7815F60070D
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 11:27:34 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,363,1592841600"; d="scan'208";a="98665408"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Aug 2020 17:27:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6225D48990D5;
 Fri, 28 Aug 2020 17:27:28 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 28 Aug 2020 17:27:28 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1598005119-2147-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200828084334.GA1648@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1e3f9915-13d6-0aaf-2fb5-56bf0d543f33@cn.fujitsu.com>
Date: Fri, 28 Aug 2020 17:27:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828084334.GA1648@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6225D48990D5.AD852
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_af_alg: fix build error when
 ALG_SET_AEAD_ASSOCLEN undefined
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr


> Hi,
> 
>>   configure.ac          |  6 ++++++
>>   include/lapi/if_alg.h | 39 ++++++++++++++++++++++++++++++---------
>>   2 files changed, 36 insertions(+), 9 deletions(-)
> 
>> diff --git a/configure.ac b/configure.ac
>> index 382963d8b..f711ac123 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -193,6 +193,12 @@ AC_CHECK_TYPES([struct xt_entry_match, struct xt_entry_target],,,[
>>   #include <linux/netfilter_ipv4/ip_tables.h>
>>   ])
> 
>> +AC_CHECK_TYPES([struct sockaddr_alg, struct af_alg_iv],,,[
>> +#ifdef HAVE_LINUX_IF_ALG_H
>> +# include <linux/if_alg.h>
>> +#endif
>> +])
> nit: This list was meant to be sorted. I'll handle that during merge.
Thanks.
>> +
>>   # Tools knobs
> 
>>   # Expect
>> diff --git a/include/lapi/if_alg.h b/include/lapi/if_alg.h
>> index 5a74df99b..9c04a444c 100644
>> --- a/include/lapi/if_alg.h
>> +++ b/include/lapi/if_alg.h
>> @@ -8,9 +8,10 @@
> 
>>   #ifdef HAVE_LINUX_IF_ALG_H
>>   #  include <linux/if_alg.h>
>> -#else
>> +#endif
>>   #  include <stdint.h>
> BTW <stdint.h> is needed only for "#ifndef HAVE_STRUCT_SOCKADDR_ALG" and "#ifndef
> HAVE_STRUCT_AF_ALG_IVL" (for uint*_t) but we can ignore that as a detail (better
> than have complicated guarder:
> #if ! (defined(HAVE_STRUCT_SOCKADDR_ALG) && defined(HAVE_STRUCT_AF_ALG_IVL)
Agree. ignore it is better.
> 
> (and later forgot to update it).
> 
>> +#ifndef HAVE_STRUCT_SOCKADDR_ALG
>>   struct sockaddr_alg {
>>   	uint16_t	salg_family;
>>   	uint8_t		salg_type[14];
>> @@ -18,21 +19,41 @@ struct sockaddr_alg {
>>   	uint32_t	salg_mask;
>>   	uint8_t		salg_name[64];
>>   };
>> +#endif
> 
> The rest lgtm:
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
