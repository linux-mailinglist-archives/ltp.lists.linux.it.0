Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D76C19AB2B
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 14:01:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89DDA3C3090
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 14:01:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 003663C061B
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 14:01:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7D12D1000C4C
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 14:01:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C71DAAE1C;
 Wed,  1 Apr 2020 12:01:29 +0000 (UTC)
Date: Wed, 1 Apr 2020 14:01:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200401120140.GD23773@yuki.lan>
References: <20200401083228.GA18685@dell5510> <20200401093934.GA23773@yuki.lan>
 <e9ea8c2a-7c00-26a7-fb1a-0db9ae093620@suse.cz>
 <20200401095822.GB23773@yuki.lan>
 <aa695e74-2aed-2b9e-c0c0-7626dfc0a7e1@suse.cz>
 <20200401105055.GC23773@yuki.lan>
 <fd62323e-3d29-884d-1a0c-bf1adc3e28c2@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd62323e-3d29-884d-1a0c-bf1adc3e28c2@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP compilation broken with -fno-common
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >>> The problem here is that gcc10 forbids variables in headers, moving it
> >>> anywhere int the header wouldn't help.
> >>
> >> I don't think GCC cares about where exactly the variable came from. It's
> >> only refusing to link multiple definitions of the same symbol. So if we
> >> move the TCID definition into the TST_NO_DEFAULT_MAIN guard block, GCC
> >> linker should stop complaining because the symbol name will become unique.
> > 
> > See:
> > 
> > https://gcc.gnu.org/gcc-10/porting_to.html
> > 
> 
> This patch fixes the "multiple definition of `TCID'" error. But never
> mind because we'll get the "undefined reference to `TCID'" error instead
> from about 50 programs files that use the new library but define their
> own main().
> 
> Reminder that "multiple definition of `TCID'" is a linker error. If
> defining variables in .h files were really forbidden, it'd be a
> preprocessor error instead.

Well variables in headers are not exactly forbidden by -fno-common but
they are not resolved as a single global variable by the linker anymore,
which was the default before gcc10. So effectivelly this disallows
having variables in headers if the header is included from more than one
compilation unit becuase you end up with a linker error.

The end result is overall the same, no more variables in headers in any
non-trivial codebase.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
