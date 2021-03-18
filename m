Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 969FE33FFD3
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 07:44:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C9253C603A
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 07:44:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AC56B3C2CA3
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 07:43:54 +0100 (CET)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8EEBB600F9C
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 07:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=W+FG5
 xdxLjJWLyJPQAmXNL0V74wDrPMcuz0A8kK1nd0=; b=KdfdKYHlz2zd8tqMrXLy2
 3YV1ue9EwW2mpX3ZyBPDCg+tRdlp4pKUpphXLGogbH8V8I+IWyc5zC2yROUFGcs8
 bDBEV+b9WynPlKLHgMEA6DfkY9SQYCMTFPfGYsOelkOi88DYYx04cn5BxUcR2dE1
 7s7eGiloMtR2sC4xEUe2Lc=
Received: from localhost.localdomain (unknown [223.104.145.0])
 by smtp9 (Coremail) with SMTP id DcCowABXrBWi9lJgYbE4Bw--.24491S2;
 Thu, 18 Mar 2021 14:43:47 +0800 (CST)
To: Xie Ziyao <xieziyao@huawei.com>, ltp@lists.linux.it
References: <20210318060834.151128-1-xieziyao@huawei.com>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <893c8a78-7307-d03b-5191-58c9337ea041@163.com>
Date: Thu, 18 Mar 2021 14:43:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210318060834.151128-1-xieziyao@huawei.com>
Content-Language: en-US
X-CM-TRANSID: DcCowABXrBWi9lJgYbE4Bw--.24491S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw1xZF15Ar4xuw1DGr4kJFb_yoW5ZFyxpr
 W7XF4F9ws5tay8tFWfXr1v9rW8X3sxtw48Ga1qyr45uFs5Ar90yFsIg3WrXr12grW2ga4Y
 9r4kWrW0yayY9a7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-a93UUUUU=
X-Originating-IP: [223.104.145.0]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/1tbiygNZhFQHLaqjawAAsI
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kernel/syscalls: Use SAFE_OPEN() instead of
 calling system API functions
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

Hi Xie
> For those:
>    testcases/kernel/syscalls/fsconfig/fsconfig02.c
>    testcases/kernel/syscalls/inotify/inotify01.c
>    testcases/kernel/syscalls/memfd_create/memfd_create03.c
>
> Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
> ---
>   testcases/kernel/syscalls/fsconfig/fsconfig02.c        |  4 +---
>   testcases/kernel/syscalls/inotify/inotify01.c          | 10 ++--------
>   .../kernel/syscalls/memfd_create/memfd_create03.c      |  4 ++--
>   3 files changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig02.c b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> index 9ff41a7d7..6ff4380ef 100644
> --- a/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> +++ b/testcases/kernel/syscalls/fsconfig/fsconfig02.c
> @@ -55,9 +55,7 @@ static void setup(void)
>   	if (fd == -1)
>   		tst_brk(TBROK | TTERRNO, "fsopen() failed");
>
> -	temp_fd = open("testfile", O_RDWR | O_CREAT, 01444);
> -	if (temp_fd == -1)
> -		tst_brk(TBROK, "Can't obtain temp_fd, open() failed");
> +	fd = SAFE_OPEN("testfile", O_RDWR | O_CREAT, 01444);

We should use temp_fd instead of fd.

Other than this, it looks good to me.

Reviewed-by: Yang Xu <xuyang_jy_0410@163.com>


>   }
>
>   static void cleanup(void)
> diff --git a/testcases/kernel/syscalls/inotify/inotify01.c b/testcases/kernel/syscalls/inotify/inotify01.c
> index 8f1547d46..2d82e5970 100644
> --- a/testcases/kernel/syscalls/inotify/inotify01.c
> +++ b/testcases/kernel/syscalls/inotify/inotify01.c
> @@ -52,10 +52,7 @@ void verify_inotify(void)
>   	event_set[test_cnt] = IN_ATTRIB;
>   	test_cnt++;
>
> -	if ((fd = open(fname, O_RDONLY)) == -1) {
> -		tst_brk(TBROK | TERRNO,
> -			"open(%s, O_RDWR|O_CREAT,0700) failed", fname);
> -	}
> +	fd = SAFE_OPEN(fname, O_RDONLY);
>   	event_set[test_cnt] = IN_OPEN;
>   	test_cnt++;
>
> @@ -70,10 +67,7 @@ void verify_inotify(void)
>   	event_set[test_cnt] = IN_CLOSE_NOWRITE;
>   	test_cnt++;
>
> -	if ((fd = open(fname, O_RDWR | O_CREAT, 0700)) == -1) {
> -		tst_brk(TBROK,
> -			"open(%s, O_RDWR|O_CREAT,0700) failed", fname);
> -	}
> +	fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0700);
>   	event_set[test_cnt] = IN_OPEN;
>   	test_cnt++;
>
> diff --git a/testcases/kernel/syscalls/memfd_create/memfd_create03.c b/testcases/kernel/syscalls/memfd_create/memfd_create03.c
> index ea846626a..036182f0a 100644
> --- a/testcases/kernel/syscalls/memfd_create/memfd_create03.c
> +++ b/testcases/kernel/syscalls/memfd_create/memfd_create03.c
> @@ -207,7 +207,7 @@ static void setup(void)
>   	SAFE_FILE_LINES_SCANF(TOTAL_HP_PATH, "%ld", &og_total_pages);
>   	sprintf(buf, "%ld", og_total_pages + 1);
>
> -	fd = open(TOTAL_HP_PATH, O_RDWR | O_TRUNC);
> +	fd = SAFE_OPEN(TOTAL_HP_PATH, O_RDWR | O_TRUNC);
>
>   	if (write(fd, buf, strlen(buf)) == -1)
>   		tst_brk(TCONF | TERRNO,
> @@ -233,7 +233,7 @@ static void cleanup(void)
>
>   	sprintf(buf, "%ld", og_total_pages);
>
> -	fd = open(TOTAL_HP_PATH, O_RDWR | O_TRUNC);
> +	fd = SAFE_OPEN(TOTAL_HP_PATH, O_RDWR | O_TRUNC);
>
>   	if (write(fd, buf, strlen(buf)) == -1)
>   		tst_brk(TCONF | TERRNO, "Clean-up failed: write() failed");
> --
> 2.17.1
>
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
