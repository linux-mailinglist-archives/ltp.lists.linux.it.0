Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B353D0EAE
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 14:28:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AA1C3C226E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 14:28:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2EB4F3C2074
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 14:28:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 54275600F48
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 14:26:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 331CDAE92;
 Wed,  9 Oct 2019 12:28:04 +0000 (UTC)
Date: Wed, 9 Oct 2019 14:28:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191009122802.GB7677@rei.lan>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-3-lkml@jv-coder.de>
 <20191009113919.GB7561@rei.lan>
 <64bb824c-d577-86e5-bfa5-17a8cfbf4174@jv-coder.de>
 <20191009114854.GC7561@rei.lan>
 <22bc4865-295c-3147-8e26-f258fac472f8@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22bc4865-295c-3147-8e26-f258fac472f8@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_test.sh: Add public tst_test_root command
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> 2. I wanted to make it consistent with other functions, that do similar
> >> stuff like
> >>   ???? tst_test_drivers and tst_test_cmds. Both also call tst_brk in case
> >> of unsuccessful tests.
> > Well I do not like these names either, it's less descriptive that it
> > would have been with tst_require_cmds and tst_require_drivers, so if
> > anything I would be for renaming the tst_test_* ones.
> Fair enough, that makes sense. But then we require a change to 
> tst_test_* first,
> otherwise the api names are inconsistent. And I'm not sure if changing the
> other functions is really worth it.

Should be easy for tst_test_drivers, that one is only used to implement
the NEEDS_DRIVERS variable. And for the second one, we would have to
change a few tests and one line of documentation, but that would be just
a simple script. I can do that if we agree on the change.

@Jan @Peter what do you think?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
