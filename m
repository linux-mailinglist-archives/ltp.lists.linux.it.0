Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A148233EB5
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 07:34:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CD403C4B9D
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 07:34:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D7F1D3C25EB
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 07:34:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 71001141CE6D
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 07:34:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73C8BAC82;
 Fri, 31 Jul 2020 05:34:57 +0000 (UTC)
Date: Fri, 31 Jul 2020 07:34:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@kernel.org>, Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200731053443.GB3900@dell5510>
References: <20200728001301.31121-1-pvorel@suse.cz>
 <1596139131.25003.14.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596139131.25003.14.camel@kernel.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 4/4] IMA: Add test for kexec cmdline measurement
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi, Lachlan,

> On Tue, 2020-07-28 at 02:13 +0200, Petr Vorel wrote:
> > From: Lachlan Sneff <t-josne@linux.microsoft.com>

> > IMA policy can be set to measure the command line passed in the kexec
> > system call. Add a testcase that verifies that the IMA subsystem
> > correctly measure the cmdline specified during a kexec.

> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
> > [ pvorel: improved setup, various LTP API cleanup ]
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> Thanks, really nice.

> Missing is a short comment explaining the reason for the multiple
> tests.

Just to reduce duplicity with checks.

Anyway, finally merged, thanks a lot both!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
