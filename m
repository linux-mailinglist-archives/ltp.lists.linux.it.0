Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CB97ECF7B7
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 13:02:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39B303C13E2
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 13:02:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BAE4F3C0794
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 13:02:46 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CCFCA200DEC
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 13:02:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3DB62B0AE
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 11:02:45 +0000 (UTC)
Date: Tue, 8 Oct 2019 13:02:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191008110243.GA23860@dell5510>
References: <20191008093218.15801-1-pvorel@suse.cz>
 <20191008105025.GB9170@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008105025.GB9170@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getdents: Fix build under glibc 2.30
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

> > glibc commit b8b3d5a14e ("Linux: Move getdents64 to <dirent.h>")
> > moved the declaration from <unistd.h> to <dirent.h> to match the
> > location of the declaration in musl.

> > Thus we need to include both <dirent.h> and <unistd.h> for getdents64().

> > Using getdents64() declaration requires on both glibc and musl
> > _GNU_SOURCE definition, thus move it to to getdents.h.

> I would rather go for _GNU_SOURCE being defined in the testcases rather
> than hiding it in the getdenst.h header and depending on the order.

> Other than that it's fine.

Make sense. Thanks for a review, merged with this change.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
