Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A2C2206B0
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 10:03:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AE653C1D4B
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 10:03:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 59D7D3C1D4B
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 10:03:48 +0200 (CEST)
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D0C13601CB1
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 10:03:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E375AF31;
 Wed, 15 Jul 2020 08:03:49 +0000 (UTC)
Date: Wed, 15 Jul 2020 10:03:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200715080344.GA10916@dell5510>
References: <20200702153545.3126-1-t-josne@linux.microsoft.com>
 <20200702153545.3126-2-t-josne@linux.microsoft.com>
 <1594774692.12900.220.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1594774692.12900.220.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=7.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] IMA: Verify that the kernel cmdline is passed
 and measured correctly through the kexec barrier.
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Thu, 2020-07-02 at 11:35 -0400, Lachlan Sneff wrote:
> > Add a testcase that verifies that kexec correctly logs the
> > kernel command line to the IMA buffer and that the command
> > line is then correctly measured.

> > This test must be run standalone, since it runs kexec
> > multiple times (and therefore reboots several times).

> Verifying the kexec boot command line doesn't require rebooting. =A0Just
> loading the kexec kernel image should be enough (kexec -s -l).
> =A0Verifying that the measurement list, including the kexec boot command
> line, is carried across kexec could be a separate test.
Mimi, thanks for a confirmation.
Lachlan, so is it possible to turn it as a normal LTP test? And the test lo=
oks
like IMA specific now, thus I'd move it into IMA tests.

I'll post some comments to the test itself.

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
