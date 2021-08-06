Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF303E2319
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 07:55:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 660593C7AEE
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 07:55:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D6FC13C009D
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 07:55:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A40191400BC8
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 07:55:21 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD29C22320;
 Fri,  6 Aug 2021 05:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628229320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZvJ5hnjwAmh7NlhVL06MX2rIOSM7F70nJ4gOvu+hfo0=;
 b=sw5OLbEEjnh1xC2y0SpZM9t0WIE2+KF1F+egSXe4eeQrINREDPyrSbQx9DUY9yEkU9B2+p
 yIQFRpiGKBAc1RTONIhrTGQve43O5JUyGWi3fHKRwuy+3ng0tOUlEkV5F396/1SyP4cplx
 UK64fd5K6qKYLfF1x1V3TrW0Yqu4IG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628229320;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZvJ5hnjwAmh7NlhVL06MX2rIOSM7F70nJ4gOvu+hfo0=;
 b=NLQgrZlBbYvtjDHsThZcAFp1XPhTjwc8GnEpnk+MH/Z2lXlHS788Iv2bcYcMGiFu2PIhg7
 V/KEStITcdCjNrDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 862E213963;
 Fri,  6 Aug 2021 05:55:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id KBs/HcjODGEAewAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 06 Aug 2021 05:55:20 +0000
Date: Fri, 6 Aug 2021 07:55:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it,
 Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YQzOxg35JjpDOj7X@pevik>
References: <20210806025659.1962902-1-liwang@redhat.com>
 <YQzLUUKbLcoJjRVb@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQzLUUKbLcoJjRVb@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] setsockopt08: includes netinet/in.h
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Cyril,

> Hi Li,

> > We have to put netinet/in.h on the top to get rid of conflict
> > of glibc and kernel headers for old unbuntu.

> >   -----------
> >   /usr/include/linux/in.h:28:3: error: redeclaration of enumerator 'IPPROTO_IP'
> >         IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
> >    ^
> >   /usr/include/netinet/in.h:42:5: note: previous definition of 'IPPROTO_IP' was here
> >        IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
> >   ...
> >   -----------

> > See: https://www.mail-archive.com/netdev@vger.kernel.org/msg132711.html

> Thanks for fixing it, it's not a first time we got hit by this.
> I wonder where <linux/in.h> is included. It's not directly in setsockopt08.c,
> it must be in our lapi header. But it's not in tst_safe_net.h, not in
> safe_net_fn.h nor in tst_net.h and both actually include <netinet/in.h>, thus it must be
> before. But there is only tst_test.h.

> I'm asking because it'd be better to add <netinet/in.h> into header before
> <linux/in.h>.

OK, it's in lapi/ip_tables.h, which includes <linux/netfilter_ipv4/ip_tables.h>
which includes <linux/if.h>. But I wonder why inclusion of <netinet/in.h> from
safe_net_fn.h or in tst_net.h does not work. Anyway, I'll test including
<netinet/in.h> in include/lapi/ip_tables.h helps.

Kind regards,
Petr

> Kind regards,
> Petr

> > Fixes: ebf3a4fbd39a (Add setsockopt08, CVE-2021-22555)
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >  testcases/kernel/syscalls/setsockopt/setsockopt08.c | 2 ++
> >  1 file changed, 2 insertions(+)

> > diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> > index f758dcbdc..f7052f27b 100644
> > --- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> > +++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> > @@ -79,6 +79,8 @@
> >   *  - sizeof(struct xt_entry_target) = 32
> >   */

> > +#include <netinet/in.h>
> > +
> >  #include "tst_test.h"
> >  #include "tst_safe_net.h"
> >  #include "lapi/ip_tables.h"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
