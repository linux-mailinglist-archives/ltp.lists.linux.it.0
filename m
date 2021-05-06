Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 139EB375A1D
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 20:21:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7E22D3C56F2
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 20:21:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 241013C19D3
 for <ltp@lists.linux.it>; Thu,  6 May 2021 20:21:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 38F6960102E
 for <ltp@lists.linux.it>; Thu,  6 May 2021 20:21:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65345AF98;
 Thu,  6 May 2021 18:21:39 +0000 (UTC)
Date: Thu, 6 May 2021 20:21:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJQzsUBhaD4wQyrF@pevik>
References: <20210506132745.16973-1-pvorel@suse.cz>
 <YJQAukLCEqSX1X/9@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJQAukLCEqSX1X/9@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/1] docparse: Handle special characters in JSON
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

Hi Cyril,
> Hi!
> > * escape backslash (/) and double quote (")
>                       ^
> 		      \
+1

> >   escaping backslash effectively escapes other C escaped strings (\t,
> >   \n, ...), which we sometimes want (in the comment) but sometimes not
> >   (in .option we want to have them interpreted)
> > * replace tab with 8x space
> > * skip and TWARN invalid chars (< 0x20, i.e. anything before space)
>              ^
> 	     warn on? We are not actually using TWARN o here right?
Yep, I didn't update commit message (first I included tst_test.h with
TST_NO_DEFAULT_MAIN but there was missing include path => stderr is enough).

> >   defined by RFC 8259 (https://tools.ietf.org/html/rfc8259#page-9)

> > NOTE: atm fix is required only for ", but tab was problematic in the past.

> > TODO: This is just a "hot fix" solution before release. Proper solution
> > would be to check if chars needed to be escaped (", \, /) aren't already
> > escaped.

> > Also for correct decision whether \n, \t should be escaped or interpreted
> > we should decide in the parser which has the context. C string should be
> > probably interpreted (thus nothing needed to be done as it escapes in
> > a compatible way with JSON), but comments probably should display \n, \t
> > thus add extra \.

> > Fixes: c39b29f0a ("bpf: Check truncation on 32bit div/mod by zero")

> > Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> > Co-developed-by: Cyril Hrubis <chrubis@suse.cz>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> >  docparse/data_storage.h | 36 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)

> > diff --git a/docparse/data_storage.h b/docparse/data_storage.h
> > index ef420c08f..9f36dd6f0 100644
> > --- a/docparse/data_storage.h
> > +++ b/docparse/data_storage.h
> > @@ -256,6 +256,40 @@ static inline void data_fprintf(FILE *f, unsigned int padd, const char *fmt, ...
> >  	va_end(va);
> >  }

> > +
> > +static inline void data_fprintf_esc(FILE *f, unsigned int padd, const char *str)
> > +{
> > +	while (padd-- > 0)
> > +		fputc(' ', f);
> > +
> > +	fputc('"', f);

> 	int was_backslash = 0;

> > +	while (*str) {
> > +		switch (*str) {
> > +		case '\\':
> > +		break;
> > +		case '"':
> > +			fputs("\\\"", f);
> 			was_backslash = 0;
> > +			break;
> > +		case '\t':
> > +			fputs("        ", f);
> > +			break;
> > +		default:
> > +			/* RFC 8259 specify  chars before 0x20 as invalid */
> > +			if (*str >= 0x20)
> > +				putc(*str, f);
> > +			else
> > +				fprintf(stderr, "%s:%d %s(): invalid character for JSON: %x\n",
> > +						__FILE__, __LINE__, __func__, *str);
> > +			break;
> > +		}

> 		if (was_backslash)
> 			fputs("\\\\", f);

> 		was_backslash = (*str == '\\');
> > +		str++;
> > +	}
> > +
> > +	fputc('"', f);
> > +}

> This should avoid "unescaping" an escaped double quote. We deffer
> printing the backslash until we know the character after it and we make
> sure that we do not excape backslash before ".

> Consider what would happen if someone did put a "\"text\"" into options
> strings, the original code would escape the backslashes and we would end
> up with "\\"text"\\" which would break parser again.

> This way we can at least avoid parsing errors until we fix the problem
> one level down in the parser where we have the context required for a
> proper fix.

+1.

I'll test it and merge under your as it's basically your work :).
Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
