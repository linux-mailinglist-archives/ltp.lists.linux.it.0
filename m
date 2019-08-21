Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7E9741C
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 09:58:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C1343C1D3C
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 09:58:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EB0333C1866
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 09:57:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BFA94600BF2
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 09:58:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3BCEAC0C;
 Wed, 21 Aug 2019 07:57:57 +0000 (UTC)
References: <20190819133618.7538-1-rpalethorpe@suse.com>
 <20190820095521.GA22253@rei.lan>
 <CAEemH2cX1CO=zLzf1ZHQM+MUNS=FLKpGD1ypx=2uGst5qXn4YQ@mail.gmail.com>
 <20190820102711.GA22483@rei.lan>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20190820102711.GA22483@rei.lan>
Date: Wed, 21 Aug 2019 09:57:57 +0200
Message-ID: <87y2znuf0a.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_res: Print errno number in addition to error
 name
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
Cc: LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> > > It appears we are atleast missing ENOTSUPP (524) which is probably returned by
>> > > create_timer for some alarm clocks on none x86 arches. This isn't entirely
>> > > clear, but what is clear is that it would help to know what the error number
>> > > is without using strace.
>> >
>> > Can we please also patch the lib/errnos.h so that the ENOTSUPP is
>> > included there as well?
>>
>> Not sure if we should do that since it(from google) says ENOTSUPP is
>> not intended to used in userland.

I suppose we could print a warning/fail if any error value over 512
(ERESTARTSYS) is seen by tst_res(). We can define these error numbers in
user land for debugging purposes.

>
> Looks like there are two of these ENOTSUP and ENOTSUPP so the syscall
> returning ENOTSUPP is a bug itself since it should return ENOTSUP. Also
> btw ENOTSUP == EOPNOTSUPP and we do have EOPNOTSUPP in errnos.h.

I think there is quite a lot of stuff missing. Maybe it is time to
create a script for generating this list?

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
