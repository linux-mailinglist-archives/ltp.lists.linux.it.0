Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5922C630
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 15:18:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79F7E3C4CFE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 15:18:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 684A53C2642
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:18:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D7D9114044CD
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:18:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33ABCAC66;
 Fri, 24 Jul 2020 13:18:57 +0000 (UTC)
Date: Fri, 24 Jul 2020 15:18:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <20200724131845.GB24626@dell5510>
References: <20200724070038.29491-1-pvorel@suse.cz>
 <20200724070038.29491-2-pvorel@suse.cz>
 <1595592111.5211.246.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595592111.5211.246.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] IMA: Add test for kexec cmdline measurement
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
Cc: balajib@linux.microsoft.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> On Fri, 2020-07-24 at 09:00 +0200, Petr Vorel wrote:
> > From: Lachlan Sneff <t-josne@linux.microsoft.com>

> > IMA policy can be set to measure the command line passed in the kexec
> > system call. Add a testcase that verifies that the IMA subsystem
> > correctly measure the cmdline specified during a kexec.

> > Note that this test does not actually reboot.

> > Ideally, test shouldn't even require an image, since it doesn't actually
> > reboot, but the IMA cmdline measurement occurs after the image is parsed
> > and verified, so we must pass a valid kernel image.

> > There is a possibility of putting together a dummy kernel image that has
> > the right headers and appears to be signed correctly, but doesn't
> > actually contain any code, but, after investigating that possibility, it
> > appears to be quite difficult (and would require a dummy kernel for each
> > arch).
Maybe I'll omit these 2 paragraphs from commit message.

> This test attempts to kexec the existing running kernel image. =A0To
> kexec a different kernel image export IMA_KEXEC_IMAGE=3D<pathname>.
+1, that's a correct description for all test description, commit message a=
nd
README.md. Thanks!

> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi,
> > sent version with few my fixes.
> > @Mimi: could you please have a quick look? (I know you reviewed previous
> > version.)

> Thanks, Petr.  Just a couple of comments ...


> <snip>

> > +# Test that the kexec cmdline is measured correctly.
> > +# NOTE: This does *not* actually reboot.
> > +test1() {
> > +	if [ ! -f "$IMA_KEXEC_IMAGE" ]; then
> > +		tst_brk TCONF "Kernel image not found ('$IMA_KEXEC_IMAGE'), specify =
it in \$IMA_KEXEC_IMAGE"
> > +	fi
> > +
> > +	# Strip the `BOOT_IMAGE=3D...` part from the cmdline.
> > +	local cmdline=3D"$(sed 's/BOOT_IMAGE=3D[^ ]* //' /proc/cmdline)"
> > +
> > +	if ! kexec -sl $IMA_KEXEC_IMAGE --reuse-cmdline; then
> > +		tst_res TCONF "kexec failed: $?"
I overlooked that TCONF is bad, I guess it should be TFAIL (failure of some=
thing
what we test).

Meaning of TCONF/TBROK/TFAIL is described in
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#222-=
basic-test-interface
IMHO only missing kernel image ($IMA_KEXEC_IMAGE) and checking
func=3DKEXEC_CMDLINE in loaded policy should be marked as TCONF, the rest s=
hould
be TFAIL. TBROK is used for unexpected errors in preparation phase (often t=
his
code is in setup).

Thus here should be:
tst_res TFAIL "kexec failed: $?"

> > +
> > +		local sb_status=3D"$(bootctl status 2>/dev/null | grep 'Secure Boot'=
 \
> > +			| tr -d ' ' | sed 's/SecureBoot:*//')"
> > +
> > +		if [ "$sb_status" =3D "enabled" ]; then
> > +			tst_res TINFO "secure boot is enabled, the specified kernel image m=
ay not be signed"
> > +		fi

> Independently of the secure boot status, the IMA policy itself could requ=
ire a signature.

> For example, a recent software update is preventing one of my test
> laptops from booting with secure boot enabled, but the custom IMA
> policy still requires the kexec kernel image to be signed.

> Search the IMA policy for an appraise "func=3DKEXEC_KERNEL_CHECK" policy
> rule.
I guess you mean keep to keep current bootctl status based search

That also mean, that check_policy_readable needs to be searched earlier.
Probably just to set:
TST_SETUP=3D"check_policy_readable"

> > +
> > +		return
> > +	fi
> > +
> > +	kexec -su
> > +
> > +	if ! measure "$cmdline"; then
> > +		tst_res TFAIL "unable to find a correct entry in the IMA log"
> > +
> > +		check_policy_readable
> > +
> > +		if ! grep "measure func=3DKEXEC_CMDLINE" $IMA_POLICY >/dev/null; then
> > +			tst_brk TCONF "The IMA policy does not specify 'measure func=3DKEXE=
C_CMDLINE', see IMA test README"
> > +		fi
> > +

> Other than the policy "action" - measure/dont_measure,
> audit/dont_audit, appraise/dont_appraise - being the first keyword,
> the ordering of the policy options and flags is flexible. =A0Most
> policies do provide the "func" option immediately following the
> "action". =A0This would normally work.
OK, is this correct?
if ! grep '^measure.*func=3DKEXEC_CMDLINE' $IMA_POLICY >/dev/null; then

> > +		return
> > +	fi
> > +
> > +	cmdline=3D"foo"
> > +	if ! kexec -sl $IMA_KEXEC_IMAGE --append=3D$cmdline; then
> > +		tst_brk TCONF "kexec failed: $?"
> > +	fi
> > +

Instead of whole block please use:
EXPECT_PASS_BRK kexec -sl $IMA_KEXEC_IMAGE --append=3D$cmdline


> The error messages are exactly the same here and below. =A0Should a hint
> be provided as to which one failed?
+1, thanks for spotting this. Using EXPECT_PASS_BRK will solve this (comman=
ds
are different).

> Mimi

> > +	kexec -su
Maybe, if we expect kexec to exit 0, we could run it with ROD (that exit te=
st
with tst_brk TBROK if non-zero exit code)
ROD kexec -su

FYI we don't use ROD everywhere, but where hidden failure of some command
complicates debugging failing test or even lead to wrong test result (false
positive or negative).

> > +
> > +	if ! measure "$cmdline"; then
> > +		tst_brk TFAIL "unable to find a correct entry in the IMA log"
> > +	fi
> > +
> > +	cmdline=3D"bar"
> > +	if ! kexec -sl $IMA_KEXEC_IMAGE --command-line=3D$cmdline; then
EXPECT_PASS_BRK kexec -sl $IMA_KEXEC_IMAGE --command-line=3D$cmdline
> > +		tst_brk TCONF "kexec failed: $?"
> > +	fi
> > +
> > +	kexec -su
And here as well.

> > +
> > +	if ! measure "$cmdline"; then
> > +		tst_brk TFAIL "unable to find a correct entry in the IMA log"
> > +	fi
> > +
> > +	tst_res TPASS "kexec cmdline was measured correctly"
> > +}
> > +
> > +tst_run

@Mimi, @Lachlan: if you both ack my changes, I can fix the code before merg=
ing.
If there are more changes needed and thus Lachlan plan new version, please =
use
my patches from https://patchwork.ozlabs.org/project/ltp/list/?series=3D191=
990&state=3D*
(download https://patchwork.ozlabs.org/series/191990/mbox/ and import it wi=
th "git am")
or clone my github fork and use kexec.v3.fixes branch:
https://github.com/pevik/ltp/tree/ima/kexec.v3.fixes).

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
