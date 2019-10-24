Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D0CE39AF
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 19:20:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 810233C2374
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 19:20:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 214D93C2152
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 19:20:32 +0200 (CEST)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5C67A10014B3
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 19:20:30 +0200 (CEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 10:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; d="scan'208";a="399837335"
Received: from nesterov-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.8.153])
 by fmsmga006.fm.intel.com with ESMTP; 24 Oct 2019 10:20:24 -0700
Date: Thu, 24 Oct 2019 20:20:23 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191024172023.GA7948@linux.intel.com>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024121848.GA5908@dell5510>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ima: skip verifying TPM 2.0 PCR values
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, ltp@lists.linux.it,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>,
 Piotr =?iso-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 24, 2019 at 02:18:48PM +0200, Petr Vorel wrote:
> Hi all,
> 
> I wonder what to do with this patch "ima: skip verifying TPM 2.0 PCR values" [1].
> Is it a correct way to differentiate between TPM 1.2 and TPM 2.0?
> Or something else should be applied?
> 
> How is the work on TPM 2.0 Linux sysfs interface?
> But even it's done in near future, we'd still need some way for older kernels.
> 
> Kind regards,
> Petr
> 
> [1] https://patchwork.ozlabs.org/patch/1100733/

version_major sysfs file would be acceptable if someone wants to proceed
and send such patch.

Also replicants for durations and timeouts files would make sense for
TPM 2.0.

/Jarkko

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
