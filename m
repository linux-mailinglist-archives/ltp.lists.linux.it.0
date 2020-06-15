Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82A1F96D2
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 14:43:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FC343C601E
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 14:43:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1AB9A3C0153
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 14:43:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 545C8100A7F5
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 14:43:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6AA3DABE4;
 Mon, 15 Jun 2020 12:43:14 +0000 (UTC)
Date: Mon, 15 Jun 2020 14:43:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200615124324.GB25279@yuki.lan>
References: <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
 <dc4d34a42d4ca85d4d73b9e87974382368d02296.1590131635.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc4d34a42d4ca85d4d73b9e87974382368d02296.1590131635.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/5] include: Add declaration of struct
 ipc64_perm
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Applied with two changes, thanks.

* The header is moved to lapi/ where it should have been

* I've removed a piece of GPL header that probably ended up in the
  source due to copy&paste

> +#if defined(__powerpc__) || defined(__powerpc64__)
> +#define HAVE_IPC64_PERM
> +/*
> + * The ipc64_perm structure for the powerpc is identical to
> + * kern_ipc_perm as we have always had 32-bit UIDs and GIDs in the
> + * kernel.  Note extra padding because this structure is passed back
> + * and forth between kernel and user space.  Pad space is left for:
> + *	- 1 32-bit value to fill up for 8-byte alignment
> + *	- 2 miscellaneous 64-bit values
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + */
            ^
	    This part.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
