Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ACC7CF1D
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 22:51:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27BC23C1D5B
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 22:51:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E787B3C1CF7
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 22:51:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 76CDC1401129
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 22:51:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8ED6EAC20;
 Wed, 31 Jul 2019 20:51:33 +0000 (UTC)
Date: Wed, 31 Jul 2019 22:51:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it, Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190731205131.GA26660@dell5510>
References: <20190703154709.20863-1-pvorel@suse.cz>
 <20190729141920.GA4040@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729141920.GA4040@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/ioctl08: Require btrfs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> > Test requires btrfs otherwise it fails:
> > WARNING: failed to open /dev/btrfs-control, skipping device
> > registration: No such file or directory
> > safe_macros.c:757: BROK: tst_test.c:752: mount(/dev/loop0, mnt_point,
> > btrfs, 0, (nil)) failed: ENODEV
> could you please test it?

I tested it on kernel without btrfs and it works as expected, thus pushed.
Thanks again for your report.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
