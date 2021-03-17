Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258333FA07
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 21:37:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0B663C6321
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 21:37:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8C0C03C2CFA
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 21:37:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D8EA768FF30
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 21:37:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7544AE89;
 Wed, 17 Mar 2021 20:37:28 +0000 (UTC)
Date: Wed, 17 Mar 2021 21:37:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YFJoh++5vxSuwJiz@pevik>
References: <20210314233646.2925-1-nramas@linux.microsoft.com>
 <YFC7j4+wA8xorNgu@pevik>
 <deeb4320-a064-fd0f-bc1e-8e52be079ff9@linux.microsoft.com>
 <YFDpFL3CSwMfZ6wo@pevik>
 <5cbe66e7-aebf-e75a-cd9a-d0a69e8a1edd@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5cbe66e7-aebf-e75a-cd9a-d0a69e8a1edd@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] IMA: Allow only ima-buf template for key
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

> > > > Just a double check does it always work without template=ima-buf for all kernel versions?
> > > > Or only for kernels with dea87d0889dd ("ima: select ima-buf template for buffer measurement")
> > > > i.e. v5.11-rc1 or backport?
> > > The above change is required. Prior to this change, template has to be
> > > specified in the policy, otherwise the default template would be used.
> > The default template is ima-ng, right?
> Yes: ima-ng is the default template.

> > > From what you write I understand that "measure func=KEY_CHECK
> > keyrings=.ima|.evm" will work only on newer kernel, thus we should always use
> > template=ima-buf as the policy example so that it's working also on that few
> > kernels between <v5.6,v5.10> (which have IMA key functionality, but not
> > dea87d0889dd), right?
> Yes: In the kernels between v5.6 and v5.10, ima-buf template needs to be
> specified in the policy for KEY_CHECK.

OK, thus your original version - i.e. don't require template=ima-buf,
but keep it in policy example is the best approach.

> > But we should mention that in the README.md.

> Agreed - will update the README.md
Thanks!

Kind regards,
Petr

> thanks,
>  -lakshmi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
