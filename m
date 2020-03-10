Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6951802DF
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 17:10:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE4B13C6027
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 17:10:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4D7623C18F9
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 17:10:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 142DB601771
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 17:10:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F3A42AF45;
 Tue, 10 Mar 2020 16:10:02 +0000 (UTC)
Date: Tue, 10 Mar 2020 17:10:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200310161001.GA29541@dell5510>
References: <1583834577-21695-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <7c240f66-a65b-4444-b4a2-7569f52e5496@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c240f66-a65b-4444-b4a2-7569f52e5496@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

> I also test fedora:32 fedora:33 in my ltp fork[1], they are all pass.
> fedora:31 and fedora:latest are failed.

> @Petr, You often modify travis code, if you have some advise, please let me
> know.
Thank you for taking care.

I hoped it'd get fixed soon, but it haven't so far :(
Generally I'd prefer to use rawhide (which is 33, see [2]), but until it's fixed
let's use 32 (upcomming release).

Please send patch today, or I'll commit it myself tonight.

Kind regards,
Petr

> [1]https://github.com/xuyang0410/ltp/commits/settimeofday_builderror
[2] https://hub.docker.com/_/fedora

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
