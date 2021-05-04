Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 647FD372AA8
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:09:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34DE93C5835
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:09:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 101423C57E0
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:09:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5ACF81000DD6
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:09:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A9F3AF2F
 for <ltp@lists.linux.it>; Tue,  4 May 2021 13:09:00 +0000 (UTC)
Date: Tue, 4 May 2021 15:08:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJFHa4o/aXGvmZE0@pevik>
References: <20210503150415.18835-1-pvorel@suse.cz>
 <YJE4J0gMjhTfsNCO@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJE4J0gMjhTfsNCO@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] docparse: Make tags in table clickable
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

> Hi!
> > linked to the section.

> Looks good, acked.


> Btw, when I was looking at the page today I noticed that in the tags
> table the tag points to the git/CVE page and not the actuall hash or ID.
> I would expect that linux-git would be normal text and the commit id
> would link to the kernel.org repo, and same for the CVE...

Well, no problem, but I'd prefer for commits to move the hash to the text, e.g.

from:
|linux-git-fbe0e839d1e2 | futex: Prevent overflow by strengthen input validation|
to:
|linux-git | fbe0e839d1e2 ("futex: Prevent overflow by strengthen input validation")|

I'll send v2 where I'll implement it and as a second commit I'll change "CVE"
and "linux-git" (and others) pointing to tags metadata.html#tags.

And as TODO I should divide .tags into subsections containing list of actual tag
values (e.g. list of CVE, linux-git (and others)) and point these links to these
sections.

Thanks for your time!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
