Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7E51E3929
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 08:26:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A5D83C3239
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 08:26:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BBA353C2242
 for <ltp@lists.linux.it>; Wed, 27 May 2020 08:26:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AD86C14001EE
 for <ltp@lists.linux.it>; Wed, 27 May 2020 08:26:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD316AE3B;
 Wed, 27 May 2020 06:26:53 +0000 (UTC)
Date: Wed, 27 May 2020 08:26:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Xu, Pengfei" <pengfei.xu@intel.com>
Message-ID: <20200527062648.GA11836@dell5510>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
 <20200526023233.GA14105@xpf-desktop.sh.intel.com>
 <20200526092346.GB10775@dell5510> <20200526092703.GC10775@dell5510>
 <20200526100700.GA24819@xpf-desktop.sh.intel.com>
 <20200526101133.GA3114075@x230>
 <20200526103708.GA26057@xpf-desktop.sh.intel.com>
 <33757536896DC84D9B3811B9D9F1A5D13D8BFA2B@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33757536896DC84D9B3811B9D9F1A5D13D8BFA2B@SHSMSX101.ccr.corp.intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: "Su, Heng" <heng.su@intel.com>, "Neri, Ricardo" <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, "Kasten, Robert A" <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Pengfei,

>   Seems LINUX_VERSION_CODE way it not suitable when test platform is not compiled platform.
Well, you're expected to have installed kernel headers for target platform, when
you cross compile. That's what embedded distros like buildroot or yocto do.
We already use constructs like this in the code.

>   Need to use " if ((tst_kvercmp(5, 5, 0)) >= 0)" way.
As you noticed in previous mail, this will not work, as it's code outside of the
function, so you cannot call any function.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
