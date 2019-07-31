Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700E7CF57
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 23:06:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4E5B3C1D1A
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 23:06:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 649CD3C1CF7
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 23:06:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3DE8D1001851
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 23:06:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2F2D5ABF1;
 Wed, 31 Jul 2019 21:06:06 +0000 (UTC)
Date: Wed, 31 Jul 2019 23:06:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190731210604.GA26954@dell5510>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190731120503.GC22537@dell5510> <20190731122853.GA30487@rei.lan>
 <20190731124816.GG22537@dell5510> <20190731132558.GB30487@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731132558.GB30487@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 1/3] lib: alter find_free_loopdev()
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

> Hi!
> > > > > -			return 0;
> > > > > +			if (path != NULL)
> > > > > +				strncpy(path, buf, path_len);
> > > > Is it safe to assume that path_len is *always* < 1024 (size of buf)?

> > > strncpy() is tricky that it may not null-terminate the string if the
> > > source is too long, I would have just added path[path_len-1] = 0 after
> > > the strncpy() here.
> > I was thinking about it as well.
> > I suggest to merge it with this change (+ tiny change I proposed in docs).

> I'm okay with that.
Merged into master with these changes and slightly changed commit messages.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
