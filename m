Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1D6D87B
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 03:39:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2AFB3C1D11
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 03:39:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 523C83C1448
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 03:39:43 +0200 (CEST)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E0D6614002B5
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 03:39:08 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6J1d29Q020165
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Thu, 18 Jul 2019 18:39:03 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Thu, 18 Jul 2019 18:39:01 -0700
To: <ltp@lists.linux.it>, <chrubis@suse.cz>
References: <1540348607-217391-1-git-send-email-hongzhi.song@windriver.com>
 <da19c43f-39f7-81b4-7173-18fdec6ea1d9@windriver.com>
 <4ebbc29e-d46a-5954-2c2f-903126a48ab7@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <489ad5d1-649b-b775-4bff-f7d27aeed248@windriver.com>
Date: Fri, 19 Jul 2019 09:38:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4ebbc29e-d46a-5954-2c2f-903126a48ab7@windriver.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite/mmap24-2: Support mips
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

cGluZy4KClRoZXJlIGFyZSBzb21lIGRpc2N1c3Npb24gZm9yIHBhdGNoLXYxIDogCmh0dHBzOi8v
bGlzdHMubGludXguaXQvcGlwZXJtYWlsL2x0cC8yMDE4LU9jdG9iZXIvMDA5NjI0Lmh0bWwKClRo
YW5rcwoKLS1Ib25nemhpCgoKT24gMTEvNS8xOCA5OjE1IEFNLCBIb25nemhpLCBTb25nIHdyb3Rl
Ogo+IEtpbmRseSBwaW5nCj4KPiAtLUhvbmd6aGkKPgo+Cj4gT24gMTEvMDEvMjAxOCAwOTo0OSBB
TSwgSG9uZ3poaSwgU29uZyB3cm90ZToKPj4gSGkgZ3V5cywKPj4KPj4gUmVmZXJyaW5nIHRvIFBP
U0lYIHNwZWMsIHRoZSByZXR1cm4gdmFsdWVzLCBFSU5WQUwgYW5kIEVOT01FTSwKPj4KPj4gYXJl
IGFsbCByaWdodCBpZiBNQVBfRklYRUQgaXMgc2V0LiBTbyBJIHRoaW5rIE1pcHMgYWxzbyBrZWVw
IHRvIFBPU0lYLgo+Pgo+Pgo+PiBQbGVhc2UgcmV2aWV3IHRoaXMgcGF0Y2guCj4+Cj4+Cj4+IC0t
SG9uZ3poaQo+Pgo+Pgo+PiBPbiAxMC8yNC8yMDE4IDEwOjM2IEFNLCBIb25nemhpLlNvbmcgd3Jv
dGU6Cj4+PiBNaXBzIHdpbGwgcmV0dXJuIEVJTlZBTCBpbnN0ZWFkIG9mIEVOT01FTSBhcyBleHBl
Y3RlZAo+Pj4gaWYgTUFQX0ZJWEVEIGlzIHNldCBhbmQgdGhlIHJhbmdlIG9mIFthZGRyICsgbGVu
KSBleGNlZWRzCj4+PiBUQVNLX1NJWkUuCj4+Pgo+Pj4gTGludXgga2VybmVsIGNvZGU6IGFyY2gv
bWlwcy9tbS9tbWFwLmMKPj4+IGlmIChmbGFncyAmIE1BUF9GSVhFRCkgewo+Pj4gwqDCoMKgwqAg
LyogRXZlbiBNQVBfRklYRUQgbWFwcGluZ3MgbXVzdCByZXNpZGUgd2l0aGluIFRBU0tfU0laRSAq
Lwo+Pj4gwqDCoMKgwqAgaWYgKFRBU0tfU0laRSAtIGxlbiA8IGFkZHIpCj4+PiDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4KPj4+IFRoZSBQT1NJWCBzcGVjaWZpY2F0aW9uIHNh
eXM6Cj4+PiAiSWYgTUFQX0ZJWEVEIGlzIHNldCwgbW1hcCgpIG1heSByZXR1cm4gTUFQX0ZBSUxF
RCBhbmQgc2V0IGVycm5vIHRvCj4+PiBbRUlOVkFMXS4iCj4+PiBbaHR0cDovL3B1YnMub3Blbmdy
b3VwLm9yZy9vbmxpbmVwdWJzLzk2OTk5MTk3OTkvZnVuY3Rpb25zL21tYXAuaHRtbF0KPj4+Cj4+
PiBTbyBJIHRoaW5rIHRoZSBtaXBzIGtlcm5lbCByZW1haW5zIFBPU0lYIGNvbXBsaWFudC4KPj4+
Cj4+PiBSZWxheCB0aGUgY29uZGl0aW9uIGFuZCBhY2NlcHQgYm90aCBFTk9NRU0gYW5kIEVJTlZB
TAo+Pj4gYXMgZXhwZWN0ZWQgb3V0Y29tZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBIb25nemhp
LlNvbmcgPGhvbmd6aGkuc29uZ0B3aW5kcml2ZXIuY29tPgo+Pj4gLS0tCj4+PiDCoCAuLi4vb3Bl
bl9wb3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNlcy9tbWFwLzI0LTIuYyB8IDEw
IAo+Pj4gKysrKystLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IAo+Pj4gYS90ZXN0Y2FzZXMvb3Blbl9w
b3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNlcy9tbWFwLzI0LTIuYyAKPj4+IGIv
dGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2NvbmZvcm1hbmNlL2ludGVyZmFjZXMvbW1h
cC8yNC0yLmMKPj4+IGluZGV4IGRlNTFkNDMuLjgxMGU1YzggMTAwNjQ0Cj4+PiAtLS0gYS90ZXN0
Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNlcy9tbWFwLzI0
LTIuYwo+Pj4gKysrIGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2NvbmZvcm1hbmNl
L2ludGVyZmFjZXMvbW1hcC8yNC0yLmMKPj4+IEBAIC03LDcgKzcsNyBAQAo+Pj4gwqDCoCAqIHNv
dXJjZSB0cmVlLgo+Pj4gwqDCoCAqCj4+PiDCoMKgICogVGhlIG1tYXAoKSBmdW5jdGlvbiBzaGFs
bCBmYWlsIGlmOgo+Pj4gLSAqIFtFTk9NRU1dIE1BUF9GSVhFRCB3YXMgc3BlY2lmaWVkLAo+Pj4g
KyAqIFtFTk9NRU0gb3IgRUlOVkFMXSBNQVBfRklYRUQgd2FzIHNwZWNpZmllZCwKPj4+IMKgwqAg
KiBhbmQgdGhlIHJhbmdlIFthZGRyLGFkZHIrbGVuKSBleGNlZWRzIHRoYXQgYWxsb3dlZAo+Pj4g
wqDCoCAqIGZvciB0aGUgYWRkcmVzcyBzcGFjZSBvZiBhIHByb2Nlc3M7IG9yLCBpZiBNQVBfRklY
RUQgd2FzIG5vdCAKPj4+IHNwZWNpZmllZCBhbmQKPj4+IMKgwqAgKiB0aGVyZSBpcyBpbnN1ZmZp
Y2llbnQgcm9vbSBpbiB0aGUgYWRkcmVzcyBzcGFjZSB0byBlZmZlY3QgdGhlIAo+Pj4gbWFwcGlu
Zy4KPj4+IEBAIC0xNSw3ICsxNSw3IEBACj4+PiDCoMKgICogVGVzdCBTdGVwOgo+Pj4gwqDCoCAq
IDEuIE1hcCBhIHNoYXJlZCBtZW1vcnkgb2JqZWN0LCB3aXRoIHNpemUgZXhjZWVkaW5nIHRoZSB2
YWx1ZSAKPj4+IGdldCBmcm9tCj4+PiDCoMKgICrCoMKgwqAgcmxpbV9jdXIgb2YgcmVzb3VyY2Ug
UkxJTUlUX0FTLCBzZXR0aW5nIE1BUF9GSVhFRDsKPj4+IC0gKiAzLiBTaG91bGQgZ2V0IEVOT01F
TS4KPj4+ICsgKiAzLiBTaG91bGQgZ2V0IEVOT01FTSBvciBFSU5WQUwuCj4+PiDCoMKgICovCj4+
PiDCoCDCoCAjZGVmaW5lIF9YT1BFTl9TT1VSQ0UgNjAwCj4+PiBAQCAtOTMsOCArOTMsOCBAQCBp
bnQgbWFpbih2b2lkKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh1bnNpZ25lZCBsb25n
KWxlbik7Cj4+PiDCoMKgwqDCoMKgIHBhID0gbW1hcChhZGRyLCBsZW4sIFBST1RfUkVBRCB8IFBS
T1RfV1JJVEUsIE1BUF9GSVhFRCB8IAo+Pj4gTUFQX1NIQVJFRCwgZmQsCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDApOwo+Pj4gLcKgwqDCoCBpZiAocGEgPT0gTUFQX0ZBSUxFRCAmJiBlcnJu
byA9PSBFTk9NRU0pIHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBwcmludGYoIkdvdCBFTk9NRU06ICVz
XG5UZXN0IFBBU1NFRFxuIiwgc3RyZXJyb3IoZXJybm8pKTsKPj4+ICvCoMKgwqAgaWYgKHBhID09
IE1BUF9GQUlMRUQgJiYgKGVycm5vID09IEVOT01FTSB8fCBlcnJubyA9PSBFSU5WQUwpKSB7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJHb3QgRU5PTUVNIG9yIEVJTlZBTDogJXNcblRlc3Qg
UEFTU0VEXG4iLCAKPj4+IHN0cmVycm9yKGVycm5vKSk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
ZXhpdChQVFNfUEFTUyk7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgIEBAIC0xMDMsNiArMTAzLDYg
QEAgaW50IG1haW4odm9pZCkKPj4+IMKgwqDCoMKgwqAgZWxzZQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIG11bm1hcChwYSwgbGVuKTsKPj4+IMKgwqDCoMKgwqAgY2xvc2UoZmQpOwo+Pj4gLcKgwqDC
oCBwcmludGYoIlRlc3QgRmFpbDogRGlkIG5vdCBnZXQgRU5PTUVNIGFzIGV4cGVjdGVkXG4iKTsK
Pj4+ICvCoMKgwqAgcHJpbnRmKCJUZXN0IEZhaWxlZDogRGlkIG5vdCBnZXQgRU5PTUVNIG9yIEVJ
TlZBTCBhcyBleHBlY3RlZFxuIik7Cj4+PiDCoMKgwqDCoMKgIHJldHVybiBQVFNfRkFJTDsKPj4+
IMKgIH0KPj4KPj4KPgo+CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
