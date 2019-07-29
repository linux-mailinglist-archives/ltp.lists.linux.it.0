Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452978A9C
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 13:32:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EBD83C1D38
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 13:32:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 30F283C111E
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 13:32:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 31D9A1000C0A
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 13:32:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B1DBB0F2;
 Mon, 29 Jul 2019 11:32:26 +0000 (UTC)
Date: Mon, 29 Jul 2019 13:32:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190729113230.GA29906@dell5510>
References: <20190726182524.43149-1-raj.khem@gmail.com>
 <20190726182524.43149-2-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726182524.43149-2-raj.khem@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] check for RES_USE_INET6 during configure
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

Hi Khem,


> glibc 2.30 has remove RES_USE_INET6 define which has been on its way out
> since 2.26 release, this check ensures that we detect it before using it
Thank you for your patch. Good point, but mc_gethost.c was actually unused,
so I removed it in 5a07ccea5.

There is no other RES_USE_INET6 use (otherwise I'd be for removing it)
therefore autotools checks aren't needed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
