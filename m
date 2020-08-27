Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E256D2545D7
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 15:24:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 745953C562C
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 15:24:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 302DF3C011E
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 15:23:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 883341401398
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 15:23:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C5B1AC48;
 Thu, 27 Aug 2020 13:24:28 +0000 (UTC)
Date: Thu, 27 Aug 2020 15:23:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200827132354.GA20439@dell5510>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-5-pvorel@suse.cz>
 <b58057275ecdc06bb512d39ea46118197f33c33f.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b58057275ecdc06bb512d39ea46118197f33c33f.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [LTP v4 4/5] IMA: Add a test to verify measurement of
 certificate imported into a keyring
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

Hi Mimi,

...
> > +	if ! tst_is_num $KEYRING_ID; then
> > +		tst_brk TBROK "unable to parse the new keyring id ('$KEYRING_ID')"
> > +	fi
> > +

> Instead of using TST_DATAROOT, which is defined as
> "$LTPROOT/datafiles", use LTPROOT directly to define the path to the
> cert.  Adding the following will allow the test to run from the build
> directory.

>       if [ ! -f $cert_file ]; then
>               cert_file="$LTPROOT/../datafiles/ima_keys/x509_ima.der"
>       fi
Yes, this will work if you set LTPROOT to <ltp git>/testcases/kernel/security/integrity/ima/tests/:

$ cd <ltp git>/testcases/kernel/security/integrity/ima/tests/
$ LTPROOT=$PWD PATH="../../../../../lib/:.:$PATH" ./ima_keys.sh

But, according to doc [1] $LTPROOT is "Prefix for installed LTP, the default is
/opt/ltp.". Using it like this is confusing (if we want to misuse $LTPROOT, one
would expect it's a cloned git root directory). Running from git root it'd have
to be:

$ cd <ltp git>
$ LTPROOT=$PWD/testcases/kernel/security/integrity/ima/tests/ \
PATH="testcases/lib:testcases/kernel/security/integrity/ima/tests/:$PATH" ima_keys.sh

TL;DR: I'd really prefer people run IMA from installed LTP (make && make install
in both testcases/lib and testcases/kernel/security/integrity/ima/ is just enough),
but I'll add this hack to make your testing easier :). But fixing this in
tst_test.sh is really needed.

> Mimi

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/User-Guidelines

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
