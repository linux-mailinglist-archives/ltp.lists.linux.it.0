Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAB76781
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 15:31:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 115C83C1D17
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 15:31:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D39983C1D09
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 15:31:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E962E2013AB
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 15:31:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1CFB6B602;
 Fri, 26 Jul 2019 13:31:25 +0000 (UTC)
Date: Fri, 26 Jul 2019 15:31:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190726133124.GC28028@rei.lan>
References: <20190725033713.8551-1-liwang@redhat.com>
 <20190726121255.GA28028@rei.lan>
 <CAEemH2c96sB1ZA_vnTxSaBy-v=G_WnR58LX+Wt=Q8=UxO0dNtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c96sB1ZA_vnTxSaBy-v=G_WnR58LX+Wt=Q8=UxO0dNtQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
> -----system env-----
> # uname -r
> 5.3.0-rc1+
> 
> # numactl -H
> available: 4 nodes (0-3)
> node 0 cpus: 0 1 2 3 16 17 18 19
> node 0 size: 32171 MB
> node 0 free: 25358 MB
> node 1 cpus: 4 5 6 7 20 21 22 23
> node 1 size: 16125 MB
> node 1 free: 5565 MB
> node 2 cpus: 8 9 10 11 24 25 26 27
> node 2 size: 96765 MB
> node 2 free: 90646 MB
> node 3 cpus: 12 13 14 15 28 29 30 31
> node 3 size: 64482 MB
> node 3 free: 60820 MB
> node distances:
> node   0   1   2   3
>   0:  10  11  11  11
>   1:  11  10  11  11
>   2:  11  11  10  11
>   3:  11  11  11  10
> 
> So, maybe we have to re-evaluate this patch V2 and to figure out why
> the retry mmap() hitting SIGBUS fails.

One possibility would be that the numa_move_pages() triggers SIGBUS
while we do the usleep() before we attempt to retry the mmap(). In that
case the race was present in the test all the time but couldn't be
triggered because the window where the memory is unmapped was very
short. If that is the case we should as well set up a handler to SIGBUS
and ignore it as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
