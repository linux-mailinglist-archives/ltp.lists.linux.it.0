Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8916D2DC6ED
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 20:15:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 469AF3C5817
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 20:15:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0F4363C2607
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 20:15:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9A9FF1400C5B
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 20:15:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FFE5AF0B
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 19:15:33 +0000 (UTC)
Date: Wed, 16 Dec 2020 20:15:32 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <X9pc1MSXJetCuPTk@pevik>
References: <20201216143244.8180-1-pvorel@suse.cz> <X9oc1p0Z7LbBhKr0@yuki.lan>
 <X9ojaYZkNuwOOsyk@pevik> <X9ooMiuT3DKHwHjJ@yuki.lan>
 <X9ovkdN27zTsK+PN@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9ovkdN27zTsK+PN@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Docparse: Escape | in table content
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > Hi!
> > > BTW I wonder how to fix .test_variants in JSON:
> > > "test_variants": "ARRAY_SIZE"

> > > It's in many tests, e.g.  testcases/kernel/syscalls/clock_gettime/clock_gettime02.c.

> > I guess that we can filter out test_variants for now, I do not think
> > that it will be useful for the metadata that much.

> +1, I'll do it.

Actually, thinking about it twice I'd quite like to have all tags.
Here test variant is for me info that test either test both raw syscall and libc
wrapper or these tests have support for time64 (Viresh Kumar's patches).

So for me would be enough boolean info, not the actual number of variants.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
