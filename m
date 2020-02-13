Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624B15B6C8
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 02:43:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EAE53C23F2
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 02:43:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3E1223C144F
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 02:43:42 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 907FB1A007AE
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 02:43:40 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,434,1574092800"; d="scan'208";a="83231484"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Feb 2020 09:43:36 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id DB42F50A9975;
 Thu, 13 Feb 2020 09:34:01 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 13 Feb 2020 09:43:33 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1892366945.7197852.1581514327491.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <71c807c2-b77b-5081-76f8-335aaf1cbe3a@cn.fujitsu.com>
Date: Thu, 13 Feb 2020 09:43:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1892366945.7197852.1581514327491.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DB42F50A9975.AD93E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/kill11: add a check between hard limit
 and MIN_RLIMIT_CORE
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpvbiAyMDIwLzAyLzEyIDIxOjMyLCBKYW4gU3RhbmNlayB3cm90ZToKPiAKPiAKPiAtLS0tLSBP
cmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4+IEN1cnJlbnRseSwgcnVubmluZyB0aGlzIGNhc2Ugd2ls
bCByZXBvcnQgRUlOVkFMIGVycm9yIGlmIEkgcnVuICJ1bGltaXQgLWMKPj4gMTAyMyIgY29tbWFu
ZCBmaXJzdGx5LiBGcm9tIHNldHJsaW1pdCgyKW1hbnBhZ2UsIGl0IGdvdCBFSU5WQUwgZXJyb3Ig
YmVjYXVzZQo+PiBybGltLT5ybGltX2N1ciB3YXMgZ3JlYXRlciB0aGFuIHJsaW0tPnJsaW1fbWF4
LiBTbyBhZGQgYSBjaGVjayBmb3IgaXQgYmVmb3JlCj4+IHNldHJsaW1pdC4KPj4KPj4gUmVwb3J0
ZWQtYnk6IFBhbmthaiBWaW5hZHJhbyBKb3NoaSA8UGFua2FqLlZKQGV4YWxlYXBzZW1pLmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbT4K
Pj4gLS0tCj4+ICAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9raWxsL2tpbGwxMS5jIHwgMyAr
KysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2tpbGwva2lsbDExLmMKPj4gYi90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2tpbGwva2lsbDExLmMKPj4gaW5kZXggODNmYmE1YmViLi41ZjcwYjBh
MDcgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMva2lsbC9raWxsMTEu
Ywo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2tpbGwva2lsbDExLmMKPj4gQEAg
LTIwMSw2ICsyMDEsOSBAQCB2b2lkIHNldHVwKHZvaWQpCj4+ICAgCj4+ICAgCVNBRkVfR0VUUkxJ
TUlUKE5VTEwsIFJMSU1JVF9DT1JFLCAmcmxpbSk7Cj4+ICAgCj4+ICsJaWYgKHJsaW0ucmxpbV9t
YXggPCBNSU5fUkxJTUlUX0NPUkUpCj4+ICsJCXRzdF9icmttKFRDT05GLCBOVUxMLCAiaGFyZCBs
aW1pdCglbHUpbGVzcyB0aGFuIE1JTl9STElNVF9DT1JFKCVpKSIsCj4+ICsJCQkJcmxpbS5ybGlt
X21heCwgTUlOX1JMSU1JVF9DT1JFKTsKPiAKPiBUaGlzIGxvb2tzIE9LLCBidXQgY291bGQgd2Ug
YWxzbyByYWlzZSB0aGUgbGltaXQgd2hlbiBwb3NzaWJsZT8KPiAKT2YgY291cnNlLiBZb3VyIHdh
eSBpcyBtb3JlIHdpc2UuCkJ1dCBJIGFsc28gd2FudCB0byBjaGFuZ2UgdGhpcyBzaXplIG9mIE1J
Tl9STElNSVRfQ09SRS4KIEZyb20gdWxpbWl0IG1hbnBhZ2UsIEkga25vdyBpbiBwb3NpeCBtb2Rl
ICItYyIgdXNlZCA1MTItYnl0ZSBibG9jay4gSSAKZG91YnQgd2hldGhlciB3ZSBjYW4gY2hhbmdl
IE1JTl9STElNSVRfQ09SRSg1MTIgKjEwMjQpLCBzbyB0aGlzIGNhc2UKY2FuIGFsc28gcGFzcyBp
biB1bmJ1bnR1KGRlZmF1bHQgZW52aXJvbm1lbnQpLgpXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0
aGlz77yfCgpwczogSSB0ZXN0ZWQgaXQgb24gZWw3LGVsOCwgdGhleSBhbGwgcGFzcy4KCj4gCj4g
KyAgICAgICBpZiAocmxpbS5ybGltX21heCA8IE1JTl9STElNSVRfQ09SRSkgewo+ICsgICAgICAg
ICAgICAgICBpZiAoZ2V0ZXVpZCgpICE9IDApIHsKPiArICAgICAgICAgICAgICAgICAgICAgICB0
c3RfYnJrbShUQ09ORiwgTlVMTCwgImhhcmQgbGltaXQoJWx1KWxlc3MgdGhhbiBNSU5fUkxJTVRf
Q09SRSglaSkiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmxpbS5ybGltX21h
eCwgTUlOX1JMSU1JVF9DT1JFKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAg
ICB0c3RfcmVzbShUSU5GTywgIlJhaXNpbmcgcmxpbV9tYXggdG8gJWkiLCBNSU5fUkxJTUlUX0NP
UkUpOwo+ICsgICAgICAgICAgICAgICBybGltLnJsaW1fbWF4ID0gTUlOX1JMSU1JVF9DT1JFOwo+
ICsgICAgICAgfQo+IAo+IAo+IAoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
