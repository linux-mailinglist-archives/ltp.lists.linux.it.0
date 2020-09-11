Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9063D2658D5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 07:36:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAC2F3C2BF5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 07:36:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id B1DD53C1CB6
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 07:36:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4F6C9100074D
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 07:35:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA9DEAEE0;
 Fri, 11 Sep 2020 05:36:14 +0000 (UTC)
Date: Fri, 11 Sep 2020 07:35:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200911053557.GA3425@dell5510>
References: <20200910110712.2181-1-pvorel@suse.cz>
 <CAOQ4uxgVkz3Xatg43Py4md7LKEUoJKbb4H-Z5y1PyzPdZbx-Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgVkz3Xatg43Py4md7LKEUoJKbb4H-Z5y1PyzPdZbx-Rw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/fanotify15: TCONF also on EOPNOTSUPP
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> On Thu, Sep 10, 2020 at 2:07 PM Petr Vorel <pvorel@suse.cz> wrote:

> > instead of TBROK:
> > fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
> > fanotify15.c:96: BROK: fanotify_mark(3, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_MODIFY | FAN_ONDIR | 0x400, AT_FDCWD, mntpoint/test_dir) failed: EOPNOTSUPP (95)

> > is now reported:
> > fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
> > fanotify15.c:93: CONF: FAN_REPORT_FID not supported on exfat filesystem

> > fanotify15.c:86: INFO: Test #0: FAN_REPORT_FID on filesystem including FAN_DELETE_SELF
> > fanotify15.c:93: CONF: FAN_REPORT_FID not supported on ntfs filesystem

> > Found on 5.8.0 on openSUSE Tumbleweed.

> > Fixes: 403f11f3a ("syscalls/fanotify15: verify fid for dirent events")

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi,

> > I suppose that EXDEV (in fanotify_test_fid()) is really error which
> > should be caught as TBROK (unlike ENODEV and EOPNOTSUPP). Am I correct?

> No. EXDEV is also an indication of problematic filesystem.
> You will get it if you try to setup the mark on a btrfs subvolume, which is not
> the root volume, because in that case the "fsid" information from event is
> not reliable.

> Probably this is not going to happen in LTP, but still.

> Good spotting.

Merged commit where handling both EOPNOTSUPP and EXDEV.
Thanks!

> Thanks,
> Amir.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
