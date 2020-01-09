Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E011353AB
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 08:24:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B1923C249C
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 08:24:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 216F83C2459
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 08:24:47 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 636241000D86
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 08:24:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,412,1571673600"; d="scan'208";a="81523009"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 15:24:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6C73249E933E;
 Thu,  9 Jan 2020 15:15:40 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 15:24:41 +0800
To: <chrubis@suse.cz>
References: <1578553217-29510-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <6bd663d6-2ef4-cee8-1a5c-163dc2a74d8b@cn.fujitsu.com>
Date: Thu, 9 Jan 2020 15:24:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1578553217-29510-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6C73249E933E.AB4F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/capget02: Use pid=0 instead of getpid()
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

Hi
> Since pid=0 returns the capabilities for the calling thread,
> we can remove getpid and use pid=0 instead of it. Also we
> can cover this test point.
Since I defined static struct, I think it doesn't need pid=0 assignment. 
I will send a v2 and add comment.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/capget/capget02.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/capget/capget02.c b/testcases/kernel/syscalls/capget/capget02.c
> index 42c76a011..0a23700b9 100644
> --- a/testcases/kernel/syscalls/capget/capget02.c
> +++ b/testcases/kernel/syscalls/capget/capget02.c
> @@ -69,15 +69,13 @@ static void verify_capget(unsigned int n)
>   
>   static void setup(void)
>   {
> -	unsigned int i, pid;
> -
> -	pid = getpid();
> +	unsigned int i;
>   
>   	header.version = 0x19980330;
> -	header.pid = pid;
> +	header.pid = 0;
>   
>   	bad_version_header.version = 0;
> -	bad_version_header.pid = pid;
> +	bad_version_header.pid = 0;
>   
>   	bad_pid_header.version = 0x19980330;
>   	bad_pid_header.pid = -1;
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
