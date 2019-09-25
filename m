Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C0BDDD8
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 14:13:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A743A3C20C6
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Sep 2019 14:13:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8839F3C0ECD
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 14:13:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F2ACD600856
 for <ltp@lists.linux.it>; Wed, 25 Sep 2019 14:13:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A9190B626;
 Wed, 25 Sep 2019 12:13:49 +0000 (UTC)
References: <20190924105801.7616-1-liwang@redhat.com>
 <87wodxkgr4.fsf@rpws.prws.suse.cz>
 <CAEemH2f-5zcvrHep30tWubA7LTqOgKbeBbuN7PO+1h70e3B0hA@mail.gmail.com>
 <87ef04ycxv.fsf@rpws.prws.suse.cz>
 <CAEemH2fmTHzWh=dnzFfPCrJ8-3WuXUHa_VheGj73WjcJfuiwKA@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2fmTHzWh=dnzFfPCrJ8-3WuXUHa_VheGj73WjcJfuiwKA@mail.gmail.com>
Date: Wed, 25 Sep 2019 14:13:49 +0200
Message-ID: <87d0foy3nm.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

> Richard Palethorpe <rpalethorpe@suse.de> wrote:
>
>>> must wrap the user supplied function. You can create a function which
>> >> accepts a pointer to some contiguous memory containing the user supplied
>> >> function
>> >> pointer and the user supplied arg pointer.
>> >>
>> >
>> > Since you have fixed the function format of thread B as void
>> *(*run_b)(void
>> > *) in tst_fzsync_pair_reset(), which means we have no need to take care
>> of
>> > the function arg pointer anymore.
>>
>> I think the function pointer signature would be 'void *(*run_b)(void)'
>> not 'void *(*run_b)(void *)'.
>>
>
> Hmm, but at least we should respect the pthread_create()? It requires the
> function prototype is ''void *(*func)(void *)'.
>
>        int pthread_create(pthread_t *thread, const pthread_attr_t *attr,
>                           void *(*start_routine) (void *), void *arg);
>
> We could unuse the arg in thread B, but declare the function prototype with
> parameter "void *" is no harm.

I'm not sure what you are saying. However you could do something like
this (I haven't tested it):

struct tst_fzsync_run_thread
{
        void *(*run)(void *);
        void *arg;
};

static void tst_fzsync_thread_wrapper(void *arg)
{
        struct tst_fzsync_run_thread t = *(struct tst_fzsync_run_thread *)arg;

        pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS);
        pthread_setcancelstate(PTHREAD_CANCEL_ENABLE);

        t.run(t.arg);
}

static void tst_fzsync_pair_reset(..., struct tst_fzsync_run_thread *run_b)
{
        ...

        if (run_b)
           SAFE_PTHREAD_fCREATE(..., tst_fzsync_thread_wrapper, (void *)run_b);

        ...
}

Note that in any case you can't reliably cast a function pointer to a
void pointer without some magic. I am guessing wrapping it in a struct
is the clearest way to do it.

You can remove the arg altogether, but I kept it because we have a
struct anyway to wrap the function pointer.

>
>
>> I doubt any test would need the arg though, because we only use one
>> thread and can store parameters in global variables. So you could remove
>> it and update the tests.
>>
>> The user might need that arg if they are starting many threads, but for
>> now we don't have explicit support for that in the library.
>>
>
> Maybe we just need to note that in the lib document.
>
>
>> >
>> > So just like what I did in V2, the wrapper function could steal the real
>> > run_b address from pthread_create(..., wrap_run_b, run_b) parameter.
>>
>>
>> --
>> Thank you,
>> Richard.
>>


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
