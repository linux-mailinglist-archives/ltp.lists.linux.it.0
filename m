Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF881F966B
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 14:20:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E68563C6032
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 14:20:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3C6C93C0EB6
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 14:20:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 34A3A14192F8
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 14:19:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C0ECAAC7;
 Mon, 15 Jun 2020 12:20:02 +0000 (UTC)
Date: Mon, 15 Jun 2020 14:20:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200615122012.GA25279@yuki.lan>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <3b3344651f2ba4bf2446b6730a76ebcd9f894dd0.1590057824.git.viresh.kumar@linaro.org>
 <20200522123903.GB2446@yuki.lan>
 <20200526030854.xocwohgiyg3p5edh@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526030854.xocwohgiyg3p5edh@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] syscalls:ipc: Move libraries to libs/ director
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > Move the ipc libraries to libs/ directory. One of the reasons to do this
> > > was to add the capability of adding tests with both old and new test
> > > frameworks in the same ipc test directory.
> > 
> > Pushed with following diff, thanks.
> > 
> > 1) You cannot build two different libs in one directory
> > 2) Setting LTPLIBS instead of LDFLAGS generates proper build
> >    dependencies as well
> > 3) Limit the linker flags for the kill and mremap tests
> 
> I don't think you pushed the changes you made. I still see my original
> patch there. :)

Indeed, I messed up ammend when I was in a hurry, sorry for that. I've
pushed a fix today.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
