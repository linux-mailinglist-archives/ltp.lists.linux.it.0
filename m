Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDllIRf2lmndrQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:37:59 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 356EB15E568
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:37:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8C423D072D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 12:37:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 57B1E3C634E
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 12:37:47 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4992710008F6
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 12:37:46 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E2C743E6DB;
 Thu, 19 Feb 2026 11:37:45 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1A283EA65;
 Thu, 19 Feb 2026 11:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DdESLgn2lmliOQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 19 Feb 2026 11:37:45 +0000
Date: Thu, 19 Feb 2026 12:37:46 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <aZb2CpwcJnK1LBrM@yuki.lan>
References: <20260128002828.424-1-wegao@suse.com>
 <DGI4KQCXESV5.5PGMWF4DXPA3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DGI4KQCXESV5.5PGMWF4DXPA3@suse.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] mseal02: Handle multiple errnos for 32-bit
 compat mode
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	NEURAL_HAM(-0.00)[-0.992];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.cz:email,yuki.lan:mid,linux.it:url]
X-Rspamd-Queue-Id: 356EB15E568
X-Rspamd-Action: no action

Hi!
> > In 32-bit compat mode, the overflow_size (calculated using a 32-bit ULONG_MAX)
> > does not cause a 64-bit integer wrap-around when added to the start address.
> > Consequently, the kernel see valid range that points to unmapped space, returning
> > ENOMEM instead of the expected EINVAL.
> >
> > Signed-off-by: Wei Gao <wegao@suse.com>
> > ---
> >  testcases/kernel/syscalls/mseal/mseal02.c | 20 +++++++++++---------
> >  1 file changed, 11 insertions(+), 9 deletions(-)
> >
> > diff --git a/testcases/kernel/syscalls/mseal/mseal02.c b/testcases/kernel/syscalls/mseal/mseal02.c
> > index e11d7dbf4..d941f6c40 100644
> > --- a/testcases/kernel/syscalls/mseal/mseal02.c
> > +++ b/testcases/kernel/syscalls/mseal/mseal02.c
> > @@ -21,6 +21,8 @@
> >  #include "tst_test.h"
> >  #include "lapi/syscalls.h"
> >  
> > +#define MAX_ERRNOS 5
> > +
> >  static void *start_addr, *unaligned_start_addr, *unallocated_start_addr, *unallocated_end_addr;
> >  static size_t page_size, twopages_size, fourpages_size, overflow_size;
> >  
> > @@ -28,22 +30,22 @@ static struct tcase {
> >  	void **addr;
> >  	size_t *len;
> >  	unsigned long flags;
> > -	int exp_err;
> > +	int exp_errs[MAX_ERRNOS];
> >  } tcases[] = {
> > -	{&start_addr, &page_size, ULONG_MAX, EINVAL},
> > -	{&unaligned_start_addr, &page_size, 0, EINVAL},
> > -	{&start_addr, &overflow_size, 0, EINVAL},
> > -	{&unallocated_start_addr, &twopages_size, 0, ENOMEM},
> > -	{&unallocated_end_addr, &twopages_size, 0, ENOMEM},
> > -	{&start_addr, &fourpages_size, 0, ENOMEM},
> > +	{&start_addr, &page_size, ULONG_MAX, {EINVAL}},
> > +	{&unaligned_start_addr, &page_size, 0, {EINVAL}},
> > +	{&start_addr, &overflow_size, 0, {EINVAL, ENOMEM}},
> > +	{&unallocated_start_addr, &twopages_size, 0, {ENOMEM}},
> > +	{&unallocated_end_addr, &twopages_size, 0, {ENOMEM}},
> > +	{&start_addr, &fourpages_size, 0, {ENOMEM}},
> >  };
> >  
> >  static void run(unsigned int n)
> >  {
> >  	struct tcase *tc = &tcases[n];
> >  
> > -	TST_EXP_FAIL(tst_syscall(__NR_mseal, *tc->addr, *tc->len, tc->flags), tc->exp_err,
> > -		"mseal(%p, %lu, %lu)", *tc->addr, *tc->len, tc->flags);
> > +	TST_EXP_FAIL2_ARR(tst_syscall(__NR_mseal, *tc->addr, *tc->len, tc->flags),
> > +		tc->exp_errs, MAX_ERRNOS, "mseal(%p, %lu, %lu)", *tc->addr, *tc->len, tc->flags);
> >  }
> >  
> >  static void setup(void)
> 
> Instead of checking multiple errno, you should pass the right type
> according to the architecture.

That would be slightly more complex here since the problem happens only
in compat mode, which can be only detected at runtime with
tst_is_compat_mode(). We would have to call that in the test setup and
adjust expectations accordinlgy.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
