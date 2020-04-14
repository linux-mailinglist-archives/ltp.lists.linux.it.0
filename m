Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C831A7F33
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 16:08:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D18C3C2B72
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 16:08:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D74BA3C2B34
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 16:08:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3D6C41400778
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 16:08:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CDC19ABD6
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 14:08:14 +0000 (UTC)
Date: Tue, 14 Apr 2020 16:08:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200414140832.GC6700@yuki.lan>
References: <20200414085934.8840-1-mdoucha@suse.cz>
 <20200414085934.8840-2-mdoucha@suse.cz>
 <20200414122908.GA6700@yuki.lan>
 <45d1cdc4-0a15-e987-b88d-87624215019b@suse.cz>
 <20200414130559.GB6700@yuki.lan>
 <1a9956bc-f6b8-f360-e8c8-14fa59bee91b@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a9956bc-f6b8-f360-e8c8-14fa59bee91b@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.7 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URI_NOVOWEL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/3] Add LVM support scripts
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
> >> generate_lvm_runfile.sh will be called near the end of install_ltp to
> >> generate system-specific runfile for LVM tests using the template.
> >> prepare_lvm.sh will be called in a separate OpenQA module right after
> >> boot_ltp. None of these helper scripts should be included in any runfile.
> > 
> > So these are OpenQA specific scripts, I do not think that they belong to
> > LTP upstream unless we make then work with upstream LTP.
> 
> These scripts have no dependencies on OpenQA and can be used to prepare
> LVM test environment under any harness, including manual testing. I've
> made some design choices to ensure compatibility with OpenQA but they're
> really meant as full replacement for testscripts/ltpfslvm.sh which has
> been in LTP since forever.

Sure but unless there is a glue script that actually makes the tests run
or at least a README it's kind of pointless.

I would really prefer if there was something that coulud execute these
tests in upstream by starting a single script, so that it's clear how
these script should be used in the first place.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
