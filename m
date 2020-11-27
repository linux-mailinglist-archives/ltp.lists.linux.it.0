Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 738402C67E4
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 15:26:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D28E3C5DEB
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 15:26:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E92E23C5DDA
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 15:26:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 33A63600069
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 15:26:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B2B5ABD7;
 Fri, 27 Nov 2020 14:26:51 +0000 (UTC)
Date: Fri, 27 Nov 2020 15:26:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201127142649.GA20397@pevik>
References: <20201126214121.6836-1-pvorel@suse.cz>
 <20201126214121.6836-4-pvorel@suse.cz>
 <CAOQ4uxh8yb+GRc2cN=MNcgBu8KZO=NPzmO9tSMkgRAvbUCXjZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxh8yb+GRc2cN=MNcgBu8KZO=NPzmO9tSMkgRAvbUCXjZg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/6] fanotify: Check for FAN_REPORT_FID support
 on fs
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

Hi Amir,

> Just a minor nit below.
> you may add:
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Sure. Thanks for your review!

> As far as I am concerned, you do not need to re-post for the nits
> if Cyril is going to fix my nit on merge (or even if he doesn't)
Sure, I also hope that nothing controversial appear after 4 reviews.

...
> > There might be even more cleanup: not sure if nofid_fd in fanotify13.c
> > is required. According to the description is probably required:

> You're right, It is required.
Thanks for confirmation!

...
> > --- a/testcases/kernel/syscalls/fanotify/fanotify.h
...
> > +static inline int fanotify_fan_report_fid_supported_on_fs(const char *fname)
> > +{
> > +       int fd;
> > +       int rval = 0;
> > +
> > +       fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF | FAN_REPORT_FID, O_RDONLY);
> > +
> > +       if (fanotify_mark(fd, FAN_MARK_ADD | FAN_MARK_FILESYSTEM,
> > +                         FAN_ACCESS | FAN_MODIFY | FAN_CLOSE | FAN_OPEN,
> > +                         AT_FDCWD, fname) < 0) {

> All those flags are not really needed for the test.
> This minimal arg list would have been enough:

> fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS, AT_FDCWD, fname)
Ack, thanks!

> Thanks,
> Amir.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
