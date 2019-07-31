Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BC17B7F5
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 04:13:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8D303C1D0D
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 04:13:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 557363C1C90
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 04:13:13 +0200 (CEST)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 436C61001385
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 04:13:04 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6V2D4vY006089
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Tue, 30 Jul 2019 19:13:04 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Tue, 30 Jul 2019 19:13:04 -0700
To: <linux-btrfs@vger.kernel.org>, <josef@toxicpanda.com>
References: <b501bcff-8be0-4303-8789-363fda4658e5@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <cc01d19f-4955-c0b9-a5be-356ea10de59c@windriver.com>
Date: Wed, 31 Jul 2019 10:13:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b501bcff-8be0-4303-8789-363fda4658e5@windriver.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: Btrfs can't allocate space for delete when
 block size arounds 512M
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
Cc: dsterba@suse.com, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpBbnlvbmUgbm90aWNlIHRoaXM/CgotLUhvbmd6aGkKCgpPbiA3LzE3LzE5IDQ6MzQgUE0s
IEhvbmd6aGksIFNvbmcgd3JvdGU6Cj4gSGkgZnJpZW5kcywKPgo+ICpEZXNjcmlwdGlvbjoqCj4K
Pgo+IMKgwqDCoCBPbmUgTFRQIHRlc3RjYXNlLCBmc19maWxsLmMsIGZhaWxzIG9uIGJ0cmZzIHdp
dGgga2VybmVsIGVycm9yIHdoZW4gCj4gdW5saW5rIGZpbGVzIG9uIEJ0cmZzIGRldmljZToKPgo+
IMKgwqDCoCAiQlRSRlMgd2FybmluZyAoZGV2aWNlIGxvb3AwKTogY291bGQgbm90IGFsbG9jYXRl
IHNwYWNlIGZvciBhIAo+IGRlbGV0ZTsgd2lsbCB0cnVuY2F0ZSBvbiBtb3VudCIuCj4KPgo+IMKg
wqDCoCBJIGZvdW5kIHRoZSBsb29wIGJsb2NrIGRldmljZSBmb3JtYXR0ZWQgd2l0aCBidHJmcyBy
b3VnaGx5IHJhbmdzIAo+IGZyb20gNDYwTSB0byA1NjBNIHdpbGwgY2F1c2UgdGhlIGVycm9yLgo+
Cj4gwqDCoMKgIDI1Nk0gYW5kIDFHIGFsbCBwYXNzLgo+Cj4KPiDCoMKgwqAgVGhlIGZzX2ZpbGwu
YyBzb3VyY2UgY29kZToKPgo+IFtodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0
L2x0cC9ibG9iL21hc3Rlci90ZXN0Y2FzZXMva2VybmVsL2ZzL2ZzX2ZpbGwvZnNfZmlsbC5jXSAK
Pgo+Cj4gwqDCoMKgIFRoZSBmc19maWxsLmMgY2FsbHMgdW5saW5rIHdoaWNoIHRyaWdnZXJzIHRo
ZSBlcnJvci4KPgo+IFtodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9i
bG9iL2UzNDU3ZTQyYzFiOTNmNTRiYjgxZGE3NDZlYmEzMTRmZDM0YWQ0MGUvdGVzdGNhc2VzL2tl
cm5lbC9mcy9mc19maWxsL2ZzX2ZpbGwuYyNMNTVdIAo+Cj4KPiBbaHR0cHM6Ly9naXRodWIuY29t
L2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvYmxvYi9lMzQ1N2U0MmMxYjkzZjU0YmI4MWRhNzQ2ZWJh
MzE0ZmQzNGFkNDBlL2xpYi9zYWZlX21hY3Jvcy5jI0wzNThdIAo+Cj4KPgo+ICpFcnJvciBpbmZv
OioKPgo+IMKgwqDCoCBUaGUgaXNzdWUgbWF5YmUgbm90IHJlcHJvZHVjZWQgZXZlcnl0aW1lIGJ1
dCBmb3VyIGZpZnRocyBjaGFuY2UuCj4KPiDCoMKgwqAgZnNfZmlsbC5jOjUzOiBJTkZPOiBVbmxp
bmtpbmcgbW50cG9pbnQvdGhyZWFkNS9maWxlMAo+IMKgwqDCoCBzYWZlX21hY3Jvcy5jOjM2MDog
QlJPSzogZnNfZmlsbC5jOjU1OiAKPiB1bmxpbmsobW50cG9pbnQvdGhyZWFkMTAvZmlsZTApIGZh
aWxlZDogRU5PU1BDCj4gwqDCoMKgIHNhZmVfbWFjcm9zLmM6MzYwOiBCUk9LOiBmc19maWxsLmM6
NTU6IAo+IHVubGluayhtbnRwb2ludC90aHJlYWQxMS9maWxlMCkgZmFpbGVkOiBFTk9TUEMKPiDC
oMKgwqAgWzYyNDc3LjM3ODg0OF0gQlRSRlMgd2FybmluZyAoZGV2aWNlIGxvb3AwKTogY291bGQg
bm90IGFsbG9jYXRlIAo+IHNwYWNlIGZvciBhIGRlbGV0ZTsgd2lsbCB0cnVuY2F0ZSBvbiBtb3Vu
dAo+IMKgwqDCoCBbNjI0NzcuMzc4OTA1XSBCVFJGUyB3YXJuaW5nIChkZXZpY2UgbG9vcDApOiBj
b3VsZCBub3QgYWxsb2NhdGUgCj4gc3BhY2UgZm9yIGEgZGVsZXRlOyB3aWxsIHRydW5jYXRlIG9u
IG1vdW50Cj4KPgo+Cj4gKktlcm5lbDoqCj4KPiDCoMKgwqAgQWZ0ZXIgdjUuMi1yYzEsIHFlbXV4
ODYtNjQKPgo+IMKgwqDCoCAjIG1ha2UgLWo0MCBBUkNIPXg4Nl82NCBDUk9TU19DT01QSUxFPXg4
Ni02NC1nY2MKPiDCoMKgwqAgdXNlIHFlbXUgdG8gYm9vdHVwIGtlcm5lbAo+Cj4KPiAqTFRQOioK
Pgo+IMKgwqDCoCBtYXN0ZXIgYnJhbmNoOiBJIHRlc3RlZCBvbiAyMDE5MDYyNQo+IMKgwqDCoCBS
ZXByb2R1Y2U6Cj4KPiDCoMKgwqAgLy8gYnVpbGQgTHRwCj4gwqDCoMKgICMgY2QgTHRwLXNvdXJj
ZQo+IMKgwqDCoCAjIC4vYnVpbGQuc2gKPgo+IMKgwqDCoCAvLyBjb3B5IGZpbGVzIHRvIHFlbXUK
PiDCoMKgwqAgIyBjcCBydW5sdHAgdGVzdGNhc2VzL2tlcm5lbC9mcy9mc19maWxsL2ZzX2ZpbGwg
dG8gcWVtdQo+Cj4gwqDCoMKgIC8vIGxvZ2luIHRvIHFlbXU6Cj4gwqDCoMKgIC8vIGFkanVzdCBi
bG9jayBkZXZpY2Ugc2l6ZSB0byA1MTJNCj4gwqDCoMKgICMgdmkgcnVubHRwCj4gwqDCoMKgIGlu
IGZ1bmN0aW9uOiBjcmVhdGVfYmxvY2soKQo+IMKgwqDCoCDCoMKgwqAgZGQgaWY9L2Rldi96ZXJv
IG9mPSR7VE1QfS90ZXN0LmltZyBicz0xMDI0IGNvdW50PTI2MjE0NAo+IMKgwqDCoCDCoMKgwqAg
LS0tPgo+IMKgwqDCoCDCoMKgwqAgZGQgaWY9L2Rldi96ZXJvIG9mPSR7VE1QfS90ZXN0LmltZyBi
cz0xMDI0IGNvdW50PTUyNDI4OAo+Cj4gwqDCoMKgIC8vIGV4ZWN1dGUgdGVzdGNhc2UKPiDCoMKg
wqAgIyBydW5sdHAgLWYgZnMgLXMgZnNfZmlsbAo+Cj4KPiAqQW5hbHlzaXM6Kgo+Cj4gwqDCoMKg
IE9uZSBuZXcga2VybmVsIGNvbW1pdCBjb250YWluZWQgaW4gdjUuMi1yYzEgaW50cm9kdWNlcyB0
aGUgaXNzdWUuCj4KPiDCoMKgwqAgY29tbWl0IGM4ZWFlYWM3YjczNDM0N2MzYWZiYTcwMDhiN2Fm
NjJmMzdiOWMxNDAKPiDCoMKgwqAgQXV0aG9yOiBKb3NlZiBCYWNpayA8am9zZWZAdG94aWNwYW5k
YS5jb20+Cj4gwqDCoMKgIERhdGU6wqDCoCBXZWQgQXByIDEwIDE1OjU2OjEwIDIwMTkgLTA0MDAK
Pgo+IMKgwqDCoCDCoMKgwqAgYnRyZnM6IHJlc2VydmUgZGVsYWxsb2MgbWV0YWRhdGEgZGlmZmVy
ZW50bHkKPiDCoMKgIMKgwqAgwqAgLi4uCj4KPgo+IEFueW9uZSdzIHJlcGx5IHdpbGwgYmUgYXBw
cmVjaWF0ZWQuCj4KPiAtLUhvbmd6aGkKPgo+Cj4KPgo+Cj4KCi0tIApNYWlsaW5nIGxpc3QgaW5m
bzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
