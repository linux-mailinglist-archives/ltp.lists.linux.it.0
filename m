Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 337591DAA15
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 07:48:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D71FF3C4DF3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 07:48:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BF4483C2055
 for <ltp@lists.linux.it>; Wed, 20 May 2020 07:48:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1AB896012D1
 for <ltp@lists.linux.it>; Wed, 20 May 2020 07:47:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF3E2AD11;
 Wed, 20 May 2020 05:48:20 +0000 (UTC)
Date: Wed, 20 May 2020 07:48:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200520054816.GA7251@dell5510>
References: <20200519120725.25750-1-pvorel@suse.cz>
 <20200519140704.GE16008@yuki.lan>
 <20200520044056.z67p66mubpok23gi@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520044056.z67p66mubpok23gi@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] C API: Turn .test_variants into array of
 description
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

Hi,

> > I do not think that having more ifdefs and splitting the test variant
> > structure helps to make things simple in the case of timer testcases.

> > What exact problem are you trying to solve?

> This is exactly what I thought about this when I saw the patch, and then also
> the problem of syncing two different arrays with their names (specially in my
> tests).
Agree, that wasn't optimal.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
