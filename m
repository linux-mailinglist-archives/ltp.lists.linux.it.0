Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2C52C4601
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 17:54:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B70F93C4E38
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 17:54:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 088143C223E
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 17:54:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8BCE21A00EB8
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 17:54:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CE3DABCE
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 16:54:29 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20201113131428.13199-1-chrubis@suse.cz>
 <20201113131428.13199-2-chrubis@suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <0c6f7b59-c1ec-5ff9-d261-7b4772ed9b1a@suse.cz>
Date: Wed, 25 Nov 2020 17:54:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201113131428.13199-2-chrubis@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 01/10] lib: Introduce more TEST_* macros
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

On 13. 11. 20 14:14, Cyril Hrubis wrote:
> In order to simplify common return value checks.
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  include/tst_test.h               |  28 +------
>  include/tst_test_macros.h        | 131 +++++++++++++++++++++++++++++++
>  lib/newlib_tests/.gitignore      |   3 +
>  lib/newlib_tests/test_macros01.c |  40 ++++++++++
>  lib/newlib_tests/test_macros02.c |  42 ++++++++++
>  lib/newlib_tests/test_macros03.c |  40 ++++++++++
>  lib/tst_test.c                   |   1 +
>  7 files changed, 258 insertions(+), 27 deletions(-)
>  create mode 100644 include/tst_test_macros.h
>  create mode 100644 lib/newlib_tests/test_macros01.c
>  create mode 100644 lib/newlib_tests/test_macros02.c
>  create mode 100644 lib/newlib_tests/test_macros03.c
> 
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> new file mode 100644
> index 000000000..69de2ce3d
> --- /dev/null
> +++ b/include/tst_test_macros.h
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2015-2020 Cyril Hrubis <chrubis@suse.cz>
> + */
> +
> +#ifndef TST_TEST_MACROS_H__
> +#define TST_TEST_MACROS_H__
> +
> +#define TEST(SCALL) \
> +	do { \
> +		errno = 0; \
> +		TST_RET = SCALL; \
> +		TST_ERR = errno; \
> +	} while (0)
> +
> +#define TEST_VOID(SCALL) \
> +	do { \
> +		errno = 0; \
> +		SCALL; \
> +		TST_ERR = errno; \
> +	} while (0)
> +
> +extern long TST_RET;
> +extern int TST_ERR;
> +extern int TST_PASS;
> +
> +extern void *TST_RET_PTR;
> +
> +#define TESTPTR(SCALL) \
> +	do { \
> +		errno = 0; \
> +		TST_RET_PTR = (void*)SCALL; \
> +		TST_ERR = errno; \
> +	} while (0)
> +
> +
> +#define TEST_2(_1, _2, ...) _2
> +
> +#define TEST_FMT_(FMT, _1, ...) FMT, ##__VA_ARGS__
> +
> +#define TEST_MSG(RES, FMT, SCALL, ...) \
> +	tst_res_(__FILE__, __LINE__, RES, \
> +		TEST_FMT_(TEST_2(dummy, ##__VA_ARGS__, SCALL) FMT, __VA_ARGS__))
> +
> +#define TEST_MSGP(RES, FMT, PAR, SCALL, ...) \
> +	tst_res_(__FILE__, __LINE__, RES, \
> +		TEST_FMT_(TEST_2(dummy, ##__VA_ARGS__, SCALL) FMT, __VA_ARGS__), PAR)
> +
> +#define TEST_FD(SCALL, ...)                                                    \

I'd recommend adding TEST_*_IMPL() variant with extra arguments that'll
allow special handling of ENOSYS, ENOTSUP and possibly also a
zero-terminated array of allowed errnos. TEST_FD() etc. would then call
the respective IMPL macro with default arguments:

#define TEST_FD_IMPL(SCALL, NOSYS_RES, NOTSUP_RES, ERRNO_LIST, ...) \
    ...

#define TEST_FD(SCALL, ...) \
    TEST_FD_IMPL((SCALL), TFAIL, TFAIL, NULL, ##__VA_ARGS__)

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
