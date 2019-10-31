Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C45F9EB2CA
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 15:32:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F4453C234F
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 15:32:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id CCE3D3C0051
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 15:31:55 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2AFCA1000426
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 15:31:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7F04FB1F7;
 Thu, 31 Oct 2019 14:31:51 +0000 (UTC)
Date: Thu, 31 Oct 2019 15:31:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191031143148.GA6781@dell5510>
References: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1571821231-3846-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571821231-3846-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/6] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
 test
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
Cc: jack@suse.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
> same as Q_GETQUOTA, but it returns quota information for the next ID
> greater than or equal to id that has a quota set.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  include/lapi/quotactl.h                       | 23 ++---
>  m4/ltp-quota.m4                               | 36 +-------
>  .../kernel/syscalls/quotactl/quotactl01.c     | 86 ++++++++++++-------
>  3 files changed, 67 insertions(+), 78 deletions(-)

> diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
...
>  #ifndef LAPI_QUOTACTL_H__
>  # define LAPI_QUOTACTL_H__

> +#include <linux/quota.h>
I'd prefer to add autotools check for <linux/quota.h configure.ac
(I guess we ignore include/config.h.default atm).

But, more important, I'd prefer to include <sys/quota.h> here as well:

#ifdef HAVE_LINUX_QUOTA_H
# include <linux/quota.h>
#else
# include <sys/quota.h>
#endif

=> move it from quotactl0*.c (there is not yet agreement to include headers in
lapi files, but later lapi files does it).

The reason is that old distros fail when both headers are included at the same
time (probably <linux/quota.h> got fixed later, maybe there is an workaround,
but the easiest way is to handle this in header anyway).

Kind regards,
Petr

[1] https://travis-ci.org/pevik/ltp/jobs/605507690
[2] https://api.travis-ci.org/v3/job/605507690/log.txt

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
