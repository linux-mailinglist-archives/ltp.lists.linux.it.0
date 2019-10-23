Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9DCE1768
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 12:10:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D5E13C22BF
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 12:10:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 881153C224D
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 12:10:20 +0200 (CEST)
Received: from alexa-out-tai-02.qualcomm.com (alexa-out-tai-02.qualcomm.com
 [103.229.16.227])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 08E59600BF5
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 12:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qcdkim; t=1571825419; x=1603361419;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=7c7UqTUme/Eqg/yvtC2rgfdVCGO6pAcQTeJqYfbGQdI=;
 b=hFyCTUboXIYzF5ElIhuGPRp4eCJ9bHis8RCxyMKVbT4YqtV314LPGqgA
 3yyGXRVytj3qgCObJfBQpxl35f0y926U1ZvSBVCx3g76mfktrEABuuxJ9
 8QQrRJ/YyuphvPCMopKJZs31aNdja6mAbvKS0XMNGoHVPUFd2lzo+U1Ok w=;
Thread-Topic: [LTP] Bug report in read_all.c
Received: from ironmsg02-tai.qualcomm.com ([10.249.140.7])
 by alexa-out-tai-02.qualcomm.com with ESMTP; 23 Oct 2019 18:10:14 +0800
IronPort-SDR: 1WdicuegtHR+eNk1yrPc3ej0+9Jts+oNldXn785f6gkRpjypPUZRYZFHMtHvGOaP786XNHMMuF
 2wKDZ5Vr+Xf5aqt9nVkSNyXxRHWyiqJEg=
Received: from aptaiexm02b.ap.qualcomm.com ([10.249.150.12])
 by ironmsg02-tai.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Oct 2019 18:10:11 +0800
Received: from aptaiexm02f.ap.qualcomm.com (10.249.150.16) by
 aptaiexm02b.ap.qualcomm.com (10.249.150.12) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3; Wed, 23 Oct 2019 18:10:08 +0800
Received: from aptaiexm02f.ap.qualcomm.com ([fe80::4152:1436:e436:faa1]) by
 aptaiexm02f.ap.qualcomm.com ([fe80::4152:1436:e436:faa1%19]) with mapi id
 15.00.1473.005; Wed, 23 Oct 2019 18:10:08 +0800
From: Xiang Li <lixian@qti.qualcomm.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Index: AdWH2/TI3veigLkQQXO52r6YDaCyhQAsvI8AADA4J0AAHRNmAAAOmThQ
Date: Wed, 23 Oct 2019 10:10:08 +0000
Message-ID: <a4fd7012860d4c989e491ee54c1a3ada@aptaiexm02f.ap.qualcomm.com>
References: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
 <20191022121222.GA15798@rei>
 <382857de8dca46e996b06ceb482cb911@apsanexr02f.ap.qualcomm.com>
 <20191023100534.GA17426@rei.lan>
In-Reply-To: <20191023100534.GA17426@rei.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.249.136.10]
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Bug report in read_all.c
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Okay, I'll keep that in mind.
Thanks for your reply.

Regards,
Xiang

-----Original Message-----
From: Cyril Hrubis <chrubis@suse.cz> 
Sent: Wednesday, October 23, 2019 6:06 PM
To: Xiang Li <lixian@qti.qualcomm.com>
Cc: ltp@lists.linux.it; Richard Palethorpe <rpalethorpe@suse.de>
Subject: [EXT] Re: [LTP] Bug report in read_all.c

Hi!
> Thanks for Richard's suggestion. I've put it in the patch.
> Please check the attached patch file for review. 

Pushed.

I've adjusted the commit message and got rid of the trailing whitespaces in the patch as well.

Also as Ritchie said, patches are usually send inline and not as attached, and this could be done with git send-email.

--
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
