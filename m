Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM9sLuggcmmPdQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 14:06:48 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D0E67080
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 14:06:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCC403CB5C8
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 14:06:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF3D33CB3B1
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 14:06:44 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4A7211A00A54
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 14:06:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 72090336D7;
 Thu, 22 Jan 2026 13:06:43 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2881913533;
 Thu, 22 Jan 2026 13:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ISD5A+IgcmlILQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 22 Jan 2026 13:06:42 +0000
Date: Thu, 22 Jan 2026 14:06:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20260122130634.GA71214@pevik>
References: <20260122102606.87754-1-liwang@redhat.com>
 <CAASaF6w3S2STiyS9LvOsK_uVEvRoO6uq=XNMG-cMNheC0k1RHg@mail.gmail.com>
 <20260122123154.GC64562@pevik>
 <CAEemH2c8+X85Ac-oPtsOND=OW=YHvx1R_TNctTThfskKhgOP9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c8+X85Ac-oPtsOND=OW=YHvx1R_TNctTThfskKhgOP9Q@mail.gmail.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] clone10: add support archs
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,linux.it:url]
X-Rspamd-Queue-Id: 45D0E67080
X-Rspamd-Action: no action

> Petr Vorel <pvorel@suse.cz> wrote:

> > > Acked-by: Jan Stancek <jstancek@redhat.com>

> > LGTM. Indeed only these 3 archs don't TCONF.
> > Acked-by: Petr Vorel <pvorel@suse.cz>

> > Out of curiosity, where is the support defined in kernel?
> > "if (clone_flags & CLONE_SETTLS)" is in many archs:

> Not based on this, the clone10.c test was written and gets tested
> only on the known archs (x86_64, s390x, aarch64) by now.

> And in case that other archs (not tested) have different behavior like i386,
> so we are limited to the know/tested archs.

> If we can get another arch to verified we can add it to the
> .supported_archs as well.

> $ cat -n ltp/include/lapi/tls.h
>     ...
>     53 static inline void init_tls(void)
>     54 {
>     55     #if defined(__x86_64__) || defined(__aarch64__) || defined(__s390x__)
>     56     tls_ptr = allocate_tls_area();
>     57 #else
>     ...

include/lapi/tls.h

static inline void init_tls(void)
{
#if defined(__x86_64__) || defined(__aarch64__) || defined(__s390x__)
	tls_ptr = allocate_tls_area();
#else
	tst_brk(TCONF, "Unsupported architecture for TLS");
#endif

I see. First IMHO the message in include/lapi/tls.h is pretty misleading. It
does not look to me as a test limitation, but as a missing arch support in
kernel.  IMHO the message should have been something like:

tst_brk(TCONF, "Test not supported only architecture");

(i.e. to mention "test")

Also having arch listed in the test and also in tls.h is redundant.
IMHO it should be only on a single place.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
