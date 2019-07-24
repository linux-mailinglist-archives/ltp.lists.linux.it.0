Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C97239A
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 03:22:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D38233C1CE4
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 03:22:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 60C2C3C183A
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 03:22:01 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 047EC1A0120C
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 03:21:57 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6O1LFdT008335
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Tue, 23 Jul 2019 18:21:32 -0700
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Tue, 23 Jul 2019 18:21:19 -0700
To: <ltp@lists.linux.it>, <chrubis@suse.cz>
References: <1540348607-217391-1-git-send-email-hongzhi.song@windriver.com>
 <da19c43f-39f7-81b4-7173-18fdec6ea1d9@windriver.com>
 <4ebbc29e-d46a-5954-2c2f-903126a48ab7@windriver.com>
 <489ad5d1-649b-b775-4bff-f7d27aeed248@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <13afe658-5746-8089-6861-9a9f0337c844@windriver.com>
Date: Wed, 24 Jul 2019 09:21:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <489ad5d1-649b-b775-4bff-f7d27aeed248@windriver.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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

cGluZwoKLS1Ib25nemhpCgoKT24gNy8xOS8xOSA5OjM4IEFNLCBIb25nemhpLCBTb25nIHdyb3Rl
Ogo+IHBpbmcuCj4KPiBUaGVyZSBhcmUgc29tZSBkaXNjdXNzaW9uIGZvciBwYXRjaC12MSA6IAo+
IGh0dHBzOi8vbGlzdHMubGludXguaXQvcGlwZXJtYWlsL2x0cC8yMDE4LU9jdG9iZXIvMDA5NjI0
Lmh0bWwKPgo+IFRoYW5rcwo+Cj4gLS1Ib25nemhpCj4KPgo+IE9uIDExLzUvMTggOToxNSBBTSwg
SG9uZ3poaSwgU29uZyB3cm90ZToKPj4gS2luZGx5IHBpbmcKPj4KPj4gLS1Ib25nemhpCj4+Cj4+
Cj4+IE9uIDExLzAxLzIwMTggMDk6NDkgQU0sIEhvbmd6aGksIFNvbmcgd3JvdGU6Cj4+PiBIaSBn
dXlzLAo+Pj4KPj4+IFJlZmVycmluZyB0byBQT1NJWCBzcGVjLCB0aGUgcmV0dXJuIHZhbHVlcywg
RUlOVkFMIGFuZCBFTk9NRU0sCj4+Pgo+Pj4gYXJlIGFsbCByaWdodCBpZiBNQVBfRklYRUQgaXMg
c2V0LiBTbyBJIHRoaW5rIE1pcHMgYWxzbyBrZWVwIHRvIFBPU0lYLgo+Pj4KPj4+Cj4+PiBQbGVh
c2UgcmV2aWV3IHRoaXMgcGF0Y2guCj4+Pgo+Pj4KPj4+IC0tSG9uZ3poaQo+Pj4KPj4+Cj4+PiBP
biAxMC8yNC8yMDE4IDEwOjM2IEFNLCBIb25nemhpLlNvbmcgd3JvdGU6Cj4+Pj4gTWlwcyB3aWxs
IHJldHVybiBFSU5WQUwgaW5zdGVhZCBvZiBFTk9NRU0gYXMgZXhwZWN0ZWQKPj4+PiBpZiBNQVBf
RklYRUQgaXMgc2V0IGFuZCB0aGUgcmFuZ2Ugb2YgW2FkZHIgKyBsZW4pIGV4Y2VlZHMKPj4+PiBU
QVNLX1NJWkUuCj4+Pj4KPj4+PiBMaW51eCBrZXJuZWwgY29kZTogYXJjaC9taXBzL21tL21tYXAu
Ywo+Pj4+IGlmIChmbGFncyAmIE1BUF9GSVhFRCkgewo+Pj4+IMKgwqDCoMKgIC8qIEV2ZW4gTUFQ
X0ZJWEVEIG1hcHBpbmdzIG11c3QgcmVzaWRlIHdpdGhpbiBUQVNLX1NJWkUgKi8KPj4+PiDCoMKg
wqDCoCBpZiAoVEFTS19TSVpFIC0gbGVuIDwgYWRkcikKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUlOVkFMOwo+Pj4+Cj4+Pj4gVGhlIFBPU0lYIHNwZWNpZmljYXRpb24gc2F5czoKPj4+
PiAiSWYgTUFQX0ZJWEVEIGlzIHNldCwgbW1hcCgpIG1heSByZXR1cm4gTUFQX0ZBSUxFRCBhbmQg
c2V0IGVycm5vIHRvCj4+Pj4gW0VJTlZBTF0uIgo+Pj4+IFtodHRwOi8vcHVicy5vcGVuZ3JvdXAu
b3JnL29ubGluZXB1YnMvOTY5OTkxOTc5OS9mdW5jdGlvbnMvbW1hcC5odG1sXQo+Pj4+Cj4+Pj4g
U28gSSB0aGluayB0aGUgbWlwcyBrZXJuZWwgcmVtYWlucyBQT1NJWCBjb21wbGlhbnQuCj4+Pj4K
Pj4+PiBSZWxheCB0aGUgY29uZGl0aW9uIGFuZCBhY2NlcHQgYm90aCBFTk9NRU0gYW5kIEVJTlZB
TAo+Pj4+IGFzIGV4cGVjdGVkIG91dGNvbWUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBIb25n
emhpLlNvbmcgPGhvbmd6aGkuc29uZ0B3aW5kcml2ZXIuY29tPgo+Pj4+IC0tLQo+Pj4+IC4uLi9v
cGVuX3Bvc2l4X3Rlc3RzdWl0ZS9jb25mb3JtYW5jZS9pbnRlcmZhY2VzL21tYXAvMjQtMi5jIHwg
MTAgCj4+Pj4gKysrKystLS0tLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IAo+Pj4+IGEvdGVzdGNhc2Vz
L29wZW5fcG9zaXhfdGVzdHN1aXRlL2NvbmZvcm1hbmNlL2ludGVyZmFjZXMvbW1hcC8yNC0yLmMg
Cj4+Pj4gYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJm
YWNlcy9tbWFwLzI0LTIuYwo+Pj4+IGluZGV4IGRlNTFkNDMuLjgxMGU1YzggMTAwNjQ0Cj4+Pj4g
LS0tIAo+Pj4+IGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2NvbmZvcm1hbmNlL2lu
dGVyZmFjZXMvbW1hcC8yNC0yLmMKPj4+PiArKysgCj4+Pj4gYi90ZXN0Y2FzZXMvb3Blbl9wb3Np
eF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNlcy9tbWFwLzI0LTIuYwo+Pj4+IEBAIC03
LDcgKzcsNyBAQAo+Pj4+IMKgwqAgKiBzb3VyY2UgdHJlZS4KPj4+PiDCoMKgICoKPj4+PiDCoMKg
ICogVGhlIG1tYXAoKSBmdW5jdGlvbiBzaGFsbCBmYWlsIGlmOgo+Pj4+IC0gKiBbRU5PTUVNXSBN
QVBfRklYRUQgd2FzIHNwZWNpZmllZCwKPj4+PiArICogW0VOT01FTSBvciBFSU5WQUxdIE1BUF9G
SVhFRCB3YXMgc3BlY2lmaWVkLAo+Pj4+IMKgwqAgKiBhbmQgdGhlIHJhbmdlIFthZGRyLGFkZHIr
bGVuKSBleGNlZWRzIHRoYXQgYWxsb3dlZAo+Pj4+IMKgwqAgKiBmb3IgdGhlIGFkZHJlc3Mgc3Bh
Y2Ugb2YgYSBwcm9jZXNzOyBvciwgaWYgTUFQX0ZJWEVEIHdhcyBub3QgCj4+Pj4gc3BlY2lmaWVk
IGFuZAo+Pj4+IMKgwqAgKiB0aGVyZSBpcyBpbnN1ZmZpY2llbnQgcm9vbSBpbiB0aGUgYWRkcmVz
cyBzcGFjZSB0byBlZmZlY3QgdGhlIAo+Pj4+IG1hcHBpbmcuCj4+Pj4gQEAgLTE1LDcgKzE1LDcg
QEAKPj4+PiDCoMKgICogVGVzdCBTdGVwOgo+Pj4+IMKgwqAgKiAxLiBNYXAgYSBzaGFyZWQgbWVt
b3J5IG9iamVjdCwgd2l0aCBzaXplIGV4Y2VlZGluZyB0aGUgdmFsdWUgCj4+Pj4gZ2V0IGZyb20K
Pj4+PiDCoMKgICrCoMKgwqAgcmxpbV9jdXIgb2YgcmVzb3VyY2UgUkxJTUlUX0FTLCBzZXR0aW5n
IE1BUF9GSVhFRDsKPj4+PiAtICogMy4gU2hvdWxkIGdldCBFTk9NRU0uCj4+Pj4gKyAqIDMuIFNo
b3VsZCBnZXQgRU5PTUVNIG9yIEVJTlZBTC4KPj4+PiDCoMKgICovCj4+Pj4gwqAgwqAgI2RlZmlu
ZSBfWE9QRU5fU09VUkNFIDYwMAo+Pj4+IEBAIC05Myw4ICs5Myw4IEBAIGludCBtYWluKHZvaWQp
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh1bnNpZ25lZCBsb25nKWxlbik7Cj4+Pj4g
wqDCoMKgwqDCoCBwYSA9IG1tYXAoYWRkciwgbGVuLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLCBN
QVBfRklYRUQgfCAKPj4+PiBNQVBfU0hBUkVELCBmZCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDApOwo+Pj4+IC3CoMKgwqAgaWYgKHBhID09IE1BUF9GQUlMRUQgJiYgZXJybm8gPT0gRU5P
TUVNKSB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHByaW50ZigiR290IEVOT01FTTogJXNcblRlc3Qg
UEFTU0VEXG4iLCBzdHJlcnJvcihlcnJubykpOwo+Pj4+ICvCoMKgwqAgaWYgKHBhID09IE1BUF9G
QUlMRUQgJiYgKGVycm5vID09IEVOT01FTSB8fCBlcnJubyA9PSBFSU5WQUwpKSB7Cj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHByaW50ZigiR290IEVOT01FTSBvciBFSU5WQUw6ICVzXG5UZXN0IFBBU1NF
RFxuIiwgCj4+Pj4gc3RyZXJyb3IoZXJybm8pKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZXhp
dChQVFNfUEFTUyk7Cj4+Pj4gwqDCoMKgwqDCoCB9Cj4+Pj4gwqAgQEAgLTEwMyw2ICsxMDMsNiBA
QCBpbnQgbWFpbih2b2lkKQo+Pj4+IMKgwqDCoMKgwqAgZWxzZQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBtdW5tYXAocGEsIGxlbik7Cj4+Pj4gwqDCoMKgwqDCoCBjbG9zZShmZCk7Cj4+Pj4gLcKg
wqDCoCBwcmludGYoIlRlc3QgRmFpbDogRGlkIG5vdCBnZXQgRU5PTUVNIGFzIGV4cGVjdGVkXG4i
KTsKPj4+PiArwqDCoMKgIHByaW50ZigiVGVzdCBGYWlsZWQ6IERpZCBub3QgZ2V0IEVOT01FTSBv
ciBFSU5WQUwgYXMgCj4+Pj4gZXhwZWN0ZWRcbiIpOwo+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIFBU
U19GQUlMOwo+Pj4+IMKgIH0KPj4+Cj4+Pgo+Pgo+Pgo+CgotLSAKTWFpbGluZyBsaXN0IGluZm86
IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
