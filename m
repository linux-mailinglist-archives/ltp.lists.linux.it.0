Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A52C651C7
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 08:19:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAE8A3C1C6C
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 08:19:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4A9863C03AD
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 08:19:29 +0200 (CEST)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F9956006C1
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 08:19:29 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6B6JQlB022897
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 23:19:26 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 10 Jul 2019 23:19:25 -0700
To: <ltp@lists.linux.it>
References: <1562824657-152321-1-git-send-email-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <feec36ce-028b-50bb-9fde-626eb194dca9@windriver.com>
Date: Thu, 11 Jul 2019 14:19:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1562824657-152321-1-git-send-email-hongzhi.song@windriver.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getrlimit03: adjust a bit of code to compatiable
 with mips32
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Commit log is not complete. I will send V2 later.

Please ignore this.

--Hongzhi


On 7/11/19 1:57 PM, Hongzhi.Song wrote:
> Error info:
> getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =
> ffffffffffffffff but __NR_getrlimit(0) had rlim_cur = 7fffffff
>
> According to kernel code: RLIM_INFINITY is set to 0x7fffffffUL
> instead of ULONG_MAX on mips32.
>
> /*
>   * SuS says limits have to be unsigned.
>   * Which makes a ton more sense anyway,
>   * but we keep the old value on MIPS32,
>   * for compatibility:
>   */
>
> Adding mips judgement code to fix this.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   testcases/kernel/syscalls/getrlimit/getrlimit03.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> index e4d56c4..1903558 100644
> --- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> +++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> @@ -61,7 +61,13 @@ struct rlimit_ulong {
>   	unsigned long rlim_cur;
>   	unsigned long rlim_max;
>   };
> +#ifdef __mips
> +#ifndef __mips64
> +const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
> +#else
>   const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
> +#endif
> +#endif
>   
>   static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
>   {
> @@ -101,8 +107,8 @@ static int compare_u64_ulong(int resource, uint64_t val_u64,
>   {
>   	if ((val_u64 > RLIM_INFINITY_UL && val_ul != RLIM_INFINITY_UL) ||
>   	    (val_u64 <= RLIM_INFINITY_UL && val_ul != val_u64)) {
> -		tst_res(TFAIL, "__NR_prlimit64(%d) had %s = %" PRIx64 " but " __NR_getrlimit_ulong_str "(%d) had %s = %lx",
> -			resource, kind, val_u64,
> +		tst_res(TFAIL, "SIGNED_GETRLIMIT = %d __WORDSIZE %d ULONG_MAX = %lu RLIM_INFINITY_UL = %lu __NR_prlimit64(%d) had %s = %" PRIx64 " but " __NR_getrlimit_ulong_str "(%d) had %s = %lx",
> +			SIGNED_GETRLIMIT, __WORDSIZE, ULONG_MAX, RLIM_INFINITY_UL, resource, kind, val_u64,
>   			resource, kind, val_ul);
>   		return -1;
>   	}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
