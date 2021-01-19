Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E02FBAA1
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 16:05:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BB3E3C309C
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 16:05:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8737D3C2314
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 16:05:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EAAC1600B72
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 16:04:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 370AEB737;
 Tue, 19 Jan 2021 15:04:59 +0000 (UTC)
Date: Tue, 19 Jan 2021 16:06:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <YAb1Wncn2/x6LBYj@yuki.lan>
References: <20210119093143.17222-1-rpalethorpe@suse.com>
 <20210119093143.17222-5-rpalethorpe@suse.com>
 <322f1056-0a73-65e6-531a-3275029df256@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <322f1056-0a73-65e6-531a-3275029df256@pengutronix.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/6] can_recv_own_msgs: Convert to new library
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
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it,
 linux-can@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >  /*
> > - * tst-rcv-own-msgs.c
> > - *
> > - * Copyright (c) 2010 Volkswagen Group Electronic Research
> > - * All rights reserved.
> > - *
> > - * Redistribution and use in source and binary forms, with or without
> > - * modification, are permitted provided that the following conditions
> > - * are met:
> > - * 1. Redistributions of source code must retain the above copyright
> > - *    notice, this list of conditions and the following disclaimer.
> > - * 2. Redistributions in binary form must reproduce the above copyright
> > - *    notice, this list of conditions and the following disclaimer in the
> > - *    documentation and/or other materials provided with the distribution.
> > - * 3. Neither the name of Volkswagen nor the names of its contributors
> > - *    may be used to endorse or promote products derived from this software
> > - *    without specific prior written permission.
> 
> IANAL, I think you're missing this license. Is looks like some sort of BSD to me.
> 
> > - *
> > - * Alternatively, provided that this notice is retained in full, this
> > - * software may be distributed under the terms of the GNU General
> > - * Public License ("GPL") version 2, in which case the provisions of the
> > - * GPL apply INSTEAD OF those given above.
> 
> It doesn't say "or later".

Looks like we cannot just remove this license. So what about moving this
text into a separate COPYING file and changing the SPDX to GPL-v2.0?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
