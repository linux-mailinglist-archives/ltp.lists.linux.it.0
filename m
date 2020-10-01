Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B10428069D
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Oct 2020 20:31:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 388FA3C6E0B
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Oct 2020 20:31:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id EA5493C295C
 for <ltp@lists.linux.it>; Thu,  1 Oct 2020 20:31:51 +0200 (CEST)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1C0CE14010FD
 for <ltp@lists.linux.it>; Thu,  1 Oct 2020 20:31:49 +0200 (CEST)
IronPort-SDR: L8bsEpOABdvlMnLwtxP3q1YyHh1uky2zJ7+WWb7hBmG4f/I5KQrE+WcfD2ErRtqNMeVuO32yme
 C5jeUUSqPybw==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="180956282"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="180956282"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:31:44 -0700
IronPort-SDR: tyeGzwUH3EV0A9RbI87Y5PeLA/0N4LDG2Rdy1CVb8xBrdbPBl96ZWESds7R2Tx+mLXHfWtWeb8
 LEEwMM9a3PVw==
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="504890753"
Received: from mcampone-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:31:41 -0700
Date: Thu, 1 Oct 2020 21:31:38 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201001183104.GA15664@linux.intel.com>
References: <20200929165021.11731-1-pvorel@suse.cz>
 <20200929231118.GA805493@linux.intel.com>
 <20200930055314.GA21664@dell5510>
 <20200930115939.GB7612@linux.intel.com>
 <20201001120125.GE32109@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001120125.GE32109@dell5510>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 01, 2020 at 02:01:25PM +0200, Petr Vorel wrote:
> I'll need to keep these hacks for older kernels, but it's great that there is a
> better solution.
> 
> Other thing: do you know anybody practically uses more TPM devices in single
> machine? I'm asking that I work with tpm0 in ima_tpm.sh, but maybe I should
> allow user to redefine it to choose different device (or even run tests for all
> available devices).

You can create a proxy TPM device for a TPM emulator or a software TPM
(e.g. could be an SGX enclave) by using ioctl interface /dev/vtpmx,
provided by tpm_vtpm_proxy driver. QEMU provides a passthrough interface
from TPM devices to the VM, which can be utilized for this.

This one I know at least.

> Kind regards,
> Petr

/Jarkko

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
