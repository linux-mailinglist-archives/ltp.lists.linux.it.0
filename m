Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A9B23EC31
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:16:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FA8E3C31F9
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:16:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 50EF03C31E2
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:16:20 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 39C891A011F3
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:16:17 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,445,1589212800"; d="scan'208";a="97771121"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 07 Aug 2020 19:16:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 441D54CE34EF;
 Fri,  7 Aug 2020 19:16:09 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 7 Aug 2020 19:16:11 +0800
To: Li Wang <liwang@redhat.com>
References: <1596793326-21639-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2d7+05ZT7UwePjtOuDKws-kK-5kt5LbyzV_zicFp51z2A@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1ca03e90-6885-4345-9be8-c1f37a6227ab@cn.fujitsu.com>
Date: Fri, 7 Aug 2020 19:16:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2d7+05ZT7UwePjtOuDKws-kK-5kt5LbyzV_zicFp51z2A@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 441D54CE34EF.A24EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_cgroup: Reset cgroup.clone_children value
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

SGkgTGkKCgo+IAo+IAo+IE9uIEZyaSwgQXVnIDcsIDIwMjAgYXQgNTo0MiBQTSBZYW5nIFh1IDx4
dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tIAo+IDxtYWlsdG86eHV5YW5nMjAxOC5qeUBjbi5m
dWppdHN1LmNvbT4+IHdyb3RlOgo+IAo+ICAgICBXaGVuIHJ1bm5pbmcgY2dyb3VwIHRlc3QgY2Fz
ZXMobGlrZSBjcHVzZXQwMSBvciBvb20wNSkgYWJvdXQgY3B1c2V0Cj4gICAgIHN1YnN5c3RlbQo+
ICAgICBmaXJzdGx5LCB0aGVuIGNwdXNldF9pbmhlcml0IGNhc2Ugd2lsbCBmYWlsIGJlY2F1c2Ug
dGhlIHZhbHVlIG9mCj4gICAgIGNncm91cC5jbG9uZV9jaGlsZHJlbiBoYXMgYmVlbiBjaGFuZ2Vk
IGludG8gMSBvbiBjZ3JvdXAtdjEuIFJlc2V0Cj4gICAgIHRoaXMgdmFsdWUKPiAgICAgd2hlbiBj
YWxsaW5nIHRzdF9jZ3JvdXBOX3Vtb3VudC4KPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogWWFuZyBY
dSA8eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbQo+ICAgICA8bWFpbHRvOnh1eWFuZzIwMTgu
anlAY24uZnVqaXRzdS5jb20+Pgo+ICAgICAtLS0KPiAgICAgIMKgbGliL3RzdF9jZ3JvdXAuYyB8
IDggKysrKysrKysKPiAgICAgIMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+
ICAgICBkaWZmIC0tZ2l0IGEvbGliL3RzdF9jZ3JvdXAuYyBiL2xpYi90c3RfY2dyb3VwLmMKPiAg
ICAgaW5kZXggOTQ1OWY3ZWEwLi43NjQ5NTFhZmEgMTAwNjQ0Cj4gICAgIC0tLSBhL2xpYi90c3Rf
Y2dyb3VwLmMKPiAgICAgKysrIGIvbGliL3RzdF9jZ3JvdXAuYwo+ICAgICBAQCAtOSw2ICs5LDgg
QEAKPiAgICAgIMKgI2luY2x1ZGUgPHN0ZGlvLmg+Cj4gICAgICDCoCNpbmNsdWRlIDxzdGRsaWIu
aD4KPiAgICAgIMKgI2luY2x1ZGUgPHN5cy9tb3VudC5oPgo+ICAgICArI2luY2x1ZGUgPGZjbnRs
Lmg+Cj4gICAgICsjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gCj4gICAgICDCoCNpbmNsdWRlICJ0c3Rf
dGVzdC5oIgo+ICAgICAgwqAjaW5jbHVkZSAidHN0X3NhZmVfbWFjcm9zLmgiCj4gICAgIEBAIC0x
MjMsNiArMTI1LDcgQEAgc3RhdGljIHZvaWQgdHN0X2Nncm91cE5fdW1vdW50KGNvbnN0IGNoYXIK
PiAgICAgKm1udF9wYXRoLCBjb25zdCBjaGFyICpuZXdfcGF0aCkKPiAgICAgIMKgIMKgIMKgIMKg
IEZJTEUgKmZwOwo+ICAgICAgwqAgwqAgwqAgwqAgaW50IGZkOwo+ICAgICAgwqAgwqAgwqAgwqAg
Y2hhciBzX25ld1tCVUZTSVpdLCBzW0JVRlNJWl0sIHZhbHVlW0JVRlNJWl07Cj4gICAgICvCoCDC
oCDCoCDCoGNoYXIga25vYl9wYXRoW1BBVEhfTUFYXTsKPiAKPiAgICAgIMKgIMKgIMKgIMKgIGlm
ICghdHN0X2lzX21vdW50ZWQobW50X3BhdGgpKQo+ICAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmV0dXJuOwo+ICAgICBAQCAtMTUxLDYgKzE1NCwxMSBAQCBzdGF0aWMgdm9pZCB0c3RfY2dy
b3VwTl91bW91bnQoY29uc3QgY2hhcgo+ICAgICAqbW50X3BhdGgsIGNvbnN0IGNoYXIgKm5ld19w
YXRoKQo+ICAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgIT0g
KHNzaXplX3Qpc3RybGVuKHZhbHVlKSAtIDEpCj4gICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0c3RfcmVzKFRXQVJOIHwgVEVSUk5PLCAid3JpdGUg
JXMiLCBzKTsKPiAgICAgIMKgIMKgIMKgIMKgIH0KPiAgICAgK8KgIMKgIMKgIMKgaWYgKHRzdF9j
Z192ZXIgJiBUU1RfQ0dST1VQX1YxKSB7Cj4gCj4gCj4gVG8gcmVjb2duaXplIGNncm91cF92MSBp
cyBub3QgZW5vdWdoIGhlcmUsIGJlY2F1c2UgaXQgd2lsbCAKPiBiZcKgZmFpbGVkwqAid2l0aMKg
bm8gc3VjaCBjZ3JvdXAuY2xvbmVfY2hpbGRyZW4gZmlsZSIgb24gTUVNQ0cgdW1vdW50wqBpZiAK
PiB0aGUgc3lzdGVtIG5vIENQVVNFVCBtb3VudGluZy4KSSBoYXMgdW1vdW50ZWQgY3B1c2V0LCBi
dXQgSSBzdGlsbCBzZWUgdGhpcyBmaWxlIGluIG1lbW9yeSBhcyBiZWxvdzoKCiNtb3VudCB8Z3Jl
cCBjcHVzZXQKbm90aGluZwojIGxzIC1sIC9zeXMvZnMvY2dyb3VwL21lbW9yeS9jZ3JvdXAuY2xv
bmVfY2hpbGRyZW4KLXJ3LXItLXItLS4gMSByb290IHJvb3QgMCBBdWcgIDcgMDg6MTYgCi9zeXMv
ZnMvY2dyb3VwL21lbW9yeS9jZ3JvdXAuY2xvbmVfY2hpbGRyZW4KCj4gCj4gTWF5YmUgYSBzbWFy
dCB3YXkgaXMgdG8gc2F2ZSB0aGUgY2dyb3VwLmNsb25lX2NoaWxkcmVuwqB2YWx1ZSwgcmVzdG9y
ZSBpdCAKPiBpZiBpdCBoYXMgYmVlbiBjaGFuZ2VkIGluIHRoZSBzZXR1cCBwaGFzZS4gV2hhdCBk
byB1IHRoaW5rPwpXZSBjYW4ganVzdCB1c2UgcHJpbnQgYW5kIHNjYW5mIGFwaSB0byBkbyB0aGlz
LgpCdXQgSSBkb24ndCBrbm93IHRoaXMgd2hldGhlciB0YWtlcyBiYWQgZWZmZWN0cyBvbiBjb21w
bGV4ZCBuZXN0aW5nIApzaXR1YXRpb24oaGFzIHN1YiBjZ3JvdXApLgoKPiAKPiAgICAgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc3ByaW50Zihrbm9iX3BhdGgsICIlcy9jZ3JvdXAuY2xvbmVfY2hp
bGRyZW4iLAo+ICAgICBtbnRfcGF0aCk7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlm
ICghYWNjZXNzKGtub2JfcGF0aCwgRl9PSykpCkhlcmUgaGFzIGEgY2hlY2sgZm9yIGNncm91cC5j
bG9uZV9jaGlsZHJlbiBzbyBpdCBzaG91bGQgbm90IHRyaWdnZXIgdW4gCnN1Y2ggZmlsZSBlcnJv
ci4KCnBzOiBJIHdpbGwgYWRkIGNsb25lX2NoaWxkcmVuIHN3aXRoIGludG8gY3B1X2luaGVyaXQg
Y2FzZS4KCkJlc3QgUmVnYXJkcwpZYW5nIFh1Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoFNBRkVfRklMRV9QUklOVEYoa25vYl9wYXRoLCAiJWQiLCAwKTsKPiAgICAg
K8KgIMKgIMKgIMKgfQo+ICAgICAgwqAgwqAgwqAgwqAgaWYgKGZkICE9IC0xKQo+ICAgICAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xvc2UoZmQpOwo+ICAgICAgwqAgwqAgwqAgwqAgaWYgKGZw
ICE9IE5VTEwpCj4gICAgIC0tIAo+ICAgICAyLjIzLjAKPiAKPiAKPiAKPiAKPiAKPiAtLSAKPiBS
ZWdhcmRzLAo+IExpIFdhbmcKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3Rz
LmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
