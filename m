Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 782A574C67
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 13:02:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1637B3C1D2E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 13:02:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 572873C1C95
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 13:02:55 +0200 (CEST)
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BD48A201343
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 13:02:54 +0200 (CEST)
Received: by mail-yw1-xc43.google.com with SMTP id b143so19089947ywb.7
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ry0AkE+YQNcsopK5Uj6aqNfQD/jBqHibfJ7virR4vuE=;
 b=E49fJAbYiD9UzHrpL33VusYVhwewRzWN5Mua+b3GYa0+AgenrpVkCXGWVN8xArvryg
 idOUQLn0ZFxraojYTwJkKU8aW1XZAyma+ywbj/0QNMUY9FKcgUlPS/WV+c6Zp0Dlslrg
 xtmIFJglQu7UdPqdKNOtEnih1+kWAxzaz87DoArNEIT4s26sTNdzlLONyfIDB9qn65iz
 M70eUdBibGPe9mU+sHY96CZfw6M9PzY0aBSzqpw9/14iZpS3SyROxGHI4M8fMxbUYske
 1NyEoq2u6OK1H++7xzZ5PORhgW0+FS505/AbhSOc0cUcoXhm6EasJ87+B2Plz9EWQxoP
 BuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ry0AkE+YQNcsopK5Uj6aqNfQD/jBqHibfJ7virR4vuE=;
 b=Yntt5tWvI17yA+xPuiQcHN7rdvWiXXRbgppxqh6rxXV9+PZoQAv536EuX0oZph3dOU
 QHDaohSMOgPki7tCjjpoG/nT5zFGnovcx94nPW38NrBqlfzUdynMPaEIZ2NYkKaBRnX3
 2MFsYvPKdTZp3Y1XpSFyO5zjjLfxl0SjSxMLwpuTHyf7c99Tj18VjmIKkjLI+oFbnnPS
 Bi3tRnhcWbrcbUrEM9kCzl+GCpN0Y/h7EJuL96WQmeYrTas0f2YDZpTqMrW5K4Urf5xl
 qWOkvUJZUqCaaxEyYJxHQfzc8a19L1APN/n8qNaRvM5thL8GV+wMGwsNv7H2d8EDj+uK
 jsBw==
X-Gm-Message-State: APjAAAV9Npc8Mv3v+GigLXB0GbzISNA8JGf2As2A0iy4ohYS+5l5roeJ
 nlt7ehEThd9pYEINcKSpRHo/hhDDa4itp6er1FAxHw==
X-Google-Smtp-Source: APXvYqy00/PSN5KEXVPzLrjkwthsjK1a+MEmcalKA/NbywxSeXWA8VAeKXbhctk/HDv8b6eZH0Rr3CXne96gntRkgvE=
X-Received: by 2002:a81:49c3:: with SMTP id w186mr52560533ywa.31.1564052573637; 
 Thu, 25 Jul 2019 04:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAOQ4uxg-5UUTB6Z=4Ma9+6LkLVnCz6NBFS4=7Zq_pJfNhZFRqA@mail.gmail.com>
 <5D3941C4.2070601@cn.fujitsu.com>
 <CAOQ4uxg7w51AVD6fig9HH0s7vjC=G2fz8H1nauBZ3V5TiRzuVQ@mail.gmail.com>
 <5D3980E6.8010104@cn.fujitsu.com>
In-Reply-To: <5D3980E6.8010104@cn.fujitsu.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 25 Jul 2019 14:02:42 +0300
Message-ID: <CAOQ4uxgAwSZEjfE=4PBW6OC2Hy95drErBEGx6r7tsv_gLSve-Q@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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

> > Right, sorry, missed that.
> > It is generally better not to define 1024 array on the stack.
> > Most LTP tests define test path vars as static char arrays in top of test file.
> Hi Amir
>
>   I think it is a code-style preference. IMO, 1024 array is not enough large and this function is not
> interate or recursion call.  It don't make stack overflow. Also, this test path is only used in setup().
>   So, I think keeping it is no problem.
>

Totally agree. It's a matter of coding style so up to project maintainer to
enforce it. I don't mind. Personally, I just prefer to use the code style of
the project I am contributing to.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
