Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9984D14614B
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 06:17:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 692F73C201C
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 06:17:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3DE113C180D
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 06:17:02 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A0E0F1000CE5
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 06:16:58 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,352,1574092800"; d="scan'208";a="82507581"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jan 2020 13:16:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id E66F050A996D
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 13:07:42 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 23 Jan 2020 13:16:56 +0800
Message-ID: <5E292C45.2010604@cn.fujitsu.com>
Date: Thu, 23 Jan 2020 13:16:53 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <1579754906-7837-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1579754906-7837-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E66F050A996D.AA5A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/socketcall: Use TCONF instead of TPASS
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

Hi Xu,

All of them are simple tests.
I perfer to convert to new library along with the minor fix. :-)

Thanks,
Xiao Yang
On 2020/1/23 12:48, Yang Xu wrote:
> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/socketcall/socketcall02.c | 2 +-
>   testcases/kernel/syscalls/socketcall/socketcall03.c | 2 +-
>   testcases/kernel/syscalls/socketcall/socketcall04.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/socketcall/socketcall02.c b/testcases/kernel/syscalls/socketcall/socketcall02.c
> index cec0246a6..7574782ff 100644
> --- a/testcases/kernel/syscalls/socketcall/socketcall02.c
> +++ b/testcases/kernel/syscalls/socketcall/socketcall02.c
> @@ -156,7 +156,7 @@ int TST_TOTAL = 0;
>
>   int main(void)
>   {
> -	tst_resm(TPASS, "socket call test on this architecture disabled.");
> +	tst_resm(TCONF, "socket call test on this architecture disabled.");
>   	tst_exit();
>   }
>
> diff --git a/testcases/kernel/syscalls/socketcall/socketcall03.c b/testcases/kernel/syscalls/socketcall/socketcall03.c
> index 244a28678..d6c082c21 100644
> --- a/testcases/kernel/syscalls/socketcall/socketcall03.c
> +++ b/testcases/kernel/syscalls/socketcall/socketcall03.c
> @@ -174,7 +174,7 @@ int TST_TOTAL = 0;
>
>   int main(void)
>   {
> -	tst_resm(TPASS, "socket call test on this architecture disabled.");
> +	tst_resm(TCONF, "socket call test on this architecture disabled.");
>   	tst_exit();
>   }
>
> diff --git a/testcases/kernel/syscalls/socketcall/socketcall04.c b/testcases/kernel/syscalls/socketcall/socketcall04.c
> index 584c8f37a..c498b6e74 100644
> --- a/testcases/kernel/syscalls/socketcall/socketcall04.c
> +++ b/testcases/kernel/syscalls/socketcall/socketcall04.c
> @@ -167,7 +167,7 @@ int TST_TOTAL = 0;
>
>   int main(void)
>   {
> -	tst_resm(TPASS, "socket call test on this architecture disabled.");
> +	tst_resm(TCONF, "socket call test on this architecture disabled.");
>   	tst_exit();
>   }
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
