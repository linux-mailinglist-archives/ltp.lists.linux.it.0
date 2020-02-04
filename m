Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 532CA151DB7
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 16:57:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03CA53C245B
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 16:57:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4BE6D3C244B
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 16:57:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 886831401AAE
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 16:57:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D902EAE07;
 Tue,  4 Feb 2020 15:57:04 +0000 (UTC)
Date: Tue, 4 Feb 2020 16:57:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200204155703.GA16838@dell5510>
References: <20200130110753.20459-1-pvorel@suse.cz>
 <e6f7f611-7c2e-04cb-afd9-e11c4423dc3f@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6f7f611-7c2e-04cb-afd9-e11c4423dc3f@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] autotools: Move simple definitions out of
 m4/* to configure.ac
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

Hi Xu,

> > TODO
> > on m4 files (in order to use simple declarations which allows to move them to configure.ac):
> > * verify and delete if they're old enough (e.g. ltp-ptrace.m4 and ltp-taskstats.m4 reference 2008, kernel commit 016ae219 from v2.6.27; ltp-signalfd.m4)
> ltp-prctl.m4 for PR_CAPBSET_DROP and PR_CAPBSET_READ also can be removed
> because it introduced since 2.6.25(it is old enough).
OK, that might go next time.

> IMO, move all simple definitions to configure.ac will make this file mess
> likce old .gitnore file. I perfer to add function or header or macro but not
> include struct in configure.ac.
I think .gitignore files are different because it's content cannot be duplicated
when they're split, but m4/ repeated some checks.
+ we already started to move configuration into configure.ac before
(AC_CHECK_HEADERS and AC_CHECK_FUNCS).
IMHO it's easier to search/work with single file than in many files with very little
content.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
