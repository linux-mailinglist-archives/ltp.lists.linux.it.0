Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11332B8EE
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 16:25:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDC543C5742
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 16:25:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B37593C56A7
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 16:25:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F15CD600682
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 16:25:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 485EBAC24;
 Wed,  3 Mar 2021 15:25:03 +0000 (UTC)
Date: Wed, 3 Mar 2021 16:26:37 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Message-ID: <YD+qrfp1cuX96Ftd@yuki.lan>
References: <20210303022221.1044234-1-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303022221.1044234-1-ruansy.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/chdir04: Convert to the new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +static struct test_case_t {
> +	char *dir_name;
> +	int expected_error;
> +} testcase_list[] = {
> +	{bad_dir, ENAMETOOLONG},
> +	{noexist_dir, ENOENT},
> +	{(void *)-1, EFAULT}
> +};

This is way to verbose, we can just name these:

struct test_case_t -> struct tcase
testcase_list -> tcases
dir_name -> dir
expected_error -> exp_errno

without loosing any information.

> -void setup(void)
> +static void setup(void)
>  {
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
>  #ifdef UCLINUX
>  	bad_addr = mmap(0, 1, PROT_NONE,
>  			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
>  	if (bad_addr == MAP_FAILED)
> -		tst_brkm(TBROK | TERRNO, cleanup, "mmap() failed");
> -	TC[2].dname = bad_addr;
> +		tst_brk(TBROK | TERRNO, "mmap() failed");
> +	testcase_list[2].dir_name = bad_addr;
> +#endif
> +}
> +
> +static void cleanup(void)
> +{
> +#ifdef UCLINUX
> +	munmap(bad_addr, 1);
>  #endif
>  }

We do not support uClinux anymore, please remove that part as well.

> -void cleanup(void)
> +static void verify_chdir(unsigned int i)
>  {
> -	tst_rmdir();
> +	TEST(chdir(testcase_list[i].dir_name));
> +
> +	if (TST_RET != -1) {
> +		tst_res(TFAIL, "call succeeded unexpectedly");
> +		return;
> +	}
>  
> +	if (TST_ERR == testcase_list[i].expected_error)
> +		tst_res(TPASS | TTERRNO, "failed as expected");
> +	else {
> +		tst_res(TFAIL | TTERRNO,
> +			"didn't fail as expected (expected %d)",
> +			testcase_list[i].expected_error);
> +	}

We do have TST_EXP_FAIL() macro that should replace all of this.

>  }
> +
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.test = verify_chdir,
> +	.tcnt = ARRAY_SIZE(testcase_list),
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};
> -- 
> 2.30.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
