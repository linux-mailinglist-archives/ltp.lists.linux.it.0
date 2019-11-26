Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D7E109E68
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:59:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3EAA3C2092
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:59:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AB5213C1C71
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:59:04 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A7139601DA4
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:59:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04396AF0D;
 Tue, 26 Nov 2019 12:59:02 +0000 (UTC)
Date: Tue, 26 Nov 2019 13:59:01 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20191126125901.GA6579@dell5510>
References: <20191107153458.16917-1-rpalethorpe@suse.com>
 <20191107153458.16917-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107153458.16917-2-rpalethorpe@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 1/2] Wrapper for Syzkaller
 reproducers
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
Cc: automated-testing@yoctoproject.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> +++ b/testcases/kernel/syzkaller-repros/Makefile
...
> +# If the reproducers directory is missing then we automatically clone the repo.
> +# We then have to call make recursively to revaluate the targets
> +SYZKALLER_REPROS_DIR ?= $(abs_top_srcdir)/testcases/linux-arts/syzkaller-repros/linux
> +$(SYZKALLER_REPROS_DIR):
> +	git submodule update --init $(abs_top_srcdir)/testcases/linux-arts
Hm, that does not get submodule code.
Reproduced locally and also on travis:
https://travis-ci.org/pevik/ltp/builds/617186693

https://api.travis-ci.org/v3/job/617186701/log.txt
fatal: Not a git repository (or any of the parent directories): .git

or

https://api.travis-ci.org/v3/job/617186700/log.txt
error: pathspec '/usr/src/ltp/testcases/linux-arts' did not match any file(s) known to git

Maybe it's due the fact I already run locally (and the same did travis):
git submodule update --init --recursive

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
