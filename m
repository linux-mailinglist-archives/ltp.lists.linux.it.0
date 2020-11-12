Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DE2B04AB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 13:04:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFFAD3C4FEB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 13:04:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 39C273C2EE6
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 13:04:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6AFBB1401320
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 13:04:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFD5FAC54;
 Thu, 12 Nov 2020 12:04:17 +0000 (UTC)
Date: Thu, 12 Nov 2020 13:05:05 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20201112120505.GA15765@yuki.lan>
References: <20201111150926.GA21539@yuki.lan>
 <1605163724-20306-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1605163724-20306-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20201112103217.GD11365@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112103217.GD11365@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/ptrace11: Add test for tracing
 init process
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
> > + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com
> > + *
> > + * This case just check whether we can trace init(1) process and
> > + * doesn't trigger error.
> > + */
> 
> Why is init(1) special here? Is this a regression test?

Looking into the manual page this wasn't supported until 2.6.26. I guess
that we should mention that here in the test description.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
