Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D81567BA
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 13:36:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3FD103C104D
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 13:36:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 46F6A3C0ECE
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 13:36:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 69884600D58
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 13:36:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF211AB9B;
 Wed, 26 Jun 2019 11:36:30 +0000 (UTC)
Date: Wed, 26 Jun 2019 13:36:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <20190626113629.GA13189@rei.lan>
References: <a361073f-3fbd-13af-b688-01da6b443b22@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a361073f-3fbd-13af-b688-01da6b443b22@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: fs_fill: fails on btrfs with "ENOSPC" when
 disk size = 512M
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
Cc: linux-btrfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Not being able to delete a file on a filled filesystem sounds like a
filesystem bug to me. CCying Btrfs mailing list.

>       Description:
> 
> fs_fill fails on Btrfs when /dev/loop//*size = 512M*/.
> I tested other size, 256M 1G, all passed.
> 
> 
>       Kernel:
> 
> v5.2-rc1, qemux86-64
> 
> |# make -j40 ARCH=x86_64 CROSS_COMPILE=x86-64-gcc use qemu to bootup kernel |
> 
> 
>       LTP:
> 
> master branch: date 20190625
> 
> 
>       Reproduce:
> 
> |build ltp source and cp ltp all outputs to qemu # vi runltp in 
> function: create_block() dd if=/dev/zero of=${TMP}/test.img bs=1024 
> count=262144 ---> dd if=/dev/zero of=${TMP}/test.img bs=1024 
> count=524288 # runltp -f fs -s fs_fill |
> 
> 
>       Issue:
> 
> The issue maybe not reproduced everytime but four fifths chance.
> 
> |safe_macros.c:358: BROK: fs_fill.c:67: unlink(mntpoint/thread9/file0) 
> failed: ENOSPC safe_macros.c:358: BROK: fs_fill.c:67: 
> unlink(mntpoint/thread4/file0) failed: ENOSPC [ 154.762502] BTRFS 
> warning (device loop0): could not allocate space for a delete; will 
> truncate on mount [ 155.691577] BTRFS warning (device loop0): could not 
> allocate space for a delete; will truncate on mount [ 156.017697] BTRFS 
> warning (device loop0): could not allocate space for a delete; will 
> truncate on mount |
> 
> 
>       Analysis:
> 
> One new kernel commit contained in v5.2-rc1 introduces the issue.
> 
> |commit c8eaeac7b734347c3afba7008b7af62f37b9c140 Author: Josef Bacik 
> <josef@toxicpanda.com> Date: Wed Apr 10 15:56:10 2019 -0400 btrfs: 
> reserve delalloc metadata differently ...|
> 
> 
> Anyone's reply will be appreciated.
> 
> --Hongzhi
> 
> ||

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
