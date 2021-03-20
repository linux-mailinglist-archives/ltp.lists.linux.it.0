Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA0342B5C
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Mar 2021 09:55:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B3753C5F77
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Mar 2021 09:55:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id EBCF33C2BB1
 for <ltp@lists.linux.it>; Sat, 20 Mar 2021 09:55:16 +0100 (CET)
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A98A36008D4
 for <ltp@lists.linux.it>; Sat, 20 Mar 2021 09:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=ABFZk
 Ka/ZTKLHgTA+RHNcaKWJZHLQlE36shc7LzO6gg=; b=fmiVPQejZ94N2FnqC1xC2
 jjQkAQGx2ChSeASR2S7gMFNzaZAH/jA9667A2UbbjS051Mr4ET7C24J2tjIFwXXz
 26gF5R67FJc+778Ze+ybj3Sf5Z2AyBqBzHF6LyMr8DM+ltGRFQFU9mKiYE8GYAqH
 KZNNGNtsM4fmecNdwK5mvs=
Received: from [192.168.0.11] (unknown [112.23.237.201])
 by smtp12 (Coremail) with SMTP id EMCowAA3PRlouFVgzHgXhg--.53644S2;
 Sat, 20 Mar 2021 16:55:05 +0800 (CST)
To: QI Fuli <fukuri.sai@gmail.com>, ltp@lists.linux.it
References: <20210319134511.1844348-1-qi.fuli@fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <08251b70-1fdc-02d3-c94c-80330942da52@163.com>
Date: Sat, 20 Mar 2021 16:55:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210319134511.1844348-1-qi.fuli@fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: EMCowAA3PRlouFVgzHgXhg--.53644S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFWUAryrXFW3ZF4ftFW8WFg_yoWrXFy8pr
 nxt3ZIvFs7J3WxJFWxXr1DGFy0vws2kry5Wan09wsY9F4kAr98JF40gay5X34jgFZ7Kay5
 KFs7XrWqyw1vq3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jtkuxUUUUU=
X-Originating-IP: [112.23.237.201]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBQwhbXl++K8aAPgABs9
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/swapon/swapon0{1..3}: Remove the
 check for BTRFS
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Qi,

Pushed with a minor change:

s/WEXITSTATUS(status) == 1/WEXITSTATUS(status)/

Thanks for your patch.

Best Regards,

Xiao Yang

On 3/19/21 9:45 PM, QI Fuli wrote:
> remove redundant tasks as BTRFS is checked in is_swap_supported()
> Fixes: caf453532("syscalls/swapon/swapon0{1..3}: use helpers to check
> 	support status")
>
> Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
> ---
>   testcases/kernel/syscalls/swapon/swapon01.c |  7 -------
>   testcases/kernel/syscalls/swapon/swapon02.c | 14 +++-----------
>   testcases/kernel/syscalls/swapon/swapon03.c | 15 +--------------
>   3 files changed, 4 insertions(+), 32 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/swapon/swapon01.c b/testcases/kernel/syscalls/swapon/swapon01.c
> index f95ce0ab2..aff842e4c 100644
> --- a/testcases/kernel/syscalls/swapon/swapon01.c
> +++ b/testcases/kernel/syscalls/swapon/swapon01.c
> @@ -32,18 +32,11 @@ static void cleanup(void);
>   char *TCID = "swapon01";
>   int TST_TOTAL = 1;
>
> -static long fs_type;
> -
>   static void verify_swapon(void)
>   {
>   	TEST(ltp_syscall(__NR_swapon, "./swapfile01", 0));
>
>   	if (TEST_RETURN == -1) {
> -		if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
> -			tst_brkm(TCONF, cleanup,
> -			         "Swapfile on BTRFS not implemeted");
> -			return;
> -		}
>   		tst_resm(TFAIL | TTERRNO, "Failed to turn on swapfile");
>   	} else {
>   		tst_resm(TPASS, "Succeeded to turn on swapfile");
> diff --git a/testcases/kernel/syscalls/swapon/swapon02.c b/testcases/kernel/syscalls/swapon/swapon02.c
> index 3d49d0c6b..f0f99619d 100644
> --- a/testcases/kernel/syscalls/swapon/swapon02.c
> +++ b/testcases/kernel/syscalls/swapon/swapon02.c
> @@ -47,7 +47,6 @@ int TST_TOTAL = 4;
>
>   static uid_t nobody_uid;
>   static int do_swapoff;
> -static long fs_type;
>
>   static struct test_case_t {
>   	char *err_desc;
> @@ -81,11 +80,6 @@ static void verify_swapon(struct test_case_t *test)
>   		return;
>   	}
>
> -	if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
> -		tst_resm(TCONF, "Swapfile on BTRFS not implemeted");
> -			return;
> -	}
> -
>   	tst_resm(TFAIL, "swapon(2) failed to produce expected error:"
>   	         " %d, errno: %s and got %d.", test->exp_errno,
>   	         test->exp_errval, TEST_ERRNO);
> @@ -138,12 +132,10 @@ static void setup(void)
>   	make_swapfile(cleanup, "swapfile01", 0);
>   	make_swapfile(cleanup, "alreadyused", 0);
>
> -	if (ltp_syscall(__NR_swapon, "alreadyused", 0)) {
> -		if (fs_type != TST_BTRFS_MAGIC || errno != EINVAL)
> -			tst_resm(TWARN | TERRNO, "swapon(alreadyused) failed");
> -	} else {
> +	if (ltp_syscall(__NR_swapon, "alreadyused", 0))
> +		tst_resm(TWARN | TERRNO, "swapon(alreadyused) failed");
> +	else
>   		do_swapoff = 1;
> -	}
>
>   	TEST_PAUSE;
>   }
> diff --git a/testcases/kernel/syscalls/swapon/swapon03.c b/testcases/kernel/syscalls/swapon/swapon03.c
> index cef57150c..19455bfe6 100644
> --- a/testcases/kernel/syscalls/swapon/swapon03.c
> +++ b/testcases/kernel/syscalls/swapon/swapon03.c
> @@ -52,8 +52,6 @@ int TST_TOTAL = 1;
>
>   static int swapfiles;
>
> -static long fs_type;
> -
>   int testfiles = 3;
>   static struct swap_testfile_t {
>   	char *filename;
> @@ -215,9 +213,6 @@ static int setup_swap(void)
>   			/* turn on the swap file */
>   			res = ltp_syscall(__NR_swapon, filename, 0);
>   			if (res != 0) {
> -				if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL)
> -					exit(2);
> -
>   				if (errno == EPERM) {
>   					printf("Successfully created %d "
>   					       "swapfiles\n", j);
> @@ -233,16 +228,8 @@ static int setup_swap(void)
>   	} else
>   		waitpid(pid, &status, 0);
>
> -	switch (WEXITSTATUS(status)) {
> -	case 0:
> -	break;
> -	case 2:
> -		tst_brkm(TCONF, cleanup, "Swapfile on BTRFS not implemeted");
> -	break;
> -	default:
> +	if (WEXITSTATUS(status) == 1)
>   		tst_brkm(TFAIL, cleanup, "Failed to setup swaps");
> -	break;
> -	}
>
>   	/* Create all needed extra swapfiles for testing */
>   	for (j = 0; j < testfiles; j++)
> --
> 2.29.2
>
>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
