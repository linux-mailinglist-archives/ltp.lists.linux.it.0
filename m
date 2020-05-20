Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 452BE1DA7A8
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 04:03:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB7A43C4E77
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 04:03:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BD0D43C240C
 for <ltp@lists.linux.it>; Wed, 20 May 2020 04:03:05 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E43BB6013D8
 for <ltp@lists.linux.it>; Wed, 20 May 2020 04:02:38 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,412,1583164800"; d="scan'208";a="92594793"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 May 2020 10:03:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A13884BCC8A1;
 Wed, 20 May 2020 10:02:59 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 20 May 2020 10:02:55 +0800
Message-ID: <5EC48FCD.9050600@cn.fujitsu.com>
Date: Wed, 20 May 2020 10:02:53 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200518054335.12017-1-yangx.jy@cn.fujitsu.com>
 <20200519143450.GF16008@yuki.lan>
In-Reply-To: <20200519143450.GF16008@yuki.lan>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A13884BCC8A1.ACB25
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test.c: Take account of
 tst_brk(TCONF)/tst_brk(TFAIL) in summary output
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

On 2020/5/19 22:34, Cyril Hrubis wrote:
> Hi!
>>   lib/tst_test.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/tst_test.c b/lib/tst_test.c
>> index 0e58060e0..b28521a67 100644
>> --- a/lib/tst_test.c
>> +++ b/lib/tst_test.c
>> @@ -316,6 +316,7 @@ void tst_vbrk_(const char *file, const int lineno, int ttype,
>>                  const char *fmt, va_list va)
>>   {
>>   	print_result(file, lineno, ttype, fmt, va);
>> +	update_results(TTYPE_RESULT(ttype));
>>
>>   	/*
>>   	 * The getpid implementation in some C library versions may cause cloned
>
> Good catch, but I guess that we should also remove the update_result()
> call from the run_tcases_per_fs() after this.
Hi Cyril,

Agreed.  I missed redundant update_result() in run_tcases_per_fs() after 
this change.

>
> And it also makes sense to call the function as a first thing in the
> tst_res_/tst_brk_ function, which simplifies the code flow.

It is actually simpler but it changes the original logic of tst_cvres() 
called by tst_brk(TBROK) in cleanup().
Before change, tst_cvres() changes TBROK to TWARN and then saves TWARN 
into summary output:
----------------------------------
e.g. Add some debug code in preadv01:
[root@Fedora-30 preadv]# ./preadv01
tst_buffers.c:55: INFO: Test is using guarded buffers
tst_test.c:1244: INFO: Timeout per run is 0h 05m 00s
preadv01.c:80: PASS: Preadv(2) read 64 bytes successfully with content 
'a' expectedly
preadv01.c:80: PASS: Preadv(2) read 64 bytes successfully with content 
'a' expectedly
preadv01.c:80: PASS: Preadv(2) read 32 bytes successfully with content 
'b' expectedly
preadv01.c:99: WARN: test

Summary:
passed   3
failed   0
skipped  0
warnings 1
----------------------------------
After change, tst_cvres() changes TBROK to TWARN but doesn't save TWARN 
into summary output:
----------------------------------
e.g. Add some debug code in preadv01:
[root@Fedora-30 preadv]# ./preadv01
tst_buffers.c:55: INFO: Test is using guarded buffers
tst_test.c:1245: INFO: Timeout per run is 0h 05m 00s
preadv01.c:80: PASS: Preadv(2) read 64 bytes successfully with content 
'a' expectedly
preadv01.c:80: PASS: Preadv(2) read 64 bytes successfully with content 
'a' expectedly
preadv01.c:80: PASS: Preadv(2) read 32 bytes successfully with content 
'b' expectedly
preadv01.c:99: WARN: test

Summary:
passed   3
failed   0
skipped  0
warnings 0
----------------------------------

I perfer to add a update_results() in tst_vbrk_(), do you think so?

Best Regards,
Xiao Yang
>
> So I guess that we want something like this (not tested):
>
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 0e58060e0..9d0ef672d 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -278,8 +278,6 @@ void tst_vres_(const char *file, const int lineno, int ttype,
>                  const char *fmt, va_list va)
>   {
>          print_result(file, lineno, ttype, fmt, va);
> -
> -       update_results(TTYPE_RESULT(ttype));
>   }
>
>   void tst_vbrk_(const char *file, const int lineno, int ttype,
> @@ -297,7 +295,6 @@ static void tst_cvres(const char *file, const int lineno, int ttype,
>          }
>
>          print_result(file, lineno, ttype, fmt, va);
> -       update_results(TTYPE_RESULT(ttype));
>   }
>
>   static void do_test_cleanup(void)
> @@ -337,6 +334,8 @@ void tst_res_(const char *file, const int lineno, int ttype,
>   {
>          va_list va;
>
> +       update_results(TTYPE_RESULT(ttype));
> +
>          va_start(va, fmt);
>          tst_vres_(file, lineno, ttype, fmt, va);
>          va_end(va);
> @@ -347,6 +346,8 @@ void tst_brk_(const char *file, const int lineno, int ttype,
>   {
>          va_list va;
>
> +       update_results(TTYPE_RESULT(ttype));
> +
>          va_start(va, fmt);
>          tst_brk_handler(file, lineno, ttype, fmt, va);
>          va_end(va);
> @@ -1316,10 +1317,8 @@ static int run_tcases_per_fs(void)
>                          mntpoint_mounted = 0;
>                  }
>
> -               if (ret == TCONF) {
> -                       update_results(ret);
> +               if (ret == TCONF)
>                          continue;
> -               }
>
>                  if (ret == 0)
>                          continue;
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
