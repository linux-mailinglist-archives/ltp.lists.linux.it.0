Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B367422E0
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jun 2023 11:06:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D91063CC78A
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jun 2023 11:06:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E7E53C02B2
 for <ltp@lists.linux.it>; Wed, 28 Jun 2023 16:35:54 +0200 (CEST)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BE9851400BF9
 for <ltp@lists.linux.it>; Wed, 28 Jun 2023 16:35:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=lUkU2FtlrmI884MIX+8Ov37gsp+qdDfIHByA05Xth/Y=; b=QxVQpJx6qn+f5oGrAkHLxJMYIf
 Qy+iqBzTXhk7XI5t7mLx4fvmIcki1IHhegCo5eQ+qlHkTkEeBooESMuLLWmckkIDT3w+HqIvf1D23
 +uqbVkJnP6nPG5o4wmJoKc6WLqOV19TF2lcx+uMhagS8UlvDPKYMl45a53elqfOxo3S8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qEWGj-0007pD-Dk; Wed, 28 Jun 2023 16:35:41 +0200
Date: Wed, 28 Jun 2023 16:35:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Message-ID: <0e82eff0-16ba-49b0-933d-26f49515d434@lunn.ch>
References: <20230627232139.213130-1-rrameshbabu@nvidia.com>
 <7fa02bc1-64bd-483d-b3e9-f4ffe0bbb9fb@lunn.ch>
 <87ilb8ba1d.fsf@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ilb8ba1d.fsf@nvidia.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 29 Jun 2023 11:05:53 +0200
Subject: Re: [LTP] [PATCH net v1] ptp: Make max_phase_adjustment sysfs
 device attribute invisible when not supported
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
Cc: Linux Kernel Functional Testing <lkft@linaro.org>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, lkft-triage@lists.linaro.org,
 "David S. Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>,
 Saeed Mahameed <saeed@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Gal Pressman <gal@nvidia.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> >> diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
> >> index 77219cdcd683..6e4d5456a885 100644
> >> --- a/drivers/ptp/ptp_sysfs.c
> >> +++ b/drivers/ptp/ptp_sysfs.c
> >> @@ -358,6 +358,9 @@ static umode_t ptp_is_attribute_visible(struct kobject *kobj,
> >>  		   attr == &dev_attr_max_vclocks.attr) {
> >>  		if (ptp->is_virtual_clock)
> >>  			mode = 0;
> >> +	} else if (attr == &dev_attr_max_phase_adjustment.attr) {
> >> +		if (!info->adjphase || !info->getmaxphase)
> >> +			mode = 0;
> >
> > Maybe it is time to turn this into a switch statement?
> 
> I agree. However, I do not want to conflate two separate things being a
> bugfix and a cleanup. I think we can do one of two options.
> 
>   1. We can take this patch as is, but I submit a subsequent cleanup patch for
>   this.

Fine by me.

> > I also wounder if this really is something for net. How do you think
> > this patch matches against the stable rules?
> 
> Apologize in advance but not sure I am following along. The commit for
> the patch the introduces the problematic logic has made its way to net
> and this patch is a fix. Therefore, isn't net the right tree to target?

Humm. So c3b60ab7a4df is in net-next, and the tag net-next-6.5. So it
was passed to Linus yesterday for merging. You would like this fix
merged either before -rc1, or just after -rc1.

We are in the grey area where it is less clear which tree it should be
against. So it is good to explain after the --- what your intention
is, so the Maintainers get a heads up and understand what you are
trying to achieve.

I actually thought you were trying to fix an older issue, something in
6.4 or older, which is what net is mostly used for. Under those
conditions, the stable rules apply. Things like, is this fixing an
issue which really effects users....

       Andrew


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
