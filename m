Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282C6A4F2
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 11:32:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B3E63C1D0F
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 11:32:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 02C313C1D00
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 11:32:22 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 6FEEC601A0E
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 11:32:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,497,1557158400"; d="scan'208";a="71557921"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Jul 2019 17:32:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 96E4F4CDDD3D;
 Tue, 16 Jul 2019 17:32:13 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 16 Jul 2019 17:32:17 +0800
Message-ID: <5D2D999C.3010601@cn.fujitsu.com>
Date: Tue, 16 Jul 2019 17:32:12 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190715154945.GA28618@rei.lan>
 <1563255457-2336-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190716090908.GA12815@rei.lan>
In-Reply-To: <20190716090908.GA12815@rei.lan>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 96E4F4CDDD3D.A1612
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/prctl06: New test for prctl() with
 PR_{SET, GET}_NO_NEW_PRIVS
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


> Hi!
> Pushed with two changes, thanks.
>
>
> diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
> index eafbedfef..0e1274a2a 100644
> --- a/testcases/kernel/syscalls/prctl/prctl06.c
> +++ b/testcases/kernel/syscalls/prctl/prctl06.c
> @@ -81,8 +81,8 @@ static void setup(void)
>
>   	SAFE_CP(TESTBIN, TEST_REL_BIN_DIR);
>
> -	SAFE_CHMOD(BIN_PATH, SUID_MODE);
>   	SAFE_CHOWN(BIN_PATH, 0, 0);
> +	SAFE_CHMOD(BIN_PATH, SUID_MODE);
>
>   	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
>   	if (TST_RET == 0) {
>
> This is actually important fix, you have to set the SUID bits last since
> they are cleared if you change owner of the file.
Hi Cyril

OK. I learn a lot from this case. Thanks for kindly reply.

>
> diff --git a/testcases/kernel/syscalls/prctl/prctl06.h b/testcases/kernel/syscalls/prctl/prctl06.h
> index 72f9c4e5a..f5c66e809 100644
> --- a/testcases/kernel/syscalls/prctl/prctl06.h
> +++ b/testcases/kernel/syscalls/prctl/prctl06.h
> @@ -25,12 +25,14 @@
>   #define BIN_PATH           MNTPOINT"/"TESTBIN
>   #define SUID_MODE          (S_ISUID|S_ISGID|S_IXUSR|S_IXGRP|S_IXOTH)
>
> -static int flag = 1;
> -
>   void check_proc_field(int val, char *name)
>   {
> +	static int flag = 1;
>   	int field = 0;
>
> +	if (!flag)
> +		return;
> +
>   	TEST(FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d",&field));
>   	if (TST_RET == 1) {
>   		tst_res(TCONF,
> @@ -57,8 +59,8 @@ void check_no_new_privs(int val, char *name)
>   		tst_res(TFAIL,
>   			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %ld",
>   			name, val, TST_RET);
> -	if (flag)
> -		check_proc_field(val, name);
> +
> +	check_proc_field(val, name);
>   }
>
>   #endif
>
> This is merely cosmetic and moves the flag to the function so that it's
> not global.
Yes. static local variable is better.





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
