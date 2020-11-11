Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F02AF773
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 18:38:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3691B3C6033
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 18:38:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EDF283C2956
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 18:38:53 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 934AC600857
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 18:38:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8420AD92;
 Wed, 11 Nov 2020 17:38:52 +0000 (UTC)
References: <20201111131131.17360-1-chrubis@suse.cz>
 <87mtzoou23.fsf@suse.de> <20201111143744.GA16874@yuki.lan>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20201111143744.GA16874@yuki.lan>
Date: Wed, 11 Nov 2020 17:38:52 +0000
Message-ID: <87k0urpzdf.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

> Hi!
>> Why not skip the whole switch statement if in_string and just check for
>> the closing '"' instead?
>
> I guess that we can instead do:
>
> diff --git a/lib/tst_bool_expr.c b/lib/tst_bool_expr.c
> index dd147cde3..387c38b91 100644
> --- a/lib/tst_bool_expr.c
> +++ b/lib/tst_bool_expr.c
> @@ -81,6 +81,13 @@ static unsigned int tokenize(const char *expr, struct tst_expr_tok *last)
>                         token_cnt += new_tok(&last, &expr[j], i - j);
>                         j = i+1;
>                 break;
> +               case '"':
> +                       while (expr[i+1] != '"' && expr[i+1])
> +                               i++;
> +
> +                       if (expr[i+1] == '"')
> +                               i++;
> +               break;
>                 default:
>                 break;
>                 }
>
>
> Not sure if this is more readable.

It's probably easier to understand, it atleast keeps string processing
separate.

>
>> >  		break;
>> >  		default:
>> >  		break;
>> > -- 
>> > 2.26.2
>> 
>> It should probably be an error if tokenize exits with in_string=1?
>
> Well my opinion is that we do not care since we will get error later on, in
> case of the kernel config we would get obviously wrong variable value. But if
> you think that this is important we can change the return type to int
> and return -1 on tokenizer failure.

I suppose it depends how much later and how such an error would look. If
the error will happen directly after leaving this function then I don't
think it matters either, but if it is possible that it manages to
complete the whole evaluation process before failing with TCONF because
the vars don't match then this has the potential to waste some time.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
