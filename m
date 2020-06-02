Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A11EB4BA
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 06:53:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4CD13C2452
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jun 2020 06:53:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BA4A03C22D9
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 06:53:20 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 0312C1A006EB
 for <ltp@lists.linux.it>; Tue,  2 Jun 2020 06:53:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,462,1583164800"; d="scan'208";a="93632297"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Jun 2020 12:53:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 59A0D4BCC8B3;
 Tue,  2 Jun 2020 12:53:12 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Jun 2020 12:53:11 +0800
To: Jan Stancek <jstancek@redhat.com>, <ltp@lists.linux.it>
References: <0e99163dd0deef5e3c0e7276533998e80a93d16e.1591016352.git.jstancek@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <7d68e6dc-bd11-6ade-436f-f04989eed2a6@cn.fujitsu.com>
Date: Tue, 2 Jun 2020 12:53:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <0e99163dd0deef5e3c0e7276533998e80a93d16e.1591016352.git.jstancek@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 59A0D4BCC8B3.AF2C0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: set loop blksize to bdev
 blksize
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgSmFuCgoKPiBUZXN0IGlzIGZhaWxpbmcgb24gczM5MCwgd2hlcmUgZGVmYXVsdCBsb29wIGJs
a3NpemUgaXMgbGVzcyB0aGFuCj4gYmFja2luZyBkZXYncyBibGtzaXplICg0MDk2KToKPiAgICB0
c3RfdGVzdC5jOjEyNDc6IElORk86IFRpbWVvdXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBzCj4gICAg
dHN0X2RldmljZS5jOjg4OiBJTkZPOiBGb3VuZCBmcmVlIGRldmljZSAwICcvZGV2L2xvb3AwJwo+
ICAgIGlvY3RsX2xvb3AwNS5jOjExNjogSU5GTzogL2Rldi9sb29wMCBkZWZhdWx0IGxvZ2ljYWxf
YmxvY2tfc2l6ZSBpcyA1MTIKPiAgICBpb2N0bF9sb29wMDUuYzo2MjogSU5GTzogV2l0aG91dCBz
ZXR0aW5nIGxvX29mZnNldCBvciBzaXplbGltaXQKPiAgICBpb2N0bF9sb29wMDUuYzo2MzogQlJP
SzogaW9jdGwoMyxMT09QX1NFVF9ESVJFQ1RfSU8sLi4uKSBmYWlsZWQ6IEVJTlZBTCAoMjIpCj4g
CkFmdGVyIGxvb2tpbmcga2VybmVsIGNvZGUsIEkgdGhpbmsgcmVtb3ZpbmcgQkxLU1NaR0VUIGlv
Y3RsIGlzIG9rLgpBbHNvIHNpbmNlIGtlcm5lbCBjb21taXQgODU1NjAxMTdkMDAgKCJsb29wOiBj
aGFuZ2UgcXVldWUgYmxvY2sgc2l6ZSB0byAKbWF0Y2ggd2hlbiB1c2luZyBESU8iKSwgaXQgd2ls
bCBjaGFuZ2UgbG9naWMgYmxvY2sgc2l6ZSBhdXRvbWF0aWNseSB3aGVuIApmZCBpcyBvcGVuZWQg
d2l0aCBPX0RJUkVDVC4gQ2FuIHdlIHVzZSBpdKOoanVzdCBhIHN1Z2dlc3Rpb26jqT8KPiBQZXIg
a2VybmVsIGNvbW1lbnQgYXQgX19sb29wX3VwZGF0ZV9kaW8oKSwgZGlyZWN0IGlvIGlzIHN1cHBv
cnRlZAo+IHdoZW4gImxvZ2ljYWwgYmxvY2sgc2l6ZSBvZiBsb29wIGlzIGJpZ2dlciB0aGFuIHRo
ZSBiYWNraW5nIGRldmljZSdzIi4KPiAKPiBTZXQgbG9vcCBibGtzaXplIHRvIG9uZSBvZiBiYWNr
aW5nIGRldmljZS4gUmV0cnkgaXMgdGhlcmUgdG8gYXZvaWQKPiBFQUdBSU4gd2FybmluZyAibG9v
cDAgKHRlc3QuaW1nKSBoYXMgc3RpbGwgZGlydHkgcGFnZXMiLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgo+IC0tLQo+ICAgLi4uL2tlcm5lbC9z
eXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYyAgICAgIHwgMjEgKysrKysrKysrKysrKysrKyst
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9v
cDA1LmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsX2xvb3AwNS5jCj4g
aW5kZXggNmM5ZWEyODAyOTgxLi5hOTY5OTc4MjM5YTUgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYwo+ICsrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1LmMKPiBAQCAtOTYsNiArOTYsOSBAQCBz
dGF0aWMgdm9pZCB2ZXJpZnlfaW9jdGxfbG9vcCh2b2lkKQo+ICAgCj4gICBzdGF0aWMgdm9pZCBz
ZXR1cCh2b2lkKQo+ICAgewo+ICsJaW50IGZkOwo+ICsJc3RydWN0IHN0YXQgYnVmOwo+ICsKPiAg
IAlpZiAodHN0X2ZzX3R5cGUoIi4iKSA9PSBUU1RfVE1QRlNfTUFHSUMpCj4gICAJCXRzdF9icmso
VENPTkYsICJ0bXBmZCBkb2Vzbid0IHN1cHBvcnQgT19ESVJFQ1QgZmxhZyIpOwo+ICAgCj4gQEAg
LTEwNSw2ICsxMDgsMTQgQEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKPiAgIAo+ICAgCXNwcmlu
dGYoc3lzX2xvb3BfZGlvcGF0aCwgIi9zeXMvYmxvY2svbG9vcCVkL2xvb3AvZGlvIiwgZGV2X251
bSk7Cj4gICAJdHN0X2ZpbGxfZmlsZSgidGVzdC5pbWciLCAwLCAxMDI0LCAxMDI0KTsKPiArCj4g
KwlmZCA9IFNBRkVfT1BFTigidGVzdC5pbWciLCBPX1JET05MWSk7Cj4gKwlTQUZFX0ZTVEFUKGZk
LCAmYnVmKTsKPiArCVNBRkVfQ0xPU0UoZmQpOwo+ICsKPiArCWxvZ2ljYWxfYmxvY2tfc2l6ZSA9
IGJ1Zi5zdF9ibGtzaXplOwo+ICsJdHN0X3JlcyhUSU5GTywgImJhY2tpbmcgZGV2IGxvZ2ljYWxf
YmxvY2tfc2l6ZSBpcyAlZCIsIGxvZ2ljYWxfYmxvY2tfc2l6ZSk7Cj4gKwo+ICAgCXRzdF9hdHRh
Y2hfZGV2aWNlKGRldl9wYXRoLCAidGVzdC5pbWciKTsKPiAgIAlhdHRhY2hfZmxhZyA9IDE7Cj4g
ICAJZGV2X2ZkID0gU0FGRV9PUEVOKGRldl9wYXRoLCBPX1JEV1IpOwo+IEBAIC0xMTIsOCArMTIz
LDE0IEBAIHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gICAJaWYgKGlvY3RsKGRldl9mZCwgTE9P
UF9TRVRfRElSRUNUX0lPLCAwKSAmJiBlcnJubyA9PSBFSU5WQUwpCj4gICAJCXRzdF9icmsoVENP
TkYsICJMT09QX1NFVF9ESVJFQ1RfSU8gaXMgbm90IHN1cHBvcnRlZCIpOwo+ICAgCj4gLQlTQUZF
X0lPQ1RMKGRldl9mZCwgQkxLU1NaR0VULCAmbG9naWNhbF9ibG9ja19zaXplKTsKPiAtCXRzdF9y
ZXMoVElORk8sICIlcyBkZWZhdWx0IGxvZ2ljYWxfYmxvY2tfc2l6ZSBpcyAlZCIsIGRldl9wYXRo
LCBsb2dpY2FsX2Jsb2NrX3NpemUpOwo+ICsJLyoKPiArCSAqIGZyb20gX19sb29wX3VwZGF0ZV9k
aW8oKToKPiArCSAqICAgV2Ugc3VwcG9ydCBkaXJlY3QgSS9PIG9ubHkgaWYgbG9fb2Zmc2V0IGlz
IGFsaWduZWQgd2l0aCB0aGUKPiArCSAqICAgbG9naWNhbCBJL08gc2l6ZSBvZiBiYWNraW5nIGRl
dmljZSwgYW5kIHRoZSBsb2dpY2FsIGJsb2NrCj4gKwkgKiAgIHNpemUgb2YgbG9vcCBpcyBiaWdn
ZXIgdGhhbiB0aGUgYmFja2luZyBkZXZpY2UncyBhbmQgdGhlIGxvb3AKPiArCSAqICAgbmVlZG4n
dCB0cmFuc2Zvcm0gdHJhbnNmZXIuCj4gKwkgKi8KPiArCVRTVF9SRVRSWV9GVU5DKGlvY3RsKGRl
dl9mZCwgTE9PUF9TRVRfQkxPQ0tfU0laRSwgbG9naWNhbF9ibG9ja19zaXplKSwgVFNUX1JFVFZB
TF9FUTApOwpMT09QX1NFVF9ESVJFQ1RfSU8gd2FzIGludHJvZHVjZSBzaW5jZSA0LjEwIGFuZCAg
TE9PUF9TRVRfQkxPQ0tfU0laRSAKaW9jdGwgd2FzIGludHJvZHVjZWQgc2luY2Uga2VybmVsIDQu
MTQsIEkgZ3Vlc3Mgd2Ugc2hvdWxkIGFkZCBhIGNoZWNrIApmb3IgTE9PUF9TRVRfQkxPQ0tfU0la
RSBpbiBoZXJlLgoKQmVzdCBSZWdhcmRzCllhbmcgWHUKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZv
aWQgY2xlYW51cCh2b2lkKQo+IAoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
