Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A487DDFD6
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Nov 2023 11:53:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C5DC3CD4F7
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Nov 2023 11:53:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 13C1C3CC8DB
 for <ltp@lists.linux.it>; Wed,  1 Nov 2023 11:53:10 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0B1FE6009F0
 for <ltp@lists.linux.it>; Wed,  1 Nov 2023 11:53:09 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E150821986;
 Wed,  1 Nov 2023 10:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698835988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKEK9gc4z6rOICE7sJpudnzA6H4HytEpeG4Bh88J7GI=;
 b=cRSKlaXd/02VN4UchmNOUdVSTqpP2gKREu2j7Y4OhQmWDdodV92hKJ/E2c0/3W0gbIwRrX
 4o1wPoKd5QZYUc3cfIybFa0Y1y5GEYoQU0c9+ma36HODtBhpBZZqB26wYlP0ItCgJkwRov
 L5Dtd4TzR632Ki0WcNk3K24eSbMEE80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698835988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKEK9gc4z6rOICE7sJpudnzA6H4HytEpeG4Bh88J7GI=;
 b=k/P04dZ1TnJ0Bym8LstxXr2+7eetYIF3HZORQmESggTAejsPx1k2YeyKzvcYruz6CQg43h
 nql5eAZm0uXtcwDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD6A71348D;
 Wed,  1 Nov 2023 10:53:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +LJwMRQuQmVSKwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 01 Nov 2023 10:53:08 +0000
Date: Wed, 1 Nov 2023 11:53:40 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZUIuNMoMbu2gGApM@yuki>
References: <20231030110107.4528-1-andrea.cervesato@suse.de>
 <20231030110107.4528-2-andrea.cervesato@suse.de>
 <20231101103420.GC884786@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231101103420.GC884786@pevik>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] Rewrite fsx-linux test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +++ b/testcases/kernel/fs/fsx-linux/fsx-linux.c
> > @@ -1,1353 +1,392 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> >  /*
> >   * Copyright (C) 1991, NeXT Computer, Inc.  All Rights Reserverd.
> > - * Copyright (c) 1998-2001 Apple Computer, Inc. All rights reserved.
> > - *
> > - * @APPLE_LICENSE_HEADER_START@
> > - *
> > - * The contents of this file constitute Original Code as defined in and
> > - * are subject to the Apple Public Source License Version 1.1 (the
> > - * "License").  You may not use this file except in compliance with the
> > - * License.  Please obtain a copy of the License at
> > - * http://www.apple.com/publicsource and read it before using this file.
> 
> I wonder if we can switch from APSL-1.1 to GPL-2.0-or-later
> https://spdx.org/licenses/APSL-1.1.html
> 
> "This is a complete rewrite of the old test." may justify that.

The test was written from scratch based loosely on what the original
stress test did, so I would say that the new license is okay.

But I suggested adding "Based on fxs.c test by Next Computer, Inc."
instead of the copyright lines, since I suppose that once we add these
copyrights we have to keep the original license.

> > - * This Original Code and all software distributed under the License are
> > - * distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, EITHER
> > - * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
> > - * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT.  Please see the
> > - * License for the specific language governing rights and limitations
> > - * under the License.
> > - *
> > - * @APPLE_LICENSE_HEADER_END@
> ...
> 
> > -#include <sys/types.h>
> > -#include <sys/stat.h>
> > -#if defined(_UWIN) || defined(__linux__)
> 
> I would also consider moving (and rename) the file to testcases/kernel/fs/fsx/fsx.c.
> We don't care about _UWIN any more.

I would keep the linux in the name, at least is clear that we do not
intend to be portable to BSDs etc. like the orignal code was.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
