Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCB1BDA44
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 10:53:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A6CD3C207F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 10:53:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C66353C14F6
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 10:53:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 530A81000CA3
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 10:53:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19FB9AF47;
 Wed, 25 Sep 2019 08:53:17 +0000 (UTC)
References: <20190924105801.7616-1-liwang@redhat.com>
 <87wodxkgr4.fsf@rpws.prws.suse.cz>
 <CAEemH2f-5zcvrHep30tWubA7LTqOgKbeBbuN7PO+1h70e3B0hA@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2f-5zcvrHep30tWubA7LTqOgKbeBbuN7PO+1h70e3B0hA@mail.gmail.com>
Date: Wed, 25 Sep 2019 10:53:16 +0200
Message-ID: <87ef04ycxv.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] fzsync: revoke thread_b if parent hits an
 accidental break
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

Li Wang <liwang@redhat.com> writes:

> Hi Richard,
>
> On Tue, Sep 24, 2019 at 8:42 PM Richard Palethorpe <rpalethorpe@suse.de>
> wrote:
>
>> ...
>> It can just be
>>
>> if (!pair->exit) {
>>    ...
>> }
>>
>> We want to join the thread and set the func pointer to zero regardless
>> of how we exit.
>>
>
> OK.
>
>
>>
>> > +                     SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
>> > +                     pair->thread_b = 0;
>> > +             } else {
>>
>> I suggest still setting pair->exit here and maybe sleeping for
>> 100ms. This gives thread B chance to exit gracefully. It is possible
>> that if thread B is in a spin loop then the thread won't be cancelled as
>> asynchronous cancellation is not guaranteed by POSIX.
>>
>
> Good suggestion. That'd be better to give one more time for thread B
> exiting gracefully.
>
>
>> > +                     pthread_cancel(pair->thread_b);
>> > +                     pair->thread_b = 0;
>> > +             }
>> >       }
>> >  }
>> >
>> > @@ -271,8 +276,11 @@ static void tst_fzsync_pair_reset(struct
>> tst_fzsync_pair *pair,
>> >       pair->a_cntr = 0;
>> >       pair->b_cntr = 0;
>> >       pair->exit = 0;
>> > -     if (run_b)
>> > +     if (run_b) {
>> > +             pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
>> > +             pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
>>
>> These need to go inside thread B unless I am mistaken. Which means you
>>
>
> Right.
>
>
>> must wrap the user supplied function. You can create a function which
>> accepts a pointer to some contiguous memory containing the user supplied
>> function
>> pointer and the user supplied arg pointer.
>>
>
> Since you have fixed the function format of thread B as void *(*run_b)(void
> *) in tst_fzsync_pair_reset(), which means we have no need to take care of
> the function arg pointer anymore.

I think the function pointer signature would be 'void *(*run_b)(void)'
not 'void *(*run_b)(void *)'.

I doubt any test would need the arg though, because we only use one
thread and can store parameters in global variables. So you could remove
it and update the tests.

The user might need that arg if they are starting many threads, but for
now we don't have explicit support for that in the library.

>
> So just like what I did in V2, the wrapper function could steal the real
> run_b address from pthread_create(..., wrap_run_b, run_b) parameter.


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
