Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2748372C54
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 16:45:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D62E3C58FF
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 16:45:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C94CA3C57E8
 for <ltp@lists.linux.it>; Tue,  4 May 2021 16:45:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 30A7B200213
 for <ltp@lists.linux.it>; Tue,  4 May 2021 16:45:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78297B06A;
 Tue,  4 May 2021 14:45:01 +0000 (UTC)
Date: Tue, 4 May 2021 16:44:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJFd6x+P7lFhLfXm@pevik>
References: <20210504125729.18781-1-pvorel@suse.cz>
 <YJFH4vLeaXnc8mzN@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJFH4vLeaXnc8mzN@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/1] docparse: Escape backslash,
 tab and double quote in JSON
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > +static inline void data_fprintf_esc(FILE *f, unsigned int padd, const char *str)
> > +{
> > +	while (padd-- > 0)
> > +		fputc(' ', f);
> > +
> > +	fputc('"', f);
> > +
> > +	while (*str) {
> > +		switch (*str) {
> > +		case '\\':
> > +			fputs("\\\\", f);
> > +			break;
> > +		case '"':
> > +			fputs("\\\"", f);
> > +			break;
> > +		case '\t':
> > +			fputs("\\t", f);
> > +			break;
> > +		default:
> > +			putc(*str, f);
> > +			break;
> > +		}
> > +		str++;
> > +	}
> > +
> > +	fputc('"', f);
> > +}

> Also does this even escape newlines? If you write "\n" in C it's stored
> in memory as [0x0a, 0x00], no actual \ are stored in the string. What
> the '\\' case does it to escape literal backslash i.e. "\\" which is
> stored as [0x5c, 0x00].
Well, due first handling '\\' any text written as \n will be kept as \n
(obviously anything starting with \ will be handled the same, e.g. \t, \r, \b, \f).
We'd like to interpret \n at least for .options (unless we transform them
to array of arrays as you suggested). But I'm not sure if we want to do
everywhere, e.g. in doc there might be \n which we want to keep, thus I'd prefer
to interpret only tabs ('\t' => "\\t") and the rest escape via escaping '\\'
(already in the patch).

I don't think there is real new line character in our JSON (unlike tab, which
was put there into CAN tests and needed to be reverted). If yes, I think we'd
prefer to interpret it instead escaping it (as well as form feed and carriage return).
Unless any of these is ascii before 0x20 (which will be handled by last change
you're suggested.

> Looking at JSON specification anything that is
> in ascii before 0x20 (space) is invalid character in a JSON string. I
> guess that the safest to write strings would be:
Very good point.

> 	...
> 	default:
> 		if (*str >= 20)
> 			putc(*str, f);
> 	}
Thus this should be the only change.

> And we would have to add escape at least for '\n' the same way we have
> for '\t' in the switch.
And I'd avoid this due previous explanation.

I can merge this under your name with my Reviewed-by: tag.
Or feel free to commit these changes yourself.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
