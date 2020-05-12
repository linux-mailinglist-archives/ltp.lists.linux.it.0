Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 437541CEA32
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 03:42:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A89C13C55F3
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 03:42:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B6F133C1D31
 for <ltp@lists.linux.it>; Tue, 12 May 2020 03:42:01 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E626520091B
 for <ltp@lists.linux.it>; Tue, 12 May 2020 03:41:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,381,1583164800"; d="scan'208";a="91929993"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 May 2020 09:41:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 77FA04BCC89B
 for <ltp@lists.linux.it>; Tue, 12 May 2020 09:41:48 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 09:41:47 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1588918535-4682-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5EB51F9D.6080404@cn.fujitsu.com>
 <207ce727-a0a4-2c2a-19f7-87aef956ffb5@cn.fujitsu.com>
 <5EB904E5.8020109@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <74d96248-f1fd-1040-8ac9-a5fbe7600247@cn.fujitsu.com>
Date: Tue, 12 May 2020 09:41:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5EB904E5.8020109@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 77FA04BCC89B.A2B33
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Ensure do zero offset in
 kernel always
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

SGkgWGlhbwoKCj4gT24gMjAyMC81LzggMTc6MjMsIFlhbmcgWHUgd3JvdGU6Cj4+IEhpIFhpYW8K
Pj4KPj4KPj4+IE9uIDIwMjAvNS84IDE0OjE1LCBZYW5nIFh1IHdyb3RlOgo+Pj4+IEN1cnJlbnRs
eSwgd2UgdXNlIHJldHVybiBpbnN0ZWFkIG9mIHplcm9fb2Zmc2V0LiBJIGRlYnVnIHRoaXMgY29k
ZQo+Pj4+IChlYXJseSByZXR1cm4sIGV4dDQgZmlsZXN5c3RlbSlhcyBiZWxvdzoKPj4+PiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+PiBURVNUKGlvY3RsKGRldl9m
ZCwgTE9PUF9TRVRfRElSRUNUX0lPLCAxKSk7Cj4+Pj4gaWYgKFRTVF9SRVQgPT0gMCkgewo+Pj4+
IMKgwqDCoCB0c3RfcmVzKFRQQVNTLCAiTE9PUF9TRVRfRElSRUNUX0lPIHN1Y2NlZWRlZCB1bmV4
cGVjdGVkbHkiKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIFNBRkVfSU9DVEwoZGV2X2ZkLCBMT09Q
X1NFVF9ESVJFQ1RfSU8sIDApOwo+Pj4+IH0KPj4+PiByZXR1cm47Cj4+Pj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gdGhpcyBjYXNlIHdpbGwgYnJva2Ugd2hl
biB1c2luZyBpIHBhcmFtZXRlciwKPj4+PiBpb2N0bF9sb29wMDUuYzo2MjogQlJPSzogaW9jdGwo
MyxMT09QX1NFVF9ESVJFQ1RfSU8sLi4uKSBmYWlsZWQ6Cj4+Pj4gRUlOVkFMICgyMikKPiBIaSBY
dSwKPiAKPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCj4gCj4gV2l0aG91dCBtb2RpZnlpbmcg
Y29kZSwgd2UgY2FuIGFsc28gZmFsbCBpbnRvIHRoaXMgYnJhbmNoIGJ5IHJ1bm5pbmcgCj4gaW9j
dGxfbG9vcDA1IHVuZGVyIGJ0cmZzLCBzbyBjb3VsZCB3ZSBzaW1wbGUgdGhlIGRlc2NyaXB0aW9u
IG9mIGlzc3VlPwoibWFrZSBzdXJlIHplcm8gb2Zmc2V0IGluIGtlcm5lbCBhdCB0aGUgYmVnZ2lu
bmluZyBvZiB0aGUgdGVzdCB0byBhdm9pZCAKdW5rbm93biBlcnJvciB3aGVuIHVzaW5nIC1pIHBh
cmFtZXRlciIuIEhvdyBhYm91dCB0aGlzPwo+IAo+Pj4+Cj4+Pj4gSXQgc2VlbXMgdGhlIGxhc3Qg
dGVzdCBhZmZlY3RlZCB0aGlzIHRlc3QsIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIHVzZQo+Pj4+IGdv
dG8gaW5zdGVhZCBvZiByZXR1cm4uIEFsc28gaW5jbHVkaW5nIGEgdHlwbywgdXBkYXRhLT51cGRh
dGUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1PHh1eWFuZzIwMTguanlAY24uZnVq
aXRzdS5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0
bC9pb2N0bF9sb29wMDUuYyB8IDUgKysrLS0KPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1LmMKPj4+PiBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1LmMKPj4+PiBpbmRleCA2Y2Y3MDFmNDcu
LmExMDNhYWE5NCAxMDA2NDQKPj4+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lv
Y3RsL2lvY3RsX2xvb3AwNS5jCj4+Pj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9p
b2N0bC9pb2N0bF9sb29wMDUuYwo+Pj4+IEBAIC01LDcgKzUsNyBAQAo+Pj4+IMKgwqAgKgo+Pj4+
IMKgwqAgKiBUaGlzIGlzIGEgYmFzaWMgaW9jdGwgdGVzdCBhYm91dCBsb29wZGV2aWNlLgo+Pj4+
IMKgwqAgKgo+Pj4+IC0gKiBJdCBpcyBkZXNpZ25lZCB0byB0ZXN0IExPT1BfU0VUX0RJUkVDVF9J
TyBjYW4gdXBkYXRhIGEgbGl2ZQo+Pj4+ICsgKiBJdCBpcyBkZXNpZ25lZCB0byB0ZXN0IExPT1Bf
U0VUX0RJUkVDVF9JTyBjYW4gdXBkYXRlIGEgbGl2ZQo+Pj4gSGkgWHUsCj4+Pgo+Pj4gV2hhdCBk
b2VzIHRoZSBsaW5lIGNoYW5nZXM/Cj4+IGp1c3QgYSB0eXBvLCB1cGRhdGEtPnVwZGF0ZQo+IAo+
IFNvcnJ5IGZvciBtaXNzaW5nIHRoZSB0eXBvLgo+IAo+Pj4KPj4+PiDCoMKgICogbG9vcCBkZXZp
Y2UgZGlvIG1vZGUuIEl0IG5lZWRzIHRoZSBiYWNraW5nIGZpbGUgYWxzbyBzdXBwb3J0cwo+Pj4+
IMKgwqAgKiBkaW8gbW9kZSBhbmQgdGhlIGxvX29mZnNldCBpcyBhbGlnbmVkIHdpdGggdGhlIGxv
Z2ljYWwgYmxvY2sgc2l6ZS4KPj4+PiDCoMKgICoKPj4+PiBAQCAtODUsMTMgKzg1LDE0IEBAIHN0
YXRpYyB2b2lkIHZlcmlmeV9pb2N0bF9sb29wKHZvaWQpCj4+Pj4gwqDCoMKgwqDCoCBpZiAoVFNU
X1JFVCA9PSAwKSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVFBBU1MsICJMT09Q
X1NFVF9ESVJFQ1RfSU8gc3VjY2VlZGVkIik7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIFNBRkVf
SU9DVEwoZGV2X2ZkLCBMT09QX1NFVF9ESVJFQ1RfSU8sIDApOwo+Pj4+IC3CoMKgwqDCoMKgwqDC
oCByZXR1cm47Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gemVyb19vZmZzZXQ7Cj4+Pj4gwqDC
oMKgwqDCoCB9Cj4+Pj4gwqDCoMKgwqDCoCBpZiAoVFNUX0VSUiA9PSBFSU5WQUwpCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVFBBU1MgfCBUVEVSUk5PLCAiTE9PUF9TRVRfRElSRUNU
X0lPIGZhaWxlZCBhcwo+Pj4+IGV4cGVjdGVkIik7Cj4+Pj4gwqDCoMKgwqDCoCBlbHNlCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLCAiTE9PUF9TRVRfRElS
RUNUX0lPIGZhaWxlZAo+Pj4+IGV4cGVjdGVkIEVJTlZBTCBnb3QiKTsKPj4+Pgo+Pj4+ICt6ZXJv
X29mZnNldDoKPj4+PiDCoMKgwqDCoMKgIGxvb3BpbmZvLmxvX29mZnNldCA9IDA7Cj4+Pj4gwqDC
oMKgwqDCoCBUU1RfUkVUUllfRlVOQyhpb2N0bChkZXZfZmQsIExPT1BfU0VUX1NUQVRVUywmbG9v
cGluZm8pLAo+Pj4+IFRTVF9SRVRWQUxfRVEwKTsKPj4+Cj4+PiBZb3UgaGF2ZSBjbGVhcmVkIHRo
ZSBzdHJ1Y3QgbG9vcGluZm8gYXQgdGhlIGJlZ2lubmluZyBvZgo+Pj4gdmVyaWZ5X2lvY3RsX2xv
b3AoKSwgc28gY291bGQgd2UganVzdCBkcm9wIGxvb3BpbmZvLmxvX29mZnNldCA9IDAgYW5kCj4+
PiBtb3ZlICdUU1RfUkVUUllfRlVOQyhpb2N0bChkZXZfZmQsIExPT1BfU0VUX1NUQVRVUywmbG9v
cGluZm8pLAo+Pj4gVFNUX1JFVFZBTF9FUTApOycgdG8gdGhlIGJlZ2lubmluZz8KPj4gWWVzLiBJ
TU8sIGF0IHRoZSBiZWdpbm5pbmcgb3IgZW5kLCB0aGV5IGFsbCB3b3JrIHdlbGwuCj4gCj4gQWdy
ZWVkLCBidXQgaXQgc2VlbXMgc2ltcGxlciB0byBjbGVhciByZXNvdWNlIGF0IHRoZSBiZWdpbm5p
bmcgb2YgCj4gdmVyaWZ5X2lvY3RsX2xvb3AoKSwgbGlrZSB0aGlzOgo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1LmMgCj4gYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2lvY3RsL2lvY3RsX2xvb3AwNS5jCj4gaW5kZXggNmNmNzAxZjQ3Li42YzllYTI4MDIgMTAwNjQ0
Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bF9sb29wMDUuYwo+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGxfbG9vcDA1LmMKPiAu
Li4KPiBAQCAtNTcsNiArNTcsNyBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfaW9jdGxfbG9vcCh2b2lk
KQo+ICDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbG9vcF9pbmZvIGxvb3BpbmZvOwo+IAo+ICDCoMKg
wqDCoMKgwqDCoCBtZW1zZXQoJmxvb3BpbmZvLCAwLCBzaXplb2YobG9vcGluZm8pKTsKPiArwqDC
oMKgwqDCoMKgIFRTVF9SRVRSWV9GVU5DKGlvY3RsKGRldl9mZCwgTE9PUF9TRVRfU1RBVFVTLCAm
bG9vcGluZm8pLCAKPiBUU1RfUkVUVkFMX0VRMCk7Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIHRzdF9y
ZXMoVElORk8sICJXaXRob3V0IHNldHRpbmcgbG9fb2Zmc2V0IG9yIHNpemVsaW1pdCIpOwo+ICDC
oMKgwqDCoMKgwqDCoCBTQUZFX0lPQ1RMKGRldl9mZCwgTE9PUF9TRVRfRElSRUNUX0lPLCAxKTsK
PiBAQCAtOTEsOSArOTIsNiBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfaW9jdGxfbG9vcCh2b2lkKQo+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHN0X3JlcyhUUEFTUyB8IFRURVJSTk8s
ICJMT09QX1NFVF9ESVJFQ1RfSU8gZmFpbGVkIGFzIAo+IGV4cGVjdGVkIik7Cj4gIMKgwqDCoMKg
wqDCoMKgIGVsc2UKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRzdF9yZXMoVEZB
SUwgfCBUVEVSUk5PLCAiTE9PUF9TRVRfRElSRUNUX0lPIGZhaWxlZCAKPiBleHBlY3RlZCBFSU5W
QUwgZ290Iik7Cj4gLQo+IC3CoMKgwqDCoMKgwqAgbG9vcGluZm8ubG9fb2Zmc2V0ID0gMDsKPiAt
wqDCoMKgwqDCoMKgIFRTVF9SRVRSWV9GVU5DKGlvY3RsKGRldl9mZCwgTE9PUF9TRVRfU1RBVFVT
LCAmbG9vcGluZm8pLCAKPiBUU1RfUkVUVkFMX0VRMCk7Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KWWVzLgo+IAo+IEJlc3QgUmVnYXJkcywKPiBYaWFvIFlhbmcKPj4+Cj4+
PiBUaGFua3MsCj4+PiBYaWFvIFlhbmcKPj4+PiDCoCB9Cj4+Pgo+PiAuCj4+Cj4gCgoKCi0tIApN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
