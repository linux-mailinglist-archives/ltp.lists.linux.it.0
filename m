Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE7517A803
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 15:46:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED43B3C6559
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 15:46:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 748303C6527
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 15:46:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B9C291A01CD6
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 15:46:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6297AD82
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:46:06 +0000 (UTC)
Date: Thu, 5 Mar 2020 15:46:06 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200305144606.GC28363@rei>
References: <20200305143658.26584-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305143658.26584-1-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add TST_ASSERT_SYSCALL*() macros
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
> +/* assert that syscall returned only 0 and nothing else */
> +#define TST_ASSERT_SYSCALL(SCALL) \
> +	TST_ASSERT_SYSCALL_IMPL(SCALL, __FILE__, __LINE__)
> +
> +#define TST_ASSERT_SYSCALL_IMPL(SCALL, FILENAME, LINENO) \
> +	({ \
> +		int _tst_ret; \
> +		errno = 0; \
> +		_tst_ret = SCALL; \
> +		if (_tst_ret == -1) { \
> +			int _tst_ttype = errno == ENOTSUP ? TCONF : TBROK; \
> +			tst_brk(_tst_ttype | TERRNO, "%s:%d " # SCALL \
                                                              ^
				I do not think that is reasonable to
				simply stringify the syscall, we are
				adding pretty printers for the syscall
				parameters and this change is backward.

These two patches are actually removing the pretty printer for the clock
id for the timerfd_create(). I do not like that.

> +				" failed", FILENAME, LINENO); \
> +		} \
> +		if (_tst_ret != 0) { \
> +			tst_brk(TBROK | TERRNO, "%s:%d " # SCALL \
> +				" returned invalid value %d", FILENAME, \
> +				LINENO, _tst_ret); \
> +		} \
> +		_tst_ret; \
> +	})
> +
> +/*
> + * assert that syscall returned any non-negative value (e.g. valid file
> + * descriptor)
> + */
> +#define TST_ASSERT_SYSCALL_FD(SCALL) \
> +	TST_ASSERT_SYSCALL_FD_IMPL(SCALL, __FILE__, __LINE__)
> +
> +#define TST_ASSERT_SYSCALL_FD_IMPL(SCALL, FILENAME, LINENO) \
> +	({ \
> +		int _tst_ret; \
> +		errno = 0; \
> +		_tst_ret = SCALL; \
> +		if (_tst_ret == -1) { \
> +			int _tst_ttype = errno == ENOTSUP ? TCONF : TBROK; \
> +			tst_brk(_tst_ttype | TERRNO, "%s:%d " # SCALL \
> +				" failed", FILENAME, LINENO); \
> +		} \
> +		if (_tst_ret < 0) { \
> +			tst_brk(TBROK | TERRNO, "%s:%d " # SCALL \
> +				" returned invalid value %d", FILENAME, \
> +				LINENO, _tst_ret); \
> +		} \
> +		_tst_ret; \
> +	})
> +
>  /*
>   * Functions to convert ERRNO to its name and SIGNAL to its name.
>   */
> -- 
> 2.25.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
