Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F5E375641
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 17:10:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7542E3C7347
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 17:10:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F02AC3C19BA
 for <ltp@lists.linux.it>; Thu,  6 May 2021 17:10:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3915D600FA5
 for <ltp@lists.linux.it>; Thu,  6 May 2021 17:10:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70D01AE20;
 Thu,  6 May 2021 15:10:38 +0000 (UTC)
Date: Thu, 6 May 2021 16:44:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJQAukLCEqSX1X/9@yuki>
References: <20210506132745.16973-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506132745.16973-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> * escape backslash (/) and double quote (")
                      ^
		      \
>   escaping backslash effectively escapes other C escaped strings (\t,
>   \n, ...), which we sometimes want (in the comment) but sometimes not
>   (in .option we want to have them interpreted)
> * replace tab with 8x space
> * skip and TWARN invalid chars (< 0x20, i.e. anything before space)
             ^
	     warn on? We are not actually using TWARN o here right?
>   defined by RFC 8259 (https://tools.ietf.org/html/rfc8259#page-9)
> 
> NOTE: atm fix is required only for ", but tab was problematic in the past.
> 
> TODO: This is just a "hot fix" solution before release. Proper solution
> would be to check if chars needed to be escaped (", \, /) aren't already
> escaped.
> 
> Also for correct decision whether \n, \t should be escaped or interpreted
> we should decide in the parser which has the context. C string should be
> probably interpreted (thus nothing needed to be done as it escapes in
> a compatible way with JSON), but comments probably should display \n, \t
> thus add extra \.
>
> Fixes: c39b29f0a ("bpf: Check truncation on 32bit div/mod by zero")
> 
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Co-developed-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  docparse/data_storage.h | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/docparse/data_storage.h b/docparse/data_storage.h
> index ef420c08f..9f36dd6f0 100644
> --- a/docparse/data_storage.h
> +++ b/docparse/data_storage.h
> @@ -256,6 +256,40 @@ static inline void data_fprintf(FILE *f, unsigned int padd, const char *fmt, ...
>  	va_end(va);
>  }
>  
> +
> +static inline void data_fprintf_esc(FILE *f, unsigned int padd, const char *str)
> +{
> +	while (padd-- > 0)
> +		fputc(' ', f);
> +
> +	fputc('"', f);

	int was_backslash = 0;

> +	while (*str) {
> +		switch (*str) {
> +		case '\\':
> +		break;
> +		case '"':
> +			fputs("\\\"", f);
			was_backslash = 0;
> +			break;
> +		case '\t':
> +			fputs("        ", f);
> +			break;
> +		default:
> +			/* RFC 8259 specify  chars before 0x20 as invalid */
> +			if (*str >= 0x20)
> +				putc(*str, f);
> +			else
> +				fprintf(stderr, "%s:%d %s(): invalid character for JSON: %x\n",
> +						__FILE__, __LINE__, __func__, *str);
> +			break;
> +		}

		if (was_backslash)
			fputs("\\\\", f);

		was_backslash = (*str == '\\');
> +		str++;
> +	}
> +
> +	fputc('"', f);
> +}

This should avoid "unescaping" an escaped double quote. We deffer
printing the backslash until we know the character after it and we make
sure that we do not excape backslash before ".

Consider what would happen if someone did put a "\"text\"" into options
strings, the original code would escape the backslashes and we would end
up with "\\"text"\\" which would break parser again.

This way we can at least avoid parsing errors until we fix the problem
one level down in the parser where we have the context required for a
proper fix.

>  static inline void data_to_json_(struct data_node *self, FILE *f, unsigned int padd, int do_padd)
>  {
>  	unsigned int i;
> @@ -263,7 +297,7 @@ static inline void data_to_json_(struct data_node *self, FILE *f, unsigned int p
>  	switch (self->type) {
>  	case DATA_STRING:
>  		padd = do_padd ? padd : 0;
> -		data_fprintf(f, padd, "\"%s\"", self->string.val);
> +		data_fprintf_esc(f, padd, self->string.val);
>  	break;
>  	case DATA_HASH:
>  		for (i = 0; i < self->hash.elems_used; i++) {
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
