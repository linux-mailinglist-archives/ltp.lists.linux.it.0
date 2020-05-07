Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 878781C8EEC
	for <lists+linux-ltp@lfdr.de>; Thu,  7 May 2020 16:31:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B21D63C7362
	for <lists+linux-ltp@lfdr.de>; Thu,  7 May 2020 16:31:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0E5823C2601
 for <ltp@lists.linux.it>; Thu,  7 May 2020 16:31:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7D8E31A000B0
 for <ltp@lists.linux.it>; Thu,  7 May 2020 16:31:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79916ABB2;
 Thu,  7 May 2020 14:31:46 +0000 (UTC)
Date: Thu, 7 May 2020 16:31:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200507143142.GA24733@dell5510>
References: <20200506170407.5562-1-rpalethorpe@suse.com>
 <20200506171921.GA1214@dell5510>
 <CAEemH2eQ9Dd4CewEvPxfZx-1R69QS990iodR1_EsbYBVX8TmyA@mail.gmail.com>
 <20200507141142.GA19567@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507141142.GA19567@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pty04: Correct struct member sizes and add to CVE
 runtest file
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi!
> > nit: I might separate runtest change into it's own commit.

> Agree here, the runtest change should be separated.
+1.

Merged, thanks for a fix!

We still have time to comment out the test if #674 won't be fixed before
release.

Kind regards,
Petr

https://github.com/linux-test-project/ltp/issues/674

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
