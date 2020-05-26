Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E50F21E1F9E
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 12:27:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50C9E3C3272
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 12:27:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2F7273C2235
 for <ltp@lists.linux.it>; Tue, 26 May 2020 12:27:16 +0200 (CEST)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3D3E11A00F97
 for <ltp@lists.linux.it>; Tue, 26 May 2020 12:27:12 +0200 (CEST)
IronPort-SDR: JOZRX/9wnXdxqzcfvUMzLUrz6S1uyrqhuUU5diYVCG3XuBnj6Xnr06GSQ9RL0qgO41yryGuY0p
 HU+NaBhlDJjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 03:27:10 -0700
IronPort-SDR: TsIKb3TzLvhy4hn8ZCVZj6sHWtckqvlrnbEfDTycdXOnPFaRf2ULQ7tO7uFFmSUAMlNjXcH/Kk
 Xs9SEG428sUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="255358795"
Received: from xpf-desktop.sh.intel.com ([10.239.13.107])
 by orsmga007.jf.intel.com with ESMTP; 26 May 2020 03:27:08 -0700
Date: Tue, 26 May 2020 18:37:08 +0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200526103708.GA26057@xpf-desktop.sh.intel.com>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
 <20200526023233.GA14105@xpf-desktop.sh.intel.com>
 <20200526092346.GB10775@dell5510> <20200526092703.GC10775@dell5510>
 <20200526100700.GA24819@xpf-desktop.sh.intel.com>
 <20200526101133.GA3114075@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526101133.GA3114075@x230>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 2020-05-26 at 12:11:33 +0200, Petr Vorel wrote:
> Hi Pengfei,
> 
> > > But it looks like Cyril is not against the implementation, it just needs to be
> > > fixed:
> > > https://patchwork.ozlabs.org/comment/2352151/
> 
> > You are right, actually it could be worked as my suggest way:
> > "CONFIG_A|CONFIG_B=Y".
> > I tried to use Cyril's advice "CONFIG_A=X|CONFIG_B=Y" way, which will
> > add more code complexity, so I just want to solve the problem I am currently
> > facing.
> > If we really need the "CONFIG_A=X|CONFIG_B=Y" function, which cannot be
> > satisfied by "CONFIG_A|CONFIG_B=Y" function in the future, then we could add
> > this function I think.
> > Thanks for your considering.
> 
> I'd also think that we need "CONFIG_A=X|CONFIG_B=Y", because
> "CONFIG_A|CONFIG_B=Y" is ambiguous (we support both CONFIG_FOO and
> CONFIG_FOO=bar and this must stay even with |).
> 
> Will you send a patch for that or shell I fix it with LINUX_VERSION_CODE <
> KERNEL_VERSION for now?

  Ok, thanks for your LINUX_VERSION way to fix this issue.
  Thanks!
  BR.

> 
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
