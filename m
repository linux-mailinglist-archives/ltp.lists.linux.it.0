Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A826BB97
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 06:50:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D4213C2AEA
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 06:50:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B0FC13C2891
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 06:50:29 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9DB7E60122E
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 06:50:28 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,431,1592841600"; d="scan'208";a="99293834"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Sep 2020 12:50:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 2BE4448990EF;
 Wed, 16 Sep 2020 12:50:24 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 16 Sep 2020 12:50:21 +0800
Message-ID: <5F61998D.7080802@cn.fujitsu.com>
Date: Wed, 16 Sep 2020 12:50:21 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Bird, Tim" <Tim.Bird@sony.com>
References: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
In-Reply-To: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2BE4448990EF.A887A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] TPASS in new test lib
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/9/16 4:54, Bird, Tim wrote:
>
>> -----Original Message-----
>> From: Petr Vorel<pvorel@suse.cz>
>>
> ...
>>> P.P.S How come some tests produce TPASS and some produce just PASS?
>> Legacy C API and shell API (both legacy and new) add T (i.e. TPASS), new C API
>> don't add it (i.e. PASS). It's a minor detail we could fix that.
> Well, Fuego's parser only checks for PASS (probably due to the inconsistency),
> but personally I'd prefer if it was consistent. The string "TPASS" is much less
> likely to appear in unrelated output than "PASS" is.
>
> It looks like it comes from print_result() in ltp/lib/tst_test.c.
>
> Here's a patch, in case there's interest in changing it:
>
> > From 151168bf384135d7c79b0c09bb95267ba1293205 Mon Sep 17 00:00:00 2001
> From: Tim Bird<tim.bird@sony.com>
> Date: Tue, 15 Sep 2020 14:18:37 -0600
> Subject: [PATCH] tst_test: Change result strings to use T prefix
>
> Change PASS to TPASS in the new C library.
> Change other results strings to also include the "T" prefix.
> This makes the new library consistent with previous LTP
> output, and with the shell output.
Hi Tim, Petr

Is it better to factor out old strttype() and call it in print_result()? 
:-)

Best Regards,
Xiao Yang
> Signed-off-by: Tim Bird<tim.bird@sony.com>
> ---
>   lib/tst_test.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 175dea7..8cc76d5 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -193,22 +193,22 @@ static void print_result(const char *file, const int lineno, int ttype,
>
>   	switch (TTYPE_RESULT(ttype)) {
>   	case TPASS:
> -		res = "PASS";
> +		res = "TPASS";
>   	break;
>   	case TFAIL:
> -		res = "FAIL";
> +		res = "TFAIL";
>   	break;
>   	case TBROK:
> -		res = "BROK";
> +		res = "TBROK";
>   	break;
>   	case TCONF:
> -		res = "CONF";
> +		res = "TCONF";
>   	break;
>   	case TWARN:
> -		res = "WARN";
> +		res = "TWARN";
>   	break;
>   	case TINFO:
> -		res = "INFO";
> +		res = "TINFO";
>   	break;
>   	default:
>   		tst_brk(TBROK, "Invalid ttype value %i", ttype);




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
