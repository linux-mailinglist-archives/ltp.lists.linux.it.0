Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6661C22C06F
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 10:07:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 347B73C4CFF
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 10:07:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7438A3C094C
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 10:07:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8BBA11401FBA
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 10:07:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D94BAFA8;
 Fri, 24 Jul 2020 08:07:17 +0000 (UTC)
Date: Fri, 24 Jul 2020 10:07:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200724080732.GA16478@yuki.lan>
References: <20200717152450.10787-1-mdoucha@suse.cz>
 <2b209b61-2bbc-c35f-5704-7b84bab9254d@cn.fujitsu.com>
 <20200723113317.GA18525@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723113317.GA18525@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Convert chdir01 to the new API
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
> > Honestly speak, I don't like merge chdir02 into chdir01 and we should
> > cleanup chdir02 case individually.

We usually tend to split test into possitive and negative testcases
in order to avoid overly complex code. In this case the code looks clean
enough though.

I guess that if we wanted to have a separate test for possitive tests,
we would do something more interesting. Maybe something that does
chdir() and getcwd() in a loop for a while for a random path from a set
of paths, e.g. $TMPDIR, /, "..", "." and would expect the getcwd() to
match the new path after successful chdir() and remain unchanged after
failure. It would probably even more interesting to run chdir() and
getcwd() in a loop in several different threads, in such case we would
expect a valid return from getcwd(), i.e. any of the paths we pass to
chdir().

> chdir02.c tests chdir("/"); and chdir("/tmp"). Not sure whether full path is
> more coverage than relative path from chdir01.c.
> If we consider these useful, we can just add it into chdir01.c.
> 
> Although it looks a bit strange to chroot into root, I'd use just that and avoid
> /tmp (it breaks at least for Android with no good reason).

I guess that we can add /etc or something that is generally present on
the system.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
