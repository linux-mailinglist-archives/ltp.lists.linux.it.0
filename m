Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B2197BAA
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:17:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 365C43C314A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:17:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9C6663C3139
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:17:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2BEBF20100F
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:17:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6F455AC51;
 Mon, 30 Mar 2020 12:17:02 +0000 (UTC)
Date: Mon, 30 Mar 2020 14:17:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200330121701.GD23915@dell5510>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <20200327213924.18816-3-pvorel@suse.cz>
 <20200330113111.GD9845@yuki.lan> <20200330114838.GB23915@dell5510>
 <CAEemH2c6UKHipLfc0XXH-QaAx3pVeuqnR+HoUW6hasN8mLmghw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c6UKHipLfc0XXH-QaAx3pVeuqnR+HoUW6hasN8mLmghw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/6] Use .needs_cmds
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

Hi Li,

> > > Hi!
> > > Looks good, acked.
> > thanks a lot for review.

> > Merged these two patches.


> Thanks Petr, there is still a tiny place need fix.
> Hope you can help to correct the description in the next round patch
> merging.
Sure, thanks for catching it!

> +       /* NULL terminated array of required binaries */
> +       const char *const *needs_cmds;

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
