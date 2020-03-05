Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 362BA17A31B
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 11:28:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E31503C6502
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 11:28:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 87D623C64E0
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 11:28:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0FE3E1A011DA
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 11:28:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48C22B1D1
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 10:28:53 +0000 (UTC)
Date: Thu, 5 Mar 2020 11:28:52 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200305102852.GB28363@rei>
References: <20200304183806.17672-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304183806.17672-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add safe timerfd macros
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
>  include/tst_safe_timerfd.h | 32 +++++++++++++++++++++
>  lib/tst_safe_timerfd.c     | 59 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 include/tst_safe_timerfd.h
>  create mode 100644 lib/tst_safe_timerfd.c
> 
> diff --git a/include/tst_safe_timerfd.h b/include/tst_safe_timerfd.h
> new file mode 100644
> index 000000000..526f12838
> --- /dev/null
> +++ b/include/tst_safe_timerfd.h
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> + */
> +
> +#ifndef TST_SAFE_TIMERFD_H__
> +#define TST_SAFE_TIMERFD_H__
> +
> +#include "lapi/timerfd.h"
> +
> +int safe_timerfd_create(const char *file, const int lineno,
> +				      int clockid, int flags);
> +
> +#define SAFE_TIMERFD_CREATE(clockid, flags)\
> +	safe_timerfd_create(__FILE__, __LINE__, (clockid), (flags))
> +
> +int safe_timerfd_gettime(const char *file, const int lineno,
> +				int fd, struct itimerspec *curr_value);
> +
> +#define SAFE_TIMERFD_GETTIME(fd, curr_value)\
> +	safe_timerfd_gettime(__FILE__, __LINE__, (fd), (curr_value))
> +
> +int safe_timerfd_settime(const char *file, const int lineno,
> +				int fd, int flags,
> +				const struct itimerspec *new_value,
> +				struct itimerspec *old_value);
> +
> +#define SAFE_TIMERFD_SETTIME(fd, flags, new_value, old_value)\
> +	safe_timerfd_settime(__FILE__, __LINE__, (fd), (flags), (new_value), \
> +						 (old_value))
> +
> +#endif /* SAFE_TIMERFD_H__ */
> diff --git a/lib/tst_safe_timerfd.c b/lib/tst_safe_timerfd.c
> new file mode 100644
> index 000000000..80de87ad3
> --- /dev/null
> +++ b/lib/tst_safe_timerfd.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> + */
> +
> +#include <errno.h>

Errno is include in tst_test.h.

> +#include "tst_safe_timerfd.h"
> +#include "lapi/timerfd.h"
> +#include "tst_clocks.h"
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +
> +#define TTYPE (errno == ENOTSUP ? TCONF : TBROK)
> +
> +int safe_timerfd_create(const char *file, const int lineno,
> +				      int clockid, int flags)
> +{
> +	int fd;
> +
> +	fd = timerfd_create(clockid, flags);
> +
> +	if (fd == -1) {

See the other email about the return values.

Other than that this looks good.

> +		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_create(%s) failed",
> +			file, lineno, tst_clock_name(clockid));
> +	}
> +
> +	return fd;
> +}
> +
> +int safe_timerfd_gettime(const char *file, const int lineno,
> +				int fd, struct itimerspec *curr_value)
> +{
> +	int rval;
> +
> +	rval = timerfd_gettime(fd, curr_value);
> +	if (rval == -1) {
> +		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_gettime() failed",
> +			file, lineno);
> +	}
> +
> +	return rval;
> +}
> +
> +int safe_timerfd_settime(const char *file, const int lineno,
> +				int fd, int flags,
> +				const struct itimerspec *new_value,
> +				struct itimerspec *old_value)
> +{
> +	int rval;
> +
> +	rval = timerfd_settime(fd, flags, new_value, old_value);
> +	if (rval == -1) {
> +		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_settime() failed",
> +			file, lineno);
> +	}
> +
> +	return rval;
> +}
> -- 
> 2.25.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
