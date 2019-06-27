Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D6584A7
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 16:39:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33FA23C1C83
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jun 2019 16:39:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E7D353C1C6D
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 16:38:59 +0200 (CEST)
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 3FE506021AB
 for <ltp@lists.linux.it>; Thu, 27 Jun 2019 16:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=3ZJo5
 +/OWguV9Ah8iREgz1QYFM5DRotJnUDiZvLWvlY=; b=e5FoG/lMItO8DFaX/JV4L
 S5CRvZMW3NPcA6qOno46HM+Wn9SCY+XeQ4tJBstlUjbaTPbiai88RvbEu9iN4G1A
 DdUExV3O4aRwCHewhU2ZQmH+LqLGzn435NMxDEy2nAUnW+8yjixisU7lSR22ava2
 TxRQ4OQIVTktpTnEjGG9eM=
Received: from [192.168.0.7] (unknown [183.210.52.6])
 by smtp7 (Coremail) with SMTP id C8CowAD3YzH81BRdQokmBw--.28016S2;
 Thu, 27 Jun 2019 22:38:53 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
References: <20190626081735.31327-1-po-hsu.lin@canonical.com>
 <394ecb21-4ed5-cc0f-9c07-9dcea295604b@163.com>
Message-ID: <75697049-0403-43a3-71c5-b2f15b6970c4@163.com>
Date: Thu, 27 Jun 2019 22:38:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <394ecb21-4ed5-cc0f-9c07-9dcea295604b@163.com>
Content-Language: en-US
X-CM-TRANSID: C8CowAD3YzH81BRdQokmBw--.28016S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrWxury7uFWkWw1fCFW3Wrg_yoW8trW7pF
 W3GF45KrWfXF95Xan7ZF10g3W8XaykAanrWFyrtw4Sgr1kXF1F9F1qgr4rCr1DWr4UZa4I
 vrsrXa4fXa43XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jCeHDUUUUU=
X-Originating-IP: [183.210.52.6]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiEBbgXlWBmpWtgQAAsP
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runpwtests03: fix for module name retrieval
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

T24gMDYvMjcvMjAxOSAxMDoyNCBQTSwgWGlhbyBZYW5nIHdyb3RlOgo+IE9uIDA2LzI2LzIwMTkg
MDQ6MTcgUE0sIFBvLUhzdSBMaW4gd3JvdGU6Cj4+IFRoZSAtbCBmbGFnIGZvciBtb2Rwcm9iZSBo
YXMgYmVlbiBkZXByZWNhdGVkIGluIG5ld2VyIHBhY2thZ2VzLgo+PiBUaGlzIHdpbGwgaW5kdWNl
IHNvbWUgbm9pc2UgZHVyaW5nIHRoZSBleGVjdXRpb246Cj4+IMKgwqDCoMKgIG1vZHByb2JlOiBp
bnZhbGlkIG9wdGlvbiAtLSAnbCcKPj4KPj4gQW5kIG1ha2luZyB0aGUgIkxvYWRpbmcgYW5kIFVu
bG9hZGluZyBvZiBnb3Zlcm5vciBrZXJuZWwgbW9kdWxlcyIgdGVzdAo+PiBub3QgZG9pbmcgbW9k
dWxlIGxvYWQgLyB1bmxvYWQgb3BlcmF0aW9ucy4KPj4KPj4gRml4IHRoaXMgYnkgdXNpbmcgdGhl
IGZpbmQgY29tbWFuZCB0byByZXRyaWV2ZSBtb2R1bGUgbmFtZXMgaW5zdGVhZC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogUG8tSHN1IExpbiA8cG8taHN1LmxpbkBjYW5vbmljYWwuY29tPgo+PiAtLS0K
Pj4gwqAgdGVzdGNhc2VzL2tlcm5lbC9wb3dlcl9tYW5hZ2VtZW50L3J1bnB3dGVzdHMwMy5zaCB8
IDggKysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvcG93ZXJfbWFuYWdl
bWVudC9ydW5wd3Rlc3RzMDMuc2ggCj4+IGIvdGVzdGNhc2VzL2tlcm5lbC9wb3dlcl9tYW5hZ2Vt
ZW50L3J1bnB3dGVzdHMwMy5zaAo+PiBpbmRleCAxMTE5NzkzN2YuLjgxZDQ0ZjliMSAxMDA3NTUK
Pj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9wb3dlcl9tYW5hZ2VtZW50L3J1bnB3dGVzdHMwMy5z
aAo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3Bvd2VyX21hbmFnZW1lbnQvcnVucHd0ZXN0czAz
LnNoCj4+IEBAIC0xMTgsOCArMTE4LDggQEAgcHdrbV9sb2FkX3VubG9hZCgpIHsKPj4gwqDCoMKg
wqDCoCBSQz0wCj4+IMKgwqDCoMKgwqAgbG9hZGVkX2dvdmVybm9yPWBjYXQgXAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1MC9jcHVmcmVxL3NjYWxpbmdf
Z292ZXJub3JgCj4+IC3CoMKgwqAgZm9yIG1vZHVsZSBpbiBgbW9kcHJvYmUgLWwgfCBncmVwIGNw
dWZyZXFfIHwgXAo+PiAtwqDCoMKgwqDCoMKgwqAgY3V0IC1mOCAtZCIvIiB8IGN1dCAtZjEgLWQi
LiJgCj4+ICvCoMKgwqAgZm9yIG1vZHVsZSBpbiBgZmluZCAvbGliL21vZHVsZXMvJCh1bmFtZSAt
cikgLW5hbWUgCj4+ICIqY3B1ZnJlcV8qLmtvIiBcCj4+ICvCoMKgwqDCoMKgwqDCoCAtcHJpbnRm
ICIlZlxuIiB8IGN1dCAtZjEgLWQiLiJgCj4gSGksCj4KPiBXZSBtYXkgaW5zdGFsbCBjb21wcmVz
c2VkIGtlcm5lbCBtb2R1bGVzKGUuZy4gY3B1ZnJlcV91c2Vyc3BhY2Uua28ueHopIAo+IHNvIHdl
IHNob3VsZCBtYXRjaAo+IHRoZXNlIGRpZmZlcmVudCBmb3JtYXRzLgo+Cj4gVGhlcmUgYXJlIHN0
aWxsIG90aGVyIGlzc3VlcyhlLmcuIHRlc3QgaXMgc2tpcHBlZCBpZiBDUFVfRlJFUSBpcyBidWls
dCAKPiBhcyBhIG1vZHVsZSkgaW4gdGhlIG9sZCBjb2RlLgpIaSwKClBTOiB0ZXN0IGlzIHNraXBw
ZWQgaWYgQ09ORklHX1g4Nl9BQ1BJX0NQVUZSRVEgaW5zdGVhZCBvZiBDUFVfRlJFUSBpcyAKYnVp
bHQgYXMgYSBtb2R1bGUgYW5kIGlzIG5vdCBsb2FkZWQuCgo+IFdlIHNob3VsZCByZXdyaXRlIGl0
IHRvIG5ldyBBUEkgZmlyc3QgYW5kIGZpeCB0aGVzZSBpc3N1ZXMgaW5jbHVkaW5nIAo+IGludmFs
aWQgIi1sIiBvcHRpb24gYnkgdGhlIHdheS4KPgo+IEJlc3QgUmVnYXJkcywKPiBYaWFvIFlhbmcK
Pj4gwqDCoMKgwqDCoCBkbwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgI2VjaG8gLW4gIkxvYWRpbmcg
JG1vZHVsZSAuLi4gIgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgWyAkbW9kdWxlICE9ICJjcHVm
cmVxXyRsb2FkZWRfZ292ZXJub3IiIF07IHRoZW4KPj4gQEAgLTEzMSw4ICsxMzEsOCBAQCBwd2tt
X2xvYWRfdW5sb2FkKCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZmkKPj4gwqDCoMKgwqDCoCBkb25lCj4+IC3CoMKgwqAgZm9yIG1vZHVs
ZSBpbiBgbW9kcHJvYmUgLWwgfCBncmVwIGNwdWZyZXFfIHwgXAo+PiAtwqDCoMKgwqDCoMKgwqAg
Y3V0IC1mOCAtZCIvIiB8IGN1dCAtZjEgLWQiLiJgCj4+ICvCoMKgwqAgZm9yIG1vZHVsZSBpbiBg
ZmluZCAvbGliL21vZHVsZXMvJCh1bmFtZSAtcikgLW5hbWUgCj4+ICIqY3B1ZnJlcV8qLmtvIiBc
Cj4+ICvCoMKgwqDCoMKgwqDCoCAtcHJpbnRmICIlZlxuIiB8IGN1dCAtZjEgLWQiLiJgCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBkbwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgI2VjaG8gLW4gIlVubG9h
ZGluZyAkbW9kdWxlIC4uLiAiCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBbICRtb2R1bGUgIT0g
ImNwdWZyZXFfJGxvYWRlZF9nb3Zlcm5vciIgXTsgdGhlbgo+Cj4KPgoKCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
