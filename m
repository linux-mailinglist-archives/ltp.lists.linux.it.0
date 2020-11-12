Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 983ED2B0731
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 15:02:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2ED8B3C525F
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 15:02:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 28B673C2EE5
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 15:02:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0C84A1A01522
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 15:02:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 701FFAC1D;
 Thu, 12 Nov 2020 14:02:31 +0000 (UTC)
References: <20201111131131.17360-1-chrubis@suse.cz>
 <87mtzoou23.fsf@suse.de> <20201111143744.GA16874@yuki.lan>
 <87k0urpzdf.fsf@suse.de> <20201112130224.GA17493@yuki.lan>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20201112130224.GA17493@yuki.lan>
Date: Thu, 12 Nov 2020 14:02:30 +0000
Message-ID: <87h7puptah.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
>> I suppose it depends how much later and how such an error would look. If
>> the error will happen directly after leaving this function then I don't
>> think it matters either, but if it is possible that it manages to
>> complete the whole evaluation process before failing with TCONF because
>> the vars don't match then this has the potential to waste some time.
>
> Well I can easily add this kind of check here, however out of all
> possible mistakes that you can do with misplaced quotes this would only
> catch the cases where the number of quotes is odd. I.e. only a subset of
> all possible errors, everything else would be caught later on when we
> attempt to evaluate the expression.
>
> E.g.
>
> 	CONFIG_FOO"=val"
> 	"CONFIG_FOO=val & CONFIG_BAR"
> 	"CONFIG_FOO"
> 	etc.
>
> are all valid in this context, but completely wrong when evaluated.
>
> I guess that it would make more sense to check if variable token is sane
> in the upper layer, i.e. in the kconfig parser since we do have the full
> information about how it should look like there. And this check would
> also cover this case as well.

+1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
