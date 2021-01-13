Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E91932F4691
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 09:36:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A10843C5449
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 09:36:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 721E73C3197
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 09:36:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1F2C6600A01
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 09:36:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AF1AAA6F;
 Wed, 13 Jan 2021 08:36:30 +0000 (UTC)
Date: Wed, 13 Jan 2021 09:36:28 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <X/6xDNIUPMRMTi05@pevik>
References: <20210113075110.31628-1-pvorel@suse.cz>
 <20210113075110.31628-2-pvorel@suse.cz>
 <5FFEAD16.7050704@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FFEAD16.7050704@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lapi: Move struct file_handle into
 lapi/fcntl.h
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

Hi Xu,

...
> > +AC_CHECK_TYPES([struct file_handle],,,[
> > +#define _GNU_SOURCE
> I think file_handle struct doesn't need _GNU_SOURCE macro or I miss
> something?

It does require :).
In glibc is guarded in sysdeps/unix/sysv/linux/bits/fcntl-linux.h with
__USE_GNU which is controlled by user with _GNU_SOURCE.

In musl (which is much easier to read) is just guarded by _GNU_SOURCE.

That is the reason why I guarded it with __USE_GNU in uclibc-ng, when I
backported there the implementation from musl.

Kind regards,
Petr

> Other than this, this patchset LGTM.
> Acked-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Thanks for your review!

Kind regards,
Petr
> > +#include<fcntl.h>
> > +])

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
