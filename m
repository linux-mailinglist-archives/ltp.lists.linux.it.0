Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A490D3753C4
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:23:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3102D3C56C0
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 14:23:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 64BF93C1B4D
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:23:48 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AFC4E10011AE
 for <ltp@lists.linux.it>; Thu,  6 May 2021 14:23:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620303826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GqITYUhlfmriLaU3WYj6lzWnoXCGDmMhYtno9zoUFPQ=;
 b=CYXIHobA4HV1vbSY1KsRTq0p57Ei17bRc2IRnnFFxiF6iqTpi69ZJxLKIsmi2DWF8HuTo8
 C0mKsUKYVFXOuvyhudyLs8dSOmAaMu1oekBNgmH4BCxd9J3rWIVgXOKd3i5z14NrMEhMTg
 T+18CacaaP/x8p5GL5AXzWrkBKICPDc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-3B9FrHxpMEGfemlRN3GT1g-1; Thu, 06 May 2021 08:23:44 -0400
X-MC-Unique: 3B9FrHxpMEGfemlRN3GT1g-1
Received: by mail-yb1-f199.google.com with SMTP id
 j63-20020a25d2420000b02904d9818b80e8so5754333ybg.14
 for <ltp@lists.linux.it>; Thu, 06 May 2021 05:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GqITYUhlfmriLaU3WYj6lzWnoXCGDmMhYtno9zoUFPQ=;
 b=T/UMyK/vGYyjitzMZncsVZXZ49QPHfB18X7yp+82ctn4qrhBd1SEAerssCUwFeMCiG
 Z0BtGYsCfkVefWFhWLq2EKGW8BwP//ubLtfId/tkz8tRydk2O1nLreKOye066h4uA5oN
 vGusFTrZiXiKHktbmcdPVTOWqnb9EnuN7XFR7pL9QAd7+dNEzYYEhze3JDzpuZXuV3IG
 FciLlkfObtWYCFlD7Crm9V+Ng4kjdgQEVVc4qoA3nTklGxNPC7Ffuo2Gz0KzLndI7hd+
 8eM4DJr5kkz8vDemX03NxbLJmo0oHzYq/gnFWQ9LFLzPVXymi4CeHaSyvbZrwPNKPGOf
 YVEQ==
X-Gm-Message-State: AOAM532ec2Y2Gd5M4s1zAmHPqjAUxaqY8DZ00k+bhw6RmRc/sbI5XhtY
 1rbDJNn2l3Dw4eiLzDl+yJUbufk+xWYe1CDTvM+izN4jCFuLmSQhfRDLnZTI27F4UitxHekI/GW
 JY58kYkzAK2dRuyrnt2XIAAQv7wI=
X-Received: by 2002:a25:1189:: with SMTP id 131mr5404364ybr.286.1620303824097; 
 Thu, 06 May 2021 05:23:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOP9lQhTPb65/t574lNiyUWvxuVdLZokkIXnVDoz61ifBwIteyicl6tR725c0DfC7a/WWnz5H0PTP47kP8rF0=
X-Received: by 2002:a25:1189:: with SMTP id 131mr5404329ybr.286.1620303823770; 
 Thu, 06 May 2021 05:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
 <YJDvIcgdl8ae58YB@pevik> <5fdefbf3-2b4e-f44b-6cb2-c133ecf36975@jv-coder.de>
 <YJEKFLmcKvnHvlIV@pevik> <651cb158-c640-e0b5-a2f2-4b77efcfa288@jv-coder.de>
In-Reply-To: <651cb158-c640-e0b5-a2f2-4b77efcfa288@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Thu, 6 May 2021 20:23:32 +0800
Message-ID: <CAEemH2dp4PT=AeEzjkhi3e_BnVbgWL6JvA3xQok5mHbAV9ig5A@mail.gmail.com>
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
Subject: Re: [LTP] [RFC] Shell API timeout sleep orphan processes
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

Hi Joerg, Petr,

On Tue, May 4, 2021 at 6:34 PM Joerg Vehlow <lkml@jv-coder.de> wrote:
>
> Hi Petr,
>
> >>>> The only way to fix this really portable I can think of is moving the
> >>>> timeout code (including the logic in _tst_kill_test) into c code. This way
> >>>> there would only be one binary, that can be killed flawlessly.
> >>> Maybe set -m would be enough. But sure, rewriting C is usually the best approach
> >>> for shell problems, we use quite a lot of C helpers for shell already.
> >> I will send the patch, if this introduces any new issues, we can still
> >> switch to a c based implementation.
> > Thank you!
>
> I guess I will not submit the fix with set -m...
> My colleague working testing on a new target just ran into a problem
> with out fix using set -m.
> For busybox sh, it only works, if a tty is allocated, otherwise it
> refuses to enable job monitor mode and the whole construct fails...
>
> Since using the monitor mode only exploits the side effect, that it
> creates a process group and we already found a first issue, I think the
> only solution is switching to a c-based solution for the timeout stuff.
> Personally I like that it is written in shell script, but I see no other
> option to do it in pure shell. There is no builtin way, to create a
> process group and just redirecting the output of sleep to null does not
> seem to be a very good solution to me, because there would still be a
> lot of orphans around.

(Sorry for the late reply, I was just back from the Holidays)

Before we decide to rewrite in C, can we think about this below method?

--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -26,7 +26,7 @@ trap "tst_brk TBROK 'test interrupted or timed out'" INT
 _tst_cleanup_timer()
 {
        if [ -n "$_tst_setup_timer_pid" ]; then
-               kill $_tst_setup_timer_pid 2>/dev/null
+               kill -TERM $_tst_setup_timer_pid 2>/dev/null
                wait $_tst_setup_timer_pid 2>/dev/null
        fi
 }
@@ -486,7 +486,7 @@ _tst_setup_timer()
        tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"

        _tst_cleanup_timer
-       sleep $sec && _tst_kill_test &
+       (trap 'kill $!; exit' TERM; sleep $sec & wait $! && _tst_kill_test)&

        _tst_setup_timer_pid=$!
 }


-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
