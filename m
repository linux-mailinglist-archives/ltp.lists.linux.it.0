Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 834356F94B
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 08:05:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2FC53C1CFB
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 08:05:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EEE233C185E
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 08:05:38 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9D8A71000C16
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 08:05:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,293,1559491200"; d="scan'208";a="71932309"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jul 2019 14:05:30 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 6A7F14CDE64B;
 Mon, 22 Jul 2019 14:05:27 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 22 Jul 2019 14:05:32 +0800
Message-ID: <5D355223.5040705@cn.fujitsu.com>
Date: Mon, 22 Jul 2019 14:05:23 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190716143238.483-1-chrubis@suse.cz>
In-Reply-To: <20190716143238.483-1-chrubis@suse.cz>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 6A7F14CDE64B.AEE9E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] [PATCH] syscalls/prctl07: Fix build.
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


> Ideally this is last fix for prctl07.
>
> Since I've changed the check_proc_capamb() to use macro definition
> instead of raw integer value we depend on sys/capability.h being
> included to compile the code.
>
> So this commit changes:
>
> The sys/capability.h is included under HAVE_SYS_CAPABILITY_H now and so
> the function is ifdefed out if we don't have that header.
>
> Also it looks like HAVE_LIBCAP is not defined unless libcap supports
> cap_compare() which should be fixed. The check for libcap and
> cap_compare() has to be uncoupled but that has to be done in a sepratate
> patch.
Hi Cyril

     I have a patch for this on 2019.5 [1] but not correct way.  Also, I am going to simpify and remove some m4.
I will uncouple libcap and cap_compare in ltp-cap.m4.

[1]http://lists.linux.it/pipermail/ltp/2019-May/011925.html

> Signed-off-by: Cyril Hrubis<chrubis@suse.cz>
> ---
>   testcases/kernel/syscalls/prctl/prctl07.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/prctl/prctl07.c b/testcases/kernel/syscalls/prctl/prctl07.c
> index 37d77df33..79f7710a8 100644
> --- a/testcases/kernel/syscalls/prctl/prctl07.c
> +++ b/testcases/kernel/syscalls/prctl/prctl07.c
> @@ -25,7 +25,7 @@
>   #include<sys/prctl.h>
>   #include<stdlib.h>
>   #include "config.h"
> -#ifdef HAVE_LIBCAP
> +#ifdef HAVE_SYS_CAPABILITY_H
>   # include<sys/capability.h>
>   #endif
>   #include "lapi/syscalls.h"
> @@ -35,7 +35,8 @@
>
>   #define PROC_STATUS "/proc/self/status"
>
> -static inline void check_proc_capamb(char *message, int flag)
> +#ifdef HAVE_SYS_CAPABILITY_H
> +static void check_proc_capamb(char *message, int flag)
>   {
>   	int cap_num;
>   	char CapAmb[20];
> @@ -62,6 +63,7 @@ static inline void check_proc_capamb(char *message, int flag)
>   			"%s, CapAmb in %s doesn't have CAP_NET_BIND_SERVICE",
>   			message, PROC_STATUS);
>   }
> +#endif
>
>   static inline void check_cap_raise(unsigned int cap, char *message, int fail_flag)
>   {




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
