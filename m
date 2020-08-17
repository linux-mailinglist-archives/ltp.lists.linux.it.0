Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1704F246526
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 13:09:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E2833C3020
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 13:09:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AC08F3C1CDD
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 13:09:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1A910200DEE
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 13:09:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B68CB737;
 Mon, 17 Aug 2020 11:09:34 +0000 (UTC)
Date: Mon, 17 Aug 2020 13:09:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200817110906.GA1895@dell5510>
References: <20200807204652.5928-1-pvorel@suse.cz>
 <20200807204652.5928-4-pvorel@suse.cz>
 <25a78f42d15dcb3312a59de587cb9f4e31ccd5b5.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25a78f42d15dcb3312a59de587cb9f4e31ccd5b5.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] IMA: Add a test to verify measurement of
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

Hi Mimi, Lakshmi,

> On Fri, 2020-08-07 at 22:46 +0200, Petr Vorel wrote:
> > From: Lachlan Sneff <t-josne@linux.microsoft.com>

> > diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> > index 53c289054..30950904e 100755
> > --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> > +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh

> > @@ -61,4 +65,52 @@ test1()
> >  	tst_res TPASS "specified keyrings were measured correctly"
> >  }

> > +# Create a new keyring, import a certificate into it, and verify
> > +# that the certificate is measured correctly by IMA.
> > +test2()
> > +{
> > +	tst_require_cmds evmctl keyctl openssl
> > +
> > +	local cert_file="$TST_DATAROOT/x509_ima.der"
> > +	local keyring_name="key_import_test"
> > +	local temp_file="file.txt"
> > +	local keyring_id
> > +
> > +	tst_res TINFO "verify measurement of certificate imported into a keyring"
> > +
> > +	if ! check_ima_policy_content "^measure.*func=KEY_CHECK.*keyrings=.*$keyring_name"; then
> > +		tst_brk TCONF "IMA policy does not contain $keyring_name keyring"
> > +	fi
> > +

> If the IMA policy contains multiple KEY_CHECK measurement policy rules
> it complains about "grep: Unmatched ( or \(".

> Sample rules:
> measure func=KEY_CHECK template=ima-buf
> keyrings=.ima|.builtin_trusted_keys
> measure func=KEY_CHECK template=ima-buf keyrings=key_import_test

Good catch, reproduced, working on fix (NOTE 2nd line is obviously joined to the
first one).

Caused by later code:
grep -E "($templates)*($keyrings)" $ASCII_MEASUREMENTS | while read line

> > +	keyctl new_session > /dev/null
> > +
> > +	keyring_id=$(keyctl newring $keyring_name @s) || \
> > +		tst_brk TBROK "unable to create a new keyring"
> > +
> > +	tst_is_num $keyring_id || \
> > +		tst_brk TBROK "unable to parse the new keyring id"
> > +
> > +	evmctl import $cert_file $keyring_id > /dev/null || \
> > +		tst_brk TBROK "unable to import a certificate into $keyring_name keyring"

> "cert_file" needs to be updated from 
> "ltp/testcases/kernel/security/integrity/ima/tests/datafiles/x509_ima.d
> er" to
> "ltp/testcases/kernel/security/integrity/ima/tests/../datafiles/ima_key
> s/x509_ima.der".

As Lakshmi wrote if you apply the fix, which I included in my branch
Lachlan_Sneff/ima_keys.sh-second-test.v1.fixes [1] it'd work.

Unlike kselftest, LTP requires installing and running from installed
directory. There was fix in the past allow running uninstalled test:
435d2fd82 ("ima: Rename the folder name for policy files to datafiles"), but I
broke that in this patchset ("IMA: Refactor datafiles directory").

Maybe fixing a code in tst_test.sh
if [ -z "$LTPROOT" ]; then
	export LTPROOT="$PWD"
	export TST_DATAROOT="$LTPROOT/datafiles"
else
	export TST_DATAROOT="$LTPROOT/testcases/data/$TST_ID"
fi

To allow to redefine it, for local testing:
if [ -z "$TST_DATAROOT" ]; then
	if [ -z "$LTPROOT" ]; then
		export LTPROOT="$PWD"
		export TST_DATAROOT="$LTPROOT/datafiles"
	else
		export TST_DATAROOT="$LTPROOT/testcases/data/$TST_ID"
	fi
fi

because datafile layout does not expect subdirectory. I also hate the makefile
helper, which requires to have special directory, datafiles just require some
rethinking.

> On failure to open the file, 
> errno: No such file or directory (2)

The rest is obviously not relevant (was just a hint for problems caused with
other LSM).
> ima_keys 2 TBROK: unable to import a certificate into key_import_test keyring
> ima_keys 2 TINFO: SELinux enabled in enforcing mode, this may affect test results
> ima_keys 2 TINFO: it can be disabled with TST_DISABLE_SELINUX=1 (requires super/root)
> ima_keys 2 TINFO: install seinfo to find used SELinux profiles
> ima_keys 2 TINFO: loaded SELinux profiles: none

Kind regards,
Petr

[1] https://github.com/pevik/ltp/tree/Lachlan_Sneff/ima_keys.sh-second-test.v1.fixes

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
