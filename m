Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CA2257751
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 12:29:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 281433C555A
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 12:29:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A024D3C2DB1
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 12:29:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 33DE86005EA
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 12:29:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38548AC1D;
 Mon, 31 Aug 2020 10:30:11 +0000 (UTC)
Date: Mon, 31 Aug 2020 12:29:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200831102934.GB17121@dell5510>
References: <b58057275ecdc06bb512d39ea46118197f33c33f.camel@linux.ibm.com>
 <20200827132354.GA20439@dell5510> <20200827135503.GA11990@dell5510>
 <b72657042d13f9b8f30d5bdea7e2d06835e4a1d1.camel@linux.ibm.com>
 <20200827225417.GA29921@dell5510>
 <d6087ee43d18605ee6cdc6b80450b0024af14fb6.camel@linux.ibm.com>
 <20200828060554.GB15251@dell5510>
 <3c720a7060a846088f8e60ce8b5c032467e97f23.camel@linux.ibm.com>
 <20200828124924.GB15355@dell5510>
 <889c90c2777e2683749ab6d339e25aa85b192407.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <889c90c2777e2683749ab6d339e25aa85b192407.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 4/5] IMA: Add a test to verify measurement of
 certificate imported into a keyring
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
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> On Fri, 2020-08-28 at 14:49 +0200, Petr Vorel wrote:
> > > On Fri, 2020-08-28 at 08:05 +0200, Petr Vorel wrote:
> > > > BTW there are also plans for reboot support [1] [2], that could be used as
> > > > workaround for configuration without CONFIG_IMA_READ_POLICY=y and
> > > > CONFIG_IMA_WRITE_POLICY=y.
> > > The reboot support could also be used for carrying the IMA measurement
> > > list across kexec and verifying the TPM PCRs.

> > Adding into my TODO list. I'd just run whole test ima_kexec.sh twice and reboot
> > in between.

> The ima_kexec.sh tests measures the kexec boot cmdline and kernel
> image.   What's needed is walking the measurement list re-calculating
> the PCRs and then verifying them against the actual TPM PCRs.  Maybe
> running the ima_tpm.sh test twice.
Right, thanks for clarification :).

It takes some time till reboot implementation in LTP API is implemented. But I
hope to send fix for TPM 2.0 and sha256 hash (these changes in v5.8) for
ima_tpm.sh this week.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
