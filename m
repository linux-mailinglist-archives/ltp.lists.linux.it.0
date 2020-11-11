Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A5F2AF35E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 15:19:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF0F03C6022
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 15:19:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 49D8E3C2956
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 15:19:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DD95A200CFF
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 15:19:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 353BFAED8;
 Wed, 11 Nov 2020 14:19:01 +0000 (UTC)
References: <20201111131131.17360-1-chrubis@suse.cz>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20201111131131.17360-1-chrubis@suse.cz>
Date: Wed, 11 Nov 2020 14:19:00 +0000
Message-ID: <87mtzoou23.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_bool_expr: Add support for strings
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> diff --git a/lib/tst_bool_expr.c b/lib/tst_bool_expr.c
> index dd147cde3..35ffa5a80 100644
> --- a/lib/tst_bool_expr.c
> +++ b/lib/tst_bool_expr.c
> @@ -64,6 +64,7 @@ static unsigned int tokenize(const char *expr, struct tst_expr_tok *last)
>  {
>  	size_t i, j;
>  	unsigned int token_cnt = 0;
> +	int in_string = 0;
>  
>  	for (j = i = 0; expr[i]; i++) {


Why not skip the whole switch statement if in_string and just check for
the closing '"' instead?

>  		switch (expr[i]) {
> @@ -72,14 +73,21 @@ static unsigned int tokenize(const char *expr, struct tst_expr_tok *last)
>  		case '!':
>  		case '&':
>  		case '|':
> -			token_cnt += new_tok(&last, &expr[j], i - j);
> -			token_cnt += new_tok(&last, &expr[i], 1);
> -			j = i+1;
> +			if (!in_string) {
> +				token_cnt += new_tok(&last, &expr[j], i - j);
> +				token_cnt += new_tok(&last, &expr[i], 1);
> +				j = i+1;
> +			}
>  		break;
>  		case '\t':
>  		case ' ':
> -			token_cnt += new_tok(&last, &expr[j], i - j);
> -			j = i+1;
> +			if (!in_string) {
> +				token_cnt += new_tok(&last, &expr[j], i - j);
> +				j = i+1;
> +			}
> +		break;
> +		case '"':
> +			in_string = !in_string;
>  		break;
>  		default:
>  		break;
> -- 
> 2.26.2

It should probably be an error if tokenize exits with in_string=1?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
