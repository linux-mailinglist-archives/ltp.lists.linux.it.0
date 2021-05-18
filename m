Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF8D387BC0
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 16:57:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39E5A3CA683
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 16:57:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E42193CA224
 for <ltp@lists.linux.it>; Tue, 18 May 2021 16:57:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 62FF01401113
 for <ltp@lists.linux.it>; Tue, 18 May 2021 16:57:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0963B14B
 for <ltp@lists.linux.it>; Tue, 18 May 2021 14:57:07 +0000 (UTC)
Date: Tue, 18 May 2021 16:57:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YKPVwoRiJKLqneN3@pevik>
References: <20210517163029.22974-1-rpalethorpe@suse.com>
 <20210517163029.22974-7-rpalethorpe@suse.com>
 <YKN4SZcHP9GAGRH4@pevik> <87im3gl5yx.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87im3gl5yx.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 6/6] API: Check exported symbols
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

Hi Richie,

> Hello Petr,

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Richie,

> >> Abort the build process if a new symbol is exported from the library
> >> without tst_ or safe_ prepended.

> > The PR does not work few on old toolchains [1], it fails on [2]:

> > awk: line 1: regular expression /parse_opts ... exceeds implementation size limit

> > It's one of the 2 awk calls in check_export_syms.sh, I suppose the other one.
> > Maybe put non_prefix_syms into temporary file and then run awk on it?

> I doubt it will help, it seems the ignore regex is too long. I'm not
> sure we need the script to run on old toolchains though.

> Maybe we need a development mode configure flag?

I'll have a look into it, as I'd prefer to be fixed
(than repeat people on mailing list that this does not work on older distros).
It's actually only on Debian stable or older.

Kind regards,
Petr

> > Kind regards,
> > Petr

> > [1] https://travis-ci.org/github/pevik/ltp/builds/771465129
> > [2] https://travis-ci.org/github/pevik/ltp/jobs/771465135#L3115

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
