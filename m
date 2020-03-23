Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6618EE59
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 04:13:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75ADB3C4F29
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 04:13:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 536613C0431
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 04:13:56 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 510A720004D
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 04:13:54 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,294,1580745600"; d="scan'208";a="86831669"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Mar 2020 11:13:52 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2A63250A9990;
 Mon, 23 Mar 2020 11:03:41 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 23 Mar 2020 11:13:51 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c0ab47c6-cc59-03e5-d474-e4efd68844a2@cn.fujitsu.com>
Date: Mon, 23 Mar 2020 11:13:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200320134937.16616-2-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2A63250A9990.AA4D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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

This patch looks good to me, just a small nit
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>   testcases/kernel/syscalls/add_key/add_key05.c   | 15 ++-------------
>   testcases/kernel/syscalls/quotactl/quotactl01.c | 14 ++------------
>   testcases/kernel/syscalls/quotactl/quotactl06.c | 12 +-----------
>   3 files changed, 5 insertions(+), 36 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
> index a39bfa0b7..6a4e20564 100644
> --- a/testcases/kernel/syscalls/add_key/add_key05.c
> +++ b/testcases/kernel/syscalls/add_key/add_key05.c
> @@ -36,19 +36,8 @@ static void add_user(void)
>   		return;
>   
>   	const char *const cmd_useradd[] = {"useradd", username, NULL};
> -	int rc;
> -
> -	switch ((rc = tst_run_cmd(cmd_useradd, NULL, NULL, 1))) {
> -	case 0:
> -		user_added = 1;
> -		ltpuser = SAFE_GETPWNAM(username);
> -		break;
> -	case 255:
> -		tst_brk(TCONF, "useradd not found");
> -		break;
> -	default:
> -		tst_brk(TBROK, "useradd failed (%d)", rc);
> -	}
> +
> +	SAFE_RUNCMD(cmd_useradd, NULL, NULL);We should keep ltpuser and user_added assignment.

Best Regards
Yang Xu
>   	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
>   }
>   
> diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
> index ede61d7e4..30151814e 100644
> --- a/testcases/kernel/syscalls/quotactl/quotactl01.c
> +++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
> @@ -162,18 +162,8 @@ static struct tcase {
>   static void setup(void)
>   {
>   	const char *const cmd[] = {"quotacheck", "-ugF", "vfsv0", MNTPOINT, NULL};
> -	int ret;
> -
> -	ret = tst_run_cmd(cmd, NULL, NULL, 1);
> -	switch (ret) {
> -	case 0:
> -		break;
> -	case 255:
> -		tst_brk(TCONF, "quotacheck binary not installed");
> -		break;
> -	default:
> -		tst_brk(TBROK, "quotacheck exited with %i", ret);
> -	}
> +
> +	SAFE_RUNCMD(cmd, NULL, NULL);
>   
>   	test_id = geteuid();
>   	if (access(USRPATH, F_OK) == -1)
> diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
> index a3b4517e0..0b62e6240 100644
> --- a/testcases/kernel/syscalls/quotactl/quotactl06.c
> +++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
> @@ -146,19 +146,9 @@ static void verify_quotactl(unsigned int n)
>   static void setup(void)
>   {
>   	const char *const cmd[] = {"quotacheck", "-uF", "vfsv0", MNTPOINT, NULL};
> -	int ret;
>   	unsigned int i;
>   
> -	ret = tst_run_cmd(cmd, NULL, NULL, 1);
> -	switch (ret) {
> -	case 0:
> -		break;
> -	case 255:
> -		tst_brk(TCONF, "quotacheck binary not installed");
> -		break;
> -	default:
> -		tst_brk(TBROK, "quotacheck exited with %i", ret);
> -	}
> +	SAFE_RUNCMD(cmd, NULL, NULL);
>   
>   	if (access(USRPATH, F_OK) == -1)
>   		tst_brk(TFAIL | TERRNO, "user quotafile didn't exist");
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
