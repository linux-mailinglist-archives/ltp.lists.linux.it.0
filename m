Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCE01DCFB6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 16:29:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6F1F3C4D3C
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 16:29:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EF7CC3C050E
 for <ltp@lists.linux.it>; Thu, 21 May 2020 16:29:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B00ED1A00784
 for <ltp@lists.linux.it>; Thu, 21 May 2020 16:29:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6CF1ACCE;
 Thu, 21 May 2020 14:29:16 +0000 (UTC)
Date: Thu, 21 May 2020 16:29:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200521142942.GF7833@yuki.lan>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <CAK8P3a2N-J5LoNPHa7hjRPcOR0ytNfZQ678pFuCJaJJHGYS--A@mail.gmail.com>
 <20200521142510.GD7833@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521142510.GD7833@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/5] syscalls: Add tests to verify the _time_high
 fields
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > The known bugs we had here were actually on 64-bit machines running
> > compat 32-bit user space. You should be able to test this on most
> > 64-bit distros using the compat libraries and building ltp against the
> > 32-bit version (not sure what the best way is to configure that, but it
> > should not be hard).
> 
> We run LTP compiled with -m32 in our automation in SUSE precisely
> because of these reasons. Not sure if somebody else does that.

In addition to a normal runs. And we also run syscalls with various
kernel debugging enabled, I guess we have one flavor with SLUB_DEBUG
etc.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
