Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCA9E4B8C
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 14:52:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78A633C22BD
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 14:52:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8B5BA3C12EB
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 14:52:04 +0200 (CEST)
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7F1B6200FE3
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 14:52:03 +0200 (CEST)
Received: by mail.hallyn.com (Postfix, from userid 1001)
 id 6836A85B; Fri, 25 Oct 2019 07:52:02 -0500 (CDT)
Date: Fri, 25 Oct 2019 07:52:02 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191025125202.GA1966@mail.hallyn.com>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
 <20191024213842.c6cl4tlnsi56pgcy@cantor>
 <1571964420.5173.12.camel@linux.ibm.com>
 <20191025021159.dt7ifgnebnke6ca7@cantor>
 <20191025085617.GA13329@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025085617.GA13329@x230>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 25 Oct 2019 14:52:39 +0200
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Piotr =?iso-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Oct 25, 2019 at 10:56:17AM +0200, Petr Vorel wrote:
> Hi,
> 
> > /sys/kernel/security/tpmX/major_version (on fedora and rhel at least, is it elsewhere on other distros?)
> 
> > versus
> 
> > /sys/class/tpm/tpmX/major_version
> 
> Is it more HW related (/sys/class/tpm/tpmX) or LSM related
> (/sys/kernel/security/tpmX)?
> I guess /sys/kernel/security/tpmX might be better.

This is purely about whether the phsyical TPM chip is 1.2 or 2.,
right?  /sys/class/tpm/tpmX is where I would expect to find that.

> Thanks for implementing this, I'll try to test it soon.

Yes, it's been a pain point, and someone (..., I) should have done this years
ago - thanks!

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
