Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 654839F7BF7
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2024 14:07:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 160E03ED411
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2024 14:07:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 036E23ED428
 for <ltp@lists.linux.it>; Thu, 19 Dec 2024 14:07:42 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DCEC8661030
 for <ltp@lists.linux.it>; Thu, 19 Dec 2024 14:07:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C7F82115C;
 Thu, 19 Dec 2024 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1734613660;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cH5qD2Y6rjbEesvEcB4JpKkJFdZb4KmhZ/RAy3zuIg4=;
 b=wpxiUCuSm71AwIMEzP94GCYpXzqKSLMzw8+XBUnHlkGW5jzDql+Kvl9cir2Hw6NQxZnKxu
 WVvntwER20H/Wgj6shxxFKkkYMwNaArrF2rnKN9seHZu1WhbLZGpe2xxl6wbVmAKg4vd0B
 n9xCdExmWIhFixVJoXe4RhT4KvyZLmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1734613660;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cH5qD2Y6rjbEesvEcB4JpKkJFdZb4KmhZ/RAy3zuIg4=;
 b=FtK+UfdJINnPdbSX0bzBfXV4tXc4HnhvlrMX2rwcWmgvCvQ9ZWotxN4+e1mUHNw0dYc6Fy
 aMu7NxdPste5HIDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1734613659;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cH5qD2Y6rjbEesvEcB4JpKkJFdZb4KmhZ/RAy3zuIg4=;
 b=FXrYFz5AowzDlgqPoyvC4D6/lYdkc1/dLgHywKvUv7RHFXGqHRpSNnknmqoqqFGgGTB/VG
 SoR+wHAx1i6K7oflj5YpLpcyqfELdGTUJFlBLhhjRefwy5irv0VVK7l9euXCPdFONa7aX1
 beMUsdnvSXXyruCZUFGeNcnWpAPiQ8U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1734613659;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cH5qD2Y6rjbEesvEcB4JpKkJFdZb4KmhZ/RAy3zuIg4=;
 b=+ClwxbZuS7pqqlrfse0eUOeyEgJDFpXGFgIKFkz/u7WXj21tXG00X+/hPF4ro2AqjwKpTe
 N9Ywchvv69Gf4lBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C43313A32;
 Thu, 19 Dec 2024 13:07:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZPNJGZsaZGddEQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 19 Dec 2024 13:07:39 +0000
Date: Thu, 19 Dec 2024 14:07:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20241219130738.GA111004@pevik>
References: <20241212060448.204158-1-liwang@redhat.com>
 <b6da77f3-45d6-4eed-b2d3-90ad20c63e50@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6da77f3-45d6-4eed-b2d3-90ad20c63e50@suse.cz>
X-Spam-Score: -7.50
X-Spamd-Result: default: False [-7.50 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH V3] lib: multiply the max_runtime if detect slow
 kconfigs
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

> Hi!

> On 12. 12. 24 7:04, Li Wang wrote:
> > The method adjusts the max_runtime for test cases by multiplying
> > it by a factor (4x) if any slower kernel options are detected.
> > Debug kernel configurations (such as CONFIG_KASAN, CONFIG_PROVE_LOCKING, etc.)
> > are known to degrade performance, and this adjustment ensures
> > that tests do not fail prematurely due to timeouts.

> > As Cyril pointed out that a debug kernel will typically run
> > slower by a factor of N, and while determining the exact value
> > of N is challenging, so a reasonable upper bound is sufficient
> > for practical purposes.

> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >   include/tst_kconfig.h | 13 +++++++++++++
> >   lib/tst_kconfig.c     | 39 +++++++++++++++++++++++++++++++++++++++
> >   lib/tst_test.c        |  3 +++
> >   3 files changed, 55 insertions(+)

> > <snip>

> > diff --git a/lib/tst_test.c b/lib/tst_test.c
> > index 8db554dea..f4e667240 100644
> > --- a/lib/tst_test.c
> > +++ b/lib/tst_test.c
> > @@ -555,6 +555,9 @@ static int multiply_runtime(int max_runtime)
> >   	parse_mul(&runtime_mul, "LTP_RUNTIME_MUL", 0.0099, 100);
> > +	if (tst_has_slow_kconfig())
> > +		max_runtime *= 4;
> > +
> >   	return max_runtime * runtime_mul;
> >   }

> We have plenty of tests which keep looping until they run out of runtime and
> then automatically stop. These tests are not at risk of timing out and this
> patch only makes them run 3 times longer than necessary.

> I'd recommend temporarily reverting this patch and adding it back with a new
> tst_test flag to identify tests which exit when runtime expires.

+1. Li, could you please do it?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
