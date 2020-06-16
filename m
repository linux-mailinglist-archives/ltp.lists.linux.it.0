Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 288571FAD24
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 11:52:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1F0D3C2CFE
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 11:52:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7277D3C0887
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 11:52:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1B45660086F
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 11:52:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E3F7B016;
 Tue, 16 Jun 2020 09:52:58 +0000 (UTC)
Date: Tue, 16 Jun 2020 11:53:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200616095309.GB6239@yuki.lan>
References: <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
 <dc4d34a42d4ca85d4d73b9e87974382368d02296.1590131635.git.viresh.kumar@linaro.org>
 <20200615124324.GB25279@yuki.lan>
 <20200616064142.pagswwcjvvf32oyl@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616064142.pagswwcjvvf32oyl@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/5] include: Add declaration of struct
 ipc64_perm
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > + * The ipc64_perm structure for the powerpc is identical to
> > > + * kern_ipc_perm as we have always had 32-bit UIDs and GIDs in the
> > > + * kernel.  Note extra padding because this structure is passed back
> > > + * and forth between kernel and user space.  Pad space is left for:
> > > + *	- 1 32-bit value to fill up for 8-byte alignment
> > > + *	- 2 miscellaneous 64-bit values
> > > + *
> > > + * This program is free software; you can redistribute it and/or
> > > + * modify it under the terms of the GNU General Public License
> > > + * as published by the Free Software Foundation; either version
> > > + * 2 of the License, or (at your option) any later version.
> > > + */
> >             ^
> > 	    This part.
> 
> I don't see this patch in master yet.

Sorry, haven't done git push at the end of my workday, should be there
now.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
