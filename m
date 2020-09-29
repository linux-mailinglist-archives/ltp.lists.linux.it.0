Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1D27DC84
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 01:11:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9F113C2AB2
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 01:11:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C96613C1859
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 01:11:27 +0200 (CEST)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0DC291A00F42
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 01:11:25 +0200 (CEST)
IronPort-SDR: gnYLiK7/citb8IVQKBkC5/aXYGs34q2bJ1L1ohxgEfCRmqO0BQlLXvp1aMXW0cBSKRr+HW3KsW
 s5Gday74/H+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="149970915"
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="149970915"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 16:11:21 -0700
IronPort-SDR: B4c9sdqzY0JVcPVwYExbSzR3fB09BzjPHQf1xyrbQZIHs0r4Oea6LtWS/8TZ2N3dvDv8djyahB
 OIzssPJ0l7vQ==
X-IronPort-AV: E=Sophos;i="5.77,320,1596524400"; d="scan'208";a="494057606"
Received: from jwilliam-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 16:11:20 -0700
Date: Wed, 30 Sep 2020 02:11:18 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200929231118.GA805493@linux.intel.com>
References: <20200929165021.11731-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929165021.11731-1-pvorel@suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Sep 29, 2020 at 06:50:17PM +0200, Petr Vorel wrote:
> Hi,
> 
> few more fixes, mostly touching older kernels or evmctl versions.
> Changes in 3rd and 4th commit.
> 
> Kind regards,
> Petr
> 
> Petr Vorel (4):
>   IMA: Move get_algorithm_digest(), set_digest_index() to ima_setup.sh
>   IMA: Rewrite ima_boot_aggregate.c to new API
>   ima_tpm.sh: Fix calculating boot aggregate
>   ima_tpm.sh: Fix calculating PCR aggregate
> 
>  .../integrity/ima/src/ima_boot_aggregate.c    | 113 ++++----
>  .../integrity/ima/tests/ima_measurements.sh   |  62 +---
>  .../security/integrity/ima/tests/ima_setup.sh |  70 +++++
>  .../security/integrity/ima/tests/ima_tpm.sh   | 265 ++++++++++++++----
>  4 files changed, 341 insertions(+), 169 deletions(-)
> 
> -- 
> 2.28.0
> 

Hi, is there something specific I should look at in this patch set?

/Jarkko

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
