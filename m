Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 227DAEF726
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 09:23:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5CCD3C22CD
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 09:23:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0BECF3C2214
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 09:23:26 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B9B881A00FFF
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 09:23:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09085B187;
 Tue,  5 Nov 2019 08:23:25 +0000 (UTC)
Date: Tue, 5 Nov 2019 09:23:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191105082322.GA16218@dell5510>
References: <20191104125228.17173-1-mdoucha@suse.cz>
 <20191104125228.17173-2-mdoucha@suse.cz>
 <20191104151647.GA15477@dell5510>
 <7c68a69d-8edd-d4d5-de1d-39d2cb8e4f03@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c68a69d-8edd-d4d5-de1d-39d2cb8e4f03@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Fix compression ratio calculation in zram01
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

> On 11/4/19 4:16 PM, Petr Vorel wrote:
> > I wonder if /sys/block/zram0/mm_stat is missing whether it can be on any other
> > zram<id>. Is it it's presence file system specific? Shouldn't we just quit whole
> > test wit tst_brk TCONF.

> If /sys/block/zram0/mm_stat is missing then all /sys/block/zram*/mm_stat
> files should be missing. But I don't want to terminate the test there
> because the remaining 3 write tests could still find a regression. So
> print a TCONF message on the first pass and silently skip the remaining
> compression ratio checks.
Do you mean that dd filling zram could find a regression?

I'm asking because it's a bit strange to have test,
which doesn't lead to any result (TPASS/TFAIL/TBROK/TCONF), which will be

If this part is also a test, maybe following TINFO should be changed to TPASS.
+ Also new shell API allows to use loop in API (code simplify), but that
requires for each run to produce a result.


> I was also thinking about checking whether the write test filled the
> test file at least up to 50% of memory limit if mm_stat doesn't exist.
> But it'd mostly add unnecessary complexity.
Agree.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
