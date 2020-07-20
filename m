Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9E226200
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 16:26:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14A093C4E1F
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 16:26:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 03C723C26E2
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 16:26:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CCF0E6009E1
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 16:24:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9188AD3F;
 Mon, 20 Jul 2020 14:26:18 +0000 (UTC)
Date: Mon, 20 Jul 2020 16:26:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200720142611.GC21201@dell5510>
References: <20200710143607.2546-1-pvorel@suse.cz>
 <20200720142206.GC4457@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720142206.GC4457@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RESENT RFC PATCH 1/1] LVM: Drop legacy scripts and
 runtest files
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

> Hi!
> Looks good to me, acked.
Thanks for your review.

> I would wait a bit more to see if anyone complains about the removal
> though.
Originally posted at the end of May (i.e. more than 1 half month in ML), but it
does not harm to wait a bit longer before dropping them.

https://patchwork.ozlabs.org/project/ltp/patch/20200528110554.10179-3-pvorel@suse.cz/

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
