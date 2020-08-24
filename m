Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB13F24F33A
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 09:41:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62C163C2EF2
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 09:41:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id ECB783C136A
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 09:41:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 409771400752
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 09:41:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1445EB5C2;
 Mon, 24 Aug 2020 07:42:25 +0000 (UTC)
Date: Mon, 24 Aug 2020 09:42:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200824074226.GB2466@yuki.lan>
References: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFuE=4-T=eitwSb0F3fkGLLsmM3VEg4VNbioqJt2JiAEww@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] ltp test add reboot function
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
Cc: ltp@lists.linux.it, Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I want to add a reboot function in LTP for my team write a memory page
> related case???
> and need reboot to make the memory cache or some likely it pure clear.
> 
> So I want to add a tst_needs_reboot. when it was set, reboot the
> machine and continue run test from the point before.
>
> I think  this requirement is meaningful??? So can you give me some advise?

Yes it is, actually you are not the only one who needs that. There are
plenty of other testcases that will have to reboot the machine, for
example the kexec() syscall tests, MCE injection tests, etc.

What I wanted to add is a bit similar to your proposal.

I wanted to add reboots_machine flag to the tst_test structure, which
will inform the test framework that the test will reboot the machine in
the middle of the test.

* The framework will have to inevitably run on a differen machine, but the
  runltp-ng already does that.

* The framework will reconnect to the machine after a reboot and
  re-execute the test with a flag that would say that this is a second
  stage of the test, i.e. after reboot.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
