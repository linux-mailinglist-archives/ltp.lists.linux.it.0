Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 891A5750E6
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 16:23:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FB683C1CDE
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 16:23:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EBBF43C0300
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 16:23:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C22C81A00807
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 16:23:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC58DAD72
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 14:23:41 +0000 (UTC)
Date: Thu, 25 Jul 2019 16:23:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20190725142315.GC23135@rei.lan>
References: <20190724080328.16145-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724080328.16145-1-rpalethorpe@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> This patch set introduces a very basic test which kicks the tires of the bpf
> system call. It doesn't actually load a eBPF program, I will create another
> test for that. However I have some concerns which I will discuss while doing
> that.
> 
> There are already extensive BPF tests in the kernel selftests. These appear to
> be quite complex and test a variety of functionality. They also are far less
> structured than LTP's modern tests and are tied to the kernel tree which makes
> using them in QA a pain. There are also some tests in the BCC project, which
> may test the kernel as a byproduct.
> 
> So there are a number of options which are not necessarily mutually exclusive:
> 
> 1) Port (some of) the selftests to the LTP.
> 2) Port the LTP library to the selftests.
> 3) Focus the LTP's BPF tests on reproducing specific high impact bugs.

The option 3 sounds good, just FYI there are CVEs some with POCs for BPF,
just by googling "ebpf CVE" you got some:

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-16995
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7308

Also cloudfare blog seems to be very relevant:

https://blog.cloudflare.com/ebpf-cant-count/

And there are some test stuffed in linux/samples/bpf/ as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
