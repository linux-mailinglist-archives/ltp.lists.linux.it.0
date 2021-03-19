Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7AA3417E9
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:04:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 868F63C6013
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:04:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 801003C5FAB
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:04:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 31BF460080C
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:04:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82C6EAE05;
 Fri, 19 Mar 2021 09:04:27 +0000 (UTC)
Date: Fri, 19 Mar 2021 10:04:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YFRpGgpEKp+1c9uZ@pevik>
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-3-pvorel@suse.cz>
 <CAEemH2fUGFY6YH=m4SfGpJ_nbYWJmUK1_-mLK8n74zM_WNFLng@mail.gmail.com>
 <CAEemH2dRU-3Q-qjE+t_O6Zh8MKDg4C+1vPAnUR+Js9_fHvFykA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dRU-3Q-qjE+t_O6Zh8MKDg4C+1vPAnUR+Js9_fHvFykA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Li Wang <liwang@redhat.com> wrote:


> > +Commit messages should have
> >> +
> >> +* Author's `Signed-off-by` tag
> >> +* Committer's `Reviewed-by` or `Signed-off-by` tag


> > Or adding `Acked-by:` also acceptable?

> > I'm not sure what's the difference between Acked-by and Reviewed-by,
> > but personally feel the Acked-by has more confidence in the reviewing.

> > In my mind,

> > `Acked-by` means:
> > code review OK, compiled OK, executed OK, has confidence it OK for all
> > arches

> > `Reviewed-by` means:
> > code review OK, compiled and executed OK just locally or optional, still room
> > for improvement/discussion


> Plz ignore my rough understanding, I find a precise description at kernel
> process/submitting-patches.rst.

> https://github.com/torvalds/linux/blob/master/Documentation/process/submitting-patches.rst#when-to-use-acked-by-cc-and-co-developed-by

But you were right, I omit "tags". Maybe this?

- Check also mailing lists for other reviewers / testers
+ Check also mailing lists for other reviewers / testers tags, notes and failure reports

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
