Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF33260B63
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:57:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FF843C2DE5
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:57:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1A5733C1CB6
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:57:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7F554600851
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:57:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70833AC46;
 Tue,  8 Sep 2020 06:57:47 +0000 (UTC)
Date: Tue, 8 Sep 2020 08:58:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200908065816.GA2475@yuki.lan>
References: <20200907150157.23886-1-chrubis@suse.cz>
 <20200907150157.23886-10-chrubis@suse.cz>
 <4a6a5c02-1d93-de12-cdd5-811e6a3610ce@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a6a5c02-1d93-de12-cdd5-811e6a3610ce@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 09/10] syscalls/ipc: Add shmctl IPC_SET test
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

Hi!
> > diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
> > index 409203db7..39b9ad78a 100644
> > --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
> > +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
> > @@ -42,10 +42,12 @@ static void verify_shmlock(void)
> >   	else
> >   		tst_res(TPASS, "shmctl(%i, SHM_UNLOCK, NULL)", shm_id);
> >   
> > +	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
> > +
> >   	if (ds.shm_perm.mode & SHM_LOCKED)
> > -		tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
> > -	else
> >   		tst_res(TFAIL, "SMH_LOCKED bit is on in shm_perm.mode");
> > +	else
> > +		tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
> >   }
> >   
> This change should belong to "syscalls/ipc: Add shmctl07 test" patch.

My bad I messed up, will fix that later on.

Anything else I missed there?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
