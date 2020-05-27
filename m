Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DB31E4218
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 14:25:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCBE83C3224
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 14:25:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 508183C222C
 for <ltp@lists.linux.it>; Wed, 27 May 2020 14:25:06 +0200 (CEST)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B11A120129D
 for <ltp@lists.linux.it>; Wed, 27 May 2020 14:25:04 +0200 (CEST)
IronPort-SDR: rL8PfwvG9QHER7eMbYg9W+0XrJs4BJu/NbjTH++ahO+I0CyOsuaPrSE/CG/E0KxZh86Ej4ewNE
 fBvyMyTNw3fw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 05:25:02 -0700
IronPort-SDR: 6C/oDG0YMBh4nRjabMxAMNNq6B2IV8n7Pu1PTZu30I7Y8U1nqSNgQd32PXL62j0gZJYMIGng7N
 RIUQawnKM4Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; d="scan'208";a="376014189"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga001.fm.intel.com with ESMTP; 27 May 2020 05:25:01 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 05:25:01 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 May 2020 05:25:01 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.178]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.34]) with mapi id 14.03.0439.000;
 Wed, 27 May 2020 20:24:58 +0800
From: "Xu, Pengfei" <pengfei.xu@intel.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v5 4/4] umip_basic_test.c: improve kconfig
 verification to avoid umip wrong abort case
Thread-Index: AQHWMtrUW1B3EYnkK0ymCCJPJlBTuai5phyA///syACAAADrgIAAkUYA//97KYCAAI1CAIAA9uxg///PWwAAHT4WMA==
Date: Wed, 27 May 2020 12:24:57 +0000
Message-ID: <33757536896DC84D9B3811B9D9F1A5D13D8C0299@SHSMSX101.ccr.corp.intel.com>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
 <20191220092529.3239-4-pengfei.xu@intel.com>
 <20200525212401.GA30581@dell5510>
 <20200526023233.GA14105@xpf-desktop.sh.intel.com>
 <20200526092346.GB10775@dell5510> <20200526092703.GC10775@dell5510>
 <20200526100700.GA24819@xpf-desktop.sh.intel.com>
 <20200526101133.GA3114075@x230>
 <20200526103708.GA26057@xpf-desktop.sh.intel.com>
 <33757536896DC84D9B3811B9D9F1A5D13D8BFA2B@SHSMSX101.ccr.corp.intel.com>
 <20200527062648.GA11836@dell5510>
In-Reply-To: <20200527062648.GA11836@dell5510>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
   Ok, thanks!

Thanks!
BR
Pengfei
+86 021 61164364=A0=A0 =




-----Original Message-----
From: Petr Vorel <pvorel@suse.cz> =

Sent: Wednesday, May 27, 2020 14:27
To: Xu, Pengfei <pengfei.xu@intel.com>
Cc: ltp <ltp@lists.linux.it>; Neri, Ricardo <ricardo.neri@intel.com>; Su, H=
eng <heng.su@intel.com>; Kasten, Robert A <robert.a.kasten@intel.com>; Cyri=
l Hrubis <chrubis@suse.cz>; Jan Stancek <jstancek@redhat.com>; Li Wang <liw=
ang@redhat.com>
Subject: Re: [LTP] [PATCH v5 4/4] umip_basic_test.c: improve kconfig verifi=
cation to avoid umip wrong abort case

Hi Pengfei,

>   Seems LINUX_VERSION_CODE way it not suitable when test platform is not =
compiled platform.
Well, you're expected to have installed kernel headers for target platform,=
 when you cross compile. That's what embedded distros like buildroot or yoc=
to do.
We already use constructs like this in the code.

>   Need to use " if ((tst_kvercmp(5, 5, 0)) >=3D 0)" way.
As you noticed in previous mail, this will not work, as it's code outside o=
f the function, so you cannot call any function.

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
