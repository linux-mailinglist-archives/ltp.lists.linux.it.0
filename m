Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 444301C1026
	for <lists+linux-ltp@lfdr.de>; Fri,  1 May 2020 11:05:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 011BE3C5E0B
	for <lists+linux-ltp@lfdr.de>; Fri,  1 May 2020 11:05:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E1F3B3C5DF8
 for <ltp@lists.linux.it>; Fri,  1 May 2020 11:05:44 +0200 (CEST)
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DE02A600BAF
 for <ltp@lists.linux.it>; Fri,  1 May 2020 11:05:34 +0200 (CEST)
Received: by mail-il1-x143.google.com with SMTP id c16so3940598ilr.3
 for <ltp@lists.linux.it>; Fri, 01 May 2020 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2hPlsWBQTm0xsCSLS/0bjzZ6VFqT00nuXwh6Relfhg=;
 b=s8gwCRV8q4E/PYq4V+d33U4d7/TThV2aVybAMLBWC9llAT72CFXV2NaXbwVpCg6CIa
 cxrADcTXYEOPhj0xCBTThHWwj4AwtBAV/v9kNdiUNQmO5SRSh3vxE5xqmpbQ26IL+ieP
 K69ubpsZfRxD2ylDRsgMx/V6HmiJimP1tOqN9ryDaURws6+/KcO11ZbJLeGuvKZbM+Zv
 nkC2vAIRdi3h68yz4zJ4hITQjwd/kvJ6mGeUL0IlxydnQQrRZ3+1LMi8d7ArOF2hgjvR
 AJ1Cou/Xfl01262IceKe2MDDzQP9IFF8y862YOItURndmyKLmwFqqLmi467AB/l6tAHW
 yAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2hPlsWBQTm0xsCSLS/0bjzZ6VFqT00nuXwh6Relfhg=;
 b=lUNceDdHmdmkkn4x0OYD5xwUpruHuNLhoIP3RVAiPyI2q66UgUbh+tL8aRTHF1UJOb
 5DG2GPHcnScPqXErVlqJrytjnc5eLoyksYGRWSlsgKXOtsqIeSXKXCa4qMq6dcVKqcnl
 jnfq1PsgIz1tLDPxxZuZKA70mBy/cakVA3IdTMhbTJpRUKO0U82/DdjcG/yZXs0xeiqV
 TLzJrdMFVidh3lRl0vMY3aIDVsYDiOBnoxJoEsLmYe70Nx2pbaYb6KkreDFdbHelfQxj
 A4+o+66Fo7CUxwjkzYQz3ATirT3CrHE2nI2T44RV9jB6dLPLozLj0rBAP7QScFv9iqo8
 nahg==
X-Gm-Message-State: AGi0PuZRQm/pE6kaPTPG0Kvv0/SaFO5h7hroMvt87vR32GKmlkBhg8+V
 qJVHEYB1217sXGS0ikdcNwBSneXQw7WOsK3OOCM=
X-Google-Smtp-Source: APiQypJcnR3h5J0a/sz/eS8ChqJ4kRuBtXsPUgBrW8bKhzSnSnArcEyk6BUlfT1bMcKbgw0K9oPHmEfwZD61xCJTmU8=
X-Received: by 2002:a92:7e86:: with SMTP id q6mr2646672ill.9.1588323942614;
 Fri, 01 May 2020 02:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-2-amir73il@gmail.com>
 <20200501071740.GA2217@morpheus.bobrowski.net>
In-Reply-To: <20200501071740.GA2217@morpheus.bobrowski.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 1 May 2020 12:05:31 +0300
Message-ID: <CAOQ4uxi3mKYH68oWZmqJ7NMs2SgGirYx=pnBQ3UD-0LkHjRw3A@mail.gmail.com>
To: Matthew Bobrowski <mbobrowski@mbobrowski.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/fanotify09: Check merging of events
 on directories
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

On Fri, May 1, 2020 at 10:17 AM Matthew Bobrowski
<mbobrowski@mbobrowski.org> wrote:
>
> On Tue, Apr 21, 2020 at 09:49:59AM +0300, Amir Goldstein wrote:
> > +static void event_res(int ttype, int group,
> > +                   struct fanotify_event_metadata *event)
> > +{
> > +     int len;
> > +     sprintf(symlnk, "/proc/self/fd/%d", event->fd);
> > +     len = readlink(symlnk, fdpath, sizeof(fdpath));
> > +     if (len < 0)
> > +             len = 0;
> > +     fdpath[len] = 0;
> > +     tst_res(ttype, "group %d got event: mask %llx pid=%u fd=%d path=%s",
> > +             group, (unsigned long long)event->mask,
> > +             (unsigned)event->pid, event->fd, fdpath);
> > +}
>
> Nice helper, although it would be nice not to see all these statements
> clunked together like this.
>
> > -      * generate FAN_CLOSE_NOWRITE event on a child subdir.
> > +      * generate FAN_CLOSE_NOWRITE event on a testdir (subdir or ".")
>            ^ s/g/G :P
>
> Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>
>

Thanks for the review Matthew, but this patch has already been merged,
so those cleanups could be done at a later time.
I will address you comments to fanotify15 and fanotify16, which are
still not merged, when you are done with review.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
