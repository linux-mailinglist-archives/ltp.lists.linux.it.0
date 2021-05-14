Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B78EE3807A2
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 12:45:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C4943C5533
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 12:45:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5979B3C2AEE
 for <ltp@lists.linux.it>; Fri, 14 May 2021 12:45:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BF236601CB3
 for <ltp@lists.linux.it>; Fri, 14 May 2021 12:45:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C474AF4E
 for <ltp@lists.linux.it>; Fri, 14 May 2021 10:45:10 +0000 (UTC)
Date: Fri, 14 May 2021 12:45:08 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <YJ5UtOYnapjKtwJU@pevik>
References: <20210512165702.22883-1-pvorel@suse.cz>
 <20210512165702.22883-2-pvorel@suse.cz> <YJ4qakUgJSkeA/kV@yuki>
 <YJ5AzHNUAiSGwfS+@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ5AzHNUAiSGwfS+@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

actually the longest one was caused by openSUSE Tumbleweed,
probably some temporary container update issue.

Thus merging both with your ack.

Kind regards,
Petr

> > Hi!
> > Looks good.

> > Is this making the build significantly slower? If not let's get this in
> > now so that we have metadata covered by travis as well.

> 53 min with [1] vs. 36 min [2] without. That's quite a big difference.
> But other build got only 39 min [3], thus running yet another build [4]
> to see what's going on. I'd like to have this docparse testing in travis.

> Kind regards,
> Petr

> [1] https://travis-ci.org/github/pevik/ltp/builds/770930869
> [2] https://travis-ci.org/github/pevik/ltp/builds/770895636
> [3] https://travis-ci.org/github/pevik/ltp/builds/771055881
> [4] https://travis-ci.org/github/pevik/ltp/builds/771117708

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
