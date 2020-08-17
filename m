Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E324783D
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 22:39:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F30A73C58D9
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 22:39:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A2C973C2FFD
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 22:39:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 13DBB2000D3
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 22:39:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94491B0B3;
 Mon, 17 Aug 2020 20:40:17 +0000 (UTC)
Date: Mon, 17 Aug 2020 22:39:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <20200817203950.GA121577@x230>
References: <20200817130916.27634-1-pvorel@suse.cz>
 <bc89bf8e0c40e6d66c86b42f55f9bf69ec7e335e.camel@linux.ibm.com>
 <cdf45ba0-287b-8fa1-d067-1c6c4f386939@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cdf45ba0-287b-8fa1-d067-1c6c4f386939@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 8/17/20 12:18 PM, Mimi Zohar wrote:

> > On Mon, 2020-08-17 at 15:09 +0200, Petr Vorel wrote:
> > > Hi Mimi, Lakshmi,

> > > changes v2->v3:
> > > fixed regression in my third commit.
> > > (please verify it on installed LTP, or at least run make install in
> > > testcases/kernel/security/integrity/ima/datafiles/ima_keys/)

> > I did, but nothing changed.  I probably need to set an environment
> > variable.

> > After building and installing LTP, it's finding the file, but some of
> > the issues still exist:

> > ima_keys 1 TINFO: $TMPDIR is on tmpfs => run on loop device
> > ima_keys 1 TINFO: Formatting /dev/loop0 with ext3 extra opts=''
> > ima_keys 1 TINFO: verify key measurement for keyrings and templates specified in IMA policy
> > grep: Unmatched ( or \(
> > ima_keys 1 TPASS: specified keyrings were measured correctly
> > ima_keys 2 TINFO: verify measurement of certificate imported into a keyring
> > keyctl_session_to_parent: Operation not permitted
> > ima_keys 2 TPASS: logged certificate matches the original

> > IMA policy:
> > measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
> > measure func=KEY_CHECK keyrings=key_import_test template=ima-buf


> I think I see the problem

> keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
> 		sed "s/\./\\\./g" | cut -d'=' -f2; done | sort -u

> The above line generates the list of keyrings (read from the IMA policy)
> with a newline after the first policy entry with "keyrings=". Please see
> below:

> ima_keys 1 TINFO: \.ima|\.builtin_trusted_keys
> key_import_test

> When this is checked in the "do-done" loop grep returns "mismatched (" due
> to the newline.

> I tried with "(" removed from the following line and that fixes the problem:

> grep -E "($templates)*($keyrings)" $ASCII_MEASUREMENTS | while read line

> But a better fix might be to remove the "newline" in $keyrings. I'll try
> that.
OK, I was too aggressive when removing tr dependency. I'll add another sed
command to remove new lines.

> Regarding the following error:
> keyctl_session_to_parent: Operation not permitted
I missed this problem.

> The following line in test2() can be removed. Not sure if this is needed.
> 	keyctl new_session > /dev/null
Not sure, I guess it'd work in existing session. But then it'd be good to
do cleanup.

> thanks,
>  -lakshmi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
