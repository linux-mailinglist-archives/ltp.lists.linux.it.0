Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21727E810
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 13:59:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5930B3C4C00
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 13:59:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 284E83C297E
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 13:59:48 +0200 (CEST)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 14ED11000B70
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 13:59:46 +0200 (CEST)
IronPort-SDR: sD58ZuOtectf0sj/nrAYqaLEUoa8azPPuO7ecOqQr9p5Y8vQyQoT1m2FRXTLz9BuoxInkJu4M9
 6846QGn5LusQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="180590301"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="180590301"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 04:59:44 -0700
IronPort-SDR: gu367M5H2ZN4V7avZSxV5vhUUKmsscYKkex41phaa8EYkUSvBzRcdNs7o+aVxO7VqxRbqeRA3T
 UB8Fky3LGTiQ==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="497212937"
Received: from lbentzio-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 04:59:41 -0700
Date: Wed, 30 Sep 2020 14:59:39 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200930115939.GB7612@linux.intel.com>
References: <20200929165021.11731-1-pvorel@suse.cz>
 <20200929231118.GA805493@linux.intel.com>
 <20200930055314.GA21664@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930055314.GA21664@dell5510>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Sep 30, 2020 at 07:53:14AM +0200, Petr Vorel wrote:
> Hi Jarkko,
> 
> > Hi, is there something specific I should look at in this patch set?
> 
> I'm sorry to bother you with LTP specific code. Can you have a quick look if I
> didn't overlook anything obvious in reading PCR files (read_pcr_tpm*())?
> 
> I'm surprised that it's working on my TPM 2.0 which does not export
> /sys/kernel/security/tpm0/binary_bios_measurements (using evmctl).

Thank you, this was actually really important remark and reminder.

OK so I think James' patch is stuck because of me, i.e.

https://lore.kernel.org/linux-integrity/20200911114820.GB6877@linux.intel.com/

I'm sorry about this. The final final conclusion is that the way it
exports PCRs is just fine.

Can you test this version?

https://patchwork.kernel.org/patch/11759729/

I can then add reviewd-by and apply it and you don't have to do any sort
of stupid hacks.

/Jarkkko

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
