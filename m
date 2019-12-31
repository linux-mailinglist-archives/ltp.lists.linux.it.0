Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC112D6C1
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:05:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5693D3C239F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:05:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5A1013C2035
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:05:41 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8400860CB92
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:05:38 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,378,1571673600"; d="scan'208";a="81051094"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Dec 2019 15:05:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0669D4CE1C99;
 Tue, 31 Dec 2019 14:56:41 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 31 Dec 2019 15:05:30 +0800
To: Li Wang <liwang@redhat.com>
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
 <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
 <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
 <23f8d05b-efff-56ba-b5d8-f99046e5619c@cn.fujitsu.com>
 <CAEemH2dyHSS20Lf9neVfY6voN-EO60_MQdXjb0Xjy9VsDfbZwA@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <d3baf4e5-66cb-6288-6742-0f7d1dc89090@cn.fujitsu.com>
Date: Tue, 31 Dec 2019 15:05:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dyHSS20Lf9neVfY6voN-EO60_MQdXjb0Xjy9VsDfbZwA@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0669D4CE1C99.A17C8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: Caspar Zhang <caspar@linux.alibaba.com>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpIaSBMaQo+IEhpIFlhbmcsCj4gCj4gWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1
LmNvbSAKPiA8bWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+PiB3cm90ZToKPiAK
PiAgICAgLi4uCj4gCj4+Cj4+ICAgICBJIGhhdmUgdHJpZWQgdGhpcyBmb3IgbWFueSBkaWZmZXJl
bnQgc3lzdGVtcywgYW5kIGl0IGRvZXNuJ3QgaGl0Cj4+ICAgICB0aGUgZmFpbHVyZSBhdCBsZWFz
dCBvbmUgdGltZS4gU28gaWYgbm8gbW9yZSBjb21tZW50cywgSSB3b3VsZAo+PiAgICAgbWVyZ2Ug
dGhlIHBhdGNoIGFzIGJlbG93IGluIHRoZSBuZXh0IHN0ZXAuCj4gCj4gICAgIEkgaGF2ZSBhIHF1
ZXN0aW9uLndlIG11c3QgY2FsbCBzeW5jKCk/IEkgdGhpbmsgc3luY2ZzIGlzIG1vcmUgYWNjdXJh
dGUuCj4gCj4gCj4gSGVyZSB3ZSB1c2Ugc3luYygpIGlzIHRvIG1ha2UgZnMgbWV0YWRhdGEvY2Fj
aGUgYmVpbmcgd3JpdHRlbiBiYWNrIAo+IGJlZm9yZSB0ZXN0aW5nIGJlY2F1c2UgdGhlcmUgaXMg
bm8gb2J0YWluYWJsZcKgZmlsZSBkZXNjcmlwdG9yICdmZCcgZm9yIAo+IHRoZSBleHQ0IGRlZmVy
cmVkwqBJTyAoZS5nLiBpbml0aWFsaXplIHRoZSBqb3VybmFsIGFuZCBpbm9kZSB0YWJsZXMpLgpJ
IHNlZS4gRm9yIG90aGVyIHRlc3QgY2FzZXMgdXNpbmcgdHN0X2Rldl9ieXRlc193cml0dGVuIGFw
aSBzdWNoIGFzIApmZGF0YXN5bmMwMy5jLCAgd2UgYWxzbyBuZWVkIHRvIGNhbGwgc3luYygpIHRv
IG1ha2UgdGhpcyB3cml0dGVuIHZhbHVlIAptb3JlIGFjY3VyYXRlLiAgV2hhdCBkbyB5b3UgdGhp
bmsgYWJvdXQgaXTvvJ8KCkJlc3QgUmVnYXJkcwpZYW5nIFh1Cj4gCj4gLS0gCj4gUmVnYXJkcywK
PiBMaSBXYW5nCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5p
dC9saXN0aW5mby9sdHAK
