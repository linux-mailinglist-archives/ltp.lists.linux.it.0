Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FE487CEC
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 16:42:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9CF83C1C96
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 16:42:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C503B3C14BF
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 16:42:21 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DC13E602181
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 16:42:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D840F51F04;
 Fri,  9 Aug 2019 14:42:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD21A5D6A9;
 Fri,  9 Aug 2019 14:42:18 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5B3518005A0;
 Fri,  9 Aug 2019 14:42:18 +0000 (UTC)
Date: Fri, 9 Aug 2019 10:42:18 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <1048151188.5768032.1565361738465.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190809122741.GC32115@rei.lan>
References: <20190808153825.18363-1-rpalethorpe@suse.com>
 <20190808153825.18363-2-rpalethorpe@suse.com>
 <20190809122741.GC32115@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.29]
Thread-Topic: capability: Introduce capability API
Thread-Index: L6j8sZnYNWA6fZUPEe7UI+UVpeobzw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 09 Aug 2019 14:42:18 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] capability: Introduce capability API
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
Cc: mmoese@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> >  include/tst_capability.h | 56 +++++++++++++++++++++++++++++
> >  include/tst_test.h       |  6 ++++
> >  lib/tst_capability.c     | 78 ++++++++++++++++++++++++++++++++++++++++
> >  lib/tst_test.c           |  3 ++
> >  4 files changed, 143 insertions(+)
> >  create mode 100644 include/tst_capability.h
> >  create mode 100644 lib/tst_capability.c
> 
> This is missing a documentation in the test-writing-guidelines I do
> expect that you will add that later on.
> 
> > diff --git a/include/tst_capability.h b/include/tst_capability.h
> > new file mode 100644
> > index 000000000..6342b667e
> > --- /dev/null
> > +++ b/include/tst_capability.h
> > @@ -0,0 +1,56 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
> > + */
> > +/**
> > + * @file tst_capability.h
> > + *
> > + * Limited capability operations without libcap.
> > + */
> > +
> > +#include <stdint.h>
> > +
> > +#include "lapi/syscalls.h"
>                ^
> 	       What is this needed for here?
> 
> > +#ifndef TST_CAPABILITY_H
> > +#define TST_CAPABILITY_H
> > +
> > +#ifndef CAP_SYS_ADMIN
> > +# define CAP_SYS_ADMIN        21
> > +#endif
> >
> > +#ifndef CAP_TO_MASK
> > +# define CAP_TO_MASK(x)      (1 << ((x) & 31))
> > +#endif
> 
> These bits should probably go to lapi/capability.h
> 
> > +#define TST_DROP 1
> > +#define TST_REQUIRE 1 << 1
> 
> Maybe these should be TST_CAP_DROP and TST_CAP_REQ
> 
> > +#define TST_CAP(action, capability) {action, capability, #capability}
> > +
> > +struct tst_cap_user_header {
> > +	uint32_t version;
> > +	int pid;
> > +};
> > +
> > +struct tst_cap_user_data {
> > +	uint32_t effective;
> > +	uint32_t permitted;
> > +	uint32_t inheritable;
> > +};
> 
> This two should probably go to lapi as well.
> 
> > +struct tst_cap {
> > +	uint32_t action;
> > +	uint32_t id;
> > +	char *name;
> > +};
> 
> I wonder if we should build a table of capability names for translation
> just as we do errnos and signals instead of storing the name here. But I
> guess that unless we will need a function to translate capabilitities
> into strings on runtime this approach is simpler.
> 
> > +int tst_capget(struct tst_cap_user_header *hdr,
> > +	       struct tst_cap_user_data *data);
> > +int tst_capset(struct tst_cap_user_header *hdr,
> > +	       const struct tst_cap_user_data *data);
> > +
> > +void tst_cap_action(struct tst_cap *cap);
> > +void tst_cap_setup(struct tst_cap *cap);
> > +
> > +#endif
> > diff --git a/include/tst_test.h b/include/tst_test.h
> > index cdeaf6ad0..84acf2c59 100644
> > --- a/include/tst_test.h
> > +++ b/include/tst_test.h
> > @@ -36,6 +36,7 @@
> >  #include "tst_sys_conf.h"
> >  #include "tst_coredump.h"
> >  #include "tst_buffers.h"
> > +#include "tst_capability.h"
> >  
> >  /*
> >   * Reports testcase result.
> > @@ -206,6 +207,11 @@ struct tst_test {
> >  	 * NULL-terminated array to be allocated buffers.
> >  	 */
> >  	struct tst_buffers *bufs;
> > +
> > +	/*
> > +	 * NULL-terminated array of capability settings
> > +	 */
> > +	struct tst_cap *caps;
> >  };
> >  
> >  /*
> > diff --git a/lib/tst_capability.c b/lib/tst_capability.c
> > new file mode 100644
> > index 000000000..d229491ae
> > --- /dev/null
> > +++ b/lib/tst_capability.c
> > @@ -0,0 +1,78 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
> > + */
> > +
> > +#define TST_NO_DEFAULT_MAIN
> > +#include "tst_test.h"
> > +#include "tst_capability.h"
> > +
> > +int tst_capget(struct tst_cap_user_header *hdr,
> > +	       struct tst_cap_user_data *data)
> > +{
> > +	return tst_syscall(__NR_capget, hdr, data);
> > +}
> > +
> > +int tst_capset(struct tst_cap_user_header *hdr,
> > +	       const struct tst_cap_user_data *data)
> > +{
> > +	return tst_syscall(__NR_capset, hdr, data);
> > +}
> > +
> > +void tst_cap_action(struct tst_cap *cap)
> > +{
> > +	struct tst_cap_user_header hdr = {
> > +		.version = 0x20080522,
> > +		.pid = tst_syscall(__NR_gettid),
> > +	};
> > +	struct tst_cap_user_data cur = { 0 };
> > +	struct tst_cap_user_data new = { 0 };
> > +	uint32_t mask = CAP_TO_MASK(cap->id);
> > +	uint32_t act = cap->action;
> > +
> > +	if (tst_capget(&hdr, &cur))
> > +		tst_brk(TBROK | TTERRNO, "tst_capget()");
> > +
> > +	new = cur;
> > +
> > +	switch (act) {
> > +	case TST_DROP:
> > +		if (cur.effective & mask) {
> > +			tst_res(TINFO, "Dropping %s(%d)",
> > +				cap->name, cap->id);
> > +			new.effective &= ~mask;
> > +			new.permitted &= ~mask;
> > +			new.inheritable &= ~mask;
> > +		}
> > +		break;
> > +	case TST_REQUIRE:
> > +		if (cur.permitted ^ mask) {
> > +			tst_brk(TCONF, "Need %s(%d)",
> > +				cap->name, cap->id);
> > +		} else if (cur.effective ^ mask) {
> > +			tst_res(TINFO, "Permitting %s(%d)",
> > +				cap->name, cap->id);
> > +			new.effective |= mask;
> > +			new.inheritable |= mask;
> > +		}
> > +		break;
> > +	default:
> > +		tst_brk(TBROK, "Unrecognised action %d", cap->action);
> > +	}
> > +
> > +	if (cur.effective != new.effective) {
> > +		if (tst_capset(&hdr, &new))
> > +			tst_brk(TBROK | TERRNO, "tst_capset(%s)", cap->name);
> > +	} else {
> > +		tst_res(TINFO, "No capability changes needed");
> > +	}
> > +}
> > +
> > +void tst_cap_setup(struct tst_cap *caps)
> > +{
> > +	struct tst_cap *cap;
> > +
> > +	for (cap = caps; cap->action; cap++) {
> > +		tst_cap_action(cap);
> > +	}
> 
> No need for the curly braces here :-).
> 
> > +}
> > diff --git a/lib/tst_test.c b/lib/tst_test.c
> > index 8dc71dbb3..62e54d071 100644
> > --- a/lib/tst_test.c
> > +++ b/lib/tst_test.c
> > @@ -893,6 +893,9 @@ static void do_test_setup(void)
> >  
> >  	if (main_pid != getpid())
> >  		tst_brk(TBROK, "Runaway child in setup()!");
> > +
> > +	if (tst_test->caps)
> > +		tst_cap_setup(tst_test->caps);
> >  }
> 
> Other than the minor things and missing docs this patch looks good to me.

+1, but please rebase it on latest master.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
