Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E650BEFB8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D2C43C22F3
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AD84A3C2443
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:33:58 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9EA69600AAE
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 11:25:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E824AF8E;
 Thu, 26 Sep 2019 09:25:50 +0000 (UTC)
References: <20190924105801.7616-1-liwang@redhat.com>
 <87wodxkgr4.fsf@rpws.prws.suse.cz>
 <CAEemH2f-5zcvrHep30tWubA7LTqOgKbeBbuN7PO+1h70e3B0hA@mail.gmail.com>
 <87ef04ycxv.fsf@rpws.prws.suse.cz>
 <CAEemH2fmTHzWh=dnzFfPCrJ8-3WuXUHa_VheGj73WjcJfuiwKA@mail.gmail.com>
 <87d0foy3nm.fsf@rpws.prws.suse.cz>
 <CAEemH2e-xAdBiTGuswcPhrw30bEoYTj4OHN0jBgUVpyEUJgXjQ@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2e-xAdBiTGuswcPhrw30bEoYTj4OHN0jBgUVpyEUJgXjQ@mail.gmail.com>
Date: Thu, 26 Sep 2019 11:25:50 +0200
Message-ID: <878sqbxvc1.fsf@rpws.prws.suse.cz>
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


Li Wang <liwang@redhat.com> writes:

> On Wed, Sep 25, 2019 at 8:13 PM Richard Palethorpe <rpalethorpe@suse.de>
> wrote:
>
>> ...
>> I'm not sure what you are saying. However you could do something like
>> this (I haven't tested it):
>>
>
> I misunderstood your words in the last mail, sorry about that.

No problem. This is also my fault.

>
>
>>
>> struct tst_fzsync_run_thread
>> {
>>         void *(*run)(void *);
>>         void *arg;
>> };
>>
>> static void tst_fzsync_thread_wrapper(void *arg)
>> {
>>         struct tst_fzsync_run_thread t = *(struct tst_fzsync_run_thread
>> *)arg;
>>
>>         pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS);
>>         pthread_setcancelstate(PTHREAD_CANCEL_ENABLE);
>>
>>         t.run(t.arg);
>> }
>>
>> static void tst_fzsync_pair_reset(..., struct tst_fzsync_run_thread *run_b)
>>
>
> I'd like to keep the tst_fzync_pair_reset() API no change to user.
>
> The patch v4.1 like below, is there any improper place in usage?

LGTM! 

>
> @@ -218,12 +219,36 @@ static void tst_fzsync_pair_init(struct
> tst_fzsync_pair *pair)
>  static void tst_fzsync_pair_cleanup(struct tst_fzsync_pair *pair)
>  {
>         if (pair->thread_b) {
> -               tst_atomic_store(1, &pair->exit);
> +               /* Revoke thread B if parent hits accidental break */
> +               if (!pair->exit) {
> +                       tst_atomic_store(1, &pair->exit);
> +                       usleep(100000);
> +                       pthread_cancel(pair->thread_b);
> +               }
>                 SAFE_PTHREAD_JOIN(pair->thread_b, NULL);
>                 pair->thread_b = 0;
>         }
>  }
>
> +/** To store the run_b pointer and pass to tst_fzsync_thread_wrapper */
> +struct tst_fzsync_run_thread {
> +       void *(*func)(void *);
> +       void *arg;
> +};
> +
> +/**
> + * Wrap run_b for tst_fzsync_pair_reset to enable pthread cancel
> + * at the start of the thread B.
> + */
> +static void *tst_fzsync_thread_wrapper(void *run_thread)
> +{
> +       struct tst_fzsync_run_thread t = *(struct tst_fzsync_run_thread
> *)run_thread;
> +
> +       pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
> +       pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> +       return t.func(t.arg);
> +}
> +
>  /**
>   * Zero some stat fields
>   *
> @@ -271,8 +296,10 @@ static void tst_fzsync_pair_reset(struct
> tst_fzsync_pair *pair,
>         pair->a_cntr = 0;
>         pair->b_cntr = 0;
>         pair->exit = 0;
> -       if (run_b)
> -               SAFE_PTHREAD_CREATE(&pair->thread_b, 0, run_b, 0);
> +       if (run_b) {
> +               struct tst_fzsync_run_thread wrap_run_b = {.func = run_b,
> .arg = NULL};
> +               SAFE_PTHREAD_CREATE(&pair->thread_b, 0,
> tst_fzsync_thread_wrapper, &wrap_run_b);
> +       }
>
>         pair->exec_time_start = (float)tst_timeout_remaining();
>  }
>
>
>> Note that in any case you can't reliably cast a function pointer to a
>> void pointer without some magic. I am guessing wrapping it in a struct
>> is the clearest way to do it.
>>
>
> Good to know this, I searched on google and confirmed that the C standard
> does not allow to cast function pointer to void*, thanks!
>
>
>>
>> You can remove the arg altogether, but I kept it because we have a
>> struct anyway to wrap the function pointer.
>>
>
> Yes, to keep it make the wrapper struct is clear to understand.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
