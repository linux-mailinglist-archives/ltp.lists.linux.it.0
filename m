Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E32611BE0E2
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 16:28:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EF203C5EEC
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 16:28:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A95043C281C
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 16:28:04 +0200 (CEST)
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0C1DC1001846
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 16:28:04 +0200 (CEST)
Received: by mail-il1-x141.google.com with SMTP id s10so2546857iln.11
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 07:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pNwzQ8+w11DwSR5xZnPsFiL0X3s60Ftm+iHz0tx2w2g=;
 b=aoJPuZ3ffNRuIgawam/Gr9QE3pnShaCUPQ5Dg0jnT36tuWFr8NrKUkg+PDbaY1VXD1
 ag1SGfy1S0f8QbO13qJDPAbDS62UuA7GXxEkqPTW4H4PTimhKtZepgA6EGmYamIB4pz5
 bJst472VtUGAchC/dZwLHIO0MhRxAeV1mw7wzY4XqJ8CDeWDgFipCDy1jR0flWXWw/4G
 DnlRuLGX+PFqKnXRnQUB5+D6BqoYixDtCfZqf16XM3TyKDoyPfG1BZEmY0y20PJl5/Xg
 rE4jfa4MWm26gwUC8XxjRsgZlDL5vFUM+9M1KTaafXe5GszjjV4JF56aJv+0Sf15OOu9
 f3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pNwzQ8+w11DwSR5xZnPsFiL0X3s60Ftm+iHz0tx2w2g=;
 b=qWjdovQI2YEdNX2HpFlh600XZof0lIqt1n9cv5e0EAfMbj1g3JJBrcjvTYaTo6S3Lu
 IW8n4i89WADtwv/dX9eeSSazCmEcot/NyEMaSchw1rkCn+BalcLMv2GpCOtVX3Lq9GGP
 L4MCqv2GS5CpQWItX/UTGpVhsmqC34mltpAPjD9vBnHirn30TJXlJDQy0lwU7Hlgprf1
 Gc+1oK4r1D2R2Ho6Eo91B6Jsh8EzYCwj+hXNQ6FegbvGjsLXuUmcotq6PiQEpgc5zk/x
 USyzlumVmu8TWfF7gyFmED1ojT/+wNUMek91wMbgdOnkOOAFWACJuqnAKeR7Z+N8anos
 WLyA==
X-Gm-Message-State: AGi0Pub03GbEgSqMq35tdw0IEkN+Mph0Dtx2BAEkus8AETex4jnsjxuY
 s9PWfpy9i5wg1Bnw9GZnvy+K4cXFfZcKiciFxKg=
X-Google-Smtp-Source: APiQypJvdb/KdLCIHcTWqANvREx+WTunQegWywSLxbKpfadPbQoo0XQizQ33fg19BZzFRgVHFIypcAKA0xNsPL24Lk4=
X-Received: by 2002:a92:9e11:: with SMTP id q17mr32524682ili.137.1588170482720; 
 Wed, 29 Apr 2020 07:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200428113501.24711-1-pvorel@suse.cz>
 <20200428113501.24711-2-pvorel@suse.cz>
 <CAOQ4uxjTh5r3JWVzt6Gazh61Cb1Fr7Y90k1mXn=q2WbsSRs2NQ@mail.gmail.com>
 <20200428133748.GA5349@dell5510>
 <CAOQ4uxjJ7qFZVf4YNNK=JYDSc=_+fRoU6v+OAwQ3Vp7soNSAbQ@mail.gmail.com>
 <20200429120611.GA10236@dell5510>
In-Reply-To: <20200429120611.GA10236@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 29 Apr 2020 17:27:51 +0300
Message-ID: <CAOQ4uxjRD_gjLYS_kujAR--GO7QAqUX_B7x=3m9K4Ffzq_Ewmw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] fanotify: Test with tst_variant both raw
 syscall and libc
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

On Wed, Apr 29, 2020 at 3:06 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > My confusion is because you removed the HAVE_SYS_FANOTIFY_H ifdef
> > and now you include sys/fanotify.h unconditionally.
> > So I meant if this code builds with all supported system configurations.
> Thanks! I overlook an obvious error. Patch is wrong, because fanotify.h must be
> included in tests below #if defined(HAVE_SYS_FANOTIFY_H).
> Below is fix to posted patch, tested without <sys/fanotify.h>.
>

That looks sane.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
