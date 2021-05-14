Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D510938060E
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 11:20:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6F203C3327
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 11:20:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 569D93C1937
 for <ltp@lists.linux.it>; Fri, 14 May 2021 11:20:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D9F43600D6E
 for <ltp@lists.linux.it>; Fri, 14 May 2021 11:20:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F027B17F
 for <ltp@lists.linux.it>; Fri, 14 May 2021 09:20:14 +0000 (UTC)
Date: Fri, 14 May 2021 11:20:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJ5AzHNUAiSGwfS+@pevik>
References: <20210512165702.22883-1-pvorel@suse.cz>
 <20210512165702.22883-2-pvorel@suse.cz> <YJ4qakUgJSkeA/kV@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ4qakUgJSkeA/kV@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] travis: Enhance docparse testing
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

> Hi!
> Looks good.

> Is this making the build significantly slower? If not let's get this in
> now so that we have metadata covered by travis as well.

53 min with [1] vs. 36 min [2] without. That's quite a big difference.
But other build got only 39 min [3], thus running yet another build [4]
to see what's going on. I'd like to have this docparse testing in travis.

Kind regards,
Petr

[1] https://travis-ci.org/github/pevik/ltp/builds/770930869
[2] https://travis-ci.org/github/pevik/ltp/builds/770895636
[3] https://travis-ci.org/github/pevik/ltp/builds/771055881
[4] https://travis-ci.org/github/pevik/ltp/builds/771117708

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
