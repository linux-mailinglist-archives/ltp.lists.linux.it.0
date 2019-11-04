Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3C0ED8F2
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 07:23:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C75053C2515
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 07:23:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B126E3C24D6
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 07:23:45 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CEFF1600718
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 07:23:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F876B365;
 Mon,  4 Nov 2019 06:23:42 +0000 (UTC)
Date: Mon, 4 Nov 2019 07:23:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191104062340.GA9263@dell5510>
References: <20191101073528.GA22452@dell5510>
 <332232ad-3b46-332d-c917-3175ff56868d@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <332232ad-3b46-332d-c917-3175ff56868d@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Remove {config.h,config.mk,features.mk,}.default ?
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

> Yes. Reading LTP/INSTALL[1], these files are used when we don't use autoconf.
> as below:
> Using autoconf (preferred):
> 	$ make autotools # This must be run from "$TOP_SRCDIR"!
> 	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
> 	$ cd "$TOP_BUILDDIR" && "$TOP_SRCDIR/configure" \
> 	  # [configure args go here, e.g. CC=$CC, LDFLAGS=$LDFLAGS, etc]

> Not using autoconf:

> 	$ test -d "$TOP_BUILDDIR" || mkdir -p "$TOP_BUILDDIR"
> 	$ cp "$TOP_SRCDIR/include/config.h.default" \
> 	     "$TOP_BUILDDIR/include/config.h"
> 	$ cp "$TOP_SRCDIR/include/mk/config.mk.default" \
> 	     "$TOP_BUILDDIR/include/mk/config.mk"
> 	$ cp "$TOP_SRCDIR/include/mk/features.mk.default" \
> 	     "$TOP_BUILDDIR/include/mk/features.mk"

> [1]https://github.com/linux-test-project/ltp/blob/master/INSTAL

> ps:IMO, I don't use these files. Now most distributions have auotconf and we can remove these files.
Thanks for review, I'll send a patch to ML.

> Thanks
> Yang Xu

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
