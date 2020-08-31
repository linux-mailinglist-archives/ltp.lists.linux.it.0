Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6AC25746C
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 09:39:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A05EC3C2DDD
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 09:39:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 76DEA3C2218
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 09:39:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D74281400747
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 09:39:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A89A4B672;
 Mon, 31 Aug 2020 07:40:03 +0000 (UTC)
Date: Mon, 31 Aug 2020 09:39:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200831073927.GA15642@dell5510>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-4-pvorel@suse.cz>
 <20200828131856.GA29915@dell5510> <20200828132825.GA12601@x230>
 <67e8920833abf5f1b77fa59e90bdee3d4eb9262d.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67e8920833abf5f1b77fa59e90bdee3d4eb9262d.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 3/5] IMA: Refactor datafiles directory
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
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> On Fri, 2020-08-28 at 15:28 +0200, Petr Vorel wrote:
> > Hi,

> > > > +SUBDIRS	:= ima_*
> > I guess this could fix it:
> > SUBDIRS	:= $(shell ls ima_*) 

> Other LTP makefiles are using "wildcard".  Like this - $(wildcard
> ima_*/)?
Thanks for a tip. But it looks like wildchard doesn't work on out-of-tree
either:

/usr/src/ltp/include/mk/generic_trunk_target.inc:97: *** SUBDIRS empty -- did you want generic_leaf_target instead?.  Stop.

It's visible only on powerpc64le-linux-gnu-gcc build, because that is the only
one from out-of-tree builds which also does make install.
(We removed make install from most of the builds in order  1) avoid sporadic
build failures due lack of space on Travis docker 2) safe time.)

Thus I fixed it in 4231003f3 with just simple listing the targets:
-SUBDIRS        := ima_*
+SUBDIRS        := ima_kexec ima_keys ima_policy

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
