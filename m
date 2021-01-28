Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 49396307A3B
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 17:03:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4D453C7933
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 17:03:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 5F1D73C2FEE
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 17:03:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 612B0600AA3
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 17:03:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5803AC4F
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 16:03:10 +0000 (UTC)
Date: Thu, 28 Jan 2021 17:03:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YBLgPafndYT+b2Vr@pevik>
References: <20210128144649.6012-1-pvorel@suse.cz> <YBLRadSFcxAWN57a@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBLRadSFcxAWN57a@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib: Fix fs support detection for non-root
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

Hi Cyril,

> Hi!
> > grep /proc/filesystems to find kernel support.
> > But consider only 0 (filesystem found) or 1 (not found),
> > ignore other results (e.g. 2: /proc/filesystems not available or
> > no permissions) and fallback to old solution (calling mount()).

> Why is this needed?
generate_lvm_runfile.sh correctly requires TST_NEEDS_ROOT=1, only for this.
zram0{12}.sh (or maybe better zram_lib.sh, which they use) incorrectly don't
require root, they need it for calling modprobe zram and generally for zram use,
but also for this. I'll fix this in my patchset fixing zram and we can ignore
generate_lvm_runfile.sh.

=> It might not be needed. But generally some test in the future (C or shell)
may want to know filesystem support for other reason which does not require
root. Thus we can drop /proc/filesystems, but at least warning would be nice to
have (although that implementation only prints warning and returns 0, thus
warning will be lost for shell).

Also .all_filesystems in C API have .needs_root = 1. Currently copy_file_range01,
preadv03, pwritev03.
They get obvious hint from tst_acquire_loop_device():
tst_device.c:100: TINFO: Not allowed to open /dev/loop-control. Are you root?: EACCES (13)
=> they need to have .needs_root = 1.
And I wonder if we should have check expecting .needs_root for certain flags
(.all_filesystems, .needs_device, .mntpoint at least).

> Also this breaks FUSE detection.
Sorry for this. Agree with all your suggestions and can send v2 if we don't decide wontfix.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
