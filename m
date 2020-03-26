Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C96541938AF
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 07:36:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 972593C4AD3
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 07:36:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6E34D3C3363
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 07:36:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DFA881000B03
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 07:36:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A9B6ACA1
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 06:36:40 +0000 (UTC)
Date: Thu, 26 Mar 2020 07:36:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200326063638.GB5206@dell5510>
References: <20200319162114.3967-1-mdoucha@suse.cz>
 <20200326055639.GA5206@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326055639.GA5206@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for CVE 2018-1000199
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

> > +TST_TEST_CONF("This test is only supported on x86 systems")
> FYI there is TST_TEST_TCONF().
+ There needs to be semicolon after the macro (we could change this in the
library.
> > +#endif

I'd also put adding SAFE_PTRACE() into separate commit.

You can also use SAFE_FOPEN() for *fr.

On some machines I got TBROK, but we probably cannot avoid it.
ptrace08.c:119: BROK: Received unexpected event from child

The rest looks ok to me. Thanks, nice work!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
