Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 501342A7F28
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 13:56:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08D553C541D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 13:56:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 14B833C2397
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 13:56:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C974410006B7
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 13:56:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB79AABAE;
 Thu,  5 Nov 2020 12:56:15 +0000 (UTC)
Date: Thu, 5 Nov 2020 13:57:01 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20201105125701.GD10395@yuki.lan>
References: <CA+G9fYu4RdH7zdd5MU=E-o+azMRx-EqR-7VYuJCUastKRd0KCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYu4RdH7zdd5MU=E-o+azMRx-EqR-7VYuJCUastKRd0KCA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [stable-rc 4.14] shmctl04.c:115: TFAIL: SHM_INFO haven't
 returned a valid index: SUCCESS (0)
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
Cc: lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
 linux- stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> LTP syscalls test shmctl04 test modified in latest LTP release 20200930
> and this test reported as fail. so reporting to LTP mailing list.
> Failed on stable-rc 4.14, 4.9 and 4.4 branches but
> passed on stable-rc 4.19, 5.4 and 5.9 branches for arm64, arm, x86_64 and i386.
> 
> shmctl04.c:115: TFAIL: SHM_INFO haven't returned a valid index: SUCCESS (0)
> shmctl04.c:131: TFAIL: Counted used = 0, used_ids = 1
> shmctl04.c:72: TPASS: used_ids = 1
> shmctl04.c:79: TPASS: shm_rss = 0
> shmctl04.c:86: TPASS: shm_swp = 0
> shmctl04.c:93: TPASS: shm_tot = 1

Looks like SHM_STAT_ANY was added to kernel 4.17, that would explain why
shmctl() with SHM_STATA_ANY returns -1 on 4.14 and older but in that
case errno should be EINVAL and not set to zero.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
