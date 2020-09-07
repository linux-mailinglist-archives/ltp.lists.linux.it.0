Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F3125F922
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 13:16:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E44F3C2D63
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Sep 2020 13:16:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id ADA333C14B2
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 13:16:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D9C6E10006AA
 for <ltp@lists.linux.it>; Mon,  7 Sep 2020 13:16:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF2D7AD46;
 Mon,  7 Sep 2020 11:16:11 +0000 (UTC)
Date: Mon, 7 Sep 2020 13:16:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200907111640.GA10649@yuki.lan>
References: <20200717163453.9587-1-chrubis@suse.cz>
 <20200717163453.9587-4-chrubis@suse.cz>
 <CAEemH2dHcasASDdXKypSwYkg7Yq1+ynO3-Z6QcxMwP6M=Qh3mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dHcasASDdXKypSwYkg7Yq1+ynO3-Z6QcxMwP6M=Qh3mQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/9] syscalls/ipc: shmctl04: Rewrite from scratch.
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
> It failed many times on my personal laptop (5.4.19-100.fc30.x86_64).
> 
> $ cat /proc/sysvipc/shm
>        key      shmid   perms        size      cpid    lpid    nattch   uid
>   gid    cuid    cgid      atime         dtime              ctime
>      rss        swap
>          0          6         1600      524288   2778   5447      2     1000
>  1000  1000  1000 1595120306 1595120306 1595119412      4096        0
>          0          8         1600      524288   1903   2043      2     1000
>  1000  1000  1000 1595119515     0                 1595119515     24576
>    0
> 
> $ ./shmctl04
> tst_test.c:1245: INFO: Timeout per run is 0h 05m 00s
> shmctl04.c:119: PASS: SHM_INFO returned valid index 8
> shmctl04.c:70: PASS: used_ids = 3
> shmctl04.c:77: PASS: shm_rss = 7
> shmctl04.c:84: PASS: shm_swp = 0
> shmctl04.c:91: PASS: shm_tot = 257
> shmctl04.c:95: FAIL: highest shmid = 8, expected 65537
> 
> Summary:
> passed   5
> failed   1
> skipped  0
> warnings 0
> 
> After printing the shm_proc during test running, I guess the 'shmid' is not
> listing in number order sometimes which probably caused that failure.

Looking at the result closely, I guess that I messed up and got confused
here, the return value from SHM_INFO is highest index into the kernel
array, which is equal to highest shmid only by an accident on a freshly
booted machine. I will fix that part in v2.

> 'SHM_STAT_ANY' is introduced since Linux 4.17. We have to confirm the SUT
> supporting before we running it.
> 
> Also, we'd better define it in "ipcshm.h" to avoid compiling errors with
> the old distro.
> 
> shmctl04.c: In function 'verify_shminfo':
> shmctl04.c:114: error: 'SHM_STAT_ANY' undeclared (first use in this
> function)
> shmctl04.c:114: error: (Each undeclared identifier is reported only once
> shmctl04.c:114: error: for each function it appears in.)

Will fix as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
