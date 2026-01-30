Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC/yNO76e2n4JgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:27:26 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D5B5E76
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:27:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 995B63CBE37
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:27:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E31FE3CB429
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 01:27:22 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 26D3A20015B
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 01:27:21 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 73C945BCF3;
 Fri, 30 Jan 2026 00:27:21 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BED23EA61;
 Fri, 30 Jan 2026 00:27:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h078Aen6e2mKfAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 30 Jan 2026 00:27:21 +0000
Date: Fri, 30 Jan 2026 01:27:19 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20260130002719.GB120546@pevik>
References: <20251215161353.GA282302@pevik>
 <DEYXGZU8IXPQ.2N0IS65HUZ0LI@suse.com>
 <20251215165247.GC282302@pevik>
 <DF171554SNRA.2CKR0Q3FLG2TU@suse.com>
 <CABeuJB2TJ4bQDX709-sLO0tb0acYH770kS6X5zXMh0V0M3Yt-w@mail.gmail.com>
 <aV6DCbns02E4BCTj@yuki.lan> <20260107160656.GB791855@pevik>
 <aV6G0gxYWHSFkls0@yuki.lan>
 <CAASaF6wOSvi+07Pq5O6+f1Hkrq6WWMgpCaooJxWrO9uOvRM3pw@mail.gmail.com>
 <aXt3cKet0G4d0oF0@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXt3cKet0G4d0oF0@yuki.lan>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] ioctl_pidfd02-06: Add CONFIG_USER_NS and
 CONFIG_PID_NS to needs_kconfigs
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
Cc: Ricardo Branco <rbranco@suse.com>, Martin Doucha <martin.doucha@suse.com>,
 ltp@lists.linux.it, Terry Tritton <terry.tritton@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_NA(0.00)[suse.cz];
	REPLYTO_EQ_FROM(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.cz:replyto]
X-Rspamd-Queue-Id: 553D5B5E76
X-Rspamd-Action: no action

Hi all,

[ Cc Martin ]

> Hi!
> > > > Because that was my question - really always prefer kconfig even there is a
> > > > simple runtime solution? I'd like to have some "rule" like conclusion we can
> > > > point during review.

> > > I think that from a long term view this is going to be simpler solution
> > > than having many different types of checks. The less diverse these
> > > checks are the easier they are to review and maintain. Hence I lean
> > > towards kernel config checks even though they are slower (mostly
> > > unmeasurable on today's harware) than the alternatives.

> > I think I lean opposite way, and rather have a check for right
> > environment to support the test.
> > You can have feature X enabled in kernel config, but still disabled
> > later at boot/runtime
> > (e.g. max_user_namespaces=0), or a module simply not being loaded.

> That is a good catch.

> Maybe the best way forward would be to add hooks for certain config
> options into the LTP kernel config parser that would do additional
> runtime checks. That way we would have both the information on which
> kernel configs should be enabled in test metadata as well as runtime
> checks.

I like the idea: having metadata doc + runtime check is nice.

FYI (I know you all watch GitHub PR but just in case) to document that for some
tests require more things to check, e.g. kconfig + min_kver:
https://github.com/linux-test-project/ltp/pull/1285

Kind regards,
Petr

> What about eventually adding something as:

> diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
> index 9bcd57721..f6abe6cc7 100644
> --- a/lib/tst_kconfig.c
> +++ b/lib/tst_kconfig.c
> @@ -110,6 +110,18 @@ static void close_kconfig(FILE *fp)
>                 fclose(fp);
>  }

> +static void runtime_check(struct tst_kconfig_var *var)
> +{
> +       if (strstr(var->id, "CONFIG_USER_NS")) {
> +               if (!tst_user_ns_enabled()) {
> +                       tst_res(TINFO, "CONFIG_USER_NS present but runtime is disabled");
> +                       var->val = 'n';
> +               }
> +       } else if (...)
> +               ...
> +       }
> +}
> +
>  static inline int kconfig_parse_line(const char *line,
>                                       struct tst_kconfig_var *vars,
>                                       unsigned int vars_len)
> @@ -183,9 +195,11 @@ out:
>                         switch (val[0]) {
>                         case 'y':
>                                 vars[i].choice = 'y';
> +                               runtime_check(&vars[i]);
>                                 return 1;
>                         case 'm':
>                                 vars[i].choice = 'm';
> +                               runtime_check(&vars[i]);
>                                 return 1;
>                         }
>                 }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
