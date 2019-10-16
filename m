Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6A1D9253
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 15:21:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 609DB3C22AE
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 15:21:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8E5833C1421
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 15:21:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E01E31001430
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 15:21:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3BFDAAC8E;
 Wed, 16 Oct 2019 13:21:41 +0000 (UTC)
Date: Wed, 16 Oct 2019 15:21:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191016132139.GA4526@dell5510>
References: <20191014112522.24548-1-chrubis@suse.cz>
 <20191014112522.24548-3-chrubis@suse.cz>
 <CAEemH2f0ZXYEwsvcxWhdE33EzLJKr=EeeG91Uq_8rBZOsx57NQ@mail.gmail.com>
 <20191015095225.GA14021@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015095225.GA14021@rei>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] testcases/kernel: Add linux git and CVE tags
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

Hi,

> > > +       .tags = (const struct tst_tag[]) {
> > > +               {"linux-git", "4291086b1f08"},
> > > +               {"CVE", "2014-0196"},
> > > +               {}

> > Some of the tests use {NULL, NULL} to terminate tag array but some not,
> > maybe we need to keep consistent in usage.

> I guess I missed some when I was converting {NULL, NULL} to just {}. I
> will fix that in v2.
+1

Nice work, thanks :).
Reviewed-by: Petr Vorel <pvorel@suse.cz>

nit: I don't that much blank lines, I'd prefer more compact output:

OPTIONS
-h       Prints this help
-i n     Execute test n times
-I x     Execute test for n seconds
-C ARG   Run child process with ARG arguments (used internally)

TAGS
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c461cb727d1
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-2618

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
