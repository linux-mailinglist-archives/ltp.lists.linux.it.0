Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D13E627D3F7
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 18:53:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82A153C4CA9
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 18:53:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0376E3C4C15
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 18:53:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C26B21A00ED9
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 18:53:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B40DB128;
 Tue, 29 Sep 2020 16:53:32 +0000 (UTC)
Date: Tue, 29 Sep 2020 18:53:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200929165330.GA11939@dell5510>
References: <20200929165021.11731-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929165021.11731-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi, Lakshmi,

sorry for late version. FYI Cyril is planning to release LTP tomorrow evening,
thus To get it into this release require review and testing till tomorrow lunch
or something.
Thus understand if you don't have time for it.

NOTE: crazy support for old versions was important to get support for older SLES
versions.

Kind regards,
Petr

> Hi,

> few more fixes, mostly touching older kernels or evmctl versions.
> Changes in 3rd and 4th commit.

> Kind regards,
> Petr

> Petr Vorel (4):
>   IMA: Move get_algorithm_digest(), set_digest_index() to ima_setup.sh
>   IMA: Rewrite ima_boot_aggregate.c to new API
>   ima_tpm.sh: Fix calculating boot aggregate
>   ima_tpm.sh: Fix calculating PCR aggregate

>  .../integrity/ima/src/ima_boot_aggregate.c    | 113 ++++----
>  .../integrity/ima/tests/ima_measurements.sh   |  62 +---
>  .../security/integrity/ima/tests/ima_setup.sh |  70 +++++
>  .../security/integrity/ima/tests/ima_tpm.sh   | 265 ++++++++++++++----
>  4 files changed, 341 insertions(+), 169 deletions(-)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
