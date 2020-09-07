Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7F25FC38
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 16:45:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D8B53C541D
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 16:45:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A34923C2214
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 16:45:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 08D2D600072
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 16:45:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2594CADBB;
 Mon,  7 Sep 2020 14:45:02 +0000 (UTC)
Date: Mon, 7 Sep 2020 16:45:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200907144529.GB10649@yuki.lan>
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-8-chrubis@suse.cz>
 <CAEemH2dJhxobkJtemb8sxx0cc9gfmVc+fq=ZNE0LfKWTdiMuoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dJhxobkJtemb8sxx0cc9gfmVc+fq=ZNE0LfKWTdiMuoA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 7/9] syscalls/ipc: Add shmctl07 test
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

Hi!
> Shouldn't we do update 'ds' before checking the ds.shm_perm.mode?
> 
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
> @@ -42,10 +42,11 @@ static void verify_shmlock(void)
>         else
>                 tst_res(TPASS, "shmctl(%i, SHM_UNLOCK, NULL)", shm_id);
> 
> +       SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
>         if (ds.shm_perm.mode & SHM_LOCKED)
> -               tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
> -       else
>                 tst_res(TFAIL, "SMH_LOCKED bit is on in shm_perm.mode");
> +       else
> +               tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
>  }
> 
> 
> 
> > +       if (ds.shm_perm.mode & SHM_LOCKED)
> > +               tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
> >
> 
> And in this branch, the status should be "on" but not "off".

And also TFAIL.

All will be fixed in v2, thx for the review.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
