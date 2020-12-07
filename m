Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B32D15CA
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 17:18:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBA253C628C
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 17:18:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id AF5123C2402
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 17:18:08 +0100 (CET)
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5E6E81000A2D
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 17:18:08 +0100 (CET)
Received: by mail-io1-xd44.google.com with SMTP id n14so13864052iom.10
 for <ltp@lists.linux.it>; Mon, 07 Dec 2020 08:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HPnToFwPCufE0EGeZFqD4K84vyIJAguUB2jdr9Ql+7E=;
 b=LPj7SddQnDj12I399NCzXha2DbBhM+sV7vtHZPATK0tA0UxB19TldOuOznwKEnqBwu
 9nMIYW6Ff/bCdftIRcdPe/IlcmRb3esVC1XyImKqXq45ztMEXDzx2D/SfqMQ2AL5Z2dk
 qI8YOdOOQjmXew7OwWKRZflp2Q4YhBnYH/XV7phgB4+0IkSqF/PeIEhk7L12nnXqFmWh
 rkUbfXEnciUIAJYUmeB2Ib1N1hVws0w1JTIO2DUIS9xBlb3mRv2ke40srN9LPDclxjXM
 6FOsZFkH2Tk/SHrPTlnvy4T1QB/tScSSXkLJBo1OnLiBPVL2ol4NzfyVwR8+NDuodHNp
 w+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPnToFwPCufE0EGeZFqD4K84vyIJAguUB2jdr9Ql+7E=;
 b=AMaku/UC0jJbousI2c6MJ3+Mh7pdSEaNL0Ghr2yBy6AI+0Kd5QbBnTgdrlDb2DoA64
 VO9w9y+yXUVT7Fw127qtYdaKttyNO+1hrtde/nqflekBDPn7xypnshemTopcbsokahLw
 RdXHav7q0nGKybDAEfzhLks9M0KP1I+foNir+lTr5AbHNzssFlA2EeVOPltSOUsP0tfT
 afepiYPApAfwlIcUIu4k6s3pvKjM+yFme1yBVjbJFupuQrh/+8/ytQnniYF10gMNKK1F
 YslnxL2WULbMlgTY85+75RYN2EWwahxppqJmiEZlBzq+d4p4eIr9V2Ovd4+3Rugrt37R
 n3HQ==
X-Gm-Message-State: AOAM530h8kykFYP6PHxac7UIcv7ZIiJyeaVzkXZGGI1veNdH70NwrD0b
 sECWKwNRUHMRmn7s6XxU306c+/EUbkQl45r1FpY=
X-Google-Smtp-Source: ABdhPJz5IHR7BAgtLjkv7YK+craal+FYJa2rtLbrmN7A/Bd6DzmGFko+Zdr8Mp/k0j9jW2bnk0qyPEuvjKACKTmo4SU=
X-Received: by 2002:a05:6602:1608:: with SMTP id
 x8mr20819631iow.72.1607357887163; 
 Mon, 07 Dec 2020 08:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-4-amir73il@gmail.com>
 <X84VqaD4+FqAix5h@pevik>
 <CAOQ4uxiCtAJVyVau3un2AnMNmn1Yub18sG10YopLRySmLAcpnw@mail.gmail.com>
 <X846sHuckxS/lLEV@pevik>
In-Reply-To: <X846sHuckxS/lLEV@pevik>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 7 Dec 2020 18:17:57 +0200
Message-ID: <CAOQ4uxhWB6Gq2SinwbKJ=PmkO=EWtcvLoF71GDPit8V=B+17EQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls/fanotify09: Read variable length
 events
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Dec 7, 2020 at 4:22 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
> > > > In preparation of testing events with filename info, teach the
> > > > how to read variable length events and parse the name info.
>
> > > This commit broke umount() on old kernels. (LTP lib doing multiple attempts is
> > > useless here). Not sure what exactly is being used, it's not by staing in
> > > mounted directory. Any idea how to fix it?
>
>
> > --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> > @@ -265,6 +265,7 @@ static void test_fanotify(unsigned int n)
> >         for (i = 1; i < NUM_GROUPS; i++) {
> >                 ret = read(fd_notify[i], event_buf, FAN_EVENT_METADATA_LEN);
> >                 if (ret > 0) {
> > +                       event = (struct fanotify_event_metadata *)event_buf;
> >                         event_res(TFAIL, i, event, "");
> >                         if (event->fd != FAN_NOFD)
> >                                 SAFE_CLOSE(event->fd);
>
> > The fix exists in the following patch, therefore I did not notice the
> > mid series regression.
> While this is valid to be added in this commit and I'll add it, it does not fix
> our solution. I might not be clear: since this commit it's broken.
> Thus any other tip?

So both a mid series regression and full series regression.
Lovely :)

Following patch needs this fix:

--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -280,6 +280,7 @@ static void test_fanotify(unsigned int n)

                        event = (struct fanotify_event_metadata *)event_buf;
                        verify_event(i, event, expect, "");
+                       event = FAN_EVENT_NEXT(event, ret);

                        for (; FAN_EVENT_OK(event, ret);
FAN_EVENT_NEXT(event, ret)) {
                                if (event->fd != FAN_NOFD)

Pushed full fix series (including un-posted inotify test) to:
https://github.com/amir73il/ltp/commits/fsnotify-fixes

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
