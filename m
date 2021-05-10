Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1A3795AE
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 19:28:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 311E73C8C0C
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 19:28:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D8FF3C4F08
 for <ltp@lists.linux.it>; Mon, 10 May 2021 19:28:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03DA21A00A5E
 for <ltp@lists.linux.it>; Mon, 10 May 2021 19:28:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50802AC5B;
 Mon, 10 May 2021 17:28:14 +0000 (UTC)
Date: Mon, 10 May 2021 19:28:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YJltLKrpw0O4MtCU@pevik>
References: <20210507191414.14795-1-pvorel@suse.cz>
 <20210507191414.14795-2-pvorel@suse.cz>
 <f22e507d-1983-b7a0-b5e0-15e1519ca038@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f22e507d-1983-b7a0-b5e0-15e1519ca038@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] ima_keys.sh: Check policy only once
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> On 5/7/21 12:14 PM, Petr Vorel wrote:
> > Not needed to check the same policy twice.
> > Rename to contain 'require' as we use tst_brk.

> Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

Thanks Lakshmi, merged this one.

And waiting for the other two till Tushar manage to get
the dm-crypt related code to mainline. Good luck!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
