Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F214332256
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 10:51:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE22D3C5549
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 10:51:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A6E953C5535
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 10:51:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1FA3960074C
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 10:51:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66748ACC6;
 Tue,  9 Mar 2021 09:51:21 +0000 (UTC)
Date: Tue, 9 Mar 2021 10:51:19 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YEdFF2g6Z1KJiJ5b@pevik>
References: <20210303203254.12856-1-nramas@linux.microsoft.com>
 <YEJZIQqa1arYKwK+@pevik>
 <33ba6274-e7ef-27de-b481-5a702136c0df@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33ba6274-e7ef-27de-b481-5a702136c0df@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Allow only ima-buf template for key
 measurement
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
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lakshmi,

> On 3/5/21 8:15 AM, Petr Vorel wrote:

> Hi Petr,

> A small change is needed:

> In the while loop, for each line of the KEY_CHECK policy, we need to check
> if a "template" is specified, and if it is then verify if it is "ima-buf".

> > You need to do:
> > while read line; do
> > 	if ! echo $line | grep -q $template; then
> > 		tst_res TCONF "only $template can be specified for $func"
> > 		return 1
> > 	fi
> > done < $TST_TMPDIR/policy.txt
> > return 0

> Please see the change below:

> while read line; do
> 	if echo $line | grep -q 'template=' && ! echo $line | grep -q $template ;
> then
> 		tst_res TCONF "only $template can be specified for $func"
> 		return 1
> 	fi
> done < $TST_TMPDIR/policy.txt
> return 0
Good catch!

> With check_policy_template() moved from ima_setup.sh to ima_keys.sh, the
> test works fine

> When the policy contains the following
>    measure func=KEY_CHECK keyrings=key_import_test template=ima-buf
>    measure func=KEY_CHECK keyrings=.builtin_trusted_keys

I guess we should update datafiles/ima_keys/keycheck.policy to contain both
lines.

> the test passes:

> ima_keys 1 TINFO: verify key measurement for keyrings and templates
> specified in IMA policy
> ima_keys 1 TINFO: keyrings: 'key_import_test|\.builtin_trusted_keys'
> ima_keys 1 TINFO: templates: 'ima-buf'
> ima_keys 1 TPASS: specified keyrings were measured correctly


> But if the policy is changed to below:
>    measure func=KEY_CHECK keyrings=key_import_test template=ima-buf
>    measure func=KEY_CHECK keyrings=.builtin_trusted_keys template=ima-sig

> the test fails as expected.

> ima_keys 1 TINFO: verify key measurement for keyrings and templates
> specified in IMA policy
> ima_keys 1 TCONF: only template=ima-buf can be specified for func=KEY_CHECK

> I'll post the updated patch shortly.

Thanks a lot!

> thanks,
>  -lakshmi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
