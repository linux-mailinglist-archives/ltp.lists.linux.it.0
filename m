Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 823331E774A
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 09:44:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 008243C3186
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 09:44:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3BB783C317C
 for <ltp@lists.linux.it>; Fri, 29 May 2020 09:43:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 88C66600E25
 for <ltp@lists.linux.it>; Fri, 29 May 2020 09:43:21 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; d="scan'208";a="93341896"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 May 2020 15:43:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 937914BCC885
 for <ltp@lists.linux.it>; Fri, 29 May 2020 15:43:47 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 15:43:48 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <1590730943-23463-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5ED0B958.2060901@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <a4ca8b5d-7774-da28-1e1c-d454207ecf24@cn.fujitsu.com>
Date: Fri, 29 May 2020 15:43:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <5ED0B958.2060901@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 937914BCC885.AE5E9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] LIB: Use INTERNAL_LIB for ltp lib
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

SGkgWGlhbwoKCj4gT24gMjAyMC81LzI5IDEzOjQyLCBZYW5nIFh1IHdyb3RlOgo+PiBVc2UgSU5U
RVJOQUxfTElCIGZvciBsdHAgbGliIGJlY2F1c2UgaW5zdGFsbGluZyB0aGVzZSBsdHAgc3RhdGlj
Cj4+IGxpYnJhcnkgaW4gYW55IHNpdHVhdGlvbiBpcyBtZWFuaW5nbGVzcy4KPj4KPj4gYWxsIHN0
YXRpYyBsaWJyYXJ5IGFzIGJlbG93Ogo+PiAuL2xpYnMvbGlibHRwdWlucHV0L2xpYmx0cHVpbnB1
dC5hCj4+IC4vbGlicy9saWJsdHBuZXdpcGMvbGlibHRwbmV3aXBjLmEKPj4gLi9saWJzL2xpYmx0
cG51bWEvbGlibHRwbnVtYS5hCj4+IC4vbGlicy9saWJsdHBpcGMvbGlibHRwaXBjLmEKPj4gLi9s
aWJzL2xpYmx0cGlwYy9saWJsdHBtc2djdGwuYQo+PiAuL3V0aWxzL3NjdHAvbGliL2xpYnNjdHAu
YQo+PiAuL3V0aWxzL3NjdHAvdGVzdGxpYi9saWJzY3RwdXRpbC5hCj4+IC4vbGliL2xpYmx0cC5h
Cj4+IC4vdGVzdGNhc2VzL25ldHdvcmsvcnBjL2Jhc2ljX3Rlc3RzL3JwYzAxL2xpYi9saWJycGMw
MS5hCj4+IC4vdGVzdGNhc2VzL25ldHdvcmsvcnBjL3JwYy10aXJwYy90ZXN0c19wYWNrL2xpYi9s
aWJycGMtdGlycGMuYQo+PiAuL3Rlc3RjYXNlcy9rZXJuZWwvY29udGFpbmVycy9saWJjbG9uZS9s
aWJjbG9uZS5hCj4+IC4vdGVzdGNhc2VzL2tlcm5lbC9tZW0vaHVnZXRsYi9saWIvbGliaHVnZXRs
Yi5hCj4+IC4vdGVzdGNhc2VzL2tlcm5lbC9tZW0vbGliL2xpYm1lbS5hCj4+IC4vdGVzdGNhc2Vz
L2tlcm5lbC9jb250cm9sbGVycy9saWJjb250cm9sbGVycy9saWJjb250cm9sbGVycy5hCj4+IC4v
dGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jcHVzZXQvY3B1c2V0X2xpYi9saWJjcHVfc2V0
LmEKPj4gLi90ZXN0Y2FzZXMva2VybmVsL2xpYi9saWJrZXJudGVzdC5hCj4+IC4vdGVzdGNhc2Vz
L2NvbW1hbmRzL25tL2RhdGFmaWxlcy9saWIuYQo+IEhpIFh1LAo+IAo+IDEpIFRoZSBsYXN0IG9u
ZShkYXRhZmlsZXMvbGliLmEpIHNlZW1zIHRvIGJlIHVzZWQgYnkgbm0gdGVzdCBhcyBhIGRhdGEu
Cj4gSSB0aGluayBpdCBpcyBub3QgaW5jbHVkZWQgdGhpcyBraW5kIG9mIGxpYnJhcnkgc28gc2hv
dWxkIHdlIHJlbW92ZSBpdCAKPiBpbiBjb21taXQgbWVzc2FnZT8KWWVzLiByZW1vdmUgdGhpcyBk
YXRhZmlsZS9saWIuYSBpbiBjb21taXQgbWVzc2FnZS4KPiAKPiAyKSBPbmUgcXVlc3Rpb246Cj4g
SXMgaXQgbmVjZXNzYXJ5IHRvIGtlZXAgbGliIGRpcmVjdG9yeShlLmcuIC9vcHQvbHRwL2xpYikg
aWYgd2UgYXZvaWQgCj4gaW5zdGFsbGluZyBhbGwgc3RhdGljIGxpYnJhcmllcz8KSU1PLCBsaWIg
aW5zdGFsbCBkaXJlY3RvcnkgaXMgdXNlbGVzcyBiZWNhdXNlIGx0cCBkb2Vzbid0IGhhdmUgb3du
IApkeW5hbWljIGxpYnJhcnkgYW5kIHdlIGNhbiByZW1vdmUgbGliIGluc3RhbGwgdGFyZ2V0IGlu
IE1ha2VmaWxlLgpJZiB5b3UgYWdyZWUgd2l0aCB0aGlzLCBJIHdpbGwgZG8gaXQgaW4gbXkgdjIg
cGF0Y2guCgpCZXN0IFJlZ2FyZHMKWWFuZyBYdQo+IAo+IFRoYW5rcywKPiBYaWFvIFlhbmcKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogWWFuZyBYdTx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+
PiAtLS0KPj4gwqAgbGliL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAy
ICstCj4+IMKgIGxpYnMvbGlibHRwaXBjL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgbGli
cy9saWJsdHBudW1hL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICstCj4+IMKgIGxpYnMvbGlibHRwdWlucHV0
L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgdGVzdGNhc2VzL2tlcm5lbC9jb250YWluZXJzL2xpYmNs
b25lL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICstCj4+IMKgIHRlc3RjYXNlcy9r
ZXJuZWwvY29udHJvbGxlcnMvY3B1c2V0L2NwdXNldF9saWIvTWFrZWZpbGUgfCAyICstCj4+IMKg
IHRlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbGliY29udHJvbGxlcnMvTWFrZWZpbGXCoMKg
wqAgfCAyICstCj4+IMKgIHRlc3RjYXNlcy9rZXJuZWwvbWVtL2h1Z2V0bGIvbGliL01ha2VmaWxl
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgdGVzdGNhc2VzL25ldHdv
cmsvcnBjL3JwYy10aXJwYy90ZXN0c19wYWNrL2xpYi9NYWtlZmlsZSB8IDIgKy0KPj4gwqAgdXRp
bHMvc2N0cC9saWIvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQo+PiDCoCB1dGlscy9zY3RwL3Rlc3Rs
aWIvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgMTEgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9saWIvTWFrZWZpbGUgYi9saWIv
TWFrZWZpbGUKPj4gaW5kZXggZTdmYzc1M2RhLi5mMDE5NDMyZTggMTAwNjQ0Cj4+IC0tLSBhL2xp
Yi9NYWtlZmlsZQo+PiArKysgYi9saWIvTWFrZWZpbGUKPj4gQEAgLTMyLDcgKzMyLDcgQEAgZWxz
ZQo+PiDCoCBGSUxURVJfT1VUX0xJQlNSQ1PCoMKgwqAgKz0gdGxpYmlvLmMgdHN0X3NhZmVfc3lz
dl9pcGMuYwo+PiDCoCBlbmRpZgo+Pgo+PiAtTElCwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6PSBs
aWJsdHAuYQo+PiArSU5URVJOQUxfTElCwqDCoMKgwqDCoMKgwqAgOj0gbGlibHRwLmEKPj4KPj4g
wqAgcGNfZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gJChERVNURElSKS8kKGRhdGFyb290
ZGlyKS9wa2djb25maWcvbHRwLnBjCj4+Cj4+IGRpZmYgLS1naXQgYS9saWJzL2xpYmx0cGlwYy9N
YWtlZmlsZSBiL2xpYnMvbGlibHRwaXBjL01ha2VmaWxlCj4+IGluZGV4IDExZjM4ZWEwYS4uZmFk
ZDA0ODMzIDEwMDY0NAo+PiAtLS0gYS9saWJzL2xpYmx0cGlwYy9NYWtlZmlsZQo+PiArKysgYi9s
aWJzL2xpYmx0cGlwYy9NYWtlZmlsZQo+PiBAQCAtNSw3ICs1LDcgQEAgdG9wX3NyY2RpcsKgwqDC
oMKgwqDCoMKgID89IC4uLy4uCj4+Cj4+IMKgIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRl
L21rL2Vudl9wcmUubWsKPj4KPj4gLUxJQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gbGlibHRw
aXBjLmEgbGlibHRwbXNnY3RsLmEKPj4gK0lOVEVSTkFMX0xJQsKgwqDCoMKgwqDCoMKgIDo9IGxp
Ymx0cGlwYy5hIGxpYmx0cG1zZ2N0bC5hCj4+Cj4+IMKgIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9p
bmNsdWRlL21rL2xpYi5tawo+PiDCoCBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9n
ZW5lcmljX2xlYWZfdGFyZ2V0Lm1rCj4+IGRpZmYgLS1naXQgYS9saWJzL2xpYmx0cG51bWEvTWFr
ZWZpbGUgYi9saWJzL2xpYmx0cG51bWEvTWFrZWZpbGUKPj4gaW5kZXggNTZkNmI3NzYyLi5hNjg1
Njc1OGQgMTAwNjQ0Cj4+IC0tLSBhL2xpYnMvbGlibHRwbnVtYS9NYWtlZmlsZQo+PiArKysgYi9s
aWJzL2xpYmx0cG51bWEvTWFrZWZpbGUKPj4gQEAgLTYsNyArNiw3IEBAIHRvcF9zcmNkaXLCoMKg
wqDCoMKgwqDCoCA/PSAuLi8uLgo+Pgo+PiDCoCBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVk
ZS9tay9lbnZfcHJlLm1rCj4+Cj4+IC1MSULCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDo9IGxpYmx0
cG51bWEuYQo+PiArSU5URVJOQUxfTElCwqDCoMKgwqDCoMKgwqAgOj0gbGlibHRwbnVtYS5hCj4+
Cj4+IMKgIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL2xpYi5tawo+PiDCoCBpbmNs
dWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1rCj4+IGRp
ZmYgLS1naXQgYS9saWJzL2xpYmx0cHVpbnB1dC9NYWtlZmlsZSBiL2xpYnMvbGlibHRwdWlucHV0
L01ha2VmaWxlCj4+IGluZGV4IGRkMmE2YzA5Ni4uYzcyZGQyZTFlIDEwMDY0NAo+PiAtLS0gYS9s
aWJzL2xpYmx0cHVpbnB1dC9NYWtlZmlsZQo+PiArKysgYi9saWJzL2xpYmx0cHVpbnB1dC9NYWtl
ZmlsZQo+PiBAQCAtNiw3ICs2LDcgQEAgdG9wX3NyY2RpcsKgwqDCoMKgwqDCoMKgID89IC4uLy4u
Cj4+Cj4+IMKgIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL2Vudl9wcmUubWsKPj4K
Pj4gLUxJQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gbGlibHRwdWlucHV0LmEKPj4gK0lOVEVS
TkFMX0xJQsKgwqDCoMKgwqDCoMKgIDo9IGxpYmx0cHVpbnB1dC5hCj4+Cj4+IMKgIGluY2x1ZGUg
JCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL2xpYi5tawo+PiDCoCBpbmNsdWRlICQodG9wX3NyY2Rp
cikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1rCj4+IGRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL2NvbnRhaW5lcnMvbGliY2xvbmUvTWFrZWZpbGUgCj4+IGIvdGVzdGNhc2Vz
L2tlcm5lbC9jb250YWluZXJzL2xpYmNsb25lL01ha2VmaWxlCj4+IGluZGV4IGQ3ODU3MGRiNy4u
MTNhZjUyYjY3IDEwMDY0NAo+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRhaW5lcnMvbGli
Y2xvbmUvTWFrZWZpbGUKPj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250YWluZXJzL2xpYmNs
b25lL01ha2VmaWxlCj4+IEBAIC0yMiw2ICsyMiw2IEBAIHRvcF9zcmNkaXLCoMKgwqDCoMKgwqDC
oCA/PSAuLi8uLi8uLi8uLgo+Pgo+PiDCoCBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9t
ay90ZXN0Y2FzZXMubWsKPj4KPj4gLUxJQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gbGliY2xv
bmUuYQo+PiArSU5URVJOQUxfTElCwqDCoMKgwqDCoMKgwqAgOj0gbGliY2xvbmUuYQo+Pgo+PiDC
oCBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9saWIubWsKPj4gZGlmZiAtLWdpdCBh
L3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY3B1c2V0L2NwdXNldF9saWIvTWFrZWZpbGUg
Cj4+IGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jcHVzZXQvY3B1c2V0X2xpYi9NYWtl
ZmlsZQo+PiBpbmRleCAwNjllYmMzOGMuLjFiNmE0MGJlYSAxMDA2NDQKPj4gLS0tIGEvdGVzdGNh
c2VzL2tlcm5lbC9jb250cm9sbGVycy9jcHVzZXQvY3B1c2V0X2xpYi9NYWtlZmlsZQo+PiArKysg
Yi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2NwdXNldC9jcHVzZXRfbGliL01ha2VmaWxl
Cj4+IEBAIC0yNyw2ICsyNyw2IEBAIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL3Rl
c3RjYXNlcy5tawo+Pgo+PiDCoCBMRExJQlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDo9IC1sbSAt
bGNvbnRyb2xsZXJzIC1sbHRwICQoTERMSUJTKQo+Pgo+PiAtTElCwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA6PSBsaWJjcHVfc2V0LmEKPj4gK0lOVEVSTkFMX0xJQsKgwqDCoMKgwqDCoMKgIDo9IGxp
YmNwdV9zZXQuYQo+Pgo+PiDCoCBpbmNsdWRlwqDCoMKgICQodG9wX3NyY2RpcikvaW5jbHVkZS9t
ay9saWIubWsKPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbGli
Y29udHJvbGxlcnMvTWFrZWZpbGUgCj4+IGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9s
aWJjb250cm9sbGVycy9NYWtlZmlsZQo+PiBpbmRleCA4ODkxOGNmMmQuLjlmODk1NWUyOCAxMDA2
NDQKPj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9saWJjb250cm9sbGVycy9N
YWtlZmlsZQo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2xpYmNvbnRyb2xs
ZXJzL01ha2VmaWxlCj4+IEBAIC0yNCw2ICsyNCw2IEBAIHRvcF9zcmNkaXLCoMKgwqDCoMKgwqDC
oCA/PSAuLi8uLi8uLi8uLgo+Pgo+PiDCoCBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9t
ay90ZXN0Y2FzZXMubWsKPj4KPj4gLUxJQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gbGliY29u
dHJvbGxlcnMuYQo+PiArSU5URVJOQUxfTElCwqDCoMKgwqDCoMKgwqAgOj0gbGliY29udHJvbGxl
cnMuYQo+Pgo+PiDCoCBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9saWIubWsKPj4g
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL2h1Z2V0bGIvbGliL01ha2VmaWxlIAo+
PiBiL3Rlc3RjYXNlcy9rZXJuZWwvbWVtL2h1Z2V0bGIvbGliL01ha2VmaWxlCj4+IGluZGV4IGM1
YzU1NjQ4Zi4uMmU4OTM0MjlkIDEwMDY0NAo+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL21lbS9o
dWdldGxiL2xpYi9NYWtlZmlsZQo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL21lbS9odWdldGxi
L2xpYi9NYWtlZmlsZQo+PiBAQCAtMjEsNiArMjEsNiBAQCB0b3Bfc3JjZGlywqDCoMKgwqDCoMKg
wqAgPz0gLi4vLi4vLi4vLi4vLi4KPj4gwqAgaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUv
bWsvZW52X3ByZS5tawo+PiDCoCBpbmNsdWRlICQodG9wX3NyY2RpcikvdGVzdGNhc2VzL2tlcm5l
bC9tZW0vaW5jbHVkZS9saWJtZW0ubWsKPj4KPj4gLUxJQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Oj0gbGliaHVnZXRsYi5hCj4+ICtJTlRFUk5BTF9MSULCoMKgwqDCoMKgwqDCoCA6PSBsaWJodWdl
dGxiLmEKPj4KPj4gwqAgaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvbGliLm1rCj4+
IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMvbmV0d29yay9ycGMvcnBjLXRpcnBjL3Rlc3RzX3BhY2sv
bGliL01ha2VmaWxlIAo+PiBiL3Rlc3RjYXNlcy9uZXR3b3JrL3JwYy9ycGMtdGlycGMvdGVzdHNf
cGFjay9saWIvTWFrZWZpbGUKPj4gaW5kZXggMzU2M2QyZGM1Li41YTZmNWQ0MWMgMTAwNjQ0Cj4+
IC0tLSBhL3Rlc3RjYXNlcy9uZXR3b3JrL3JwYy9ycGMtdGlycGMvdGVzdHNfcGFjay9saWIvTWFr
ZWZpbGUKPj4gKysrIGIvdGVzdGNhc2VzL25ldHdvcmsvcnBjL3JwYy10aXJwYy90ZXN0c19wYWNr
L2xpYi9NYWtlZmlsZQo+PiBAQCAtMjAsNiArMjAsNiBAQCB0b3Bfc3JjZGlywqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgID89IC4uLy4uLy4uLy4uLy4uLy4uCj4+Cj4+IMKgIGluY2x1ZGXCoMKgwqDC
oMKgwqDCoCAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvZW52X3ByZS5tawo+Pgo+PiAtTElCwqDC
oMKgIDo9IGxpYnJwYy10aXJwYy5hCj4+ICtJTlRFUk5BTF9MSULCoMKgwqAgOj0gbGlicnBjLXRp
cnBjLmEKPj4KPj4gwqAgaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvbGliLm1rCj4+
IGRpZmYgLS1naXQgYS91dGlscy9zY3RwL2xpYi9NYWtlZmlsZSBiL3V0aWxzL3NjdHAvbGliL01h
a2VmaWxlCj4+IGluZGV4IGMwY2IzNWI0ZS4uNTQ0MzhiNjFjIDEwMDY0NAo+PiAtLS0gYS91dGls
cy9zY3RwL2xpYi9NYWtlZmlsZQo+PiArKysgYi91dGlscy9zY3RwL2xpYi9NYWtlZmlsZQo+PiBA
QCAtMjYsNiArMjYsNiBAQCBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9lbnZfcHJl
Lm1rCj4+Cj4+IMKgIENQUEZMQUdTwqDCoMKgwqDCoMKgwqAgKz0gLUkkKGFic19zcmNkaXIpLy4u
L2luY2x1ZGUKPj4KPj4gLUxJQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOj0gbGlic2N0cC5hCj4+
ICtJTlRFUk5BTF9MSULCoMKgwqDCoMKgwqDCoCA6PSBsaWJzY3RwLmEKPj4KPj4gwqAgaW5jbHVk
ZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUvbWsvbGliLm1rCj4+IGRpZmYgLS1naXQgYS91dGlscy9z
Y3RwL3Rlc3RsaWIvTWFrZWZpbGUgYi91dGlscy9zY3RwL3Rlc3RsaWIvTWFrZWZpbGUKPj4gaW5k
ZXggMjk3N2Y0NWIzLi44NGVkMDIwNDAgMTAwNjQ0Cj4+IC0tLSBhL3V0aWxzL3NjdHAvdGVzdGxp
Yi9NYWtlZmlsZQo+PiArKysgYi91dGlscy9zY3RwL3Rlc3RsaWIvTWFrZWZpbGUKPj4gQEAgLTI4
LDcgKzI4LDcgQEAgQ1BQRkxBR1PCoMKgwqDCoMKgwqDCoCArPSAtRExUUCAtSSQoYWJzX3NyY2Rp
cikvLi4vaW5jbHVkZQo+Pgo+PiDCoCBMRExJQlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IC1s
bHRwIC1sc2N0cAo+Pgo+PiAtTElCwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6PSBsaWJzY3RwdXRp
bC5hCj4+ICtJTlRFUk5BTF9MSULCoMKgwqDCoMKgwqDCoCA6PSBsaWJzY3RwdXRpbC5hCj4+Cj4+
IMKgICMKPj4gwqAgI0RFUExJQkRJUsKgwqDCoMKgwqDCoMKgIDo9IC4uL2xpYgo+IAoKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
