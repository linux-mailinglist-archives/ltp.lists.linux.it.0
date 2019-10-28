Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D6FE7A85
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 21:51:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A6793C248F
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 21:51:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id DEAB23C2486
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 21:51:32 +0100 (CET)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8AA8F600648
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 21:51:29 +0100 (CET)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 13:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="210955246"
Received: from shrehore-mobl1.ti.intel.com (HELO localhost) ([10.251.82.5])
 by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2019 13:51:23 -0700
Date: Mon, 28 Oct 2019 22:51:22 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20191028205122.GG8279@linux.intel.com>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
 <20191024182005.GZ23952@ziepe.ca>
 <20191024191402.GB12038@linux.intel.com>
 <20191024233602.GF23952@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024233602.GF23952@ziepe.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
 ltp@lists.linux.it, linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>,
 Piotr =?iso-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 24, 2019 at 08:36:02PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 24, 2019 at 10:14:02PM +0300, Jarkko Sakkinen wrote:
> > On Thu, Oct 24, 2019 at 03:20:05PM -0300, Jason Gunthorpe wrote:
> > > On Thu, Oct 24, 2019 at 08:20:23PM +0300, Jarkko Sakkinen wrote:
> > > > Also replicants for durations and timeouts files would make sense for
> > > > TPM 2.0.
> > > 
> > > These ones don't meet the sysfs standard of one value per file, which
> > > is why they didn't make it to tpm2
> > 
> > They would be still useful to have available in some form as there is
> > no way deduce them from the user space.
> 
> Why? Userspace doesn't refer to these values since the kernel handles
> all the timeouts, right?

For debugging at least would be definitely a nice to have what
values the driver ended up setting.

/Jarkko

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
