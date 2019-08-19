Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA10924F8
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 15:28:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82E833C1814
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Aug 2019 15:28:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EBD6B3C1814
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 15:28:51 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E7B38200BC6
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 15:28:45 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7JDSfj8001914
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
 for <ltp@lists.linux.it>; Mon, 19 Aug 2019 06:28:42 -0700 (PDT)
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 19 Aug 2019 06:28:40 -0700
To: <ltp@lists.linux.it>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <2c982dfd-9929-8969-4c4e-18d2d91ede1b@windriver.com>
Date: Mon, 19 Aug 2019 21:28:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [128.224.162.221]
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] MIPS/MIPS64 syscalls
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgQWxsLAoKVGhlcmUgc2VlbXMgbm90IGFueSBtaXBzL21pcHM2NCBzeXNjYWxscyBkZWZpbmVk
LiBXaGVyZSBjYW4gd2UgZmluZCB0aGVtPyBvciBkbyB3ZSBzdXBwb3J0IHRoZW0/CgpscyBpbmNs
dWRlL2xhcGkvc3lzY2FsbHMvCmFhcmNoNjQuaW7CoCBocHBhLmluwqAgaWE2NC5pbsKgIHBvd2Vy
cGM2NC5pbsKgIHJlZ2VuLnNowqAgczM5MHguaW7CoCBzcGFyYzY0LmluwqAgc3RyaXBfc3lzY2Fs
bC5hd2sKYXJtLmluwqDCoMKgwqDCoCBpMzg2LmluwqAgb3JkZXLCoMKgwqAgcG93ZXJwYy5pbsKg
wqDCoCBzMzkwLmluwqDCoCBzaC5pbsKgwqDCoMKgIHNwYXJjLmluwqDCoMKgIHg4Nl82NC5pbgoK
U29tZSBjYXNlcyBsaWtlIHJ0X3NpZ3RpbWVkd2FpdDAxIHdvdWxkIGZhaWwgd2l0aG91dCB0aGUg
ZGVmaW5pdGlvbi4KCi4vdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zaWd3YWl0aW5mby9zaWd3
YWl0aW5mbzAxLmMKI2lmZGVmIFRFU1RfUlRfU0lHVElNRURXQUlUwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoApzdGF0aWMgaW50IG15X3J0X3NpZ3RpbWVk
d2FpdChjb25zdCBzaWdzZXRfdCAqIHNldCwgc2lnaW5mb190ICogaW5mbyzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHRpbWVzcGVjICp0aW1lb3V0KcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCnvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgCsKgwqDCoMKgwqDCoMKgIC8qIFRoZSBsYXN0IGFyZ3VtZW50IGlzIChu
dW1iZXJfb2Zfc2lnbmFscykvKGJpdHNfcGVyX2J5dGUpLCB3aGljaCBhcmUgNjQgYW5kIDgsIHJl
c3AuICovCsKgwqDCoMKgwqDCoMKgIHJldHVybiBsdHBfc3lzY2FsbChfX05SX3J0X3NpZ3RpbWVk
d2FpdCwgc2V0LCBpbmZvLCB0aW1lb3V0LCA4KTvCoMKgwqDCoMKgwqDCoMKgCn3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAojZW5kaWYKCgpUaGFua3MsClpoZQoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
