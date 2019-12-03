Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D9E10FD84
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 13:22:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 260B03C25B5
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 13:22:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 456C13C24FD
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 13:22:39 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9351B1A0176C
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 13:22:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C9801B193;
 Tue,  3 Dec 2019 12:22:37 +0000 (UTC)
Date: Tue, 3 Dec 2019 13:22:37 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Rachel Sibley <rasibley@redhat.com>
Message-ID: <20191203122236.GC2844@rei>
References: <cki.B4696121A3.SRVKVUGWT3@redhat.com>
 <546bd6ac-8ab1-9a9b-5856-e6410fb8ee89@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <546bd6ac-8ab1-9a9b-5856-e6410fb8ee89@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] ??? FAIL: Test report for kernel 5.3.13-cc9917b.cki
 (stable-queue)
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > We ran automated tests on a recent commit from this kernel tree:
> > 
> >         Kernel repo: git://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git
> >              Commit: cc9917b40848 - mdio_bus: Fix init if CONFIG_RESET_CONTROLLER=n
> > 
> > The results of these automated tests are provided below.
> > 
> >      Overall result: FAILED (see details below)
> >               Merge: OK
> >             Compile: OK
> >               Tests: FAILED
> > 
> > All kernel binaries, config files, and logs are available for download here:
> > 
> >    https://artifacts.cki-project.org/pipelines/309848
> > 
> > One or more kernel tests failed:
> > 
> >      ppc64le:
> >       ??? LTP
> 
> I see a slew of syscalls failures here for LTP:
> https://artifacts.cki-project.org/pipelines/309848/logs/ppc64le_host_1_LTP_resultoutputfile.log
> https://artifacts.cki-project.org/pipelines/309848/logs/ppc64le_host_1_LTP_syscalls.run.log

There are a few syslog failures, which does not seem to be related to
the kernel commit at all. The commit above seems to touch error handling
in a mdio bus which is used to configure network hardware. I would say
that this is connected to the rest of the unexplained failures on
ppc64le that seems to happen randomly.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
