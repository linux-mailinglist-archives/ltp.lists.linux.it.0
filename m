Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958F231B35
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 10:31:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E1AF3C2657
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 10:31:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D36B93C0196
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 10:31:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8FCEC602197
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 10:31:02 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,409,1589212800"; d="scan'208";a="97053916"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Jul 2020 16:31:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7C5174CE2808;
 Wed, 29 Jul 2020 16:30:55 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 29 Jul 2020 16:30:55 +0800
To: Li Wang <liwang@redhat.com>
References: <1595911224-12470-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595911224-12470-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eFrsa0rNfjcKrdQpUkV6YvbQR10tbzy4F5jXVQOrra7w@mail.gmail.com>
 <9916b020-27b6-bc12-919b-9046dc7dcee5@cn.fujitsu.com>
 <CAEemH2ckxPDkncT9m2nyv0-tvJ70SKogun7EfzAN912sc5662A@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <598ad053-525b-c4b7-1ed7-f1409e84818f@cn.fujitsu.com>
Date: Wed, 29 Jul 2020 16:30:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2ckxPDkncT9m2nyv0-tvJ70SKogun7EfzAN912sc5662A@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7C5174CE2808.ABE47
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.6 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] libs/libltpnewipc: Add libmsgctl.c into
 new ipc library
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

SGkgTGkKCgo+IAo+IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20gCj4gPG1h
aWx0bzp4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPj4gd3JvdGU6Cj4gCj4gICAgIC4uLgo+
ICAgICAgPiBJdCdzIGZpbmUgdG8gbWFpbnRhaW4gb25seSBhIHNpbmdsZSBTeXN0ZW0gViBJUEMg
bGlicmFyeSBpbiBMVFAuCj4gICAgICA+IEJUVywgZG8geW91IGhhdmUgYSBwbGFuIHRvIHJlbW92
ZSB0aGUgb2xkIGxpYm1zZ2N0bC5jIGFmdGVyCj4gICAgIG1lcmdpbmcgdGhpcz8KPiAgICAgWWVz
LiBJIGhhdmUgYSBwbGFuWzFdIHRvwqAgcmVtb3ZlIHRoaXMgb2xkIGxpYm1zZ2N0bCB3aGVuIEkg
Y2xlYW4gdXAKPiAgICAgbXNnc3RyZXNzIGNhc2UoSSBhbSBkb2luZyBpdCkuCj4gCj4gCj4gR3Jl
YXQsIHRoYW5rIHlvdSEKPiAKPiAgICAgQWxzbywgSSBwbGFuIHRvIHJlbW92ZSBnZXRfbWF4X21z
Z3F1ZXVlcygpwqAgZnVuY3Rpb24gaW4gb2xkIGxpYmlwYy5jCj4gICAgIGJlY2F1c2Ugd2UgY2Fu
IGRpcmVjdGx5IHVzZSBTQUZFX0ZJTEVfU0NBTkYoIi9wcm9jL3N5cy9rZXJuZWwvbXNnbW5pIiwK
PiAgICAgIiVkIiwgJm5yX21zZ3FzKSBpbiB0ZXN0IGNhc2UuCj4gCj4gCj4gKzEKPiAKPiBPciwg
bWF5YmUgaWYgeW91J2QgbGlrZSB0byBkbyBtb3JlIGluIG5leHQsIHRoZSBsaWJpcGMuYyBhbHNv
IGNvdWxkIGJlIAo+IG1lcmdlZCBpbnRvIGxpYm5ld2lwYy5jIHNpbmNlIHRoZXkgaGF2ZSBzb21l
IG92ZXJsYXBzIHRvby4gQW55d2F5LCBpdCAKPiBkZXBlbmRzIG9uIHlvdXIgdGhvdWdodHMgOiku
CkkgaGF2ZSB0aGlzIGlkZWFbMV0uCkkgdGhpbmsgd2Ugc2hvdWxkIHBsYW4gdG8gcmVtb3ZlIG9s
ZCBsaWJpcGMuYyB3aGVuIHdlIGNsZWFudXAgYWxsIGlwYyAKdGVzdCBjYXNlLgoKQ3lyaWwgaGFz
IGNsZWFudXAgc2htY3RsIGFuZCBWaXJlc2ggaGFzIGNsZWFudXAgc2Vtb3AgdG9kYXksIEkgYWxz
byBoYXZlIAphIHBhdGNoc2V0IHRvIGNsZWFudXAgbXNncmN2LiBJdCBzZWVtcyB3ZSBvbmx5ICBo
YXZlIApzZW1nZXQsc2htZ2V0LHNlbWN0bCxzaG1kdCBjYXNlIHRoYXQgdXNlIG9sZCBpcGMuCgoj
IGdyZXAgLW5zciBMVFBMSUJTCnNlbWdldC9NYWtlZmlsZTo2OkxUUExJQlMgPSBsdHBpcGMKbXNn
Z2V0L01ha2VmaWxlOjY6TFRQTElCUyA9IGx0cG5ld2lwYwptc2dzbmQvTWFrZWZpbGU6NjpMVFBM
SUJTID0gbHRwbmV3aXBjCnNobWdldC9NYWtlZmlsZTo2OkxUUExJQlMgPSBsdHBpcGMKc2htY3Rs
L01ha2VmaWxlOjY6TFRQTElCUyA9IGx0cGlwYyBsdHBuZXdpcGMKbXNnc3RyZXNzL01ha2VmaWxl
OjY6TFRQTElCUyA9IGx0cGlwYyBsdHBuZXdpcGMKbXNncmN2L01ha2VmaWxlOjY6TFRQTElCUyA9
IGx0cGlwYwptc2djdGwvTWFrZWZpbGU6NjpMVFBMSUJTID0gbHRwbmV3aXBjCnNlbWN0bC9NYWtl
ZmlsZTo2OkxUUExJQlMgPSBsdHBpcGMgbHRwbmV3aXBjCnNobWF0L01ha2VmaWxlOjY6TFRQTElC
UyA9IGx0cG5ld2lwYwpzaG1kdC9NYWtlZmlsZTo2OkxUUExJQlMgPSBsdHBpcGMKc2Vtb3AvTWFr
ZWZpbGU6NjpMVFBMSUJTID0gbHRwaXBjCiMKClsxXWh0dHA6Ly9saXN0cy5saW51eC5pdC9waXBl
cm1haWwvbHRwLzIwMjAtSnVseS8wMTgwNjMuaHRtbAo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gTGkg
V2FuZwoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
