Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1232B7A61
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 10:30:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEBA83C2E75
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 10:30:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 24F7A3C4F3C
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 19:04:03 +0100 (CET)
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D24281000AED
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 19:04:02 +0100 (CET)
Received: by mail-qt1-x844.google.com with SMTP id m65so13495616qte.11
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 10:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y3101fum38WUoHdq1MUuzesWDh5vaj9D8RJhfSqmi28=;
 b=eNEULt27mQLHLLsPb32qMoic1tFWkIDWW+uBBFnBalT6i5StixnhRRMDBu0JF1Qb+c
 H2AwCpopoArP+Y0UTs4Tbwd6mRpp5zSeuNiS1Sj0dVPhaJ/MaPUEHKkTkXuSc7VL8nqi
 kzSSQeaInscsLGTdeTQXlmilfE85uTg7LbqdWA2SbPG6C1xvoRtB+e6Ri3e7g3vRyWBm
 SB+XH5nzm4UWF7BQaKxtXHlA9GoIflzXbJcaqZB5RWkYTg1xpe4QEIBi6t+8VWW29hLa
 mxn5bVC2onr2pt0XaFhmP9Z8qxnmDuxqyGlcu7rBLrVzPMB96Wii7nKX8Vhn5xU9vFbb
 wZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y3101fum38WUoHdq1MUuzesWDh5vaj9D8RJhfSqmi28=;
 b=aPMCZLBBRzs1TARMmOhWEzBEXAqTcb0rvyxkcOVkL2E2XSe0hoLhMaj+l8nsx9O0YL
 Tnpg1P8LR0u6+9u1l7EKkZ6N8hl8nVZ38JDFIqek6IJtQH9XL4nSJPi42N8j5peDBIak
 Texk2SCAe3+/MI5cM+9HORF9RsHXWcGfLzHeiszleNaFGQv3P9Im8tCu/NIaKSg2etZ4
 ttunNtHQag6OiWz+yGB/gQ1pJcaGfILc2OzhX2aqV2r7cVfoqaxqUevKB32fBgBW/LIZ
 Hiccz3elGOAPzqSR1KMdLpjP5kpgjwky4jpOWL2nryUpCRpUuA2nLatd9jJxTwCw5AMh
 BuVQ==
X-Gm-Message-State: AOAM530ypXB+KipKZ6f9QcXxRnNO7TetHPcjpHMsxArnEYnj7kF7sK7Z
 G9WX/KyNkaQfErq37DlBF5L4Z3RyG8gb+BUhalM=
X-Google-Smtp-Source: ABdhPJzqlvyhlyfgyrFLwVN6KgPyA70sFFTVhuoVN8hGOj5DyA9Z7KN+aPNIleaRWEBF3E7mEtZsA76ebG7UGD1bwxw=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr14932940qtb.80.1605549841640; 
 Mon, 16 Nov 2020 10:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20201116003345.3261577-1-raj.khem@gmail.com>
 <20201116070857.GB81864@pevik>
 <CAMKF1sqjVMexm38VVt=grmL-K63=hyfA-0aoNyi=53TyFVXJ0w@mail.gmail.com>
 <20201116170320.GC152616@pevik>
In-Reply-To: <20201116170320.GC152616@pevik>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Nov 2020 10:03:35 -0800
Message-ID: <CAMKF1srem0H=hkjkD_Yb1qzyygbbosB06y9x6=g+PasASQrqRQ@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 18 Nov 2020 10:30:37 +0100
Subject: Re: [LTP] [PATCH] Define SYS_futex on 32bit arches using 64-bit
 time_t
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Nov 16, 2020 at 9:03 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi Khem,
>
> > On Sun, Nov 15, 2020 at 11:08 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> > > Hi Khem,
>
> > > > Newer 32bit arches like RISCV32 and ARC are using 64bit time_t
> > > > from get go unlike other 32bit architecture therefore aliasing
> > > __NR_futex to
> > > > __NR_futex_time64 helps avoid the below errors
>
> > > > tst_checkpoint.c:99:17: error: use of undeclared identifier 'SYS_futex'
>
> > > Thanks for your fix.
>
> > > I wonder if this could be defined just in include/lapi/futex.h and this:
>
>
> > > https://github.com/pevik/ltp/commit/a20107ab47554798e0de0347dd4d7259f01675af
>
>
> > It could be but it did not work everywhere when I tried it I guess this
> > header has to be included in all needed placed
>
> Sure, but that's done :)
>
> You put the changes into 3 files:
> lib/tst_checkpoint.c
> testcases/kernel/syscalls/clone/clone08.c
> testcases/kernel/syscalls/futex/futextest.h
>
> Check the affected files:
>
> I put changes into include/lapi/futex.h
> and load it in
> testcases/kernel/syscalls/clone/clone08.c
>
> The other two (testcases/kernel/syscalls/clone/clone08.c
> testcases/kernel/syscalls/futex/futextest.h) already include lapi/futex.h.
>
> Are you sure it's failing when you try my patchset?
>

I tested https://github.com/pevik/ltp/commit/a20107ab47554798e0de0347dd4d7259f01675af
and it works fine. So please use this one.

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
