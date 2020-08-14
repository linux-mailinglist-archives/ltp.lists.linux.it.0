Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CB3244C38
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 17:38:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A184D3C309D
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Aug 2020 17:38:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 79D3C3C1CB8
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 17:38:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3C90A1002047
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 17:38:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A41AAB5BC
 for <ltp@lists.linux.it>; Fri, 14 Aug 2020 15:38:27 +0000 (UTC)
Date: Fri, 14 Aug 2020 17:38:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200814153803.GB30390@dell5510>
References: <20200811130502.12010-1-mdoucha@suse.cz>
 <20200811130502.12010-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811130502.12010-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] Update tests to new taint check API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> These are just trivial changes of tst_taint_init(mask) to .taint_check = mask.
> I intentionally didn't remove any tst_taint_check() calls here.

>  testcases/cve/cve-2017-17053.c                        | 4 +---
>  testcases/kernel/pty/pty05.c                          | 4 +---
>  testcases/kernel/sound/snd_seq01.c                    | 3 +--
>  testcases/kernel/sound/snd_timer01.c                  | 3 +--
>  testcases/kernel/syscalls/connect/connect02.c         | 4 +---
>  testcases/kernel/syscalls/sendmsg/sendmsg03.c         | 3 +--
>  testcases/kernel/syscalls/setsockopt/setsockopt05.c   | 7 +++----
>  testcases/kernel/syscalls/setsockopt/setsockopt06.c   | 4 +---
>  testcases/kernel/syscalls/timerfd/timerfd_settime02.c | 3 +--
>  9 files changed, 11 insertions(+), 24 deletions(-)

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Have you tried to use .taint_check also for testcases/kernel/crypto/af_alg07.c
and testcases/kernel/syscalls/bpf/bpf_prog04.c?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
