Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3454D16141B
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 15:04:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB45E3C25D2
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 15:04:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 21D203C1CDB
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 15:04:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D84BE6009A3
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 15:04:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B5F8B1B0;
 Mon, 17 Feb 2020 14:04:54 +0000 (UTC)
Date: Mon, 17 Feb 2020 15:04:52 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200217140452.GA32465@dell5510>
References: <20200217084622.11199-1-pvorel@suse.cz>
 <20200217084622.11199-5-pvorel@suse.cz>
 <20200217135205.GA25504@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217135205.GA25504@rei>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 4/4] syscalls/fsmount01: Add test for fsmount
 series API
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > +	if (ismount(MNTPOINT)) {
> > +		tst_res(TPASS, "new mount API works");
> > +		SAFE_UMOUNT(MNTPOINT);
> > +		is_mounted = 0;
> > +	} else
> > +		tst_res(TFAIL, "new mount API works");
>                                   ^
> 				"device not mounted" ?
+1.

> Also LKML coding style prefers curly braces over both branches if they
> are required over one of them.
I'll fix this.

> Other than this the patchset looks fine.

+ I'll add sort as a separate change.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
