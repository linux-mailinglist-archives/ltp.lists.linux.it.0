Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6F14C8B7
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 11:27:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2B253C256A
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 11:27:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9B4323C2387
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 11:27:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A08691A014E9
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 11:27:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E8D0AAF39;
 Wed, 29 Jan 2020 10:27:06 +0000 (UTC)
Date: Wed, 29 Jan 2020 11:27:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200129102705.GA16176@dell5510>
References: <20200128212725.22781-1-petr.vorel@gmail.com>
 <20200128213902.GA23927@dell5510> <20200129100126.GB21699@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129100126.GB21699@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ioctl02.c: check for struct termio
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

Hi,

> > Hm, am I wrong, and we should rewrite ioctl01.c and ioctl02.c to use struct
> > termios? Or do we want to test with both new struct termios and legacy termio?

> Just have a look at 'man ioctl_list' there are two sets of ioctls one
> for termio and one for termios and as usuall we should ideally test both.
Thanks for info. I had a look at man ioctl_tty, just wasn't sure whether it's
worth to test the legacy one.

Added as easyhack issue (I'll wait a bit before implementing it)
https://github.com/linux-test-project/ltp/issues/637

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
