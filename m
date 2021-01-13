Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 141CF2F4804
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 10:55:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87A9C3C5DC0
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 10:55:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A8F383C26DD
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 10:55:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5A8A7600572
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 10:55:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 470F5AA6F;
 Wed, 13 Jan 2021 09:55:01 +0000 (UTC)
Date: Wed, 13 Jan 2021 10:54:59 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <X/7Dc2cb730/RtJy@pevik>
References: <20210113075110.31628-1-pvorel@suse.cz>
 <20210113075110.31628-4-pvorel@suse.cz>
 <5FFEBA89.5040001@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FFEBA89.5040001@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] syscalls: Remove unused include <fcntl.h>
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

> On 2021/1/13 15:51, Petr Vorel wrote:
> > Tests should always use lapi/fcntl.h instead of <fcntl.h> to fix
> > possible missing definitions.

> > But in this case removing include, because fanotify tests include
> > <fcntl.h> in lapi/fcntl.h (via fanotify.h) and
> > {name_to,open_by}_handle_at tests include lapi/fcntl.h in
> > lapi/name_to_handle_at.h.
> Hi Petr,

> This patchset looks good to me.
> Reviewed-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

> Only one monir question:
> Why do we remove <fcntl.h> header for all fanotify tests?
> Of course, just four fanotify tests take use of struct file_handle.
I thought I was clear in the commit description, but obviously I wasn't.
Previous commit adds lapi/fcntl.h to fanotify.h. And lapi/fcntl.h loads
<fcntl.h>, thus it's not needed here.

There has been a discussion in the past whether include "original" headers (e.g.
<fcntl.h>) in lapi headers (e.g. lapi/fcntl.h). I suggested to always include
this header, because we often don't test in Travis these corner cases when
things get broken due some definition missing. It's just safer to always use
lapi header. Previously lapi header was loaded only "when needed", but it gets
broken on less common libc (all but glibc) or on less common archs.
And it does not make sense to load "original" header and then lapi header.

If I remember correctly we agreed on this, but older lapi headers use the old
approach. I might send a patch to cleanup this and document it so we use the
same approach.

Kind regards,
Petr

> Best Regards,
> Xiao Yang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
