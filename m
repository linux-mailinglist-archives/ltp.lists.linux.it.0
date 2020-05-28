Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9C1E5B81
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 11:11:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00E043C31D1
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 11:11:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3CA483C0FE7
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:11:54 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5BCFD25734B
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:11:53 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id n15so2856048pjt.4
 for <ltp@lists.linux.it>; Thu, 28 May 2020 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/V7JIC0TKrRsP7XGALdEffQna/v01x20S/UQG89H4hU=;
 b=dX+X7JCzOLa62/l/dwxQKAMoeNkH1lkhTvG6H0YRVaXVTeFwYPMCv84NLkejpb58qX
 A0PHxWkcvubhpUvfZzw5R/SNn6ASBe8o/no4s4N9v+e7vqb0BBDI8aQH1hxDvOpsCXzk
 0BnDAr08//RoHq++h7Q3jL14ad74uo1XYcGfZb9hh83DNUbPFWJiCKOLjNQPDbdbjcej
 S4xiXVDhhPclrR0N/zkBKZwlKAtl13lmQGMsXGMJejym1B3zUbCGOboQVoZD0exq2ewJ
 fwIy9gPvcgJWbHbLtco8gT+YlA7py9Xue2/+40wiFXpG3yvR1JfKW4sXWWDr4nZ5g7y8
 5PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/V7JIC0TKrRsP7XGALdEffQna/v01x20S/UQG89H4hU=;
 b=ZNUH+MtXv9n+ZNRE+d/ANUW2OImXMF/GNiV9ZPQ9AxaM8VTduqQjtqZ+SEDurpiFxG
 jm57V1mMDFctNkbrvfSKTgbBHr1ZcVCTVyRsIw2iN/ZsE+jqUaD2rR71/O+pubJcKJW9
 BGpZK5Fvj5mw4A1fOMmxYd+nqx1x7Okhq/i61TVzjy5ljEy6Tyzxb1KQnEEUC1YJLiT/
 9gedr7Jx+I+Nz1Dnyj2iMlC3Ee2zvxwXW5Rv/0C+9DVt7zfW5ENUrOYVRWo//e6C/EYw
 aJ0RFsHYpGxp8JQu+wpBUaY3a41XxYdnSP1CbwYKWM/ED6CufjUqX+c0XGDi0DtclTXF
 DtHA==
X-Gm-Message-State: AOAM5323YxagOdEX4huOjj8jmLiVtw6exNvPQvDXFiw86pHLkqnnMSJa
 AiObDjk9B8WVD1w9IZlQHE/2Eg==
X-Google-Smtp-Source: ABdhPJy2aAQXUZwZK53P5fD93gQ3uCfKv3Fp5h6BrVlCDq6ftopARgL4DE3KcyahT/vSem9lbZq0ew==
X-Received: by 2002:a17:90a:4f42:: with SMTP id
 w2mr2830495pjl.74.1590657111846; 
 Thu, 28 May 2020 02:11:51 -0700 (PDT)
Received: from localhost ([122.172.60.59])
 by smtp.gmail.com with ESMTPSA id k14sm3911767pgn.94.2020.05.28.02.11.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 May 2020 02:11:51 -0700 (PDT)
Date: Thu, 28 May 2020 14:41:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200528091148.3afrkdjqzjer4vqh@vireshk-i7>
References: <70417fdc55c750e8b13d7124e66a7e8a59182e75.1590494889.git.viresh.kumar@linaro.org>
 <86a36c7d5919a966e077cb76f0d8710f31bcc60a.1590649002.git.viresh.kumar@linaro.org>
 <CAK8P3a11aWYdBtgV=T91_BOVR_hX-OZTAVhr806nbTFtCE+3MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a11aWYdBtgV=T91_BOVR_hX-OZTAVhr806nbTFtCE+3MQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls: clock_settime: Add test around y2038
 vulnerability
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 28-05-20, 10:27, Arnd Bergmann wrote:
> On Thu, May 28, 2020 at 8:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > This adds a test around the y2038 vulnerability, it sets the system time
> > to just before y2038 time (i.e. max value that can be stored in s32),
> > and adds a timer to expire just after crossing it.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V2:
> > - Fix the y2038 bug in the test itself, changes in the setup() routine.
> >   :)
> 
> So I assume this version works as expected?
> I don't see any more problems with it.

Absolutely perfectly. I don't know what the problem with timer was
earlier, maybe it was related to a different way I was trying to
capture the signal with (i.e. SAFE_SIGNAL(SIGALRM, sighandler)).

But this (and the earlier patch as well, perhaps I tested even an
earlier version then) works just fine.

> > +       ret = tv->clock_settime(CLOCK_REALTIME, tst_ts_get(&ts));
> > +       if (ret == -1)
> > +               tst_brk(TBROK | TERRNO, "clock_settime() failed");

But I noticed that even this version may not be good enough, as I am
still doing the same thing in setup(), i.e. setting time to just
before y2038 to test if it is y2038 safe or not. I believe even that
isn't fine ?

> > +
> > +       tst_its_set_time(&its, time + EXPIREDELTA, 0, 0, 0);
> > +
> > +       TEST(tv->timer_settime(timer, TIMER_ABSTIME, tst_its_get(&its), NULL));
> > +       if (TST_RET == -1)
> > +               tst_brk(TBROK | TTERRNO, "timer_settime() failed");
> > +
> > +       if (sigwait(&set, &sig) == -1)
> > +               tst_brk(TBROK, "sigwait() failed");
> 
> Should you maybe check the time after the expiration to ensure the
> timer ran for the expected length?
> 
> I suppose you can read the time in CLOCK_MONOTONIC to check
> for the elapsed time regardless of what the kernel might think the
> CLOCK_REALTIME is after this.

This should be enough I believe.

diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
index 9e316378b1cc..876651a5d537 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime03.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -13,7 +13,7 @@
 
 #define EXPIREDELTA 3
 
-static struct tst_ts ts;
+static struct tst_ts ts, end;
 static struct tst_its its;
 
 static struct test_variants {
@@ -37,7 +37,6 @@ static void setup(void)
 {
        struct test_variants *tv = &variants[tst_variant];
        unsigned long long time = 0x7FFFFFFF; /* Time just before y2038 */
-       struct tst_ts end;
        int ret;
 
        tst_res(TINFO, "Testing variant: %s", tv->desc);
@@ -72,6 +71,7 @@ static void run(void)
                .sigev_notify = SIGEV_SIGNAL,
                .sigev_signo = SIGABRT,
        };
+       struct tst_ts diff;
        timer_t timer;
        sigset_t set;
        int sig, ret;
@@ -105,7 +105,16 @@ static void run(void)
        if (sigwait(&set, &sig) == -1)
                tst_brk(TBROK, "sigwait() failed");
 
+       ret = tv->clock_gettime(CLOCK_REALTIME, tst_ts_get(&end));
+       if (ret == -1)
+               tst_brk(TBROK | TERRNO, "clock_gettime() failed");
+
        if (sig == SIGABRT) {
+               diff = tst_ts_diff(end, ts);
+
+               if (tst_ts_get_sec(diff) != EXPIREDELTA)
+                       tst_res(TINFO, "Test slept longer than it should have, expected:%d, actual:%lld",
+                               EXPIREDELTA, tst_ts_get_sec(diff));
                tst_res(TPASS, "clock_settime(): Y2038 test passed");
                return;
        }

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
