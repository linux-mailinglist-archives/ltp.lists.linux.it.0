Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 708DD25515B
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 00:54:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A25103C2EB6
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 00:54:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2A3AC3C1CDD
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 00:54:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B79AB600C89
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 00:54:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 388A3AD20;
 Thu, 27 Aug 2020 22:54:51 +0000 (UTC)
Date: Fri, 28 Aug 2020 00:54:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200827225417.GA29921@dell5510>
References: <20200820090824.3033-1-pvorel@suse.cz>
 <20200820090824.3033-5-pvorel@suse.cz>
 <b58057275ecdc06bb512d39ea46118197f33c33f.camel@linux.ibm.com>
 <20200827132354.GA20439@dell5510> <20200827135503.GA11990@dell5510>
 <b72657042d13f9b8f30d5bdea7e2d06835e4a1d1.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b72657042d13f9b8f30d5bdea7e2d06835e4a1d1.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
> > > > Instead of using TST_DATAROOT, which is defined as
> > > > "$LTPROOT/datafiles", use LTPROOT directly to define the path to the
> > > > cert.  Adding the following will allow the test to run from the build
> > > > directory.
> > > >       if [ ! -f $cert_file ]; then
> > > >               cert_file="$LTPROOT/../datafiles/ima_keys/x509_ima.der"
> > > >       fi
> > > Yes, this will work if you set LTPROOT to <ltp git>/testcases/kernel/security/integrity/ima/tests/:

> When running any of the tests from build tree test directory -
> ltp/testcases/kernel/security/integrity/ima/tests, supplying LTPROOT
> isn't necessary. "IMA: Refactor datafiles directory" broke running the
> other tests directly from the build tree as well.
Correct, I overlooked $LTPROOT does not have to be set.
You're right, there is export LTPROOT="$PWD" in tst_test.sh.

The only broken tests are ima_policy.sh and ima_keys.sh. I fixed that workaround
in the commit "IMA: Refactor datafiles directory":

+++ testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -160,6 +160,11 @@ ima_setup()
 	BINARY_MEASUREMENTS="$IMA_DIR/binary_runtime_measurements"
 	IMA_POLICY="$IMA_DIR/policy"
 
+	# hack when running tests locally from tests directory
+	if [ ! -d "$TST_DATAROOT" ]; then
+		TST_DATAROOT="$LTPROOT/../datafiles/$TST_ID/"
+	fi
+
 	print_ima_config
 
 	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
---

Again, pushed to:
https://github.com/pevik/ltp/tree/Lachlan_Sneff/ima_keys.sh-second-test.v4.fixes

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
