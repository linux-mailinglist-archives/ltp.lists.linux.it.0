Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F2F269DD2
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 07:28:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 051963C2B44
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Sep 2020 07:28:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CEA443C21DD
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 07:28:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 01C8C6005D6
 for <ltp@lists.linux.it>; Tue, 15 Sep 2020 07:28:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D059AAC7;
 Tue, 15 Sep 2020 05:28:29 +0000 (UTC)
Date: Tue, 15 Sep 2020 07:28:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200915052811.GA4719@dell5510>
References: <20200908073138.GB2475@yuki.lan> <20200910084554.GA21741@dell5510>
 <20200914111543.GE5524@yuki.lan>
 <CY4PR13MB117529F882F68FED2C60AD09FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB117529F882F68FED2C60AD09FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tim, Cyril,

> I'm also open to suggestions for possible tests.  I'd like a shell script command
> to add to the list of binary programs.  Here is what I've chosen so far:
> access01 access01
> chdir01 chdir01
> fork01 fork01
> time01 time01
> wait02 wait02
> write01 write01
> symlink01 symlink01
> stat04 symlink01 -T stat04
> utime01A symlink01 -T utime01
> rename01A symlink01 -T rename01
> splice02 seq 1 20 | splice02
Could we please add at least one network test program?
e.g. route tests with netlink also uses shell API and it's really quick (real
time 0m0,687s):
route6-change-netlink-dst route-change-netlink-dst.sh -6


> This takes about 5 seconds on one of my test machines.
+1

>  -- Tim

> P.S. Maybe, if you're moving away from runltp and ltp-pan, it's a little late to be
> adding some selftests to make sure they work correctly.  But Fuego is using them.
> I don't know what other frameworks use when they invoke LTP to perform
> tests.

> P.P.S How come some tests produce TPASS and some produce just PASS?
Legacy C API and shell API (both legacy and new) add T (i.e. TPASS), new C API
don't add it (i.e. PASS). It's a minor detail we could fix that.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
