Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7FE31A50B
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 20:10:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CF753C96FC
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 20:10:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1A7003C68F6
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 20:10:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B93C21001190
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 20:10:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E200BAFF3;
 Fri, 12 Feb 2021 19:10:15 +0000 (UTC)
Date: Fri, 12 Feb 2021 20:10:14 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YCbSlgcTS8XM5yp/@pevik>
References: <20210202130441.17861-1-pvorel@suse.cz>
 <20210202130441.17861-2-pvorel@suse.cz> <YCamj5IAuyPMOcBo@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCamj5IAuyPMOcBo@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] keyctl05: TCONF on FIPS mode
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
Cc: ltp@lists.linux.it, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > +	int is_asymmetric = !strcmp(type, "asymmetric");
> > +
> >  	TEST(add_key(type, "desc", payload, plen, KEY_SPEC_SESSION_KEYRING));
> >  	if (TST_RET < 0) {
> > +		if (TST_ERR == EINVAL && is_asymmetric && tst_fips_enabled()) {
>                                                           ^
> 							  I guess that
> 							  we can save
> 							  the value in
> 							  test setup
> 							  instead of
> 							  re-reading it
> 							  on every
> 							  iteration.

> Other than that it looks good to me.
Good point, thanks! Moved to variable set at setup and merged.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
