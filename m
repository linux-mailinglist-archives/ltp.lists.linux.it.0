Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB21F41FA
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 19:15:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F5FC3C2E59
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 19:15:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id EBACA3C094D
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 19:15:45 +0200 (CEST)
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3DE761000BD2
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 19:15:45 +0200 (CEST)
Received: by mail-qt1-x842.google.com with SMTP id j32so18189020qte.10
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wb5kYtxMEg/cSzMjvAYEdbY/kajKOo/WX9CyV5TMFpk=;
 b=PqFckDVBGJVHEGFfOgQPxonUW7P8Bq3IZDlFK6r/LfG3pf4XSkWb+wEyPTthAGRTx9
 jo7e15feHTQOrf1PUleCjeio+1ReeFBEQ4GaIs8SY7T/tRiFgYFBORYMvb2o/c3vimol
 GHZ8nCgBciKj1GtfY+kVqNpYwXezyiynxexftOVWYUt0hnwpSjWKJlWqt67LOVdskxIe
 cDpwvQ4yGbCXCRydGPNkzG+cSvaUyv0q7DEjeeRdQzXilnUdz3FDmaZ/vYzP4CxSqh8n
 APK+/4+f2g1CAR1wgZbQe027Rc1XUa0J2kn1Q+xtj8E9A+brdlIDcI2+uFQRbpSJCYkP
 O+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wb5kYtxMEg/cSzMjvAYEdbY/kajKOo/WX9CyV5TMFpk=;
 b=aR4h3iE5DZPpUMAEmnogf20zAXo+i2aK9LDnEhqowKd6DW4FGeVJzi//HLZEXsRu5N
 Ir44n6x/5COU7fMkXj73p4BcgH8x/+z7c81qDVDTo4E2IIWqnY6Lt5MMjxh51uRGCO5Z
 +bzI7TI9d4fa3Y/3At5032+OZHG0ZSjcEEB6/ZLl7flthewZ8/3eAzV1cM7WUlN/qG8f
 sytCW3KHytUtskvOnzxw2qNNVPa6BaKNTXHp19TPezn22mderX52x4PFuqQ46kEtxcF4
 lU9xbtg49PLY7SZHoMGrWPTPg2lJbo5gvCWP+taaHgYV1+CneSJ3NlX+hROMKGrB6fkc
 J/QA==
X-Gm-Message-State: AOAM5313sNBkoL+CSGmpBWoY1IvxwCX/Z+GGHBoTkqVDyQlMo8COMYak
 RI6BTDaOwWTc2aCwUDHGlu2WH1aHHAILNtwhGgAu+w==
X-Google-Smtp-Source: ABdhPJxIfWdr5hLPxBO2onMq/qxZJCqFB02qhEdONhOpXXpdJZkn0jZP+VhQ9U89lG8Qsfob93nanUXysJgH5Bm8pjM=
X-Received: by 2002:ac8:36c2:: with SMTP id b2mr29676524qtc.257.1591722943803; 
 Tue, 09 Jun 2020 10:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200609113421.10936-1-rpalethorpe@suse.com>
 <20200609165921.GA28805@dell5510>
 <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
In-Reply-To: <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
Date: Tue, 9 Jun 2020 19:15:32 +0200
Message-ID: <CACT4Y+bYdmD7vdNUayT86oiW8yVLUBdFLOZRJ1nTi9AE99KzSg@mail.gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Wrapper for Syzkaller reproducers
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
From: Dmitry Vyukov via ltp <ltp@lists.linux.it>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jun 9, 2020 at 7:10 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 6/9/20 10:59 AM, Petr Vorel wrote:
> > Hi Richard,
> >
> >> So this has now being floating in limbo for some time. My preference is to
> >> merge it to make it easy for users to try out with plenty of time before the
> >> next LTP release. It shouldn't break anything because it is hidden behind a
> >> configure switch.
> > +1
> >
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> >
> > I plan to test it a bit and appreciate if somebody else also test it,
> > but I see no problem to include this patchset.
> > >> V3:
> >> + Updated linux-arts commit (thanks Dmitry and Shuah for updating those!)
> >> + Fixed AC macro
> >
>
> You can send patch to me against linux-arts for this and I will pull
> it in.
>
> Dmitry, is that okay with you. This could make it easier for you and
> reduce your work.

Hi,

I don't have any particular comments.
I assume Richard tested it and it works. if so, it's fine with me :)
I don't have any concrete plans to use this at the moment. We have a
corpus of reproducers in syzkaller format and we can run these. This
should be more useful for kernel continuous integration systems and
distro testing.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
