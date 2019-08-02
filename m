Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C07EA9D
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 05:12:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84E3E3C1DFC
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 05:12:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 866E73C1DE3
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 05:12:01 +0200 (CEST)
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C4EE41A00A21
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 05:11:58 +0200 (CEST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
 by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x723BsMQ006917
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Thu, 1 Aug 2019 20:11:54 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Thu, 1 Aug 2019 20:11:53 -0700
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
To: <linux-btrfs@vger.kernel.org>, <josef@toxicpanda.com>,
 <linux-kernel@vger.kernel.org>
References: <b501bcff-8be0-4303-8789-363fda4658e5@windriver.com>
Message-ID: <f6795b4b-d70e-491e-e7ce-d235ca1b95ff@windriver.com>
Date: Fri, 2 Aug 2019 11:11:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b501bcff-8be0-4303-8789-363fda4658e5@windriver.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.188]
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: Btrfs prompts "can't allocate space for
 delete" when block size arounds 512M
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

QWRkIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcuCgpQaW5nLi4uCgoKVGhhbmtzLAoKLS1I
b25nemhpCgoKT24gNy8xNy8xOSA0OjM0IFBNLCBIb25nemhpLCBTb25nIHdyb3RlOgo+IEhpIGZy
aWVuZHMsCj4KPiAqRGVzY3JpcHRpb246Kgo+Cj4KPiDCoMKgwqAgT25lIExUUCB0ZXN0Y2FzZSwg
ZnNfZmlsbC5jLCBmYWlscyBvbiBidHJmcyB3aXRoIGtlcm5lbCBlcnJvciB3aGVuIAo+IHVubGlu
ayBmaWxlcyBvbiBCdHJmcyBkZXZpY2U6Cj4KPiDCoMKgwqAgIkJUUkZTIHdhcm5pbmcgKGRldmlj
ZSBsb29wMCk6IGNvdWxkIG5vdCBhbGxvY2F0ZSBzcGFjZSBmb3IgYSAKPiBkZWxldGU7IHdpbGwg
dHJ1bmNhdGUgb24gbW91bnQiLgo+Cj4KPiDCoMKgwqAgSSBmb3VuZCB0aGUgbG9vcCBibG9jayBk
ZXZpY2UgZm9ybWF0dGVkIHdpdGggYnRyZnMgcm91Z2hseSByYW5ncyAKPiBmcm9tIDQ2ME0gdG8g
NTYwTSB3aWxsIGNhdXNlIHRoZSBlcnJvci4KPgo+IMKgwqDCoCAyNTZNIGFuZCAxRyBhbGwgcGFz
cy4KPgo+Cj4gwqDCoMKgIFRoZSBmc19maWxsLmMgc291cmNlIGNvZGU6Cj4KPiBbaHR0cHM6Ly9n
aXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvYmxvYi9tYXN0ZXIvdGVzdGNhc2VzL2tl
cm5lbC9mcy9mc19maWxsL2ZzX2ZpbGwuY10gCj4KPgo+IMKgwqDCoCBUaGUgZnNfZmlsbC5jIGNh
bGxzIHVubGluayB3aGljaCB0cmlnZ2VycyB0aGUgZXJyb3IuCj4KPiBbaHR0cHM6Ly9naXRodWIu
Y29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvYmxvYi9lMzQ1N2U0MmMxYjkzZjU0YmI4MWRhNzQ2
ZWJhMzE0ZmQzNGFkNDBlL3Rlc3RjYXNlcy9rZXJuZWwvZnMvZnNfZmlsbC9mc19maWxsLmMjTDU1
XSAKPgo+Cj4gW2h0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL2Jsb2Iv
ZTM0NTdlNDJjMWI5M2Y1NGJiODFkYTc0NmViYTMxNGZkMzRhZDQwZS9saWIvc2FmZV9tYWNyb3Mu
YyNMMzU4XSAKPgo+Cj4KPiAqRXJyb3IgaW5mbzoqCj4KPiDCoMKgwqAgVGhlIGlzc3VlIG1heWJl
IG5vdCByZXByb2R1Y2VkIGV2ZXJ5dGltZSBidXQgZm91ciBmaWZ0aHMgY2hhbmNlLgo+Cj4gwqDC
oMKgIGZzX2ZpbGwuYzo1MzogSU5GTzogVW5saW5raW5nIG1udHBvaW50L3RocmVhZDUvZmlsZTAK
PiDCoMKgwqAgc2FmZV9tYWNyb3MuYzozNjA6IEJST0s6IGZzX2ZpbGwuYzo1NTogCj4gdW5saW5r
KG1udHBvaW50L3RocmVhZDEwL2ZpbGUwKSBmYWlsZWQ6IEVOT1NQQwo+IMKgwqDCoCBzYWZlX21h
Y3Jvcy5jOjM2MDogQlJPSzogZnNfZmlsbC5jOjU1OiAKPiB1bmxpbmsobW50cG9pbnQvdGhyZWFk
MTEvZmlsZTApIGZhaWxlZDogRU5PU1BDCj4gwqDCoMKgIFs2MjQ3Ny4zNzg4NDhdIEJUUkZTIHdh
cm5pbmcgKGRldmljZSBsb29wMCk6IGNvdWxkIG5vdCBhbGxvY2F0ZSAKPiBzcGFjZSBmb3IgYSBk
ZWxldGU7IHdpbGwgdHJ1bmNhdGUgb24gbW91bnQKPiDCoMKgwqAgWzYyNDc3LjM3ODkwNV0gQlRS
RlMgd2FybmluZyAoZGV2aWNlIGxvb3AwKTogY291bGQgbm90IGFsbG9jYXRlIAo+IHNwYWNlIGZv
ciBhIGRlbGV0ZTsgd2lsbCB0cnVuY2F0ZSBvbiBtb3VudAo+Cj4KPgo+ICpLZXJuZWw6Kgo+Cj4g
wqDCoMKgIEFmdGVyIHY1LjItcmMxLCBxZW11eDg2LTY0Cj4KPiDCoMKgwqAgIyBtYWtlIC1qNDAg
QVJDSD14ODZfNjQgQ1JPU1NfQ09NUElMRT14ODYtNjQtZ2NjCj4gwqDCoMKgIHVzZSBxZW11IHRv
IGJvb3R1cCBrZXJuZWwKPgo+Cj4gKkxUUDoqCj4KPiDCoMKgwqAgbWFzdGVyIGJyYW5jaDogSSB0
ZXN0ZWQgb24gMjAxOTA2MjUKPiDCoMKgwqAgUmVwcm9kdWNlOgo+Cj4gwqDCoMKgIC8vIGJ1aWxk
IEx0cAo+IMKgwqDCoCAjIGNkIEx0cC1zb3VyY2UKPiDCoMKgwqAgIyAuL2J1aWxkLnNoCj4KPiDC
oMKgwqAgLy8gY29weSBmaWxlcyB0byBxZW11Cj4gwqDCoMKgICMgY3AgcnVubHRwIHRlc3RjYXNl
cy9rZXJuZWwvZnMvZnNfZmlsbC9mc19maWxsIHRvIHFlbXUKPgo+IMKgwqDCoCAvLyBsb2dpbiB0
byBxZW11Ogo+IMKgwqDCoCAvLyBhZGp1c3QgYmxvY2sgZGV2aWNlIHNpemUgdG8gNTEyTQo+IMKg
wqDCoCAjIHZpIHJ1bmx0cAo+IMKgwqDCoCBpbiBmdW5jdGlvbjogY3JlYXRlX2Jsb2NrKCkKPiDC
oMKgwqAgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0ke1RNUH0vdGVzdC5pbWcgYnM9MTAyNCBj
b3VudD0yNjIxNDQKPiDCoMKgwqAgwqDCoMKgIC0tLT4KPiDCoMKgwqAgwqDCoMKgIGRkIGlmPS9k
ZXYvemVybyBvZj0ke1RNUH0vdGVzdC5pbWcgYnM9MTAyNCBjb3VudD01MjQyODgKPgo+IMKgwqDC
oCAvLyBleGVjdXRlIHRlc3RjYXNlCj4gwqDCoMKgICMgcnVubHRwIC1mIGZzIC1zIGZzX2ZpbGwK
Pgo+Cj4gKkFuYWx5c2lzOioKPgo+IMKgwqDCoCBPbmUgbmV3IGtlcm5lbCBjb21taXQgY29udGFp
bmVkIGluIHY1LjItcmMxIGludHJvZHVjZXMgdGhlIGlzc3VlLgo+Cj4gwqDCoMKgIGNvbW1pdCBj
OGVhZWFjN2I3MzQzNDdjM2FmYmE3MDA4YjdhZjYyZjM3YjljMTQwCj4gwqDCoMKgIEF1dGhvcjog
Sm9zZWYgQmFjaWsgPGpvc2VmQHRveGljcGFuZGEuY29tPgo+IMKgwqDCoCBEYXRlOsKgwqAgV2Vk
IEFwciAxMCAxNTo1NjoxMCAyMDE5IC0wNDAwCj4KPiDCoMKgwqAgwqDCoMKgIGJ0cmZzOiByZXNl
cnZlIGRlbGFsbG9jIG1ldGFkYXRhIGRpZmZlcmVudGx5Cj4gwqDCoCDCoMKgIMKgIC4uLgo+Cj4K
PiBBbnlvbmUncyByZXBseSB3aWxsIGJlIGFwcHJlY2lhdGVkLgo+Cj4gLS1Ib25nemhpCj4KPgo+
Cj4KPgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
