Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0EAA0C3E7
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jan 2025 22:40:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34BDF3C79AE
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jan 2025 22:40:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4178F3C1BCE
 for <ltp@lists.linux.it>; Mon, 13 Jan 2025 22:40:21 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 31D2F21BDA8
 for <ltp@lists.linux.it>; Mon, 13 Jan 2025 22:40:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD46B2116D;
 Mon, 13 Jan 2025 21:40:18 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D36D13876;
 Mon, 13 Jan 2025 21:40:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7HogDT6IhWcUPQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 13 Jan 2025 21:40:14 +0000
Date: Mon, 13 Jan 2025 22:40:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20250113214010.GA512384@pevik>
References: <20241217061636.16366-1-wegao@suse.com>
 <20250113081622.28942-1-wegao@suse.com>
 <20250113081622.28942-2-wegao@suse.com> <Z4U5C3tHhDQ_pQTv@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4U5C3tHhDQ_pQTv@yuki.lan>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: BD46B2116D
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 1/2] ptrace05: Refactor the test using new LTP
 API
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

Hi Cyril, Wei,
> Hi!
> > +static void print_dbg_sig(int signum)
> >  {
> > -	fprintf(stderr, "usage: %s [start-signum] [end-signum]\n", argv0);
> > -	return 1;
> > +	char const *strsig = tst_strsig(signum);
> > +
> > +	if (strstr(strsig, "???"))
> > +		tst_res(TDEBUG, "[child] Sending kill(.., %d)", signum);
> > +	else
> > +		tst_res(TDEBUG, "[child] Sending kill(.., %s)", strsig);
> >  }

> This works around the library defficiencies. I would rather see patch
> that changes the tst_strsig() return the number if we do not have a
> match.

Good point.

> This should work:

> diff --git a/lib/tests/tst_strsig.c b/lib/tests/tst_strsig.c
> index 9a5ca80aa..ed5be3f00 100644
> --- a/lib/tests/tst_strsig.c
> +++ b/lib/tests/tst_strsig.c
> @@ -29,6 +29,7 @@ int TST_TOTAL = 1;

>  int main(void)
>  {
> +       fprintf(stderr, "0 = %s\n", tst_strsig(0));
>         fprintf(stderr, "SIGKILL = %s\n", tst_strsig(SIGKILL));
>         fprintf(stderr, "SIGALRM = %s\n", tst_strsig(SIGALRM));
>         return 0;
> diff --git a/lib/tst_res.c b/lib/tst_res.c
> index 7c66d2f6c..90403bc67 100644
> --- a/lib/tst_res.c
> +++ b/lib/tst_res.c
> @@ -141,11 +141,14 @@ struct pair {
>  #define PAIR(def) [def] = {.name = #def, .val = def},
>  #define STRPAIR(key, value) [key] = {.name = value, .val = key},

> -#define PAIR_LOOKUP(pair_arr, idx) do {                       \
> -       if (idx < 0 || (size_t)idx >= ARRAY_SIZE(pair_arr) || \
> -           pair_arr[idx].name == NULL)                       \
> -               return "???";                                 \
> -       return pair_arr[idx].name;                            \
> +#define PAIR_LOOKUP(pair_arr, idx) do {                                    \
> +       static char par_str_buf__[16];                                     \
> +       if (idx < 0 || (size_t)idx >= ARRAY_SIZE(pair_arr) ||              \
> +           pair_arr[idx].name == NULL) {                                  \
> +               snprintf(par_str_buf__, sizeof(par_str_buf__), "%i", idx); \
> +               return par_str_buf__;                                      \
> +       }                                                                  \
> +       return pair_arr[idx].name;                                         \
>  } while (0)

For this library change:
Reviewed-by: Petr Vorel <pvorel@suse.cz>

This makes sense. Could you please for speedup merge this library change,
so that Wei can base v6 on it?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
