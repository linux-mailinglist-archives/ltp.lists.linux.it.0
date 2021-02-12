Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1911319FE4
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 14:31:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FD2B3C6CDC
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 14:31:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B4E6B3C6BA6
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 14:31:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A4C6F601DC2
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 14:31:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D83D3B1EA;
 Fri, 12 Feb 2021 13:31:17 +0000 (UTC)
Date: Fri, 12 Feb 2021 14:31:16 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YCaDJAlQOEF5wulw@pevik>
References: <20210211174543.25003-1-rpalethorpe@suse.com>
 <20210211174543.25003-6-rpalethorpe@suse.com>
 <YCZ9FaUwcitx3hNL@pevik> <YCZ/v82SPHjCtPI2@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCZ/v82SPHjCtPI2@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/5] close_range: Add test
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > >  .../kernel/syscalls/close_range/.gitignore    |   1 +
> > >  .../kernel/syscalls/close_range/Makefile      |  10 +
> > >  .../syscalls/close_range/close_range01.c      | 200 ++++++++++++++++++

> > It looks like you haven't added close_range01 to runtest file.
> > It should probably go to syscalls and Cyril can add it before merging.

> That's what I did along with a few more minor changes and pushed.
Great :).

> > Patchset LGTM and compiles ok.

> Sorry I haven't included your review in the tags.
np :). Thanks for handling this.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
