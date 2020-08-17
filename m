Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C212477B1
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 21:52:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB04E3C300F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 21:52:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 087A03C076F
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 21:52:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5C0941A002E3
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 21:52:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4DF2AAB0;
 Mon, 17 Aug 2020 19:53:10 +0000 (UTC)
Date: Mon, 17 Aug 2020 21:52:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200817195244.GA112397@x230>
References: <20200817130916.27634-1-pvorel@suse.cz>
 <bc89bf8e0c40e6d66c86b42f55f9bf69ec7e335e.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc89bf8e0c40e6d66c86b42f55f9bf69ec7e335e.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/4] IMA: verify measurement of certificate
 imported into a keyring
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
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Mon, 2020-08-17 at 15:09 +0200, Petr Vorel wrote:
> > Hi Mimi, Lakshmi,

> > changes v2->v3:
> > fixed regression in my third commit.
> > (please verify it on installed LTP, or at least run make install in
> > testcases/kernel/security/integrity/ima/datafiles/ima_keys/)

> I did, but nothing changed.  I probably need to set an environment
> variable.
You also need to set LTPROOT (prefix, e.g. /opt/ltp).

> After building and installing LTP, it's finding the file, but some of
> the issues still exist:

> ima_keys 1 TINFO: $TMPDIR is on tmpfs => run on loop device
> ima_keys 1 TINFO: Formatting /dev/loop0 with ext3 extra opts=''
> ima_keys 1 TINFO: verify key measurement for keyrings and templates specified in IMA policy
> grep: Unmatched ( or \(
This should be fixed by v3 (fixed by for loop and sort -u)
https://patchwork.ozlabs.org/project/ltp/patch/20200817130916.27634-5-pvorel@suse.cz/
But I'll test it tomorrow with your IMA policy.

Thank you for testing!

Kind regards,
Petr

> ima_keys 1 TPASS: specified keyrings were measured correctly
> ima_keys 2 TINFO: verify measurement of certificate imported into a keyring
> keyctl_session_to_parent: Operation not permitted
> ima_keys 2 TPASS: logged certificate matches the original

> IMA policy:
> measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf 
> measure func=KEY_CHECK keyrings=key_import_test template=ima-buf 

> Mimi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
