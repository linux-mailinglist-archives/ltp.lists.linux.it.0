Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7304D17953F
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 17:29:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68E413C664E
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 17:29:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B13703C65E2
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 17:29:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3FFC014016FA
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 17:28:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A6ADB4FB
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:28:59 +0000 (UTC)
Date: Wed, 4 Mar 2020 17:28:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200304162857.GA30492@dell5510>
References: <20200304151201.19117-1-pvorel@suse.cz>
 <b42e93cb-b06d-538c-a5ff-1d110ed8ce74@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b42e93cb-b06d-538c-a5ff-1d110ed8ce74@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Please split the following code off to a separate .c file:
OK, I'll do :). We had some discussions about it, I remember problems caused by
using lapi files in the library headers (tst_device.h), I'd consider ok having
just header tst_safe_timerfd.h unless it's loaded by library itself, but
somebody could do it later. And I also consider it as a cleaner solution
(hoping that linker will really drop unused symbols).

> > +#include <errno.h>
> > +#include "lapi/timerfd.h"
> > +#include "tst_test.h"
> > +
> > +#define TTYPE (errno == ENOTSUP ? TCONF : TBROK)
> > +
> > +static inline int safe_timerfd_create(const char *file, const int lineno,
> > +				      int clockid, int flags)
> > +{
> > +	int fd;
> > +

> Don't forget to clear errno when you're not using the TEST() macro.
Do you think it's necessary? I've noticed you clear errno here in original test,
but I'd expect errno is be set if (fd < 0).
But ok, it's done in some macros (tst_safe_macros.c, safe_macros.c)

> > +	if (tst_kvercmp(2, 6, 26) <= 0)
> > +		flags = 0;

> I think tst_brk(TCONF) would be better here. Or at least tst_res(TWARN),
> since resetting flags to 0 may render some tests useless.
Well, this is just to keep test working under 2.6.25 and .26. Obviously it
would not affect many users, but these would got broken these tests
timerfd01.c (all)
timerfd_settime01.c (3th and 4rd test)
timerfd_settime02.c (not sure whether this old version is really affected by
CVE-2017-10661)

break all tests). Agree that hiding it is not good.

> > +
> > +	rval = timerfd_settime(fd, flags, new_value, old_value);
> > +	if (rval < 0) {
> > +		tst_brk(TTYPE | TERRNO, "%s:%d: timerfd_settime() failed",
> > +			file, lineno);
> > +	}
> > +
> > +	return rval;
> > +}

> Split off up to here.
I guess you mean that macros should be kept in header (sure).

> > +
> > +#define SAFE_TIMERFD_CREATE(clockid, flags)\
> > +	safe_timerfd_create(__FILE__, __LINE__, (clockid), (flags))
> > +
> > +#define SAFE_TIMERFD_GETTIME(fd, curr_value)\
> > +	safe_timerfd_gettime(__FILE__, __LINE__, (fd), (curr_value))
> > +
> > +#define SAFE_TIMERFD_SETTIME(fd, flags, new_value, old_value)\
> > +	safe_timerfd_settime(__FILE__, __LINE__, (fd), (flags), (new_value), \
> > +						 (old_value))
> > +
> > +#endif /* SAFE_TIMERFD_H__ */

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
