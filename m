Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A863E1081
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 05:23:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 491AC3C22D9
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 05:23:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id EC5523C22CB
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 05:23:50 +0200 (CEST)
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 58BEE1A01122
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 05:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
 s=qcdkim; t=1571801029; x=1603337029;
 h=from:to:cc:date:message-id:references:in-reply-to:
 mime-version:subject;
 bh=GcVQWoUSiifoWk+MQeGYwDW/hWjuHGNds7NHpg1iehQ=;
 b=i/Ni8iGO9EHWjTcqm5EogkFsgNX+LE5zdmSyM+ys5yxYOz1TSv4hpDfO
 P5vKHworMGrOhQMM5g0V42S8jn2IqZV5eR52x9cxk2jVjpbX2Ig+ipD4J
 jeU5oIferDpdGHJBfbaHUHbd71rctD7e1Ao1Pe2lgkU6ROMLjT2rYF3OB A=;
Thread-Topic: [LTP] Bug report in read_all.c
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Oct 2019 20:23:44 -0700
IronPort-SDR: B/BaCwTT6vHX5eLTaz2ghSluOHFDWw1FtocqTyA5zT6Q74fPBfYqaWTkXNcbEj3S0UZww4g29S
 l9jxmIKZF1qzUALm7fC+jCizaodQBMyrg=
Received: from nasanexm03d.na.qualcomm.com ([10.85.0.91])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Oct 2019 20:23:44 -0700
Received: from apsanexr02b.ap.qualcomm.com (10.85.0.27) by
 nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Tue, 22 Oct 2019 20:23:44 -0700
Received: from apsanexr02f.ap.qualcomm.com (10.85.0.29) by
 apsanexr02b.ap.qualcomm.com (10.85.0.27) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Tue, 22 Oct 2019 20:23:41 -0700
Received: from apsanexr02f.ap.qualcomm.com ([10.85.0.29]) by
 apsanexr02f.ap.qualcomm.com ([10.85.0.29]) with mapi id 15.00.1473.005; Tue,
 22 Oct 2019 20:23:42 -0700
From: Xiang Li <lixian@qti.qualcomm.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Index: AdWH2/TI3veigLkQQXO52r6YDaCyhQAsvI8AADA4J0A=
Date: Wed, 23 Oct 2019 03:23:42 +0000
Message-ID: <382857de8dca46e996b06ceb482cb911@apsanexr02f.ap.qualcomm.com>
References: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
 <20191022121222.GA15798@rei>
In-Reply-To: <20191022121222.GA15798@rei>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.249.136.10]
Content-Type: multipart/mixed;
 boundary="_002_382857de8dca46e996b06ceb482cb911apsanexr02fapqualcommco_"
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--_002_382857de8dca46e996b06ceb482cb911apsanexr02fapqualcommco_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for Richard's suggestion. I've put it in the patch.
Please check the attached patch file for review.=20

Regards,
Xiang


-----Original Message-----
From: Cyril Hrubis <chrubis@suse.cz>=20
Sent: Tuesday, October 22, 2019 8:12 PM
To: Xiang Li <lixian@qti.qualcomm.com>
Cc: ltp@lists.linux.it
Subject: [EXT] Re: [LTP] Bug report in read_all.c

Hi!
> Modifying i + 1 to (i + 1) % QUEUE_SIZE at the source code Line#123 can e=
asily fix it.
> This bug is not triggered on every machine because the files are differen=
t between target machine.
> Adjust the length of the QUEUE_SIZE will help you reproduce this bug.

Can you send a patch that I can apply (ideally with the suggestion from Rit=
chie as well)?

--
Cyril Hrubis
chrubis@suse.cz

--_002_382857de8dca46e996b06ceb482cb911apsanexr02fapqualcommco_
Content-Type: application/octet-stream;
	name="0001-Fix-memory-read-overflow-when-a-full-file-path-store.patch"
Content-Description: 0001-Fix-memory-read-overflow-when-a-full-file-path-store.patch
Content-Disposition: attachment;
	filename="0001-Fix-memory-read-overflow-when-a-full-file-path-store.patch";
	size=1234; creation-date="Wed, 23 Oct 2019 03:12:14 GMT";
	modification-date="Wed, 23 Oct 2019 03:12:14 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2MzAzNzBjMGNjMmNjY2ZjZDAzNTQzZmJkMGNjZmI0ODllOTJlMmY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBYaWFuZyBMaSA8bGl4aWFuQHF0aS5xdWFsY29tbS5jb20+CkRh
dGU6IFdlZCwgMjMgT2N0IDIwMTkgMTE6MDE6MTAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBGaXgg
bWVtb3J5IHJlYWQgb3ZlcmZsb3cgd2hlbiBhIGZ1bGwgZmlsZSBwYXRoIHN0b3JlcyBleGFjdGx5
CiBhdCB0aGUgZW5kIG9mIHRoZSBkYXRhIGFycmF5CgpTaWduZWQtb2ZmLWJ5OiBYaWFuZyBMaSA8
bGl4aWFuQHF0aS5xdWFsY29tbS5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9mcy9yZWFkX2Fs
bC9yZWFkX2FsbC5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2ZzL3Jl
YWRfYWxsL3JlYWRfYWxsLmMgYi90ZXN0Y2FzZXMva2VybmVsL2ZzL3JlYWRfYWxsL3JlYWRfYWxs
LmMKaW5kZXggN2JlYjA4Y2NmLi4yMGY3NWM1YmMgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvZnMvcmVhZF9hbGwvcmVhZF9hbGwuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL2ZzL3JlYWRf
YWxsL3JlYWRfYWxsLmMKQEAgLTExNSwxMiArMTE1LDEyIEBAIHN0YXRpYyBpbnQgcXVldWVfcG9w
KHN0cnVjdCBxdWV1ZSAqcSwgY2hhciAqYnVmKQogCiAJCWlmICgrK2ogPj0gQlVGRkVSX1NJWkUg
LSAxKQogCQkJdHN0X2JyayhUQlJPSywgIkJ1ZmZlciBpcyB0b28gc21hbGwgZm9yIHBhdGgiKTsK
LQkJaWYgKCsraSA+PSBRVUVVRV9TSVpFKQotCQkJaSA9IDA7CisKKwkJIGkgPSAoaSArIDEpICUg
UVVFVUVfU0laRTsKIAl9CiAKIAlidWZbal0gPSAnXDAnOwotCXRzdF9hdG9taWNfc3RvcmUoaSAr
IDEsICZxLT5mcm9udCk7CisJdHN0X2F0b21pY19zdG9yZSgoaSArIDEpICUgUVVFVUVfU0laRSwg
JnEtPmZyb250KTsKIAogCXJldHVybiAxOwogfQpAQCAtMTMzLDggKzEzMyw4IEBAIHN0YXRpYyBp
bnQgcXVldWVfcHVzaChzdHJ1Y3QgcXVldWUgKnEsIGNvbnN0IGNoYXIgKmJ1ZikKIAlkbyB7CiAJ
CXEtPmRhdGFbaV0gPSBidWZbal07CiAKLQkJaWYgKCsraSA+PSBRVUVVRV9TSVpFKQotCQkJaSA9
IDA7CisJCWkgPSAoaSArIDEpICUgUVVFVUVfU0laRTsKKwkJCiAJCWlmIChpID09IGZyb250KQog
CQkJcmV0dXJuIDA7CiAKLS0gCjIuMjMuMC53aW5kb3dzLjEKCg==

--_002_382857de8dca46e996b06ceb482cb911apsanexr02fapqualcommco_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--_002_382857de8dca46e996b06ceb482cb911apsanexr02fapqualcommco_--
