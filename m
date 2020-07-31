Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E8234457
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 12:55:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 355303C28F7
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 12:55:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D503D3C14A2
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 12:55:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4ADEF1001426
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 12:55:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EFD7AD0B
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 10:55:42 +0000 (UTC)
Date: Fri, 31 Jul 2020 12:55:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200731105550.GA2768@yuki.lan>
References: <20200730092637.487-1-pvorel@suse.cz>
 <20200730094842.GB3457@yuki.lan> <20200730101643.GA6381@dell5510>
 <20200730122226.GD3457@yuki.lan> <20200730125329.GA31867@dell5510>
 <20200730140912.GE3457@yuki.lan> <20200730161344.GA18804@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730161344.GA18804@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] semctl: Fix 32 bit build
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> https://travis-ci.org/github/pevik/ltp/jobs/713370407
> /usr/bin/ld: /tmp/ccaGt1eJ.o: in function `main':
> /usr/src/ltp/testcases/network/nfsv4/locks/locktests.c:1012: undefined reference to `configureClient'
> /usr/bin/ld: /usr/src/ltp/testcases/network/nfsv4/locks/locktests.c:1015: undefined reference to `getConfiguration'
> /usr/bin/ld: /usr/src/ltp/testcases/network/nfsv4/locks/locktests.c:1008: undefined reference to `configureServer'
> /usr/bin/ld: /usr/src/ltp/testcases/network/nfsv4/locks/locktests.c:1009: undefined reference to `setupClients'
> 
> Obviously using LTPLDLIBS doesn't apply here. But I don't see what is missing /
> wrong.

Well it matched our explicit rule instead of (different) implicit one,
looks like we have to define a full set, I will send a patchset later
on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
