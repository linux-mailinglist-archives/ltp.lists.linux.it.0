Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFB0341C00
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 13:11:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79A7E3C5FB2
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 13:11:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EFD703C1C00
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 13:11:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D29D7600847
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 13:11:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38A51AE05;
 Fri, 19 Mar 2021 12:11:40 +0000 (UTC)
Date: Fri, 19 Mar 2021 13:13:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YFSVbmQ7T0kPnlXs@yuki.lan>
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-3-pvorel@suse.cz>
 <60546E24.9010601@fujitsu.com> <YFRvZ89AykS5ldJj@yuki.lan>
 <YFSGZ9YKo/JUHMtm@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFSGZ9YKo/JUHMtm@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] doc: Add Maintainer Patch Review Checklist
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
Cc: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Good point, we should state the default license for new tests and also
> > state that the licence for tests should not change unless they are
> > completely rewritten.
> 
> 
> Maybe:
> 
> * license: the default license for new tests is GPL v2 or later, use
>   GPL-2.0-or-later; the licence for test (e.g. GPL-2.0) should not change unless
>   it's completely rewritten
> * old copyrights should be kept unless test is completely rewritten
> 
> BTW this is important, specially for DMCA from Wipro. Cyril, can you point some
> test from Wipro which could be considered as "completely rewritten"?

This is tricky topic and I'm not a lawyer, so I guess that we better
consult one.

I would expect that if you remove all the previous test code and start
from a scratch the old copyrights would not apply, but again I'm not
lawyer and I do not have in depth understanding of the copyright laws
and treaties.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
