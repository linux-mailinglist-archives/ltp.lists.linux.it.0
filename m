Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 080FC1AD7F0
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 09:48:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9CFF3C2ACE
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 09:48:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EB7513C2AB9
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 09:48:36 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9C4581A00E3A
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 09:48:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,394,1580745600"; d="scan'208";a="89193168"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Apr 2020 15:48:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5272B49DF129;
 Fri, 17 Apr 2020 15:37:56 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 17 Apr 2020 15:48:28 +0800
To: Li Wang <liwang@redhat.com>, <laniel_francis@privacyrequired.com>
References: <20200409211255.1357-1-laniel_francis@privacyrequired.com>
 <7c9e27de-aaff-98ea-4e00-2c242f7a0cc3@cn.fujitsu.com>
 <f8f3aea3-5371-a8b5-09dd-1200d9dc6d72@cn.fujitsu.com>
 <CAEemH2dzt4Hi7HDyO4Spn_i3naJbhQ5GwpZVCk3BgkdaL5uNWg@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c4118b86-b364-1355-3bf4-602a9ae0c5bc@cn.fujitsu.com>
Date: Fri, 17 Apr 2020 15:48:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dzt4Hi7HDyO4Spn_i3naJbhQ5GwpZVCk3BgkdaL5uNWg@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5272B49DF129.AC072
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Add new test for pipe2 with/without O_NONBLOCK mode
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

SGkgTGkKCgo+IEhpIFh1LAo+IAo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaGVzLgo+
IAo+IFlhbmcgWHUgPHh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20gCj4gPG1haWx0bzp4dXlh
bmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPj4gd3JvdGU6Cj4gCj4gICAgIC4uLgo+ICAgICAgPiBJ
IG1vZGlmeSB5b3VyIHBhdGNoIGFuZCBtZXJnZWQgaW50byBteSBsdHAgb3duIGZvcmsuCj4gICAg
ICA+IHNlZQo+ICAgICAgPgo+ICAgICBodHRwczovL2dpdGh1Yi5jb20veHV5YW5nMDQxMC9sdHAv
Y29tbWl0cy9MYW5pZWxfZnJhbmNpc19waXBlMl8wM192My5maXhlcwo+ICAgICAgPgo+ICAgICAg
PiBwczogSSB3aWxsIGNvbnZlcnQgcGlwZTJfMDEvMDIuYyBpbnRvIG5ldyBsaWJyYXkgYW5kIHVz
ZQo+ICAgICBTQUZFX1BJUEUyIG1hY3JvLgo+ICAgICBDYW4geW91IG1lcmdlIHRoZSBzYWZlX3Bp
cGUyIHBhdGNoKGRvbid0IG5lZWQgdG8gYWRkIHRoaXMgbWFjcm8gaW50bwo+ICAgICBvbGQKPiAg
ICAgc2FmZV9tYWNybyBoZWFkZXIpIGludG8gbWFzdGVyPyBzbyB0aGVuIEkgY2FuIHdyaXRlIG5l
dyB0ZXN0IGNhc2VzCj4gCj4gCj4gSSdtIG9rIHdpdGggb25seSBzdXBwb3J0IGl0IGluIHRoZSBu
ZXcgbGlicmFyeS4KPiAKPiBCdXQgaWYgd2UgZXhwb3J0IHRoZSBzYWZlIG1hY3JvIG9ubHkgdG8g
dXNlIGJ5IG5ldyBBUEksIHdlJ2QgYmV0dGVyIGFkZCAKPiBpdCBpbnRvIGxpYi90c3Rfc2FmZV9t
YWNyb3MuYwo+IGJ1dCBub3QgbGliL3NhZmVfbWFjcm9zLmMsIHRoaXMgcGF0Y2ggbGVhdmVzIHRo
ZSAndm9pZCAoKmNsZWFudXBfZm4pIAo+ICh2b2lkKSfCoGhvb2sgaW4gZnVuY3Rpb24gc2FmZV9w
aXBlMigpCj4gYW5kIHB1dCBpbiBzYWZlX21hY3Jvcy5jIHRoYXQgaXMgY29tcGF0aWJsZcKgd2l0
aCBib3RoIEFQSSB1c2luZy4KPiAKPiBEbyB5b3UgdGhpbmsgc28/IGlmIHllcyBJIGNhbiBoZWxw
IHRvIG1vdmUgaXQgdG/CoHRzdF9zYWZlX21hY3Jvcy5jIGFuZCAKPiBhcHBseSBpdC4KWWVzLiBJ
IG9ubHkgbm90aWNlZCBoZWFkZXIgZmlsZSBwbGFjZSBhbmQgZm9yZ290IEMgZmlsZSBwbGFjZS4K
PiAKPiAtLSAKPiBSZWdhcmRzLAo+IExpIFdhbmcKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
