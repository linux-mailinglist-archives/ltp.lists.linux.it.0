Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6C28CD4C
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Oct 2020 13:59:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DA023C26C0
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Oct 2020 13:59:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CED093C0376
 for <ltp@lists.linux.it>; Tue, 13 Oct 2020 13:59:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5ED4A200078
 for <ltp@lists.linux.it>; Tue, 13 Oct 2020 13:59:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7BCFB27C;
 Tue, 13 Oct 2020 11:59:10 +0000 (UTC)
Date: Tue, 13 Oct 2020 13:59:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20201013115935.GB29925@yuki.lan>
References: <20201005133054.23587-1-chrubis@suse.cz>
 <20201005133054.23587-5-chrubis@suse.cz>
 <135581472.16896262.1601907346856.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <135581472.16896262.1601907346856.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 04/11] docparse: Add README
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
Cc: Cyril Hrubis <metan@ucw.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +Open Points
> > +===========
> > +
> > +There are stil some loose ends. Mostly it's not well defined where to put
> > +things and how to format them.
> > +
> > +* Some of the hardware requirements are already listed in the tst\_test.
> > Should
> > +  we put all of them there?
> > +
> > +* What would be the format for test documentation and how to store things
> > such
> > +  as test variants there?
> 
> I'm assuming you don't mean ".test_variants" here, but runtest entries
> using same binary with different parameters. Currently we have a "tag"
> that can refer to binary+parameters pair. Which is also useful, for
> skipping tests - e.g. they run long, they are broken, or older kernel
> is known to crash - we have a list of checks that modify runtest files
> before actual run to avoid running into known issues (or save time).

Yes I do mean binary parameters here. And yes we will need a way how to
express skiplist for this as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
