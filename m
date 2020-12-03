Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB02CD5B8
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 13:46:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C9703C4CA5
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 13:46:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D630C3C2B95
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 13:46:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 73EFA600F79
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 13:46:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9B75AC6A;
 Thu,  3 Dec 2020 12:46:33 +0000 (UTC)
Date: Thu, 3 Dec 2020 13:47:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20201203124727.GC5809@yuki.lan>
References: <20201119095227.921830-1-lkml@jv-coder.de>
 <20201119113816.GH2785@yuki.lan>
 <8dc13989-88bf-1727-1dbd-83a2163ffb03@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8dc13989-88bf-1727-1dbd-83a2163ffb03@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] realtime/m4: Re-add define for robust mutexattr
 APIs
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
Cc: ltp@lists.linux.it, Mathias Fiedler <mathias.fiedler@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > The code switched to the POSIX variants later on so I wonder if we even
> > need this configure check or if we can remove the ifdefs from the
> > testcases completely.
> either that or this patch. At least at the moment these tests are 
> completely broken.
> I am not sure how long pthread_mutexattr_*roboust* api is part of posix 
> and if ltp is supposed to be supported on platforms, that may not 
> implement it.

As for LTP the only part that is supposed to be used on anything else
than Linux is the open posix testsuite. The rest, including the relatime
tests, is strictly Linux only.

Looking at the glibc the pthread_mutexattr_*robust* calls were
implemented in 2010 which is 10 years from now, which means that it's
old enough to just remove the checks.

Will you send a patch or should I do so?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
