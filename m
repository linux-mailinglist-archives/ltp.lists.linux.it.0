Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685AE2B61
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 09:49:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9128F3C236B
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 09:49:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 192163C1824
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 09:49:12 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0A8201A00CA3
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 09:49:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67B69AD0F;
 Thu, 24 Oct 2019 07:49:10 +0000 (UTC)
Date: Thu, 24 Oct 2019 09:49:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20191024074907.GA10174@dell5510>
References: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
 <20191023121901.GA25868@dell5510>
 <463301336.8732968.1571837306503.JavaMail.zimbra@redhat.com>
 <20191023182845.GA2863@x230>
 <CAEemH2dGc-y4yfduw4N=ecwRydXqmEGmG8-eKBxmAxCxL2iEHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dGc-y4yfduw4N=ecwRydXqmEGmG8-eKBxmAxCxL2iEHQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lsmod01.sh: retry test couple times to lower
 false positives
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Jan,

...
> > > I wonder if we need to TBROK in TST_RETRY_FUNC(). We could just return
> > > what the FUNC returns and let the test decide.
> > > TST_RETRY_FUNC_BRK() could be a wrapper that TBROKs on timeout.
> > That could work (apart from the fact it diverges the functionality from C).
> > + there could be the third one, which TPASS/TFAIL (instead of
> > nothing/TBROK).

> > But this should be based on TST_RETRY_FN_EXP_BACKOFF (TST_RETRY_FUNC is
> > reusing
> > TST_RETRY_FN_EXP_BACKOFF) + add also TST_RETRY_FUNC wrappers.

> > Do we need similar functionality in C?


> Not sure, but we could collect the requirement for the EXP_BACKOFF series
> macro. I'm also thinking about to extend the functionality for more
> situations.

> e.g http://lists.linux.it/pipermail/ltp/2019-October/013896.html
+1 for @INFI - 1: retry infinitely, 0: retry in limit times

Combining with TPASS/TFAIL vs. nothing/TBROK it might make sense to either use
enum flags for C implementation, which would save one parameter and allow
further extension. Shell could have getopts instead of more parameters.
And it's a question whether cover all variants with wrappers like
TST_RETRY_FUNC* or not.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
