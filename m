Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB906E321C
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 14:18:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FAD03C238D
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 14:18:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3ED883C236A
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 14:18:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 15DDA1400BC7
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 14:18:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1D47B186;
 Thu, 24 Oct 2019 12:18:50 +0000 (UTC)
Date: Thu, 24 Oct 2019 14:18:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-ID: <20191024121848.GA5908@dell5510>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517150456.GA11796@dell5510>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Piotr =?iso-8859-2?Q?Kr=F3l?= <piotr.krol@3mdeb.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

I wonder what to do with this patch "ima: skip verifying TPM 2.0 PCR values" [1].
Is it a correct way to differentiate between TPM 1.2 and TPM 2.0?
Or something else should be applied?

How is the work on TPM 2.0 Linux sysfs interface?
But even it's done in near future, we'd still need some way for older kernels.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1100733/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
