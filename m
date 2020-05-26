Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B644D1E1DA1
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 10:48:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F7EB3C3270
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 10:48:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 06A243C02C2
 for <ltp@lists.linux.it>; Tue, 26 May 2020 10:48:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6AEC4140122F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 10:48:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 096D4AEF9;
 Tue, 26 May 2020 08:48:42 +0000 (UTC)
Date: Tue, 26 May 2020 10:48:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Vikas Kumar <vikas.kumar2@arm.com>
Message-ID: <20200526084837.GA10775@dell5510>
References: <20200526063555.25006-1-vikas.kumar2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526063555.25006-1-vikas.kumar2@arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5] syscall: Add io_uring related tests
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Vikas,

not a complete review, just a few notes.

...
> +/*
> + * Check whether the ioring related system calls are supported on
> + * the current kernel. These system calls are enabled by default
> + * on kernel version 5.1.0 or higher. But they also might have
> + * been backported as well.
> + */
IMHO the function name is obvious, so please shorten the comment :).
> +void io_uring_setup_supported_by_kernel(void)
> +{
> +	if ((tst_kvercmp(5, 1, 0)) < 0) {
> +		TEST(syscall(__NR_io_uring_setup, NULL, 0));
> +		if (TST_RET != -1)
> +			SAFE_CLOSE(TST_RET);
> +		else if (TST_ERR == ENOSYS)
> +			tst_brk(TCONF,
> +				"Test not supported on kernel version < v5.1");
> +	}
> +}
> +
> +void io_uring_register_supported_by_kernel(void)
> +{
> +	if ((tst_kvercmp(5, 1, 0)) < 0) {
> +		TEST(syscall(__NR_io_uring_register, NULL, 0));
> +		if (TST_RET != -1)
> +			SAFE_CLOSE(TST_RET);
> +		else if (TST_ERR == ENOSYS)
> +			tst_brk(TCONF,
> +				"Test not supported on kernel version < v5.1");
> +	}
> +}
> +
> +void io_uring_enter_supported_by_kernel(void)
> +{
> +	if ((tst_kvercmp(5, 1, 0)) < 0) {
> +		TEST(syscall(__NR_io_uring_enter, NULL, 0));
> +		if (TST_RET != -1)
> +			SAFE_CLOSE(TST_RET);
> +		else if (TST_ERR == ENOSYS)
> +			tst_brk(TCONF,
> +				"Test not supported on kernel version < v5.1");
> +	}
> +}
IMHO It's unlikely that somebody would backport just some syscalls, not all 3.
I'd be just for testing io_uring_setup().
Then no setup function is needed (use .setup =
io_uring_setup_supported_by_kernel in struct tst_test).

And according to man pages only io_uring_setup() returns a file descriptor. The
other two takes it as a parameter, so SAFE_CLOSE(TST_RET) is wrong.
https://www.mankier.com/2/io_uring_setup
https://www.mankier.com/2/io_uring_register
https://www.mankier.com/2/io_uring_enter
> +
> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +	int ret = 0;
> +
> +	s = SAFE_MALLOC(sizeof(*s));
> +	if (!s)
> +		return;
All SAFE_* macros (and safe_* functions which use them) are here to avoid these
checks in the code. They exit executing via tst_brk(TCONF, "..."), therefore use
just
s = SAFE_MALLOC(sizeof(*s));
(drop the check).

> +
> +	memset(s, 0, sizeof(*s));
> +	ret = setup_io_uring_test(s, tc);
> +	if (ret)
> +		tst_res(TFAIL | TTERRNO, "io_uring_setup error");
> +
> +	ret = submit_to_uring_sq(s, tc);
> +	if (ret)
> +		tst_res(TFAIL | TTERRNO, "io_uring_submit error");
> +	else
> +		tst_res(TPASS, "functionality of io_uring API is correct");

nit: we prefer return in if instead of else:

if (submit_to_uring_sq(s, tc)) {
	tst_res(TFAIL | TTERRNO, "io_uring_submit error");
	return;
}

tst_res(TPASS, "functionality of io_uring API is correct");

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
