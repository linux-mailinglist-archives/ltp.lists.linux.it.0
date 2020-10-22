Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56427295CAF
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 12:28:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DE713C318D
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 12:28:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 153963C2480
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 12:28:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A0EF61000C32
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 12:28:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 041E1B2E6;
 Thu, 22 Oct 2020 10:28:38 +0000 (UTC)
References: <20201020100910.10828-1-chrubis@suse.cz>
 <20201020100910.10828-3-chrubis@suse.cz> <871rhrwnb7.fsf@suse.de>
 <20201021182001.GF10861@yuki.lan> <87pn5avgob.fsf@suse.de>
 <20201022085756.GB2427@yuki.lan>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20201022085756.GB2427@yuki.lan>
Date: Thu, 22 Oct 2020 11:28:37 +0100
Message-ID: <87ft66v9ka.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] lib: Add generic boolean expression parser
 and eval
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

Hi,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> >> > +enum tst_op char_to_op(char c)
>> >> > +{
>> >> > +	switch (c) {
>> >> > +	case '(':
>> >> > +		return TST_OP_LPAR;
>> >> > +	case ')':
>> >> > +		return TST_OP_RPAR;
>> >> > +	case '&':
>> >> > +		return TST_OP_AND;
>> >> > +	case '|':
>> >> > +		return TST_OP_OR;
>> >> > +	case '!':
>> >> > +		return TST_OP_NOT;
>> >> > +	default:
>> >> > +		return -1;
>> >> 
>> >> This should probably be an enum value like TST_OP_INVAL (still may be
>> >> -1), otherwise it is likely to confuse static anlyses tools.
>> >
>> > I tried to avoid adding more enum values since that means that we have
>> > to explicitly handle them in all switch () bodies. So I'm not sure what
>> > is worse, adding nop case to a few of these or having numeric value like
>> > that.
>> 
>> I think it is usually enough to have a 'default' in the switch statement
>> to prevent warnings about unhandled values?
>
> That is IMHO wrong as well since this solution defeats the purpose of
> the warning in the first place. I do actually like that warning since it
> tells me that I have forgotten something.
>
>> Of course there is still a tradeoff here, because you end up with an
>> enum containing unrelated values.
>
> And loose the warning as well.

This makes sense, but the function still says it returns enum tst_op,
but actually also returns -1. Ideally the function would return a union
of two enums, but I guess C doesn't allow that. At any rate I think you
are correct here. Hopefully at some point I will have chance to try some
more static analyses of LTP.

>
>> >> > +{
>> >> > +	if (stack_empty(stack_pos))
>> >> > +		return -1;
>> >> > +
>> >> > +	return stack[stack_pos - 1]->op;
>> >> > +}
>> >> 
>> >> Perhaps we should copy & paste the dynamic preallocated vector we
>> >> created for gfxprim? We are doing a bunch of mallocs and reinventing
>> >> linked lists and stacks, which can all be represented by the vector
>> >> IIRC.
>> >
>> > I do not think that it would work for the tokenizer/RPN since we reorder
>> > that and free things from the middle vector is not ideal data structure
>> > for that, link list is better suited for that work. And as for the stack
>> > we use, these have nice upper bound on size so we do not really need
>> > dynamic array for that.
>> 
>> Well it is not really about needing it just for this, I'm more thinking
>> about deduplicating array, stack and list code in general. However I
>> guess this can be dealt with separately.
>
> Actually I think that with the token with indexes I can simplify the
> code even further and get rid of some.
>
> Thanks for the review I will send a v2 later on.

+1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
