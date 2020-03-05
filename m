Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB0F17AD71
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 18:42:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3899C3C652D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 18:42:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5EC303C64A2
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 18:42:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8A10B1004480
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 18:42:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BEABFADB3
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 17:42:06 +0000 (UTC)
Date: Thu, 5 Mar 2020 18:42:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200305174205.GA29517@dell5510>
References: <20200305151459.30341-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305151459.30341-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] Add TST_ASSERT_SYSCALL*() macros
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> These macros take care of the standard return value checking boilerplate
> in cases where the test cannot continue after error.

> - TST_ASSERT_SYSCALL() calls tst_brk() if retval != 0
> - TST_ASSERT_SYSCALL_FD() calls tst_brk() if retval < 0
Reviewed-by: Petr Vorel <pvorel@suse.cz>

What I like on these macros (besides DRY) is that it really shows the test, not
the library, see
before:
tst_safe_timerfd.c:21: BROK: timerfd01.c:89 timerfd_create(CLOCK_MONOTONIC) failed: EINVAL (22)
after:
timerfd01.c:89: BROK: timerfd_create(CLOCK_MONOTONIC) failed: EINVAL (22)

> +/* assert that syscall returned only 0 and nothing else */
> +#define TST_ASSERT_SYSCALL(SCALL) \
> +	TST_ASSERT_SYSCALL_IMPL(SCALL, __FILE__, __LINE__, #SCALL)
> +
> +#define TST_ASSERT_SYSCALL_IMPL(SCALL, FILENAME, LINENO, CALLSTR, ...) \
> +	({ \
> +		int _tst_ret; \
> +		errno = 0; \
> +		_tst_ret = SCALL; \
> +		if (_tst_ret == -1) { \
> +			int _tst_ttype = errno == ENOTSUP ? TCONF : TBROK; \
> +			tst_brk_(FILENAME, LINENO, _tst_ttype | TERRNO, \
> +				CALLSTR " failed", ##__VA_ARGS__); \
> +		} \
> +		if (_tst_ret != 0) { \
> +			tst_brk_(FILENAME, LINENO, TBROK | TERRNO, \
> +				CALLSTR " returned invalid value %d", \
> +				##__VA_ARGS__, _tst_ret); \
> +		} \
> +		_tst_ret; \
> +	})
> +
> +/*
> + * assert that syscall returned any non-negative value (e.g. valid file
> + * descriptor)
> + */
> +#define TST_ASSERT_SYSCALL_FD(SCALL) \
> +	TST_ASSERT_SYSCALL_FD_IMPL(SCALL, __FILE__, __LINE__, #SCALL)
> +
> +#define TST_ASSERT_SYSCALL_FD_IMPL(SCALL, FILENAME, LINENO, CALLSTR, ...) \
> +	({ \
> +		int _tst_ret; \
> +		errno = 0; \
> +		_tst_ret = SCALL; \
> +		if (_tst_ret == -1) { \
> +			int _tst_ttype = errno == ENOTSUP ? TCONF : TBROK; \
> +			tst_brk_(FILENAME, LINENO, _tst_ttype | TERRNO, \
> +				CALLSTR " failed", ##__VA_ARGS__); \
> +		} \
> +		if (_tst_ret < 0) { \
> +			tst_brk_(FILENAME, LINENO, TBROK | TERRNO, \
> +				CALLSTR " returned invalid value %d", \
> +				##__VA_ARGS__, _tst_ret); \
> +		} \
> +		_tst_ret; \
> +	})

I'd consider to add single implementation, which would be influenced with flags
Something like
if ((flags & TST_ASSERT_LT_0) && _tst_ret < 0 || _tst_ret != 0) \

But maybe some people will not like degreased readability with macro,
and using flags would make it even a bit harder to read.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
