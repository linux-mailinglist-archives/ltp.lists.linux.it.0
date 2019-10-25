Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E971BE4C09
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 15:25:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0B6A3C22C7
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 15:25:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 961763C2241
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 15:25:31 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 498061A00A2C
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 15:25:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 68388AD3A;
 Fri, 25 Oct 2019 13:25:29 +0000 (UTC)
Date: Fri, 25 Oct 2019 15:25:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Serge E. Hallyn" <serge@hallyn.com>
Message-ID: <20191025132527.GB13329@x230>
References: <1558041162.3971.2.camel@linux.ibm.com>
 <fccc3abd-f3ce-fdb1-55d7-c18ce116446c@linux.vnet.ibm.com>
 <20190517150456.GA11796@dell5510> <20191024121848.GA5908@dell5510>
 <20191024172023.GA7948@linux.intel.com>
 <20191024213842.c6cl4tlnsi56pgcy@cantor>
 <1571964420.5173.12.camel@linux.ibm.com>
 <20191025021159.dt7ifgnebnke6ca7@cantor>
 <20191025085617.GA13329@x230>
 <20191025125202.GA1966@mail.hallyn.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025125202.GA1966@mail.hallyn.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Piotr =?iso-8859-2?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > > /sys/kernel/security/tpmX/major_version (on fedora and rhel at least, is it elsewhere on other distros?)

> > > versus

> > > /sys/class/tpm/tpmX/major_version

> > Is it more HW related (/sys/class/tpm/tpmX) or LSM related
> > (/sys/kernel/security/tpmX)?
> > I guess /sys/kernel/security/tpmX might be better.

> This is purely about whether the phsyical TPM chip is 1.2 or 2.,
> right?  /sys/class/tpm/tpmX is where I would expect to find that.
+1

> > Thanks for implementing this, I'll try to test it soon.

> Yes, it's been a pain point, and someone (..., I) should have done this years
> ago - thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
