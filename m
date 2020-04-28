Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EB1BBA60
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:52:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FEFA3C2864
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 11:52:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 6F3C13C282E
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 11:52:04 +0200 (CEST)
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 81C561A0037B
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 11:52:03 +0200 (CEST)
Received: by mail-io1-xd43.google.com with SMTP id i19so22122880ioh.12
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WwZvJpse6jwsiADvc3x3ywXWVKMnXP8szckK/X4O79M=;
 b=tkzwHZcq/mPeZWOppAppUY5ox8kuNy3xUdozK5WOaAGBxAhdTu8ipWE2sVuJSVFKXF
 AZ0a9jbW9yzK5nnqMsiEVrQissYO9sTKSsyAzUnjEvOzeBW8u5JIbtUsWGre/cE4j1UO
 tdJ0SV+AWSqmmz1k9/a/IwUhI/fRMuzgPIHELTeb2SALwLOtaA8UDg+duuyZhPVepL44
 h8/5zkWxF70+8SYcHHJYQ/vnE49KG3bR9IGr/RPod0J+9fXlOo79+kSgo//0rK5wbry8
 gq36Zr0noBRV+iM0b4J9DU8ekzxnBfjg/sPlanqzyCxMSgBinAmNLe3SHmGcnNCNj94W
 8UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WwZvJpse6jwsiADvc3x3ywXWVKMnXP8szckK/X4O79M=;
 b=awBwp3SMIZF8/x1/ZRItoD3XzdhxYT5+yca6eMTrQ9AOtRTtpQ0KP+RBTsz9wcthOQ
 mqy1xIZOqBTebdj/eHfcMpMawfN4gF0Po4V97SKmF2ip6yfDMLc6GSQJw8mrxDm4ADFh
 U+appgX7a3SZcHzejx/HDUZnbQM7oC2L4dnOwaMZLX9qD/zKpcW1FRyEwgaIPmVTfen+
 jMq8YlZaf1cNk5YJuCzKd9WxOV0pLSz7MVOo3oUvKWNyDSMsLIBQclWSLUujiygAEHyb
 H1A4Q3Zt0mcOZoQR6jXk+NtODyHC70LEQb4Y/H/sCqp/iApVa1QMftE1HfeHbNHsW08t
 wSbg==
X-Gm-Message-State: AGi0PuZli9cgOKWxLNPghgIspqs2tnuae+LrrSvL2fE4/vvno3xFOqM/
 hh3NcYwhMRlYI/mgJQfb028uUGwGv2Jm6eB4MfQ=
X-Google-Smtp-Source: APiQypJgRDIEedJ3xqhUyE/BeWAcl3yH8UZejlp3BUj3DgQ1fk0nP/uH3NsbxBoRVTOES4wCxcnL/APN8Ld9Vcb9G2E=
X-Received: by 2002:a5d:8417:: with SMTP id i23mr25263814ion.186.1588067522309; 
 Tue, 28 Apr 2020 02:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-5-amir73il@gmail.com>
 <20200428092256.GC18634@dell5510>
In-Reply-To: <20200428092256.GC18634@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 28 Apr 2020 12:51:51 +0300
Message-ID: <CAOQ4uxgQFj6QXVPbLZAf59Piiw=JmzoFHeAfAkzQqhqj9o5E4w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/fanotify: New test for FAN_MODIFY_DIR
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Apr 28, 2020 at 12:22 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> ...
> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
> ...
> > +     fd_notify = fanotify_init(FAN_REPORT_FID, 0);
> > +     if (fd_notify == -1) {
> > +             if (errno == EINVAL) {
> > +                     tst_brk(TCONF,
> > +                             "FAN_REPORT_FID not supported by kernel");
> > +                     return;
> tst_brk() exits the test, so return is not needed.
> > +             }
> > +             tst_brk(TBROK | TERRNO,
> > +                     "fanotify_init(FAN_REPORT_FID, 0) failed");
> > +     }
> > +
> > +     /*
> > +      * Watch dir modify events with name in filesystem/dir
> > +      */
> > +     if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag, tc->mask,
> > +                       AT_FDCWD, MOUNT_PATH) < 0) {
> > +             if (errno == EINVAL) {
> > +                     tst_brk(TCONF,
> > +                             "FAN_DIR_MODIFY not supported by kernel");
> > +                     return;
> Also here.
> > +             }
> > +             tst_brk(TBROK | TERRNO,
> > +                 "fanotify_mark (%d, FAN_MARK_ADD | %s, "
> > +                 "FAN_DIR_MODIFY, AT_FDCWD, '"MOUNT_PATH"') "
> > +                 "failed", fd_notify, mark->name);
> > +     }
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> Suggesting these changes:

Hi Petr,

Those changes are fine by me.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
