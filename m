Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C35B36B91A
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 11:21:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 942703C1D1D
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 11:21:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0F53C3C1CA0
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 11:21:40 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3BB8C14017E5
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 11:21:37 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6H9LaIm006938
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Wed, 17 Jul 2019 02:21:36 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Wed, 17 Jul 2019 02:21:35 -0700
To: <ltp@lists.linux.it>, Li Wang <liwang@redhat.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <56f854e2-9cc6-4725-3182-ff83e106ee23@windriver.com>
Date: Wed, 17 Jul 2019 17:21:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] Question about kernel/syscall/signal/signal06.c
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgV2FuZywKClNvcnJ5IGZvciBib3RoZXIgeW91LgoKSSBmaW5kIHNpZ25hbDA2IGZhaWxzIG9u
IHFlbXV4ODYtNjQgd2hlbiBxZW11IGhhcyBhIHNtYWxsIG51bWJlciBjb3JlcywgCmUuZy4gInFl
bXUgLXNtcCAxLzIvNC82Ii4KCkVSUk9SIElORk86CgpzaWduYWwwNsKgwqDCoCAwwqAgVElORk/C
oCA6wqAgbG9vcCA9IDIzCnNpZ25hbDA2wqDCoMKgIDHCoCBURkFJTMKgIDrCoCBzaWduYWwwNi5j
Ojg3OiBCdWcgUmVwcm9kdWNlZCEKCkJ1dCBpZiBib290IHFlbXUgd2l0aCAiLXNtcCAxNiIsIHRo
ZSBjYXNlIGhhcyBncmVhdCBjaGFuY2UgdG8gcGFzcy4KCgpJIGhhdmUgdHdvIHF1ZXN0aW9ucyBh
Ym91dCB0aGlzIGNhc2U6CgoxLiBJIGRvbid0IGtub3cgd2h5IG11bHRpLWNvcmUgd2lsbCBhZmZl
Y3QgdGhlIGNhc2UuCgoyLiBPbiBmYWlsdXJlIHNpdHVhdGlvbiwgd2hhdCBkb2VzIGJyZWFrIHRo
ZSAid2hpbGUgbG9vcCIgc2hvd24gaW4gYmVsb3cgCmNvZGUuCgogwqDCoMKgIHdoaWxlIChEID09
IFZBTFVFICYmIGxvb3AgPCBMT09QUykgewogwqDCoMKgwqDCoMKgwqAgLyogc3lzX3RraWxsKHBp
ZCwgU0lHSFVQKTsgYXNtIHRvIGF2b2lkIHNhdmUvcmVsb2FkCiDCoMKgwqDCoMKgwqDCoMKgICog
ZnAgcmVncyBhcm91bmQgYyBjYWxsICovCiDCoMKgwqDCoMKgwqDCoCBhc20gKCIiIDogOiAiYSIo
X19OUl90a2lsbCksICJEIihwaWQpLCAiUyIoU0lHSFVQKSk7CiDCoMKgwqDCoMKgwqDCoCBhc20g
KCJzeXNjYWxsIiA6IDogOiAiYXgiKTsKCiDCoMKgwqDCoMKgwqDCoCBsb29wKys7CiDCoMKgwqAg
fQoKIMKgwqDCoCAuLi4KCiDCoMKgwqAgaWYgKGxvb3AgPT0gTE9PUFMpIHsKIMKgwqDCoMKgwqDC
oMKgIHRzdF9yZXNtKFRQQVNTLCAiJXMgY2FsbCBzdWNjZWVkZWQiLCBUQ0lEKTsKIMKgwqDCoCB9
IGVsc2UgewogPj4+IHRzdF9yZXNtKFRGQUlMLCAiQnVnIFJlcHJvZHVjZWQhIik7CiDCoMKgwqDC
oMKgwqDCoCB0c3RfZXhpdCgpOwogwqDCoMKgIH0KCgpUaGFua3MuCgotLUhvbmd6aGkKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
