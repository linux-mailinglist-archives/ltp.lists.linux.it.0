Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE04013407E
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 12:30:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 857353C24FF
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 12:30:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0430C3C243D
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 12:30:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 31B1F1401B8A
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 12:30:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 782B9AB7F;
 Wed,  8 Jan 2020 11:30:09 +0000 (UTC)
Date: Wed, 8 Jan 2020 12:30:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200108113008.GB22954@dell5510>
References: <20200107071324.29492-1-liwang@redhat.com>
 <20200107101119.GA22967@rei.lan>
 <CAEemH2fmmQ2a0EVHoqkMwMOjy5EZoiNT+02yYRz-TnWpTQ__0A@mail.gmail.com>
 <20200108112537.GA22954@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108112537.GA22954@dell5510>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: add new tst_dev_sync
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Cyril,

> This broke build with -Werror=implicit-function-declaration [1]:

> ../include/tst_device.h:78:2: error: implicit declaration of function 'syncfs'; did you mean 'sync'? [-Werror=implicit-function-declaration]
> 2770  syncfs(fd);
> 2771  ^~~~~~
> 2772  sync

> The problem is that syncfs() is guarded with __USE_GNU (in glibc, in musl
> directly _GNU_SOURCE), so this requires to use _GNU_SOURCE (before including
> first header).
> Because it's in tst_device.h, we effectively need to build with -D_GNU_SOURCE.
> Is that what we want? Or should we always use tst_syscall(__NR_syncfs, fd)
> (without conditional check #ifndef HAVE_SYNCFS) ?

Or maybe use tst_syscall(__NR_syncfs, fd) in include/tst_device.h and
keep include/lapi/syncfs.h for tests (which would need to define _GNU_SOURCE?).

Kind regards,
Petr

> [1] https://travis-ci.org/linux-test-project/ltp/jobs/634178861

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
