Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D089BBD1EB
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 20:38:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6121C3C20BD
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 20:38:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4050E3C111E
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 20:38:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 06E961400BD5
 for <ltp@lists.linux.it>; Tue, 24 Sep 2019 20:38:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 557C3AC93;
 Tue, 24 Sep 2019 18:38:04 +0000 (UTC)
Date: Tue, 24 Sep 2019 20:38:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190924183802.GA6492@dell5510>
References: <20190919135043.14359-1-pvorel@suse.cz>
 <20190919135043.14359-3-pvorel@suse.cz> <20190924140757.GA787@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924140757.GA787@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] shell: Introduce TST_TIMEOUT variable,
 add checks
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

> > +2.2.4 Test temporary directory
> >  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> Can we please avoid this renumbering, also after this patch this
> variable applies to both shell and C. So this should probably go
> somewhere else, and I'm pretty sure that we have a few more at least
> LTPROOT, TMPDIR, KCONFIG_PATH, LTP_COLORIZE_OUTPUT.

Just a note about renumbering. I don't like it either, but with this format
requiring to specify number section we might end up with important changes being
at the bottom.

It'd help a bit if we had automatic TOC, but I haven't figured out how to do it
properly for AsciiDoc implementation in github.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
