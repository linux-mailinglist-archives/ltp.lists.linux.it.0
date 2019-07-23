Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E8371696
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 12:52:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 230EE3C1CA0
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jul 2019 12:52:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C91803C183E
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 12:52:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5161F1A01125
 for <ltp@lists.linux.it>; Tue, 23 Jul 2019 12:52:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,298,1559491200"; d="scan'208";a="72023173"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jul 2019 18:52:36 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id E0E2F4CDE65B;
 Tue, 23 Jul 2019 18:52:35 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 23 Jul 2019 18:52:32 +0800
Message-ID: <5D36E6F1.7090008@cn.fujitsu.com>
Date: Tue, 23 Jul 2019 18:52:33 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20190723102826.9679-1-liwang@redhat.com>
In-Reply-To: <20190723102826.9679-1-liwang@redhat.com>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: E0E2F4CDE65B.AD48A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setdomainname: use strlen() to get length of
 string
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

On 2019/07/23 18:28, Li Wang wrote:
> The sizeof(new) is only to get the size of char *, and it's not corret to pass
> it as 'len' in setdomainname(). Here replace by strlen() to get the correct number
> of characters for string.
Hi Li,

As setdomainname(2) manpage mentions, name does not require a 
terminating null byte.
It looks good to me. :-)

Best Regards,
Xiao Yang
> On x86_64, we get this failures if the LTP compilied in 32bit.
>
>    -----Error Log-----
>    setdomainname.h:24: INFO: Testing libc setdomainname()
>    setdomainname01.c:24: FAIL: getdomainname() returned wrong domainname: 'test'
>    setdomainname.h:27: INFO: Testing __NR_setdomainname syscall
>    setdomainname01.c:24: FAIL: getdomainname() returned wrong domainname: 'test'
>    -------------------
>
> Signed-off-by: Li Wang<liwang@redhat.com>
> Cc: Petr Vorel<pvorel@suse.cz>
> ---
>   testcases/kernel/syscalls/setdomainname/setdomainname01.c | 2 +-
>   testcases/kernel/syscalls/setdomainname/setdomainname03.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/setdomainname/setdomainname01.c b/testcases/kernel/syscalls/setdomainname/setdomainname01.c
> index 57d58ab42..1731af733 100644
> --- a/testcases/kernel/syscalls/setdomainname/setdomainname01.c
> +++ b/testcases/kernel/syscalls/setdomainname/setdomainname01.c
> @@ -12,7 +12,7 @@ static void do_test(void)
>   	char *new = TST_VALID_DOMAIN_NAME;
>   	static char tmp[_UTSNAME_DOMAIN_LENGTH];
>
> -	TEST(do_setdomainname(new, sizeof(new)));
> +	TEST(do_setdomainname(new, strlen(new)));
>
>   	if (TST_RET != 0)
>   		tst_brk(TFAIL | TTERRNO, "setdomainname() failed: %d", TST_ERR);
> diff --git a/testcases/kernel/syscalls/setdomainname/setdomainname03.c b/testcases/kernel/syscalls/setdomainname/setdomainname03.c
> index e53ea8806..b8d17d8da 100644
> --- a/testcases/kernel/syscalls/setdomainname/setdomainname03.c
> +++ b/testcases/kernel/syscalls/setdomainname/setdomainname03.c
> @@ -16,7 +16,7 @@ static void do_test(void)
>   {
>   	char *new = TST_VALID_DOMAIN_NAME;
>
> -	TEST(do_setdomainname(new, sizeof(new)));
> +	TEST(do_setdomainname(new, strlen(new)));
>
>   	if (TST_RET != -1) {
>   		tst_res(TFAIL, "unexpected exit code: %ld", TST_RET);




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
