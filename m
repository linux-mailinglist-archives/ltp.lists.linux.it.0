Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B50A61938C9
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 07:40:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 722AF3C4ADE
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 07:40:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 637FE3C0823
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 07:40:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EC87F60054E
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 07:40:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 547BFAC90
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 06:40:30 +0000 (UTC)
Date: Thu, 26 Mar 2020 07:40:29 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200326064029.GA13858@dell5510>
References: <20200319162114.3967-1-mdoucha@suse.cz>
 <20200326055639.GA5206@dell5510> <20200326063638.GB5206@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326063638.GB5206@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

> > > +TST_TEST_CONF("This test is only supported on x86 systems")
> > FYI there is TST_TEST_TCONF().
> + There needs to be semicolon after the macro (we could change this in the
> library.
> > > +#endif

Last thing about TST_TEST_TCONF() :). You need to define it after including
tst_test.h.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
