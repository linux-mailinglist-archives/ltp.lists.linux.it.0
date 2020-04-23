Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D65B1B592E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 12:30:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 040DF3C297E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 12:30:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 76C1D3C2959
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 12:30:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8CBB0600BF0
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 12:30:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,306,1583164800"; d="scan'208";a="89764461"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Apr 2020 18:30:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C4E6E46B5FA0;
 Thu, 23 Apr 2020 18:19:34 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Apr 2020 18:30:11 +0800
To: Li Wang <liwang@redhat.com>
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ea_CtRyP9KtpJDjpEzobRyhrodiycDCAxhLbCjuOwhCQ@mail.gmail.com>
 <662aa817-04ff-e924-6880-7c23fa1cfe31@cn.fujitsu.com>
 <CAEemH2cF-kziNEHuN1GayTtzwdxFFzsu0wRGB85yJ=LaKS-XBw@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <3268f153-6730-708f-ed93-19ca4cf85fdd@cn.fujitsu.com>
Date: Thu, 23 Apr 2020 18:30:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cF-kziNEHuN1GayTtzwdxFFzsu0wRGB85yJ=LaKS-XBw@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C4E6E46B5FA0.AFB51
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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

SGkgTEkKCj4gCj4gCj4gT24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgNDo0NSBQTSBZYW5nIFh1IDx4
dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tIAo+IDxtYWlsdG86eHV5YW5nMjAxOC5qeUBjbi5m
dWppdHN1LmNvbT4+IHdyb3RlOgo+IAo+ICAgICAuLi4KPiAgICAgID4gSSBnb3QgYSBmYWlsdXJl
IG9uIHRoZSBwcGM2NGxlIHBsYXRmb3JtKHBhZ2Ugc2l6ZTogNjU1MzZrQikuCj4gICAgICA+Cj4g
ICAgICA+ICMgLi9waXBlMl8wMwo+ICAgICAgPiB0c3RfdGVzdC5jOjEyNDY6IElORk86IFRpbWVv
dXQgcGVyIHJ1biBpcyAwaCAwNW0gMDBzCj4gICAgICA+IHBpcGVfc2l6ZSA9IDEwNDg1NzYKPiAg
ICAgID4gUElQRV9CVUYgPSA0MDk2Cj4gICAgICA+IHBhY2tldF9udW0gPSAyNTYKPiAgICAgID4g
c2FmZV9tYWNyb3MuYzo0NTc6IEJST0s6IHBpcGUyXzAzLmM6NTg6Cj4gICAgICA+IHdyaXRlKDQs
MHgxMDAxZDJiOCwxODQ0Njc0NDA3MzcwOTU1MTYxNSkgZmFpbGVkOgo+ICAgICBFQUdBSU4vRVdP
VUxEQkxPQ0sgKDExKQo+ICAgICBJIHRoaW5rIHdlIHNob3VsZCByZW1vdmUgUElQRV9CVUYgYW5k
IHVzZSBwYWdlX3NpemXCoCBiZWNhdXNlIHdlIHVzZSBhCj4gICAgIHBhZ2UgdG8gc3RvcmUgZGF0
YSBub3QgYSBmaXhlZCBzaXplIGJ1ZmZlciBpbiBrZXJuZWwuIGFzIGJlbG93KGFsc28sCj4gICAg
IG1hbi1wYWdlc1sxXSBpcyBuZWVkIHRvIHVwZGF0ZSk6Cj4gCj4gCj4gRW1tLCBJZiBQSVBFX0JV
RiBkb2Vzbid0IHdvcmsgY29ycmVjdGx5LCBzaG91bGRuJ3QgdGhpcyBhIGtlcm5lbCBwaXBlIAo+
IGJ1Zz8gSSB0aGluayB3ZSBuZWVkIHRvIHRha2UgYSBjbG9zZSBsb29rIGF0IHdoYXQgaGFwcGVu
ZWQgdGhlcmUgYnV0IG5vdCAKPiB0byByZXBsYWNlIGJ5wqB1c2luZyBwYWdlX3NpemUgZGlyZWN0
bHkuCj4gLS0gCkl0IGlzIG9ubHkgZGVmaW5lZCBpbiBsaW1pdC5oKEkgb25seSB0aGluayBpdCBp
cyBhIGVycm9yIGluIGxpbWl0LmgpIGFuZCAKICBQSVBFX0JVRiBkb2Vzbid0IGJlIHVzZWQgaW4g
a2VybmVsLgoKSW4ga2VybmVsIGNvZGUsIHBpcGVzIHVzZSBzdHJ1Y3QgcGlwZV9idWZmZXIgdG8g
c3RvcmUgYnVmZmVyIGRhdGEgYW5kIApvdGhlciBpbmZvLApzdHJ1Y3QgcGlwZV9idWZmZXIgewog
ICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZTsgLy9hbGxvYyBwYWdlIHRvIHN0b3JlIGRhdGEKICAg
ICAgICAgdW5zaWduZWQgaW50IG9mZnNldCwgbGVuOwogICAgICAgICBjb25zdCBzdHJ1Y3QgcGlw
ZV9idWZfb3BlcmF0aW9ucyAqb3BzOwogICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7IC8vCiAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgcHJpdmF0ZTsKfTsKCmFzIG15IHBpcGUyXzAxLmMgc2FpZCB3
ZSBvbmx5IG1ha2UgYnVmIHdpdGggUElQRV9CVUZfRkxBR19QQUNLRVQgZmxhZyBpbiAKd3JpdGUg
ZW5kICwgYW5kIHJlYWQgd2lsbCBjaGVjayB0aGlzIGZsYWcuICBUaGlzIHVuaXQgaXMgYSBwYWdl
IGluc3RlYWQgCm9mIHRoaXMgUElQRV9CVUYgbWFjcm8uCgpCZXN0IFJlZ2FyZHMKWWFuZyBYdQo+
IFJlZ2FyZHMsCj4gTGkgV2FuZwoKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
