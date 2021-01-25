Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CEC3026D3
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 16:24:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2325F3C5F30
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 16:24:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CB7BF3C52DA
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 16:24:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 30CD01000989
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 16:24:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69050AC97;
 Mon, 25 Jan 2021 15:24:44 +0000 (UTC)
Date: Mon, 25 Jan 2021 16:25:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YA7i/eQagkj0Jxsy@yuki.lan>
References: <20210125064747.26759-1-liwang@redhat.com>
 <20210125064747.26759-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210125064747.26759-2-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC 2/2] swapping01: check memory swap usage per
 process
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
> Since previously swapping01 read the system FreeSwap for counting
> usage of swap-size, that's not precise on system especially with
> eating-memory daemon??in the background. Now, we try to check the
> 'VmmSwap' in proc/PID/status??per process, to get rid of??the potential
> influence from??other processes??which easily leads to false positive.

I've been looking for a while at the kernel commit:

commit 50a15981a1fac7e019ff7c3cba87531fb580f065
Author: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date:   Sun Jul 24 10:47:59 2011 +0200

    [S390] reference bit testing for unmapped pages

For which this test seems to be a reproducer and as far as I can tell
this fix is not correct.

If I understand correctly what we are trying to test here is that the
kernel will not attempt to swap out unreferenced pages, so we have to,
by definition, look at the system counters not the process ones.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
