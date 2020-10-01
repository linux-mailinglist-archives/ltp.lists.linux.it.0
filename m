Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B127FEBC
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Oct 2020 14:01:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 443273C655E
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Oct 2020 14:01:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2A20C3C297A
 for <ltp@lists.linux.it>; Thu,  1 Oct 2020 14:01:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4470160135B
 for <ltp@lists.linux.it>; Thu,  1 Oct 2020 14:01:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5CC40AF98;
 Thu,  1 Oct 2020 12:01:27 +0000 (UTC)
Date: Thu, 1 Oct 2020 14:01:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-ID: <20201001120125.GE32109@dell5510>
References: <20200929165021.11731-1-pvorel@suse.cz>
 <20200929231118.GA805493@linux.intel.com>
 <20200930055314.GA21664@dell5510>
 <20200930115939.GB7612@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930115939.GB7612@linux.intel.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/4] TPM 2.0 fixes in IMA tests
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jarkko,

> On Wed, Sep 30, 2020 at 07:53:14AM +0200, Petr Vorel wrote:
> > Hi Jarkko,

> > > Hi, is there something specific I should look at in this patch set?

> > I'm sorry to bother you with LTP specific code. Can you have a quick look if I
> > didn't overlook anything obvious in reading PCR files (read_pcr_tpm*())?

> > I'm surprised that it's working on my TPM 2.0 which does not export
> > /sys/kernel/security/tpm0/binary_bios_measurements (using evmctl).

> Thank you, this was actually really important remark and reminder.

> OK so I think James' patch is stuck because of me, i.e.

> https://lore.kernel.org/linux-integrity/20200911114820.GB6877@linux.intel.com/

> I'm sorry about this. The final final conclusion is that the way it
> exports PCRs is just fine.
That's a great, thank you for going to upstream James' patch.
James, thanks for implementing it!

> Can you test this version?
Sure, I'll test it next week.

> https://patchwork.kernel.org/patch/11759729/


> I can then add reviewd-by and apply it and you don't have to do any sort
> of stupid hacks.
I'll need to keep these hacks for older kernels, but it's great that there is a
better solution.

Other thing: do you know anybody practically uses more TPM devices in single
machine? I'm asking that I work with tpm0 in ima_tpm.sh, but maybe I should
allow user to redefine it to choose different device (or even run tests for all
available devices).

Kind regards,
Petr

> /Jarkkko

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
