Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B011D4D9F
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:26:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C609B3C53AA
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:26:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 811153C180D
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:26:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4B50E20111D
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:26:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B915B181;
 Fri, 15 May 2020 12:26:57 +0000 (UTC)
Date: Fri, 15 May 2020 14:26:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200515122653.GB23472@dell5510>
References: <20200515093216.829-1-pvorel@suse.cz>
 <20200515093216.829-4-pvorel@suse.cz>
 <20200515113131.GB2364@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515113131.GB2364@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/4] INSTALL: Remove uClinux and "What's in a
 Path?" sections
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

> > Note about reasonable PATH it's kind of obvious, we don't have to
> > point that out.

> Well that comment is there becuase of openSUSE build service that
> creates a directories with colon in the middle for home directories and
> LTP fails to build in such scenario, which wasn't that obvious, at least
> if I remmeber correctly. And I do not think that other GNU software
> fails to build in such scenario, I think it's really LTP fault because
> we operate on absolute paths because of the out-of-tree build support.
Interesting, thanks for info.

> Anyways the patchset looks fine, and changes to documentation are
> considered low risk, so let's get this into the release.
Thanks, merged.

You can merge pty04 fix and we can release :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
