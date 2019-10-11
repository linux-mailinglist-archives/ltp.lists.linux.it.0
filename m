Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5191D3B47
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:36:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D9E43C147F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 10:36:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 386983C0794
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:36:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 317371401B13
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 10:36:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8284AACEC;
 Fri, 11 Oct 2019 08:36:15 +0000 (UTC)
Date: Fri, 11 Oct 2019 10:36:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191011083612.GA1315@dell5510>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-3-lkml@jv-coder.de>
 <20191009113919.GB7561@rei.lan>
 <64bb824c-d577-86e5-bfa5-17a8cfbf4174@jv-coder.de>
 <20191009114854.GC7561@rei.lan>
 <22bc4865-295c-3147-8e26-f258fac472f8@jv-coder.de>
 <20191009122802.GB7677@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009122802.GB7677@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > >> 2. I wanted to make it consistent with other functions, that do similar
> > >> stuff like
> > >>   ???? tst_test_drivers and tst_test_cmds. Both also call tst_brk in case
> > >> of unsuccessful tests.
> > > Well I do not like these names either, it's less descriptive that it
> > > would have been with tst_require_cmds and tst_require_drivers, so if
> > > anything I would be for renaming the tst_test_* ones.
> > Fair enough, that makes sense. But then we require a change to 
> > tst_test_* first,
> > otherwise the api names are inconsistent. And I'm not sure if changing the
> > other functions is really worth it.

> Should be easy for tst_test_drivers, that one is only used to implement
> the NEEDS_DRIVERS variable. And for the second one, we would have to
> change a few tests and one line of documentation, but that would be just
> a simple script. I can do that if we agree on the change.

> @Jan @Peter what do you think?
We already did rename once (0567a8958 shell: Rename
s/tst_check_cmds/tst_test_cmds/), but even if we didn't;
I'm for renaming tst_test_* to tst_require_* - clear names are important
(consistency with names as well).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
