Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF64170CA7
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 00:37:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D393E3C25A9
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 00:37:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 987D03C1D97
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 00:37:19 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5368A1000B09
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 00:37:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9D492AE0F
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 23:37:18 +0000 (UTC)
Date: Thu, 27 Feb 2020 00:37:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20200226233717.GA10163@dell5510>
References: <20200226172620.29815-1-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226172620.29815-1-cfamullaconrad@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Stringify flags to improve error msg of
 unshare()
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

Hi Clemens,

> If your test has multiple calls of unshare() it is hard to read which
> unshare() call really failed. With this we improve the error message to
> something like this:

>   sendmsg03.c:43: CONF: unshare(CLONE_NEWUSER) unsupported: EINVAL (22)

> Instead of having a hard to understand number like:

>   sendmsg03.c:43: CONF: unshare(268435456) unsupported: EINVAL (22)

> Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM. BTW I guess sendmsg03.c is part of patch you're working on atm, right?
It's a bit confusing to refer to file which does not exist in git yet.
Actually, no test is using yet since it's adding in db2f0ed9e.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
