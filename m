Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC6B24CAB2
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 04:22:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D68F03C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 04:22:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 77E793C13D8
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 04:22:52 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 876B31A004F6
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 04:22:51 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; d="scan'208";a="98366906"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 10:22:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id EF31248990D1;
 Fri, 21 Aug 2020 10:22:45 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 10:22:38 +0800
To: Li Wang <liwang@redhat.com>
References: <1597919168-10702-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1597919168-10702-2-git-send-email-zhufy.jy@cn.fujitsu.com>
 <CAEemH2eUd3yCuxt3iawHPXKUSryiJprud3HvneSr=JK_1wFhXg@mail.gmail.com>
 <43a404a1-dd4b-d091-5723-e756604fbbc8@cn.fujitsu.com>
 <CAEemH2fjgYGLD0+JozNcMqv3Eo0eAwK8+BKOCo0QZihUPiP6eg@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <ebb95886-a352-ab26-2d40-8a3e2e7fa62f@cn.fujitsu.com>
Date: Fri, 21 Aug 2020 10:21:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2fjgYGLD0+JozNcMqv3Eo0eAwK8+BKOCo0QZihUPiP6eg@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EF31248990D1.AF28D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] syscalls/kill03,
 04: Cleanup && Convert to new library
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

SGkgTGkKCgo+IAo+IAo+IE9uIEZyaSwgQXVnIDIxLCAyMDIwIGF0IDk6MTggQU0gWWFuZyBYdSA8
eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbSAKPiA8bWFpbHRvOnh1eWFuZzIwMTguanlAY24u
ZnVqaXRzdS5jb20+PiB3cm90ZToKPiAKPiAgICAgSGkgTGkKPiAKPiAKPiAgICAgID4KPiAgICAg
ID4gRmVpeXUgWmh1IDx6aHVmeS5qeUBjbi5mdWppdHN1LmNvbQo+ICAgICA8bWFpbHRvOnpodWZ5
Lmp5QGNuLmZ1aml0c3UuY29tPiA8bWFpbHRvOnpodWZ5Lmp5QGNuLmZ1aml0c3UuY29tCj4gICAg
IDxtYWlsdG86emh1ZnkuanlAY24uZnVqaXRzdS5jb20+Pj4gd3JvdGU6Cj4gICAgICA+Cj4gICAg
ICA+wqAgwqAgwqAuLi4KPiAgICAgID7CoCDCoCDCoCsjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gICAg
ICA+wqAgwqAgwqArI2luY2x1ZGUgInRzdF90ZXN0LmgiCj4gICAgICA+wqAgwqAgwqArCj4gICAg
ICA+wqAgwqAgwqArc3RhdGljIHBpZF90IHJlYWxfcGlkLCBmYWtlX3BpZCwgaW50X21pbl9waWQ7
Cj4gICAgICA+wqAgwqAgwqArc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKTsKPiAgICAgID7CoCDC
oCDCoCsKPiAgICAgID7CoCDCoCDCoCtzdGF0aWMgc3RydWN0IHRjYXNlIHsKPiAgICAgID7CoCDC
oCDCoCvCoCDCoCDCoCDCoGludCB0ZXN0X3NpZzsKPiAgICAgID7CoCDCoCDCoCvCoCDCoCDCoCDC
oGludCBleHBfZXJybm87Cj4gICAgICA+wqAgwqAgwqArwqAgwqAgwqAgwqBpbnQgY2hpbGRfZmxh
ZzsKPiAgICAgID4KPiAgICAgID4KPiAgICAgID4gVGhlIGNoaWxkX2ZsYWcgZmllbGQgaXMgbm90
IG5lY2Vzc2FyeSwgd2UgY291bGQgcHJlcGFyZSBhIHJlYWwKPiAgICAgY2hpbGQgaW4KPiAgICAg
ID4gc2V0dXAoKQo+ICAgICAgPiBhbmTCoHJlY2xhaW0gaXQgYWZ0ZXIgdGVzdGluZyB2aWEgY2hl
Y2sgdGhlIHJlYWxfcGlkIHZhbHVlLCB0aGF0Cj4gICAgIHdpbGwgYmUKPiAgICAgID4gbW9yZSBl
YXNpbHkuCj4gICAgIFdoZW4gSSByZXZpZXdlZCB0aGlzIHBhdGNoIGluIGludGVybmFsLCBJIGhh
ZCB0aGUgc2FtZSBpZGVhLiBCdXQgd2hlbiBJCj4gICAgIHRyeSBpdCBhbmQgdGhpcyBjYXNlIHdp
bGwgaGFuZyBiZWNhdXNlIHN1YiB0ZXN0IHdpbGwgd2FpdCBjaGlsZHJlbgo+ICAgICBmaW5pc2hl
ZCBieSB1c2luZyB0c3RfcmVhcF9jaGlsZHJlbnMgYmVsb3c6Cj4gCj4gICAgIGxpYi90c3RfdGVz
dC5jCj4gICAgIHN0YXRpYyB2b2lkIHJ1bl90ZXN0cyh2b2lkKQo+ICAgICB7Cj4gICAgICDCoCDC
oCDCoCDCoCAuLi4KPiAgICAgIMKgIMKgIMKgIMKgIMKgZm9yIChpID0gMDsgaSA8IHRzdF90ZXN0
LT50Y250OyBpKyspIHsKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2F2ZWRfcmVz
dWx0cyA9ICpyZXN1bHRzOwo+ICAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c3RfdGVz
dC0+dGVzdChpKTsKPiAKPiAgICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGdldHBp
ZCgpICE9IG1haW5fcGlkKSB7Cj4gICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGV4aXQoMCk7Cj4gICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0KPiAKPiAg
ICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHN0X3JlYXBfY2hpbGRyZW4oKTsKPiAKPiAg
ICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJlc3VsdHNfZXF1YWwoJnNhdmVkX3Jl
c3VsdHMsIHJlc3VsdHMpKQo+ICAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB0c3RfYnJrKFRCUk9LLCAiVGVzdCAlaSBoYXZlbid0IHJlcG9ydGVkCj4gICAgIHJlc3Vs
dHMhIiwgaSk7Cj4gICAgICDCoCDCoCDCoCDCoCDCoH0KPiAKPiAKPiAgICAgfQo+IAo+ICAgICBB
bHNvLCB3ZSBjYW4gdXNlIHRoZSBjdXJyZW50IHByb2Nlc3MgaWQgYnV0IGl0IG1heSBoYXMgdW5l
eHBlY3RlZAo+ICAgICByZXN1bHQKPiAgICAgd2hlbiBraWxsIHN1Y2NlZWQuIFNvIGZvcmsgYSBj
aGlsZCB0byB0ZXN0IG1heWJlIGEgYmV0dGVyIHNvbHV0aW9uLgo+IAo+IAo+IEhtbSwgc29ycnkg
Zm9yIHRoZSB1bmNsZWFyZWQgZGVzY3JpcHRpb24sIGFjdHVhbGx5IEkgbWVhbnQsIHRvIHVzZSBy
ZWFsX3BpZAo+IGluc3RlYWQgb2YgdGhlwqB0Yy0+Y2hpbGRfZmxhZyBkaXJlY3RseSwgdGhlbiBz
dGFydCB0byByZWNsYWltIHRoZSBjaGlsZCAKPiB3aGVuIHRoZQo+IHJlYWxfcGlkIHRlc3QgZmlu
aXNoaW5nLgo+IAo+IERvZXMgdGhpcyBiZWxvdyBkaWZmIHdvcmsgZm9yIHlvdT8KSXQgbG9va3Mg
d2VsbC4gQnV0IHRoZSByZWFsX3BpZCBvbmx5IHZhbGlkIHdoZW4gdGhlIGZpcnN0IHN1YiB0ZXN0
IGFuZCAKdGhlIHJlYWwgcGlkIGlzIGVxdWFscyB0byAwIHdoZW4gdXNpbmcgLWkgcGFyYW1ldGVy
cyBiZWNhdXNlIHdlIGhhdmUgCmtpbGxlZCB0aGlzIGNoaWxkcmVuLgoKRm9yIHBpZCA9IDAsIGl0
IG1lYW5zICB0aGVuIHNpZyBpcyBzZW50IHRvIGV2ZXJ5IHByb2Nlc3MgaW4gdGhlIHByb2Nlc3Mg
Cmdyb3VwIG9mIHRoZSBjYWxsaW5nIHByb2Nlc3MuICBTbyBpdCBsb29rcyBsaWtlIHdlIHRlc3Qg
ZGlmZmVyZW50IHRoaW5nIAp3aGVuIHVzaW5nIC1pIHBhcmFtZXRlcnMuICBXaGF0IGRvIHlvdSB0
aGluayBhYm91dCB0aGlzPwo+IAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMva2ls
bC9raWxsMDMuYwo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMva2lsbC9raWxsMDMu
Ywo+IEBAIC0yMSwyNCArMjEsMTcgQEAgc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKTsKPiAgwqBz
dGF0aWMgc3RydWN0IHRjYXNlIHsKPiAgwqAgwqAgwqAgwqAgaW50IHRlc3Rfc2lnOwo+ICDCoCDC
oCDCoCDCoCBpbnQgZXhwX2Vycm5vOwo+IC0gwqAgwqAgwqAgaW50IGNoaWxkX2ZsYWc7Cj4gIMKg
IMKgIMKgIMKgIHBpZF90ICpwaWQ7Cj4gIMKgfSB0Y2FzZXNbXSA9IHsKPiAtIMKgIMKgIMKgIHsy
MDAwLCBFSU5WQUwsIDEsICZyZWFsX3BpZH0sCj4gLSDCoCDCoCDCoCB7U0lHS0lMTCwgRVNSQ0gs
IDAsICZmYWtlX3BpZH0sCj4gLSDCoCDCoCDCoCB7U0lHS0lMTCwgRVNSQ0gsIDAsICZpbnRfbWlu
X3BpZH0KPiArIMKgIMKgIMKgIHsyMDAwLCBFSU5WQUwsICZyZWFsX3BpZH0sCj4gKyDCoCDCoCDC
oCB7U0lHS0lMTCwgRVNSQ0gsICZmYWtlX3BpZH0sCj4gKyDCoCDCoCDCoCB7U0lHS0lMTCwgRVNS
Q0gsICZpbnRfbWluX3BpZH0KPiAgwqB9Owo+IAo+ICDCoHN0YXRpYyB2b2lkIHZlcmlmeV9raWxs
KHVuc2lnbmVkIGludCBuKQo+ICDCoHsKPiAgwqAgwqAgwqAgwqAgc3RydWN0IHRjYXNlICp0YyA9
ICZ0Y2FzZXNbbl07Cj4gCj4gLSDCoCDCoCDCoCBpZiAodGMtPmNoaWxkX2ZsYWcpIHsKPiAtIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHJlYWxfcGlkID0gU0FGRV9GT1JLKCk7Cj4gLSDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBpZiAoIXJlYWxfcGlkKQo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcGF1c2UoKTsKPiAtIMKgIMKgIMKgIH0KPiAtCj4gIMKgIMKgIMKgIMKgIFRFU1Qoa2ls
bCgqdGMtPnBpZCwgdGMtPnRlc3Rfc2lnKSk7Cj4gIMKgIMKgIMKgIMKgIGlmIChUU1RfUkVUICE9
IC0xKSB7Cj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRzdF9yZXMoVEZBSUwsICJraWxsIHNo
b3VsZCBmYWlsIGJ1dCBub3QsIHJldHVybiAlbGQiLCAKPiBUU1RfUkVUKTsKPiBAQCAtNTEsMTQg
KzQ0LDE5IEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9raWxsKHVuc2lnbmVkIGludCBuKQo+ICDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB0c3RfcmVzKFRGQUlMIHwgVFRFUlJOTywgImtpbGwgZXhwZWN0
ZWQgJXMgYnV0IGdvdCIsCj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRz
dF9zdHJlcnJubyh0Yy0+ZXhwX2Vycm5vKSk7Cj4gCj4gLSDCoCDCoCDCoCBpZiAodGMtPmNoaWxk
X2ZsYWcpIHsKPiArIMKgIMKgIMKgIGlmIChyZWFsX3BpZCkgewo+ICDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBjbGVhbnVwKCk7Cj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlYWxfcGlkID0g
MDsKPiAgwqAgwqAgwqAgwqAgfQo+ICsKPiAgwqB9Cj4gCj4gIMKgc3RhdGljIHZvaWQgc2V0dXAo
dm9pZCkKPiAgwqB7Cj4gKyDCoCDCoCDCoCByZWFsX3BpZCA9IFNBRkVfRk9SSygpOwo+ICsgwqAg
wqAgwqAgaWYgKCFyZWFsX3BpZCkKPiArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBhdXNlKCk7Cj4g
Kwo+ICDCoCDCoCDCoCDCoCBmYWtlX3BpZCA9IHRzdF9nZXRfdW51c2VkX3BpZCgpOwo+ICDCoCDC
oCDCoCDCoCBpbnRfbWluX3BpZCA9IElOVF9NSU47Cj4gIMKgfQo+IC0tIAo+IFJlZ2FyZHMsCj4g
TGkgV2FuZwoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
