Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045BCA5A0
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 18:43:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B96893C23CA
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 18:43:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0F4AC3C22AC
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 18:43:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B69161000CBC
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 18:43:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B6A05B241
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 16:43:50 +0000 (UTC)
Date: Thu, 3 Oct 2019 18:43:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191003164347.GA2061@dell5510>
References: <20190930115852.21672-1-pvorel@suse.cz>
 <20190930115852.21672-3-pvorel@suse.cz> <20191003114428.GC1858@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003114428.GC1858@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/2] doc: Add user-guide.txt
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

Hi Cyril,

> >  ```
> > -$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
> > +$ LTPROOT=/opt/ltp PATH="$PATH:$LTPROOT/bin:$LTPROOT/testcases/bin" testcases/bin/wc01.sh
> >  ```

> This looks like an unrelated change at best and should probably be part
> of a separate patch.

> Also the only thing that seems to be installed in $LTPROOT/bin/ that
> could be potentially used by tests is the ffsb tool, that we are going
> to get rid anyways. So I would have avoided including it in the example
> anyways.

Yep, I'm aware ffsb is needed from $LTPROOT/bin. I haven't forced to send
proposal about ffbs adding into separate repository, that why I included it.
But sure, I'll drop this part.
Ack the rest?

> > +1. Library environment variables
> > +--------------------------------
> > +
> > +|==============================================================================
> > +| 'KCONFIG_PATH'        | The path to the kernel config file, (if not set, it tries
> > +                          the usual paths '/boot/config-RELEASE' or '/proc/config.gz').
> > +| 'LTPROOT'             | Prefix for installed LTP, the default is '/opt/ltp'.
> > +| 'LTP_COLORIZE_OUTPUT' | Force colorized output behaviour. 'y' or '1': always colorize
> > +                          'n' or '0': never colorize.
> > +| 'LTP_TIMEOUT_MUL'     | Multiply timeout, must be number >= 1 (> 1 is useful for
> > +                          slow machines to avoid unexpected timeout).
> > +                          Variable is also used in shell tests.
> > +| 'PATH'                | It's required to addjust path:
> > +                          `PATH="$PATH:$LTPROOT/bin:$LTPROOT/testcases/bin"`
+ off course to fix it here.
                               `PATH="$PATH:$LTPROOT/testcases/bin"`

> > +| 'TMPDIR'              | Base directory for template directory, which is required by C tests


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
