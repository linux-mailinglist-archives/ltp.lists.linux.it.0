Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2BD387851
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 14:02:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E7353CA680
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 14:02:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 507423C30B3
 for <ltp@lists.linux.it>; Tue, 18 May 2021 14:02:12 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7E67D1000ED4
 for <ltp@lists.linux.it>; Tue, 18 May 2021 14:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621339330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YCXs/r68b4BqMqURXbg+PYyhDJDqKYzlRR5SMljoSJc=;
 b=Kex6F8ZIepTg8K7WbWfkzChNEe1urmqjPkY/QPcILkK9CtvAk51Tl1YEiCjMA3OXPNc8fJ
 BoqcEDRaMtoPFevN9WkJy8+vxS3HH+LJE/aW0asA+Tqfy8LITAS0s5dL1XxSPklqkpmjAH
 qhSrbbnN6++lqGE4VSgL9/VOT9kpKI4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-z7Gfqy2tP_yaBAu5BL0a6A-1; Tue, 18 May 2021 08:02:06 -0400
X-MC-Unique: z7Gfqy2tP_yaBAu5BL0a6A-1
Received: by mail-yb1-f197.google.com with SMTP id
 d63-20020a254f420000b02904f91ef33453so13363337ybb.12
 for <ltp@lists.linux.it>; Tue, 18 May 2021 05:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCXs/r68b4BqMqURXbg+PYyhDJDqKYzlRR5SMljoSJc=;
 b=g2HrB+RCy+OxUYcGvH6QHVG0KSgJzsEWuM+geGPkdFsv5fy8Oo1BM4Ys2qjdtd+5EJ
 +aulsjInJBKk0/EutWlJhvfFaGOzd/8L8ZtMCBdupD7832fP+GVTn/rvp9t7TDdMG44N
 XHWL3VICOtCHHm2jbEK9mV+l7h5yY0xOXrLtHJoRcL/vMLp6OO9lovrV+OG91t1o1P7C
 B8jmBJXRuJQOLOajBQZXGH9urWNwYt4WN9NZ9maMndwpjm61JaEcgNUB1FwA7M52O4nu
 lo7kUKtEMVU4X9Fwt/0t18q/Z+3taBg6dhxFWOUYZrG+iHwHamSvim+egHBH45ivqGyj
 rcrg==
X-Gm-Message-State: AOAM530/o5Jeiv6sdMLHgziSEw4OSpATF09w4ogZNvay4o7/JK52C/2P
 mjCUGRHur5AtlaTPoGOwDTHdFVYPnv5Zk1MUZg5zVlqXDXT9t2L5cPqUeMp1gBvdv9j1hLtF/IN
 O4P1GMnTlMx3Ezd1voB5qcV1TIkw=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr7096111ybj.97.1621339325425; 
 Tue, 18 May 2021 05:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznnOdfL2Nr8O6zr3b52F26+B+2fAkNWfwZKK4PTMM8lhA55b64wMu5d6Ft9h0rVTsCDzlxgF74f4YIfzk8rdU=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr7096082ybj.97.1621339325175; 
 Tue, 18 May 2021 05:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210508055109.16914-4-liwang@redhat.com>
 <dfdd8e9a-90ca-642d-1c21-da169ca3878f@jv-coder.de>
 <CAEemH2et8_SXWJTsofdt7gc0NRV=91rPe0RtAMt1BX=SbAzhig@mail.gmail.com>
 <YJvkFTUWS2iuZ00H@pevik>
 <CAEemH2fRLqipQWTxVsakYNGsmQT+2X8_xzgepCiAY1O8YWtKFA@mail.gmail.com>
 <a4154e09-8ae3-beb3-13d5-c92126177ed5@jv-coder.de>
 <CAEemH2c-zTLkh2N2UpA=DSiq1tSJ=072S6j+PVoUz_yUaKjD-Q@mail.gmail.com>
 <5eb244b9-f97b-7a53-9feb-1a0452f56843@jv-coder.de>
In-Reply-To: <5eb244b9-f97b-7a53-9feb-1a0452f56843@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 May 2021 20:01:53 +0800
Message-ID: <CAEemH2fPHqu6CyFqvV5GkCijLWnjBBnqbjoaSV70pP9n9ojVeA@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/4] lib: ignore SIGINT in _tst_kill_test
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> > In conclusion, I think we maybe have such situations to be solved:
> >
> > 1. SIGINT (Ctrl^C) for terminating the main process and do cleanup
> > correctly before a timeout
> > 2. Test finish normally and retrieves the _tst_timeout_process in the
> > background via SIGTERM(sending by _tst_cleanup_timer)
> > 3. Test timeout occurs and _tst_kill_test sending SIGTERM to
> > terminating all process, and the main process do cleanup work
> > 4. Test timeout occurs but still have process alive after
> > _tst_kill_test sending SIGTERM, then sending SIGKILL to the whole
> > group
> >
> > So, I'm now thinking can we just introduce a knob(variable) for skipping
> > the _tst_cleanup_timer works in timeout mode, then it will not have a
> > deadlock anymore.
> This works of course and is the "simplest" solution, the only thing I do
> not like about this,
> is the fact, that SIGTERM send by something else (e.g. system shoutdown
> or process manager),
> is handled like timeouts are handled and reported as timeout. That's why
> I suggested introducing
> a new signal. But since this is probably rare, I could live without it.

Hmm, it wouldn't handle/report like a time-out if we break with "test
terminated"
output for a SIGTERM. If we do

     trap "unset _tst_setup_timer_pid; tst_brk TBROK 'test terminated'" TERM

in the main process, system will still send SIGTERM to the _tst_timeout_process
when shutting down, and the _tst_kill_test will never be called in that case.

>
>
> >
> > How about:
> >
> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -16,12 +16,14 @@ export TST_COUNT=1
> >   export TST_ITERATIONS=1
> >   export TST_TMPDIR_RHOST=0
> >   export TST_LIB_LOADED=1
> > +export TST_TIMEOUT_OCCUR=0
> >
> >   . tst_ansi_color.sh
> >   . tst_security.sh
> >
> >   # default trap function
> > -trap "tst_brk TBROK 'test interrupted or timed out'" INT
> > +trap "tst_brk TBROK 'test interrupted'" INT
> > +trap "TST_TIMEOUT_OCCUR=1; tst_brk TBROK 'test timeouted'" TERM
> This could also be done by "unset _tst_setup_timer_pid" or
> '_tst_setup_timer_pid=""'.

+1, 'unset _tst_setup_timer_pid' is a good idea, sorry I was blind
here when reading your previous email:).

> I guess even if a new variable is introduced, it should start with an _,
> because it is supposed to be internal to the framework?

Yes, but let's go with "unset _tst_setup_timer_pid" but not introduce
a new variable.

>
>
> >
> >   _tst_do_exit()
> >   {
> > @@ -48,7 +50,9 @@ _tst_do_exit()
> >                  [ "$TST_TMPDIR_RHOST" = 1 ] && tst_cleanup_rhost
> >          fi
> >
> > -       _tst_cleanup_timer
> > +       if ["$TST_TIMEOUT_OCCUR" = 0 ]; then
> > +               _tst_cleanup_timer
> > +       fi
> >
> >          if [ $TST_FAIL -gt 0 ]; then
> >                  ret=$((ret|1))
> > @@ -439,18 +443,18 @@ _tst_kill_test()
> >   {
> >          local i=10
> >
> > -       trap '' INT
> > -       tst_res TBROK "Test timeouted, sending SIGINT! If you are
> > running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
> > -       kill -INT -$pid
> > +       trap '' TERM
> > +       tst_res TBROK "Test timeouted, sending SIGTERM! If you are
> > running on slow machine, try exporting LTP_TIMEOUT_MUL > 1"
> If you post this as a patch, can you please fix "timeouted" => "timed out"?
> There is no word "timeouted" in the english language.

Sure. Thanks for your strict attitude on syntax.


> @Petr
> I wouldn't recommend getting the fix into the release.
> The problem is nothing new and does not fix a "real issue" at the moment,
> but has the risk of introducing something unexpected.
> Fixing the output redirection could be done without a major risk, I guess.

I will split the fix into two-part, one for errors redirection,
another for SIGTERM using.

Thanks for your review!


--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
