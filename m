Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500E1E34AD
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 03:23:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF9C23C32BF
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 03:23:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AA94F3C2605
 for <ltp@lists.linux.it>; Wed, 27 May 2020 03:23:08 +0200 (CEST)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 349FC60085E
 for <ltp@lists.linux.it>; Wed, 27 May 2020 03:23:05 +0200 (CEST)
IronPort-SDR: baU5/qeFPxB2plB6cKE7hfMyv/PfZyw7IIltsoufEURJ+aJ1mrQsgJHtRNEJYY7JlZeT3IwJXv
 1WOD76ZksGvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 18:23:03 -0700
IronPort-SDR: eCFbcI7NRroQhj4peAZK8yX6kWPk/YPEpFxAoEi6VujLYJHLeg9LQnrtwLTstCbH4K6CwEPCth
 2oT53w5pMw/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,439,1583222400"; d="scan'208";a="468520827"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga005.fm.intel.com with ESMTP; 26 May 2020 18:23:03 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 26 May 2020 18:23:02 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX102.amr.corp.intel.com (10.18.124.200) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 26 May 2020 18:23:02 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.178]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.80]) with mapi id 14.03.0439.000;
 Wed, 27 May 2020 09:22:59 +0800
From: "Xu, Pengfei" <pengfei.xu@intel.com>
To: "Xu, Pengfei" <pengfei.xu@intel.com>, Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v5 4/4] umip_basic_test.c: improve kconfig
 verification to avoid umip wrong abort case
Thread-Index: AQHWMtrUW1B3EYnkK0ymCCJPJlBTuai5phyA///syACAAADrgIAAkUYA//97KYCAAI1CAIAA9uxg
Date: Wed, 27 May 2020 01:22:58 +0000
Message-ID: <33757536896DC84D9B3811B9D9F1A5D13D8BFA2B@SHSMSX101.ccr.corp.intel.com>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
 <20200526023233.GA14105@xpf-desktop.sh.intel.com>
 <20200526092346.GB10775@dell5510> <20200526092703.GC10775@dell5510>
 <20200526100700.GA24819@xpf-desktop.sh.intel.com>
 <20200526101133.GA3114075@x230>
 <20200526103708.GA26057@xpf-desktop.sh.intel.com>
In-Reply-To: <20200526103708.GA26057@xpf-desktop.sh.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
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
Cc: "Su, Heng" <heng.su@intel.com>, "Neri, Ricardo" <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>, "Kasten, Robert A" <robert.a.kasten@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
  Seems LINUX_VERSION_CODE way it not suitable when test platform is not co=
mpiled platform.
  Need to use " if ((tst_kvercmp(5, 5, 0)) >=3D 0)" way.

Thanks!
BR
Pengfei
+86 021 61164364=A0=A0 =




-----Original Message-----
From: Pengfei Xu <pengfei.xu@intel.com> =

Sent: Tuesday, May 26, 2020 18:37
To: Petr Vorel <pvorel@suse.cz>
Cc: ltp <ltp@lists.linux.it>; Neri, Ricardo <ricardo.neri@intel.com>; Su, H=
eng <heng.su@intel.com>; Kasten, Robert A <robert.a.kasten@intel.com>; Cyri=
l Hrubis <chrubis@suse.cz>; Jan Stancek <jstancek@redhat.com>; Li Wang <liw=
ang@redhat.com>
Subject: Re: [LTP] [PATCH v5 4/4] umip_basic_test.c: improve kconfig verifi=
cation to avoid umip wrong abort case

Hi Petr,

On 2020-05-26 at 12:11:33 +0200, Petr Vorel wrote:
> Hi Pengfei,
> =

> > > But it looks like Cyril is not against the implementation, it just =

> > > needs to be
> > > fixed:
> > > https://patchwork.ozlabs.org/comment/2352151/
> =

> > You are right, actually it could be worked as my suggest way:
> > "CONFIG_A|CONFIG_B=3DY".
> > I tried to use Cyril's advice "CONFIG_A=3DX|CONFIG_B=3DY" way, which =

> > will add more code complexity, so I just want to solve the problem I =

> > am currently facing.
> > If we really need the "CONFIG_A=3DX|CONFIG_B=3DY" function, which canno=
t =

> > be satisfied by "CONFIG_A|CONFIG_B=3DY" function in the future, then =

> > we could add this function I think.
> > Thanks for your considering.
> =

> I'd also think that we need "CONFIG_A=3DX|CONFIG_B=3DY", because =

> "CONFIG_A|CONFIG_B=3DY" is ambiguous (we support both CONFIG_FOO and =

> CONFIG_FOO=3Dbar and this must stay even with |).
> =

> Will you send a patch for that or shell I fix it with =

> LINUX_VERSION_CODE < KERNEL_VERSION for now?

  Ok, thanks for your LINUX_VERSION way to fix this issue.
  Thanks!
  BR.

> =

> Kind regards,
> Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
