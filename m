Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E72C14CE70
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 17:31:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54E6F3C2443
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 17:31:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E08163C242D
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 17:31:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6F221601E61
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 17:31:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DCBDEADEE
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 16:31:27 +0000 (UTC)
Date: Wed, 29 Jan 2020 17:31:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200129163127.GH22477@rei.lan>
References: <20200129132759.5265-1-pvorel@suse.cz>
 <20200129145314.GE22477@rei.lan> <20200129153613.GA13790@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129153613.GA13790@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] ioctl,
 pty Add: fallback definition of struct termio
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Thanks! I wonder if I should move new LTP_CHECK_TERMIO function from newly
> created ltp-termio.m4 into already existing ltp-ioctl.m4. If we want to bother.
> 
> BTW we might want do consider moving simple uses of AC_CHECK_TYPES (e.g.
> ltp-quota.m4) or AC_CHECK_MEMBERS (e.g. ltp-signal.m4, ltp-perf_event.m4)
> into configure.ac, similarly we did for AC_CHECK_HEADERS and AC_CHECK_FUNCS
> (to cut number of files in m4/, which just contain single line).
> But maybe this way it's easier to track why check was done.

I would say that either way is fine, but if you prefer having the simple
ones in configure.ac then go for it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
