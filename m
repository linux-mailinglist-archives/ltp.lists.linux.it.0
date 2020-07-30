Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB01232EDF
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 10:49:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 721A53C2617
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 10:49:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id EEBDE3C0515
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 10:49:23 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BC64A1000AC4
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 10:49:22 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,413,1589212800"; d="scan'208";a="97103593"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2020 16:49:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EC78E4CE545A;
 Thu, 30 Jul 2020 16:49:18 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Jul 2020 16:49:19 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200722125946.GA22573@yuki.lan>
 <1595556357-29932-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595556357-29932-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200729113946.GB7152@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <924c3fc1-c56c-a752-0720-bb12d6cf8ec0@cn.fujitsu.com>
Date: Thu, 30 Jul 2020 16:49:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729113946.GB7152@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EC78E4CE545A.A36F7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.5 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/ioctl_loop05: Using
 LOOP_CONFIGURE to set direct io
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SEkgQ3lyaWwKCj4gSGkhCj4gSSBzdGFydGVkIGxvb2sgYXQgdGhpcyBwYXRjaCBob3dldmVyIHRo
ZSBmaXJzdCB0aGluZyBJJ3ZlIGZvdW5kIG91dCBpcyB0aGF0Cj4gb3VyIG1vdW50aW5mbyBwYXJz
ZXIgaXMgd3JvbmcuIElmIHlvdSBsb29rIGF0IG1hbiA1IHByb2MgaXQgc2F5czoKPiAKPiAzNiAz
NSA5ODowIC9tbnQxIC9tbnQyIHJ3LG5vYXRpbWUgbWFzdGVyOjEgLSBleHQzIC9kZXYvcm9vdCBy
dyxlcnJvcnM9Y29udGludWUKPiAoMSkoMikoMykgICAoNCkgICAoNSkgICAgICAoNikgICAgICAo
NykgICAoOCkgKDkpICAgKDEwKSAgICAgICAgICgxMSkKPiAKPiAKPiAoNykgIG9wdGlvbmFsIGZp
ZWxkczogemVybyBvciBtb3JlIGZpZWxkcyBvZiB0aGUgZm9ybQo+ICAgICAgICJ0YWdbOnZhbHVl
XSI7IHNlZSBiZWxvdy4KPiAKPiBTbyB3ZSBjYW5ub3QgcmVhbGx5IHBhcnNlIHRoZSBpbmZvcm1h
dGlvbiB3aXRoIGEgc3RhdGljIHNjYW5mKCkgc3RyaW5nLAo+IHNpbmNlIHRoZSBudW1iZXIgb2Yg
ZWxlbWVudHMgaW4gdGhlIGxpbmUgaXMgbm90IGNvbnN0YW50Lgo+IAo+IEFuZCBpdCBkb2VzIGZh
aWwgb24gc29tZSBvZiB0aGUgbWFjaGluZXMgSSBkbyBoYXZlIGhlcmUgc2luY2UgdGhlcmUgaXMK
PiBubyBvcHRpb25hbCBmaWVsZHMgcHJlc2VudC4KPiAKPiBTbyBJIGd1ZXNzIHRoYXQgd2Ugd2ls
bCBoYXZlIHRvIHdyaXRlIGEgcGFyc2VyIHRoYXQgcmVhZHMgdGhhdAo+IGluZm9ybWF0aW9uIGxp
bmUgYnkgbGluZSBhZnRlciBhbGwuCkkgZG91YnQgaG93IG1hY2hpZXMgd2lsbCBoYXZlIG1vcmUg
b3IgemVybyBmaWVsZHMgaW4gKDcpLiBCdXQgSSB0aGluayAKeW91IGFyZSByaWdodCwKSG93IGFi
b3V0IHVzaW5nIHRoZSAoMykgZmllbGQgYW5kIHNlY29uZCB0byBsYXN0IGZpZWxkLiBUaGVuIHdl
IGNhbiAKYXZvaWQgemVybyBvciBtb3JlIGZpbGVkIGluICg3KS4gdGhlIGNvZGUgYXMgYmVsb3ej
ugoKZGlmZiAtLWdpdCBhL2xpYi90c3RfZGV2aWNlLmMgYi9saWIvdHN0X2RldmljZS5jCmluZGV4
IDhkOGJjNWI0MC4uMzZkNjY2NmZlIDEwMDY0NAotLS0gYS9saWIvdHN0X2RldmljZS5jCisrKyBi
L2xpYi90c3RfZGV2aWNlLmMKQEAgLTQ5NywxNiArNDk3LDMxIEBAIHVuc2lnbmVkIGxvbmcgdHN0
X2Rldl9ieXRlc193cml0dGVuKGNvbnN0IGNoYXIgKmRldikKCiAgdm9pZCB0c3RfZmluZF9iYWNr
aW5nX2Rldihjb25zdCBjaGFyICpwYXRoLCBjaGFyICpkZXYpCiAgewotICAgICAgIGNoYXIgZm10
WzEwMjRdOworICAgICAgIGNoYXIgZm10WzIwXTsKICAgICAgICAgc3RydWN0IHN0YXQgYnVmOwor
ICAgICAgIEZJTEUgKmZpbGU7CisgICAgICAgY2hhciBsaW5lW1BBVEhfTUFYXTsKKyAgICAgICBj
aGFyICpwcmUgPSBOVUxMOworICAgICAgIGNoYXIgKm5leHQgPSBOVUxMOwoKICAgICAgICAgaWYg
KHN0YXQocGF0aCwgJmJ1ZikgPCAwKQogICAgICAgICAgICAgICAgICB0c3RfYnJrbShUV0FSTiB8
IFRFUlJOTywgTlVMTCwgInN0YXQoKSBmYWlsZWQiKTsKCi0gICAgICAgc25wcmludGYoZm10LCBz
aXplb2YoZm10KSwgIiUlKmkgJSUqaSAldToldSAlJSpzICUlKnMgJSUqcyAlJSpzIAolJSpzICUl
KnMgJSVzICUlKnMiLAotICAgICAgICAgICAgICAgICAgICAgICBtYWpvcihidWYuc3RfZGV2KSwg
bWlub3IoYnVmLnN0X2RldikpOworICAgICAgIHNucHJpbnRmKGZtdCwgc2l6ZW9mKGZtdCksICIl
dToldSIsIG1ham9yKGJ1Zi5zdF9kZXYpLCAKbWlub3IoYnVmLnN0X2RldikpOworICAgICAgIGZp
bGUgPSBTQUZFX0ZPUEVOKE5VTEwsICIvcHJvYy9zZWxmL21vdW50aW5mbyIsICJyIik7CgotICAg
ICAgIFNBRkVfRklMRV9MSU5FU19TQ0FORihOVUxMLCAiL3Byb2Mvc2VsZi9tb3VudGluZm8iLCBm
bXQsIGRldik7CisgICAgICAgd2hpbGUgKGZnZXRzKGxpbmUsIHNpemVvZihsaW5lKSwgZmlsZSkp
IHsKKyAgICAgICAgICAgICAgIGlmIChzdHJzdHIobGluZSwgZm10KSAhPSBOVUxMKSB7CisgICAg
ICAgICAgICAgICAgICAgICAgIHByZSA9IHN0cnRva19yKGxpbmUsICIgIiwgJm5leHQpOworICAg
ICAgICAgICAgICAgICAgICAgICB3aGlsZShwcmUgIT0gTlVMTCkgeworICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cmNweShkZXYsIHByZSk7CisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcHJlID0gc3RydG9rX3IoTlVMTCwgIiAiLCAmbmV4dCk7CisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHN0cmxlbihuZXh0KSA9PSAwKQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICAgICAgICAgICAgIH0K
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICAgICB9CisgICAgICAg
fQoKICAgICAgICAgaWYgKHN0YXQoZGV2LCAmYnVmKSA8IDApCiAgICAgICAgICAgICAgICAgIHRz
dF9icmttKFRXQVJOIHwgVEVSUk5PLCBOVUxMLCAic3RhdCglcykgZmFpbGVkIiwgZGV2KTsKCj4g
CgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
