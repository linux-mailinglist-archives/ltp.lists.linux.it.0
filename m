Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 363F332A1B6
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 15:00:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED5583C56ED
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 15:00:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AF3473C56C1
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 15:00:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D417B6026A1
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 15:00:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D53EAFEF;
 Tue,  2 Mar 2021 14:00:55 +0000 (UTC)
Date: Tue, 2 Mar 2021 15:02:28 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <YD5FdG1QyGBCcHyc@yuki.lan>
References: <ae126f8484a916daa5e9b3970461dd3ac4083273.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae126f8484a916daa5e9b3970461dd3ac4083273.camel@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] Determinism issue for swapon/swapoff tests
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
> I've been ensuring the ltp binaries/packages used by Yocto Project
> are reproducible. I've sent two patches which address most of the issues,
> the remaining one was with the swapon/swapoff tests.
> 
> The challenge there is they share libswapon.o. There is a race over
> building it depending on whether swapon or swapoff is built first.
> The issue is that in one case "../swapon/libswapon.c" is referenced
> in libswapon.o and in the other, "libswapon.c" is referenced. This
> means the build isn't deterministic/reproducible.
> 
> I've worked around this in Yocto Project by executing:
> 
> "make -C XXX/testcases/kernel/syscalls/swapon/"
> 
> before running the main compile. That ensures we're deterministic
> but I wanted to mention the issue in case you had a better solution
> to fix the Makefiles?

Actually we recently introduced top level libs directory for code shared
between multiple tests, so the best course of action would be to move
the libswapon.c there.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
