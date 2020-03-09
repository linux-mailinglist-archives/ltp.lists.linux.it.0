Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BF17D859
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 04:57:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C64D3C6220
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 04:57:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8B7843C0358
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 04:57:14 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A5090200AEA
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 04:57:11 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,531,1574092800"; d="scan'208";a="86032028"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Mar 2020 11:57:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 75BBE406AB15;
 Mon,  9 Mar 2020 11:47:09 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 9 Mar 2020 11:57:04 +0800
To: Li Wang <liwang@redhat.com>
References: <20200306071221.GA13530@dell5510>
 <1583490720-10003-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ce95Uyi1cZumF4drQ7NtehVwWyhcTM5L7cEjcb7he+oA@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1d808289-aa4b-a47d-55cd-81908aaa532c@cn.fujitsu.com>
Date: Mon, 9 Mar 2020 11:57:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2ce95Uyi1cZumF4drQ7NtehVwWyhcTM5L7cEjcb7he+oA@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 75BBE406AB15.ADEB6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] hugeshmctl01: Small refactor and remove
 stat_time
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGkKCj4gSGkgWHVZYW5nLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHdvcmsgb24gcmVm
YWN0b3JpbmcuIEknZCBzdWdnZXN0IHVzaW5nIHRoZSBuZXcgCj4gJy5yZXF1ZXN0X2h1Z2VwYWdl
cyfCoCBpbiB0aGUgdGVzdGNhc2UsIHdvdWxkIG1pbmQgaGF2aW5nIGEgdHJ5PwpPSy4gQnV0IEkg
dGhpbmsgd2UgY2FuIG1lcmdlIHRoaXMgcGF0Y2goIGl0IGhhcyBhIG5ldyBsaW5lIGJlZm9yZSAK
ZnVuY19zdGF0LCByZW1vdmUgLi4pIGZpcnN0bHkgYW5kIHRoZW4gSSB3aWxsIHVzZSB0aGlzIGxp
YnJhcnkgYXBpIGluIApuZXh0IHBhdGNoIGZvciBhbGwgcmVsYXRlZCAgaHVnZXBhZ2UgY2FzZXMu
CgpCZXN0IFJlZ2FyZHMKWWFuZyBYdQo+IAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL2h1
Z2V0bGIvaHVnZXNobWN0bC9odWdlc2htY3RsMDEuYwo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwv
bWVtL2h1Z2V0bGIvaHVnZXNobWN0bC9odWdlc2htY3RsMDEuYwo+IEBAIC01Myw4ICs1Myw2IEBA
IHN0YXRpYyB2b2lkIGZ1bmNfc2V0KHZvaWQpOwo+ICDCoHN0YXRpYyB2b2lkIGZ1bmNfcm1pZCh2
b2lkKTsKPiAgwqBzdGF0aWMgdm9pZCAqc2V0X3NobWF0KHZvaWQpOwo+IAo+IC1zdGF0aWMgbG9u
ZyBodWdlcGFnZXMgPSAxMjg7Cj4gLQo+ICDCoHN0YXRpYyBzdHJ1Y3QgdHN0X29wdGlvbiBvcHRp
b25zW10gPSB7Cj4gIMKgIMKgIMKgIMKgIHsiczoiLCAmbnJfb3B0LCAiLXMgwqAgbnVtIMKgU2V0
IHRoZSBudW1iZXIgb2YgdGhlIGJlZW4gYWxsb2NhdGVkIAo+IGh1Z2VwYWdlcyJ9LAo+ICDCoCDC
oCDCoCDCoCB7TlVMTCwgTlVMTCwgTlVMTH0KPiBAQCAtMjkwLDE1ICsyODgsMTYgQEAgdm9pZCBz
ZXR1cCh2b2lkKQo+ICDCoHsKPiAgwqAgwqAgwqAgwqAgbG9uZyBocGFnZV9zaXplOwo+IAo+IC0g
wqAgwqAgwqAgc2F2ZV9ucl9odWdlcGFnZXMoKTsKPiAtIMKgIMKgIMKgIGlmIChucl9vcHQpCj4g
LSDCoCDCoCDCoCDCoCDCoCDCoCDCoCBodWdlcGFnZXMgPSBTQUZFX1NUUlRPTChucl9vcHQsIDAs
IExPTkdfTUFYKTsKPiArIMKgIMKgIMKgIGlmIChucl9vcHQpIHsKPiArIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHRzdF9odWdlcGFnZXMgPSBTQUZFX1NUUlRPTChucl9vcHQsIDAsIExPTkdfTUFYKTsK
PiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRzdF9yZXF1ZXN0X2h1Z2VwYWdlcyh0c3RfaHVnZXBh
Z2VzKTsKPiArIMKgIMKgIMKgIH0KPiArCj4gKyDCoCDCoCDCoCBpZiAodHN0X2h1Z2VwYWdlcyA9
PSAwKQo+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHN0X2JyayhUQ09ORiwgIk5vIGVub3VnaCBo
dWdlcGFnZXMgZm9yIHRlc3RpbmciKTsKPiAKPiAtIMKgIMKgIMKgIGxpbWl0X2h1Z2VwYWdlcygm
aHVnZXBhZ2VzKTsKPiAtIMKgIMKgIMKgIHNldF9zeXNfdHVuZSgibnJfaHVnZXBhZ2VzIiwgaHVn
ZXBhZ2VzLCAxKTsKPiAgwqAgwqAgwqAgwqAgaHBhZ2Vfc2l6ZSA9IFNBRkVfUkVBRF9NRU1JTkZP
KCJIdWdlcGFnZXNpemU6IikgKiAxMDI0Owo+IC0KPiAtIMKgIMKgIMKgIHNobV9zaXplID0gaHBh
Z2Vfc2l6ZSAqIGh1Z2VwYWdlcyAvIDI7Cj4gKyDCoCDCoCDCoCBzaG1fc2l6ZSA9IGhwYWdlX3Np
emUgKiB0c3RfaHVnZXBhZ2VzIC8gMjsKPiAgwqAgwqAgwqAgwqAgdXBkYXRlX3NobV9zaXplKCZz
aG1fc2l6ZSk7Cj4gIMKgIMKgIMKgIMKgIHNobWtleSA9IGdldGlwY2tleSgpOwo+ICDCoH0KPiBA
QCAtMzA2LDcgKzMwNSw2IEBAIHZvaWQgc2V0dXAodm9pZCkKPiAgwqB2b2lkIGNsZWFudXAodm9p
ZCkKPiAgwqB7Cj4gIMKgIMKgIMKgIMKgIHJtX3NobShzaG1faWRfMSk7Cj4gLSDCoCDCoCDCoCBy
ZXN0b3JlX25yX2h1Z2VwYWdlcygpOwo+ICDCoH0KPiAKPiAgwqBzdGF0aWMgc3RydWN0IHRzdF90
ZXN0IHRlc3QgPSB7Cj4gQEAgLTMxOCw0ICszMTYsNSBAQCBzdGF0aWMgc3RydWN0IHRzdF90ZXN0
IHRlc3QgPSB7Cj4gIMKgIMKgIMKgIMKgIC5jbGVhbnVwID0gY2xlYW51cCwKPiAgwqAgwqAgwqAg
wqAgLnRlc3QgPSB0ZXN0X2h1Z2VzaG1jdGwsCj4gIMKgIMKgIMKgIMKgIC5uZWVkc19jaGVja3Bv
aW50cyA9IDEsCj4gKyDCoCDCoCDCoCAucmVxdWVzdF9odWdlcGFnZXMgPSAxMjgsCj4gIMKgfTsK
PiAKPiAKPiAtLSAKPiBSZWdhcmRzLAo+IExpIFdhbmcKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
