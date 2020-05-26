Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9331E1F6B
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 12:11:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFF2D3C32BF
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 12:11:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 32B5E3C2031
 for <ltp@lists.linux.it>; Tue, 26 May 2020 12:11:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B7A23600B19
 for <ltp@lists.linux.it>; Tue, 26 May 2020 12:11:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F108AEE0;
 Tue, 26 May 2020 10:11:38 +0000 (UTC)
Date: Tue, 26 May 2020 12:11:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Pengfei Xu <pengfei.xu@intel.com>
Message-ID: <20200526101133.GA3114075@x230>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
 <20200526023233.GA14105@xpf-desktop.sh.intel.com>
 <20200526092346.GB10775@dell5510> <20200526092703.GC10775@dell5510>
 <20200526100700.GA24819@xpf-desktop.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526100700.GA24819@xpf-desktop.sh.intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 4/4] umip_basic_test.c: improve kconfig
 verification to avoid umip wrong abort case
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Pengfei,

> > But it looks like Cyril is not against the implementation, it just needs to be
> > fixed:
> > https://patchwork.ozlabs.org/comment/2352151/

> You are right, actually it could be worked as my suggest way:
> "CONFIG_A|CONFIG_B=Y".
> I tried to use Cyril's advice "CONFIG_A=X|CONFIG_B=Y" way, which will
> add more code complexity, so I just want to solve the problem I am currently
> facing.
> If we really need the "CONFIG_A=X|CONFIG_B=Y" function, which cannot be
> satisfied by "CONFIG_A|CONFIG_B=Y" function in the future, then we could add
> this function I think.
> Thanks for your considering.

I'd also think that we need "CONFIG_A=X|CONFIG_B=Y", because
"CONFIG_A|CONFIG_B=Y" is ambiguous (we support both CONFIG_FOO and
CONFIG_FOO=bar and this must stay even with |).

Will you send a patch for that or shell I fix it with LINUX_VERSION_CODE <
KERNEL_VERSION for now?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
