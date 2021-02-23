Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1E322FA6
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 18:31:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A87733C60CA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 18:31:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5B7393C2BEF
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 18:31:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DD39F200CE0
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 18:31:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D9FCEAC1D;
 Tue, 23 Feb 2021 17:31:28 +0000 (UTC)
Date: Tue, 23 Feb 2021 18:31:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YDU77/zetTzs569z@pevik>
References: <20210222023421.12576-1-nramas@linux.microsoft.com>
 <YDTJtl9C9HbRILQb@pevik>
 <2b7f2f88-7df8-bd31-59cb-fd74bfe555fd@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b7f2f88-7df8-bd31-59cb-fd74bfe555fd@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Check for ima-buf template is not required
 for keys tests
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

> On 2/23/21 1:24 AM, Petr Vorel wrote:

> Hi Petr,


> > > ima-buf is the default IMA template used for all buffer measurements.
> > > Therefore, IMA policy rule for measuring keys need not specify
> > > an IMA template.
> > Good catch. But was it alway?

> > IMHO ima-buf as default was added in dea87d0889dd ("ima: select ima-buf template for buffer measurement") in v5.11-rc1.
> For key measurements ima-buf template was required in the policy rule, but
> with the above commit (dea87d0889dd) it was changed to ima-buf. So we no
> longer need to specify the template in the policy.

> > But test1() tests 450d0fd51564 ("IMA: Call workqueue functions to measure queued keys") from v5.6-rc1.
> > Is it safe to ignore it?
> Even when the key is queued for measurement, ima-buf template will be used
> when the key is dequeued. Not sure if that answers your question.
IMHO template=ima-buf is required from v5.6-rc1 to v5.10, right?
But maybe it's just enough to check that no other template is used as we discuss
below.

> > BTW template=ima-buf requirement was added in commit b0418c93f ("IMA/ima_keys.sh: Require template=ima-buf, fix grep pattern")

> > Also, shouldn't we check that there is none of the other templates (e.g. template=ima-ng, ...)?
> This is a good point - yes: we should check if no other template other than
> ima-buf is specified in the policy rule for measuring keys.
It'd be great if you include it in v2.

...
> > >   FUNC_KEYCHECK='func=KEY_CHECK'
> > > -TEMPLATE_BUF='template=ima-buf'
> > > -REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_KEYCHECK)"
> > > +REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK)"
> > nit: remove brackets:
> > REQUIRED_POLICY="^measure.*$FUNC_KEYCHECK"
> Sure - will remove that.
Thanks!

> > There is
> > testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy file,
> > which should be a helper to load proper policy and needs to be updated as well:
> > -measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
> > +measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test

> > I was also thinking to move keyrings to REQUIRED_POLICY, e.g.:

> > KEYRINGS="keyrings=\.[a-z]+"
> > REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$KEYRINGS|$KEYRINGS.*$FUNC_KEYCHECK)"
> "keyrings=" is optional in the policy. If keyrings is specified it should be
> checked.
OK, just optional.

Kind regards,
Petr

> thanks,
>  -lakshmi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
