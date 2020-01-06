Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE2130DFE
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 08:33:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1683A3C245E
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 08:33:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4832C3C23B2
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 08:33:21 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id CF0701401435
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 08:33:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,401,1571673600"; d="scan'208";a="81360960"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 15:33:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 799C349E932F
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 15:24:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 15:32:49 +0800
To: <ltp@lists.linux.it>
References: <1576641763-18305-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <0ec6817b-8b78-40ac-11c3-39ab4c1c87a7@cn.fujitsu.com>
Date: Mon, 6 Jan 2020 15:32:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1576641763-18305-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 799C349E932F.AFE2C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/userfaultfd01: add hint about
 unprivileged_userfaultfd
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

Hi
Ping.
> Since commit cefdca0a86be ("userfaultfd/sysctl: add vm.unprivileged_userfaultfd").
> , it adds a global sysctl knob "vm.unprivileged_userfaultfd" to control whether
> unprivileged users can use the userfaultfd system calls. Set this to 1 to allow
> unprivileged users to use the userfaultfd system calls, or set this to 0 to
> restrict userfaultfd to only privileged users (with SYS_CAP_PTRACE capability). The
> default value is 1. Add hint about it.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   .../syscalls/userfaultfd/userfaultfd01.c      | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> index a5e142209..4e178b4f8 100644
> --- a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> +++ b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> @@ -82,12 +82,19 @@ static void run(void)
>   
>   	set_pages();
>   
> -	uffd = sys_userfaultfd(O_CLOEXEC | O_NONBLOCK);
> -
> -	if (uffd == -1)
> -		tst_brk(TBROK | TERRNO,
> -			"Could not create userfault file descriptor");
> -
> +	TEST(sys_userfaultfd(O_CLOEXEC | O_NONBLOCK));
> +
> +	if (TST_RET == -1) {
> +		if (TST_ERR == EPERM) {
> +			tst_res(TCONF, "Hint: check /proc/sys/vm/unprivileged_userfaultfd");
> +			tst_brk(TCONF | TTERRNO,
> +				"userfaultfd() requires CAP_SYS_PTRACE on this system");
> +		} else
> +			tst_brk(TBROK | TTERRNO,
> +				"Could not create userfault file descriptor");
> +	}
> +
> +	uffd = TST_RET;
>   	uffdio_api.api = UFFD_API;
>   	uffdio_api.features = 0;
>   	SAFE_IOCTL(uffd, UFFDIO_API, &uffdio_api);
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
