Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5AE2BD8
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 10:14:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7506B3C2371
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 10:14:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7C7AB3C1CAC
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 10:14:41 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6F2FB201178
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 10:14:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF852B5F3;
 Thu, 24 Oct 2019 08:14:39 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 560861E4A99; Thu, 24 Oct 2019 10:14:38 +0200 (CEST)
Date: Thu, 24 Oct 2019 10:14:38 +0200
From: Jan Kara <jack@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191024081438.GJ31271@quack2.suse.cz>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1571821231-3846-6-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571821231-3846-6-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/6] syscalls/quotactl04: add project quota
 test for non-xfs filesystem
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
Cc: jack@suse.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed 23-10-19 17:00:30, Yang Xu wrote:
> This is a variant about quotactl01. It is used to test project quota.
> I split it into a new case instead of adding it in quotaclt01 because
> two points:
> 1)before linux 4.10, ext4 doesn't support project quota
> 2)on old kernel, kernel doesn't permit mount both prjquota and grpquota together
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Suggested-by: Jan Kara <jack@suse.cz>
>
...
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * This testcase checks the basic flag of quotactl(2) for project quota on
> + * non-XFS filesystems.
> + *
> + * 1) quotactl(2) succeeds to turn on quota with Q_QUOTAON flag for project.
> + * 2) quotactl(2) succeeds to set disk quota limits with Q_SETQUOTA flag
> + *    for project.
> + * 3) quotactl(2) succeeds to get disk quota limits with Q_GETQUOTA flag
> + *    for project.
> + * 4) quotactl(2) succeeds to set information about quotafile with Q_SETINFO
> + *    flag for project.
> + * 5) quotactl(2) succeeds to get information about quotafile with Q_GETINFO
> + *    flag for project.
> + * 6) quotactl(2) succeeds to get quota format with Q_GETFMT flag for project.
> + * 7) quotactl(2) succeeds to update quota usages with Q_SYNC flag for project.

Testing Q_SYNC is mostly pointless for project quota as it will just do
nothing (the quota changes are journalled).

> + * 8) quotactl(2) succeeds to get disk quota limit greater than or equal to
> + *    ID with Q_GETNEXTQUOTA flag for project.
> + * 9) quotactl(2) succeeds to turn off quota with Q_QUOTAOFF flag for project.
> + */

Otherwise the set of checks looks sensible to do basic sanity check of
quotactl(2) syscall.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
