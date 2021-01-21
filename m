Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B23A2FEFA1
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 16:59:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47F833C7605
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 16:59:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B32603C53B9
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:59:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 459821A0080F
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 16:59:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3902ABD6
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 15:59:49 +0000 (UTC)
References: <20210121130033.20764-1-pvorel@suse.cz> <87mtx29wiq.fsf@suse.de>
 <YAmUwVWvm84w8ITB@yuki.lan> <YAmhO8gMJ1KZ4EHA@pevik>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YAmhO8gMJ1KZ4EHA@pevik>
Date: Thu, 21 Jan 2021 15:59:48 +0000
Message-ID: <87k0s69t6z.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] docparse: Replace \t with space
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Petr Vorel <pvorel@suse.cz> writes:

> Hi,
>
>> > JQ says "control characters from U+0000 through U+001F must be
>> > escaped". So I expect it is only a matter of time until some other
>> > control character is used.
> +1
>
>> > Perhaps we should escape all control characters into the \uXXXX
>> > hexidecimal form?
>
>> Or fail the compilation if we get one of these into the parser?
> We do fail already, but it's a bit hidden now.
> I don't know why build continues for so long.
>
> Also there would have to be striking error message.
> But docparser is not mandatory (people might have it disabled), thus mostly it
> will be us the maintainers who is going to fix these whitespace issues :(.
>
>> There is no point in having them in the metadata anyways.
> That would be solved by replacing some reasonable subset. So far it was the tab
> character.
>
> Kind regards,
> Petr

I suppose actually I could just escape the tab in the C string. But as
Petr says, docparse is not mandatory so anything which can pass C
compilation, but fails docparse is likely to create trouble.

It would be possible to force running docparse and doing some validation
on the JSON. As this would not require any more dependencies. In fact it
would be nice to run docparse to produce just the JSON without having to
install asciidoc[tor].

The Makefile doesn't seem to allow this. Although it is quite easy to
compile docparse without it.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
