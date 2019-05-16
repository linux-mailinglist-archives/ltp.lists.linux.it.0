Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A31FFC7
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 08:45:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1D463EA2EC
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2019 08:45:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 08E183EA2DB
 for <ltp@lists.linux.it>; Thu, 16 May 2019 08:45:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id CF21D1401B4A
 for <ltp@lists.linux.it>; Thu, 16 May 2019 08:45:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,475,1549900800"; d="scan'208";a="63297570"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 May 2019 14:44:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id D64D04CDC82D;
 Thu, 16 May 2019 14:44:57 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 16 May 2019 14:44:58 +0800
Message-ID: <5CDD06E7.7050100@cn.fujitsu.com>
Date: Thu, 16 May 2019 14:44:55 +0800
From: xuyang <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <1557732392-7049-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190513131451.GA22761@dell5510> <5CDA5124.3070708@cn.fujitsu.com>
 <20190514120119.GA26452@dell5510> <5CDBD564.8010300@cn.fujitsu.com>
 <20190515143746.GA7507@dell5510>
In-Reply-To: <20190515143746.GA7507@dell5510>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: D64D04CDC82D.AFEFC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ltp-cap.m4: add libcap version detection && fix
 compiler error
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
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

SGkgUGV0cgoKPiBIaSBZYW5nLAo+Cj4+Pj4gQXQgdGhlIGJlZ2lubmluZywgSQo+Pj4+ICAgICB0
aGluayBpdCBtYWtlcyBubyBzZW5zZSBiZWNhdXNlIGxpYmNhcC0xIGlzIHRvbyBvbGQuICBCdXQg
SSBub3RpY2VzIHRoYXQgbHRwLXF1b3RhLm00Cj4+Pj4gICAgIGhhcyBxdW90YV92MSBhbmQgcXVv
dGFfdjIuIEkgY2hhbmdlcyBteSBtaW5kLgo+Pj4+ICAgICBTaW5jZSB3ZSBoYXZlIGRyb3AgbGli
bnVtYSB2MSwgSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHdlIGFsc28gZHJvcCBsaWJjYXAgdjEodG9v
IG9sZCkuCj4+Pj4gICAgIEFsc28sIEkgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgcXVvdGFfdjEgYmVj
YXVzZSBpdCBpcyB0b28gb2xkIChzaW5jZSBMaW51eCAyLjQuMjIsIFFfR0VUSU5GTyBoYXMKPj4+
PiAgICAgYmVlbiBzdXBwb3J0ZWQgaW4ga2VybmVsKS4KPj4+IEdvb2QgcG9pbnQuIEJ1dCBJJ20g
bm90IHN1cmUgaWYgaXQncyB0aGUgc2FtZSwgYXMgUUZNVF9WRlNfT0xEIGlzIHBhcnQgb2Yga2Vy
bmVsCj4+PiBzb3VyY2UgdHJlZSAocGFydCBvZiBrZXJuZWwgc3BhY2UgY29kZSkgc28gaXQgbWFr
ZXMgc2Vuc2UgdG8gdGVzdCBpdCwgd2hlcmVhcwo+Pj4gbGliY2FwIHYxIGFuZCBsaWJudW1hIHYx
IGFyZSBqdXN0IG9sZCB2ZXJzaW9ucyBvZiB1c2VyIHNwYWNlIGxpYnJhcnkuCj4+PiBPciBhbSBJ
IHdyb25nPwo+PiBIaSBQZXRyCj4+ICAgICBJIGhhdmUgc2VlbiBrZXJuZWwgc291cmNlIGFib3V0
IHF1b3RhIGFuZCB0cnkgaXQuIEkgdGhpbmsgeW91IGFyZSByaWdodC4gIEJ1dCBjdXJyZW50IHF1
b3RhX3YxCj4+IGFuZCBxdW90YV92MiBkZXRlY3Rpb24gaGFzIHByb2JsZW0uIEluIGtlcm5lbCBz
b3VyY2UsIEkgZGlzYWJsZSBDT05GSUdfUUZNVF9WMiBhbmQgZW5hYmxlIENPTkZJR19RRk1UX1Yx
Cj4+ICx0aGVuIEkgZm91bmQgbHRwIHN0aWxsIGRldGVjdHMgcXVvdGF2MiBpbnN0ZWFkIG9mIHF1
b3RhdjEsICBhbmQgcnVuIC4vcXVvdGFjdGwwMSwgdGhlIGZvbGxvd2luZyBlcnJvciBvY2N1cnM6
Cj4gTFRQIGRldGVjdGlvbiBpbiBsdHAtcXVvdGEubTQgZGVmaW5lcyBfTElOVVhfUVVPVEFfVkVS
U0lPTiBmb3IgZGV0ZWN0aW9uLgo+IEkgZ3Vlc3MgeW91J2QgaGF2ZSB0byBkZWZpbmUgSEFWRV9R
VU9UQVYxIGFuZCB1bmRlZmluZSBIQVZFX1FVT1RBVjIgaW4gaW4KPiBpbmNsdWRlL2NvbmZpZy5o
LCBidXQgbm90IHRlc3RlZC4KPgo+IEJUVyBfTElOVVhfUVVPVEFfVkVSU0lPTiB3YXMgcmVtb3Zl
ZCBmcm9tIGdsaWJjIGluIDIuMjUgWzFdIFsyXSwgd2hpY2ggYmFzZWQgc2V0dXAKPiBvbjxsaW51
eC9xdW90YS5oPi4gQW5kIG11c2wgZGVmaW5lcyBvbmx5IF9MSU5VWF9RVU9UQV9WRVJTSU9OIDIu
Cj4KPiBSZWdhcmRzIG1hbiBpbmZvIHRoYXQgdjEgaXMgZnJvbSBrZXJuZWwgdjIuNC4yMiB3ZSBz
aG91bGQgcHJvYmFibHkgYWxzbyByZW1vdmUKPiBpdCdzIHN1cHBvcnQuCiAgVGhhbmtzIGZvciB5
b3VyIHJlcGx5LgoKPiBXZSBnb3QgYSBiaXQgYXdheSBmcm9tIGxpYmNhcCA6KS4KICAgIDotKSAg
IGxldCdzIGdvIGJhY2sgdG8gbGliY2FwLiBJIHdpbGwgc2VuZCBhIHYyIHBhdGNoIHRvIG9ubHkg
Zml4IHBvc3NpYmxlIGNvbXBpbGVyIGVycm9yLgoKPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4g
WzFdIGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWNvbW1pdGRpZmY7
aD00ZDcyODA4N2VmOGNjODI2YjA1YmQyMWQwYzc0ZDRlY2E5YjFhMjdkO2hwPWRlNmI2ZDE0ZTli
NGQ4ZTlhNzMzM2FkZGNhNTUxNjNkOWViYjdmZjYKPiBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wYXRjaC82NjQxNTYvCj4KPgo+IC4KPgoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
