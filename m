Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 640132A29B4
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 12:45:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 327903C3035
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Nov 2020 12:45:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1BF443C23BB
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 12:45:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 30FBD60090E
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 12:45:27 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,444,1596470400"; d="scan'208";a="100826851"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Nov 2020 19:45:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1D3304CE34E2
 for <ltp@lists.linux.it>; Mon,  2 Nov 2020 19:45:24 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 2 Nov 2020 19:45:25 +0800
Message-ID: <5F9FF15C.8080308@cn.fujitsu.com>
Date: Mon, 2 Nov 2020 19:45:32 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <ltp@lists.linux.it>
References: <1604317338-22774-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1604317338-22774-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1604317338-22774-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1D3304CE34E2.AB4B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/ptrace08: Add exception for RHEL8
 4.18 kernel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi All
Sorry, please ignore this email.:-[

> RHEL 4.18 kernel got this patch
> commit bd14406b78e6d ("perf/hw_breakpoint: Modify breakpoint even if the new attr has disabled set") since 4.18.0-49,
>
> therefore it will return success instead of EINVAL when modifying breakpoint.
>
> Without this fix, the test will fail on RHEL8 4.18 kernel with:
> tst_kernel.c:79: TINFO: uname.machine=x86_64 kernel is 64bit
> ptrace08.c:90: TINFO: Trying address 0xffff800000000000
> ptrace08.c:116: TFAIL: ptrace() breakpoint with kernel addr succeeded
> ptrace08.c:90: TINFO: Trying address 0xffffffffffffffff
> ptrace08.c:116: TFAIL: ptrace() breakpoint with kernel addr succeeded
> ptrace08.c:90: TINFO: Trying address 0xffffbfffffffffff
> ptrace08.c:116: TFAIL: ptrace() breakpoint with kernel addr succeeded
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/syscalls/ptrace/ptrace08.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/syscalls/ptrace/ptrace08.c b/testcases/kernel/syscalls/ptrace/ptrace08.c
> index 63086f1fd..741923e36 100644
> --- a/testcases/kernel/syscalls/ptrace/ptrace08.c
> +++ b/testcases/kernel/syscalls/ptrace/ptrace08.c
> @@ -56,6 +56,11 @@ static pid_t child_pid;
>  
>  static int deffered_check;
>  
> +static struct tst_kern_exv kvers[] = {
> +	{"RHEL8", "4.18.0-49"},
> +	{NULL, NULL},
> +};
> +
>  static void setup(void)
>  {
>  	/*
> @@ -72,7 +77,7 @@ static void setup(void)
>  	 * disabled instead and the EINVAL was returned when dr7 was written to
>  	 * enable it again.
>  	 */
> -	if (tst_kvercmp(4, 19, 0) < 0)
> +	if (tst_kvercmp2(4, 19, 0, kvers) < 0)
>  		deffered_check = 1;
>  }
>  




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
