Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB143417DF
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:01:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19C4D3C5FED
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 10:01:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 314053C2C71
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:01:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 566F01001342
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 10:01:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A34F7AE1B;
 Fri, 19 Mar 2021 09:01:26 +0000 (UTC)
Date: Fri, 19 Mar 2021 10:01:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YFRoZfYwvXssI+4A@pevik>
References: <20210318181641.2062-1-pvorel@suse.cz>
 <20210318181641.2062-2-pvorel@suse.cz>
 <CAEemH2cGPW5KkS2rzU7PcZrLQaF9=O88n-rtOaHtHFoZaCYOSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cGPW5KkS2rzU7PcZrLQaF9=O88n-rtOaHtHFoZaCYOSQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] doc: Document test tags
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

> Petr Vorel <pvorel@suse.cz> wrote:

> +Glibc git commit in a regression test for a glibc bug:
> > +[source,c]

> > +-------------------------------------------------------------------------------
> > +struct tst_test test = {
> > +       ...
> > +       .tags = (const struct tst_tag[]) {
> > +               {"glibc-git", "574500a108be"},
> > +               {}
> > +       }
> > +};

> > +-------------------------------------------------------------------------------
> > +
> > +[source,c]

> > +-------------------------------------------------------------------------------
> > +struct tst_test test = {
> > +       ...
> > +       .tags = (const struct tst_tag[]) {
> > +               {"glibc-git", "574500a108be"},
> > +               {}
> > +       }
> > +};


> I go through many times for the above two structures, but am not see any
> difference:).
Lol :). Thanks for pointing copy paste error, I'll remove the second one.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
