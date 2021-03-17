Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C233ECDD
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:19:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79FD83C2D4E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:19:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6ACCE3C2CFC
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:19:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0C3B41000F10
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:19:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DF83AC1E;
 Wed, 17 Mar 2021 09:19:47 +0000 (UTC)
Date: Wed, 17 Mar 2021 10:19:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
Message-ID: <YFHJsr1ORyl+k7dq@pevik>
References: <20210304021304.1126635-1-ruansy.fnst@fujitsu.com>
 <20210304021304.1126635-2-ruansy.fnst@fujitsu.com>
 <YFDfbrziEwXgxpOS@pevik>
 <OSBPR01MB2920359890156471406C642EF46A9@OSBPR01MB2920.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2920359890156471406C642EF46A9@OSBPR01MB2920.jpnprd01.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/getppid02: Convert to the new API
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > > +/*\
> > > + * [DESCRIPTION]
> > >   *
> > > + * Check that getppid() in child returns the same pid as getpid() in parent.
> > > +\*/
> > nit: this should be merged as */ only (drop leading \, see 96e964f97 ("docparse:
> > Use C standard comment end").

> Hi Petr,

> Do I need to send a v2 to fix this?
No need, we fix it before merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
