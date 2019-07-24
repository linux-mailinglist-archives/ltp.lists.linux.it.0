Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706272B64
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:30:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E65F33C1CF9
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:30:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9E34C3C13D8
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:30:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C9C79600476
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:30:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97B67AF40
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 09:30:42 +0000 (UTC)
Date: Wed, 24 Jul 2019 11:30:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20190724093047.GC4917@dell5510>
References: <20190724080328.16145-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724080328.16145-1-rpalethorpe@suse.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] [RFC] BPF testing
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

Hi Richie,

> Hello,

> This patch set introduces a very basic test which kicks the tires of the bpf
> system call. It doesn't actually load a eBPF program, I will create another
> test for that. However I have some concerns which I will discuss while doing
> that.
Good start, great.

> There are already extensive BPF tests in the kernel selftests. These appear to
> be quite complex and test a variety of functionality. They also are far less
> structured than LTP's modern tests and are tied to the kernel tree which makes
> using them in QA a pain. There are also some tests in the BCC project, which
> may test the kernel as a byproduct.
Yep, this is true for other tests in kselftest tree.

> So there are a number of options which are not necessarily mutually exclusive:

> 1) Port (some of) the selftests to the LTP.
> 2) Port the LTP library to the selftests.
> 3) Focus the LTP's BPF tests on reproducing specific high impact bugs.

> This patch set copies in the necessary headers so that we have zero external
> dependencies.

> I will also use raw byte code for the program test which is at
> least acceptable for trivial programs. So we do not need BCC or Clang/LLVM
> with eBPF support or matching kernel sources to generate offsets into internal
> structures.
+1

> For the time being atleast my preference would be for (3) while avoiding
> taking on any dependencies to ensure those tests are run by users mostly
> ignorant of BPF, but are still exposed to critical bugs in the BPF stack.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
