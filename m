Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC12917A4A6
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 12:54:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 909283C6510
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 12:54:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B26073C6501
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 12:54:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 35F551A023FB
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 12:54:14 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66A60ACE3
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 11:54:14 +0000 (UTC)
Date: Thu, 5 Mar 2020 12:54:13 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200305115413.GA5882@dell5510>
References: <20200304151201.19117-1-pvorel@suse.cz>
 <b42e93cb-b06d-538c-a5ff-1d110ed8ce74@suse.cz>
 <dc371963-7dd4-1414-f1c9-19696ffc0124@suse.cz>
 <20200304164521.GA5603@dell5510> <20200305101122.GA31652@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305101122.GA31652@rei>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add safe timerfd macros
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

Hi Cyril,

> > > I forgot to add one more thing: making the return value checks more
> > > pedantic would also be nice.
> > I guess you mean if (rval == -1). Sure, I'll do that.

> Actually for the sake of SAFE_MACROS() it makes sense to fail unless we
> got a valid result. So for > 0 for timerfd_create() 
I guess you mean fd < 0 here (no " > 0), as it's a file descriptor.
> and != 0 for
> timerfd_settime() and timerfd_gettime().

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
