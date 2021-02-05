Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E62E310E4C
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 18:06:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0DB63C72FB
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 18:06:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1135A3C4F20
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 18:06:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2CB38201020
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 18:06:09 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7FDB6AC97
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 17:06:09 +0000 (UTC)
Date: Fri, 5 Feb 2021 18:06:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YB17ABVa99GD/vLD@pevik>
References: <20210204110342.11821-1-mdoucha@suse.cz>
 <20210204110342.11821-2-mdoucha@suse.cz> <YB1qyucNa+aN3p2V@pevik>
 <28ce5f25-ee74-adad-ba59-d25e3e72aa1d@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28ce5f25-ee74-adad-ba59-d25e3e72aa1d@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] Add safe functions for io_uring to LTP
 library
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

Hi Martin,

> >> +++ b/lib/tst_safe_io_uring.c
> > ...
> >> +	uring->sqr_base = safe_mmap(file, lineno, NULL, uring->sqr_mapsize,
> >> +		PROT_READ | PROT_WRITE, MAP_SHARED | MAP_POPULATE, uring->fd,
> >> +		IORING_OFF_SQ_RING);
> >> +
> >> +	if (uring->sqr_base == MAP_FAILED)
> >> +		return -1;
> > IMHO this is not needed, safe_mmap() breaks on rval == MAP_FAILED.

> Except when called in cleanup() where it prints a warning and returns as
> usual. That's why safe_io_uring_init() returns int instead of void in
> the first place.

> I don't expect that safe_io_uring_init() will be used in cleanup() very
> often but I've made all the other SAFE_*() functions cleanup()-safe and
> I want to stick with that here as well.

Good point, makes sense. Thanks for an explanation.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
