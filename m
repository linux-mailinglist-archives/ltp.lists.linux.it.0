Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C92F48C6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 11:39:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA9BD3C2688
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 11:39:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 43B663C25EF
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 11:39:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E2B071A0068B
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 11:39:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06542AC8F;
 Wed, 13 Jan 2021 10:39:02 +0000 (UTC)
Date: Wed, 13 Jan 2021 11:39:00 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <X/7NxM9EaGiXvjDy@pevik>
References: <20210111123626.28932-1-pvorel@suse.cz>
 <5FFEBDCC.6020102@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FFEBDCC.6020102@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] autoconf: Use pkg-config for keyutils
 detection
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

Hi Yang,

> On 2021/1/11 20:36, Petr Vorel wrote:
> > Using pkg-config is less error prone during cross compilation.
> Hi Petr,

> Is there any detailed example about the above point?
Sometimes I experienced problems during cross compilation with installed library
for build architecture but missing library for host architecture build failed
during linking because library was expected but missing.

But I it turned out to be when using our CROSS_COMPILE implementation (without
specifying --host). When configuring with just --host libraries are properly
detected with AC_CHECK_LIB().

pkg-config has some pros and cons.
Pros:
* easily require specific library version
* getting CFLAGS from *.pc file
* IMHO it's a standard way nowadays

Cons:
* For cross compilation it's reuired to set correctly PKG_CONFIG_LIBDIR.

I brought pkg-config as dependency to LTP due checking libtirpc >= 0.2.4.
But this version is already 7 years old so we might not need this version check now.
(and one day it'd be best to fix (or rewrite from scratch) rpc/tirpc tests and
move them to libtirpc upstream as Sun-RPC was removed from glibc in 2.32).

Thus we can safely reconsider if we want pkg-config or not.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
