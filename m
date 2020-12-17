Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A12DCDAD
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 09:33:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF3DF3C57C9
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 09:33:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 452603C011E
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 09:33:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AC4AF1A013A3
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 09:33:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A05DFAC7B;
 Thu, 17 Dec 2020 08:33:09 +0000 (UTC)
Date: Thu, 17 Dec 2020 09:33:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <X9sXxGacmaPYN8hp@pevik>
References: <20201214221946.6340-1-pvorel@suse.cz>
 <aec8d4d757c674b3fdb4caaf3d89317d230b91e7.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aec8d4d757c674b3fdb4caaf3d89317d230b91e7.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/4] TPM 2.0 fixes in IMA tests
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
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> Hi Petr,

> On Mon, 2020-12-14 at 23:19 +0100, Petr Vorel wrote:
> > The only problem which bothers me is failure on ima_policy=tcb:

> > evmctl ima_measurement /sys/kernel/security/integrity/ima/binary_runtime_measurements -vv
> > ...
> > sha256: PCRAgg  10: c19866f10132282d4cf20ca45f50078db843f95dc8d1ea8819d0e240cdf3b21c
> > sha256: TPM PCR-10: df913daa0437a2365f710f6d93a4f2d37146414425d9aaa60740dc635d187158
> > sha256: PCRAgg 10 does not match TPM PCR-10
> > Failed to match per TPM bank or SHA1 padded TPM digest(s) (count 1446)
> > errno: No such file or directory (2)

> > Thus test get failure for the fist run without --ignore-violations
> > ...
> > ima_tpm 1 TINFO: using command: evmctl ima_boot_aggregate -v
> > Using tss2-rc-decode to read PCRs.
> > ima_tpm 1 TINFO: IMA boot aggregate: '0756853d9378ff6473966e20610a8d1cb97e4dc613cb87adf5e870c8eb93fd0f'
> > ima_tpm 1 TPASS: bios boot aggregate matches IMA boot aggregate
> > ima_tpm 2 TINFO: verify PCR values
> > ima_tpm 2 TINFO: real PCR-10: '6d8aec6291c0c19efdee50e20899939135be073cd4d6e9063e53386f54f9487d'
> > ima_tpm 2 TFAIL: evmctl failed, trying with --ignore-violations
> > ima_tpm 2 TINFO: aggregate PCR-10: '6d8aec6291c0c19efdee50e20899939135be073cd4d6e9063e53386f54f9487d'
> > ima_tpm 2 TPASS: aggregate PCR value matches real PCR value
> > ima_tpm 3 TINFO: AppArmor enabled, this may affect test results
> > ima_tpm 3 TINFO: it can be disabled with TST_DISABLE_APPARMOR=1 (requires super/root)
> > ima_tpm 3 TINFO: loaded AppArmor profiles: none

> > Summary:
> > passed   2
> > failed   1
> > skipped  0
> > warnings 0

> > IMHO unless this is specific for this particular TPM we should skip test
> > if ima_policy=tcb.

> No, I don't think so.  Violations are a result of a file being opened
> for read and write at the same time.  Opening a file for write, when it
> is already open for read, results in a Time of Measure/Time of Use
> (ToMToU) violation.  Opening a file for read, when it is already open
> for write, results in an open_writer violation.  One of the more common
> reasons for these violations are log files.

> With the builtin TCB measurement policy enabled on the boot command
> line, files are measured from the beginning, before a custom policy is
> loaded.  Normally a custom policy is loaded after an LSM policy has
> been loaded, allowing IMA policy rules to be defined in terms of LSM
> labels.

> Verifying the IMA measurement list against the TPM PCRs is an important
> test.  Ignoring violations doesn't make sense either.   Perhaps if a
> custom policy has not been loaded, emit an informational message and
> skip the test without "--ignore-violations".

Thanks for an explanation. Agree, you're right. It's most likely wrong setup
(there were some temporary files in /tmp and even postfix pid file in /var/run/),
I need to properly setup dracut-ima. It'd be then good to document this, but I'd
do it as separate effort.

So, can I merge the patchset with your ack/review-by?

Kind regards,
Petr

> thanks,

> Mimi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
