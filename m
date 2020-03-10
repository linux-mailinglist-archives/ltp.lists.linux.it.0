Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F959180970
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 21:45:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45D6F3C6020
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 21:45:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4FD893C13D9
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 21:45:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E0D8D200AD7
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 21:45:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1783ADBB;
 Tue, 10 Mar 2020 20:45:15 +0000 (UTC)
Date: Tue, 10 Mar 2020 21:45:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200310204514.GA4381@dell5510>
References: <1583834577-21695-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <7c240f66-a65b-4444-b4a2-7569f52e5496@cn.fujitsu.com>
 <20200310161001.GA29541@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310161001.GA29541@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] travis: Temporarily disable fedora:lastest
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

> > I also test fedora:32 fedora:33 in my ltp fork[1], they are all pass.
> > fedora:31 and fedora:latest are failed.

> > @Petr, You often modify travis code, if you have some advise, please let me
> > know.
> Thank you for taking care.

> I hoped it'd get fixed soon, but it haven't so far :(
> Generally I'd prefer to use rawhide (which is 33, see [2]), but until it's fixed
> let's use 32 (upcomming release).

> Please send patch today, or I'll commit it myself tonight.
FYI I pushed 34f225892 travis: Temporarily use fedora:33.

When [1] is fixed, we 1) revert this 2) restart these failed jobs, which use
rawhide.

Thanks a lot for taking care and reporting [1].

Kind regards,
Petr

[1] https://github.com/fedora-cloud/docker-brew-fedora/issues/73

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
