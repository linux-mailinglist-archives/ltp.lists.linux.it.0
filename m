Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0A12D6BF
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:02:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82A7F3C2263
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:02:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 68F363C2035
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:02:17 +0100 (CET)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A43431002885
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:02:13 +0100 (CET)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBV7289n015293
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 30 Dec 2019 23:02:08 -0800 (PST)
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 30 Dec 2019 23:02:07 -0800
To: Li Wang <liwang@redhat.com>
References: <1577257063-246792-1-git-send-email-zhe.he@windriver.com>
 <CAEemH2fAwMjPoVX17ydSJ3jchpiLgsXQwr=PN6t77Kpq12puHQ@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <261bf3bb-fa9f-be51-c204-e365f173ecc7@windriver.com>
Date: Tue, 31 Dec 2019 15:02:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAEemH2fAwMjPoVX17ydSJ3jchpiLgsXQwr=PN6t77Kpq12puHQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [128.224.162.175]
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] nm01: Remove prefix zeros of the addresses output
 by nm before comparing
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQuIEknbGwgc2VuZCB2Mi4KClpoZQoKT24gMTIvMzAv
MTkgOToxMyBQTSwgTGkgV2FuZyB3cm90ZToKPiBIaSBaaGUsCj4KPiBPbiBXZWQsIERlYyAyNSwg
MjAxOSBhdCAyOjU4IFBNIDx6aGUuaGVAd2luZHJpdmVyLmNvbSA8bWFpbHRvOnpoZS5oZUB3aW5k
cml2ZXIuY29tPj4gd3JvdGU6Cj4KPiAgICAgRnJvbTogSGUgWmhlIDx6aGUuaGVAd2luZHJpdmVy
LmNvbSA8bWFpbHRvOnpoZS5oZUB3aW5kcml2ZXIuY29tPj4KPgo+ICAgICBUaGUgbGF0ZXN0IG5t
IHYyLjMzLjEuMjAxOTEyMDggb3V0cHV0cyBzeW1ib2xzIGFkZHJlc3NlcyB3aXRob3V0IHByZWZp
eCB6ZXJvcwo+ICAgICBmb3IgIm5tIC1mIHBvc2l4Iiwgd2hpY2ggY2F1c2VzIHRoZSBmb2xsb3dp
bmcgZXJyb3IuCj4gICAgIG5tMDEgNSBURkFJTDogR290IHdyb25nIGZvcm1hdCB3aXRoIC1mIGJz
ZAo+Cj4gICAgIExldCdzIHJlbW92ZSB0aGUgcHJlZml4IHplcm9zIGJlZm9yZSBjb21wYXJpbmcu
Cj4KPiAgICAgU2lnbmVkLW9mZi1ieTogSGUgWmhlIDx6aGUuaGVAd2luZHJpdmVyLmNvbSA8bWFp
bHRvOnpoZS5oZUB3aW5kcml2ZXIuY29tPj4KPiAgICAgLS0tCj4gICAgIMKgdGVzdGNhc2VzL2Nv
bW1hbmRzL25tL25tMDEuc2ggfCAzICsrKwo+ICAgICDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKPgo+ICAgICBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2NvbW1hbmRzL25tL25tMDEu
c2ggYi90ZXN0Y2FzZXMvY29tbWFuZHMvbm0vbm0wMS5zaAo+ICAgICBpbmRleCAzMGM0MWJkLi4y
OWI2YmQ3IDEwMDc1NQo+ICAgICAtLS0gYS90ZXN0Y2FzZXMvY29tbWFuZHMvbm0vbm0wMS5zaAo+
ICAgICArKysgYi90ZXN0Y2FzZXMvY29tbWFuZHMvbm0vbm0wMS5zaAo+ICAgICBAQCAtODQsNiAr
ODQsOSBAQCB0ZXN0NSgpCj4gICAgIMKgIMKgIMKgIMKgIEVYUEVDVF9QQVNTICROTSAtZiBic2Qg
JFRTVF9EQVRBUk9PVC9mMSBcPiBubV9ic2Qub3V0Cj4gICAgIMKgIMKgIMKgIMKgIEVYUEVDVF9Q
QVNTICROTSAtZiBwb3NpeCAkVFNUX0RBVEFST09UL2YxIFw+IG5tX3Bvc2l4Lm91dAo+Cj4gICAg
ICvCoCDCoCDCoCDCoFJPRCBhd2sgJ3twcmludCBnZW5zdWIoLygwKykoWzAtOWEtZkEtRl0rKS8s
ICJcXDIiLCAiZyIpfScgbm1fYnNkLm91dCBcPiBubV9ic2Qub3V0Cj4KPgo+IEFXSyBpcyBiYXNl
IG9uIHN0cmVhbSBlZGl0aW5nLCBtYXliZSB3ZSBuZWVkIHRoZSBvdXRwdXQgdG/CoGEgbmV3IGxv
ZyBmaWxlLgo+Cj4gICAgICvCoCDCoCDCoCDCoFJPRCBhd2sgJ3twcmludCBnZW5zdWIoLygwKyko
WzAtOWEtZkEtRl0rKS8sICJcXDIiLCAiZyIpfScgbm1fcG9zaXgub3V0IFw+IG5tX3Bvc2l4Lm91
dAo+Cj4KPiBUaGUgcmVnZXggaXMgbm90IGZpdCBmb3Igbm1fcG9zaXgub3V0IHNpbmNlIHRoaXMg
Zm9ybWF0wqBvZiBhZGRyZXNzIGRvZXMgbm90IHN0YXJ0IHdpdGggMDAwMDAwMDAwMCwgZS5nLgo+
Cj4gIyBjYXQgbm1fcG9zaXgub3V0IHwgZ3JlcCA0MDEwOGYKPiAuYW5ub2Jpbl9pbml0LmMgdCA0
MDEwOGYKPiAuYW5ub2Jpbl9pbml0LmNfZW5kIHQgNDAxMDhmwqAKPgo+ICMgZWNobyA0MDEwOGYg
fGF3ayAne3ByaW50IGdlbnN1YigvKDArKShbMC05YS1mQS1GXSspLywgIlxcMiIsICJnIil9Jwo+
IDQxMDhmCj4gwqAKPgo+ICAgICArCj4gICAgIMKgIMKgIMKgIMKgIFJPRCBhd2sgJ3twcmludCAk
MyAkMiAkMX0nIG5tX2JzZC5vdXQgXD4gbm0xLm91dAo+ICAgICDCoCDCoCDCoCDCoCBST0QgYXdr
ICd7cHJpbnQgJDEgJDIgJDN9JyBubV9wb3NpeC5vdXQgXD4gbm0yLm91dAo+Cj4gICAgIC0tIAo+
ICAgICAyLjcuNAo+Cj4KPiAgICAgLS0gCj4gICAgIE1haWxpbmcgbGlzdCBpbmZvOiBodHRwczov
L2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo+Cj4KPgo+IC0tIAo+IFJlZ2FyZHMsCj4gTGkg
V2FuZwoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0
aW5mby9sdHAK
