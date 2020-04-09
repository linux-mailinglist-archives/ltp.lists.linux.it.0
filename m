Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1701A3242
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:09:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDFF03C2CCA
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:09:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 723623C2CBA
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:09:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EB57E200B36
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:09:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A9263AD5F;
 Thu,  9 Apr 2020 10:09:12 +0000 (UTC)
Date: Thu, 9 Apr 2020 12:09:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200409100925.GC9792@yuki.lan>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <6bb6bc11-c3c0-48e5-0a67-80b246dfbe4b@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bb6bc11-c3c0-48e5-0a67-80b246dfbe4b@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 01/10] lapi: Add a configure check and fallback
 for loop ioctl and flag
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> 
> Here's a little legal issue for LTP: "GPL" and "All rights reserved" are
> mutually exclusive. Those two lines are effectively saying that your
> code is both open-source and proprietary at the same time. Please pick
> one, or the other. It can't be both.

Actually the "All rights reserved" should not have any legal effects.
The Buenos Aires Convention required that text for estabilishing
copyright which you would have needed before you could license your work
under GPL. However it's long obsolete now and has no legal effect as far
as I can tell.

Btw "All rights reserved" is part of the BSD MIT license because of
these reasons.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
