Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B122659B2
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 08:56:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17CA53C4FB4
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 08:56:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id ECA0D3C25D9
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 08:56:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9279C1400B80
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 08:56:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77287ABAD;
 Fri, 11 Sep 2020 06:56:52 +0000 (UTC)
Date: Fri, 11 Sep 2020 08:56:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200911065635.GB3425@dell5510>
References: <20200910121628.18505-1-pvorel@suse.cz>
 <20200910153035.GA12601@yuki.lan>
 <CAOQ4uxjaiT4N1uvwzh8Jer4wc3HR+pqxNM_CLzFWZDbxZDxEHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjaiT4N1uvwzh8Jer4wc3HR+pqxNM_CLzFWZDbxZDxEHA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify10: Treat ignore mask bug as TCONF
 for < v5.9
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> What I suggested was to skip only the test cases with non zero
> tc->ignored_onchild for kernel < 5.9.

> Those are the new test cases that are failing due to missing fix
> "497b0c5a7c06 fsnotify: send event to parent and child with single"
> Which is not likely to be backported.

> I see no reason to run those test cases and then report the failure as
> TCONF.
> The TCONF message can say that ignored mask in combination with
> flag FAN_EVENT_ON_CHILD have undefined behavior on kernel < 5.9.
Yep, that makes more sense.

> While at it, please remove the stray line from header comment:
>  *     497b0c5a7c06 fsnotify: send event to parent and child with single...
>  *     eca4784cbb18 fsnotify: send event to parent and child with single...
Apologize for not removing eca4784cbb18.

> And please remove commit id 497b0c5a7c06 from .tags, otherwise,
> stable kernel maintainers are still going to be bothered by attempting
> to find a backport if that test fails due to other reasons on a stable kernel.
+1. I kept comment in the commit (in v2) and explicitly mention why it's not in
tags.

Thanks for all suggestions. Just in case I sent v2 instead of merging it directly.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
