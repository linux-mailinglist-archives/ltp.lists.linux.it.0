Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C76155CA5
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 18:11:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE5413C23C6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 18:11:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 305703C1CAC
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 18:11:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B5D65100377C
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 18:11:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21684AD89
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 17:11:27 +0000 (UTC)
Date: Fri, 7 Feb 2020 18:11:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200207171125.GC16951@rei.lan>
References: <20200129144913.9889-1-mdoucha@suse.cz>
 <20200129144913.9889-3-mdoucha@suse.cz>
 <20200203152420.GA29586@dell5510> <20200207164544.GB19681@rei.lan>
 <20200207170756.GA10520@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207170756.GA10520@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] Allow acquiring multiple loop devices
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
> > > BTW IMHO DEV_FILE should be #define DEV_FILE "test_dev.%d.img", where %d would
> > > be PID to fix clash when tests run in paralel (e.g. mkswap01.sh and df01.sh).
> > > I'll send a patch tomorrow, based on this one.
> 
> > Huh, do we even attempt to support parallel runs at this point? I doubt
> > so.
> No, but I'd expect it'd be nice to have this support for runltp-ng. Or not?

We will fix this, when we get there. Also thinking of it the file that
is backing the device is actually created in the test temporary
directory, which has unique name anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
