Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF86B31A4D9
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 19:59:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88F753C8D6B
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 19:59:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 300C13C6CDD
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 19:59:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BD2681000456
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 19:59:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFFE9AF74;
 Fri, 12 Feb 2021 18:59:34 +0000 (UTC)
Date: Fri, 12 Feb 2021 19:59:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YCbQFWEUUpU3IIY/@pevik>
References: <20210202130441.17861-1-pvorel@suse.cz> <YCamFRCWW6a4zgLv@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCamFRCWW6a4zgLv@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib: Add function to detect FIPS mode
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

Hi,

> Hi!
> > +#ifndef TST_FIPS_H__
> > +#define TST_FIPS_H__
> > +
> > +#define PATH_FIPS	"/proc/sys/crypto/fips_enabled"

> I'm not sure that this belongs to the header, at least it's not prefixed
> with TST_.
Good catch. As it's not needed I'll move it to C source, because it's not needed
for other tests so far.

BTW the same problem is with PATH_LOCKDOWN from tst_lockdown.[ch].
It'd be better to move them to tst_lockdown.c as well.

> Other than that Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
