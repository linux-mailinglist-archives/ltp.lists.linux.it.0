Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 444E0160427
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 14:23:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A662F3C24DC
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 14:23:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 792D13C1D32
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 14:23:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 384472000E4
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 14:23:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 836F3ADFE;
 Sun, 16 Feb 2020 13:23:46 +0000 (UTC)
Date: Sun, 16 Feb 2020 14:23:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200216132345.GA2718765@x230>
References: <20200210124043.14425-1-pvorel@suse.cz>
 <CAEemH2fvK+d3V8W=sR4YtZpwmE=jq5TmS-g1TNTu+UbW2oU8CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fvK+d3V8W=sR4YtZpwmE=jq5TmS-g1TNTu+UbW2oU8CQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] tst_umount: Fail immediately when errno !=
 EBUSY
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

> Acked-by: Li Wang <liwang@redhat.com>

> Since we have guaranteed there is no other error besides EBUSY, maybe we
> could cancel the 'err == EBUSY' in the next if() sentences.
> Otherweise patch 1/3, 2/3 looks good.

> if (i == 0 && err == EBUSY) {
>     ...
> }
+1 (fixed in prepared code to be merged).
Thanks for your review.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
