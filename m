Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDA86F90E8
	for <lists+linux-ltp@lfdr.de>; Sat,  6 May 2023 11:31:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F2D53CB605
	for <lists+linux-ltp@lfdr.de>; Sat,  6 May 2023 11:31:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ACADA3C9954
 for <ltp@lists.linux.it>; Sat,  6 May 2023 11:31:49 +0200 (CEST)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B614D600665
 for <ltp@lists.linux.it>; Sat,  6 May 2023 11:31:47 +0200 (CEST)
X-UUID: d8ed57965fc24539b137026f32d73691-20230506
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:0169c5e5-fed0-4938-9394-4edb6eb90b91, IP:5,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-15
X-CID-INFO: VERSION:1.1.22, REQID:0169c5e5-fed0-4938-9394-4edb6eb90b91, IP:5,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-15
X-CID-META: VersionHash:120426c, CLOUDID:e90bfabf-e32c-4c97-918d-fbb3fc224d4e,
 B
 ulkID:2305060150419ZG8XGWU,BulkQuantity:1,Recheck:0,SF:24|17|19|44|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: d8ed57965fc24539b137026f32d73691-20230506
X-User: zenghao@kylinos.cn
Received: from [172.20.12.253] [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 467025575; Sat, 06 May 2023 17:31:40 +0800
Message-ID: <3724afefd2397964a2e8703655d42e529683c051.camel@kylinos.cn>
From: Hao Zeng <zenghao@kylinos.cn>
To: Petr Vorel <pvorel@suse.cz>
Date: Sat, 06 May 2023 17:31:32 +0800
In-Reply-To: <20230505174141.GA36292@pevik>
References: <6b2a7ceb.4466.1874a537430.Coremail.crawler2015@163.com>
 <20230505174141.GA36292@pevik>
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] testcases:Fix the failure of shell script to get
 path
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCAyMDIzLTA1LTA1IGF0IDE5OjQxICswMjAwLCBQZXRyIFZvcmVsIHdyb3RlOgoKaGkg
UGV0cgpUaGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIHJlcGx5LiAKSSB3aWxsIGZvbGxvdyB5b3Vy
IHN1Z2dlc3Rpb24gYW5kIHN1Ym1pdCB0aGUgVjIgdmVyc2lvbgoKQmVzdCByZWdhcmRzCkhhbwo+
IAo+IAo+ID4gRnJvbSA5ZjM3MmQyZDRjOWE5ZGY5Y2RhMWE3YWZjZWRkYWEyYWNjYTI3ZjAzIE1v
biBTZXAgMTcgMDA6MDA6MDAKPiA+IDIwMDEKPiA+IEZyb206IEhhbyBaZW5nIDx6ZW5naGFvQGt5
bGlub3MuY24+Cj4gPiBEYXRlOiBGcmksIDMxIE1hciAyMDIzIDE3OjA0OjA3ICswODAwCj4gPiBT
dWJqZWN0OiBbTFRQXSBbUEFUQ0hdIHRlc3RjYXNlczpGaXggdGhlIGZhaWx1cmUgb2Ygc2hlbGwg
c2NyaXB0IHRvCj4gPiBnZXQgcGF0aAo+IAo+ID4gRm9yIGV4YW1wbGUsIGluIHRoZSBmaWxlCj4g
PiB0ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2NwdXNldC9jcHVzZXRfZnVuY3Muc2gsIGlm
IHRoZSBwYXRoIGlzCj4gPiBvYnRhaW5lZCBieQo+ID4gZmluZCAiJENQVVNFVCIgLXR5cGUgZCB8
IHNvcnQgfCBzZWQgLW4gJzIsJHAnIHwgdGFjIHwgd2hpbGUgcmVhZAo+ID4gc3ViZGlyLCB0aGUg
ZXNjYXBlZCBjaGFyYWN0ZXJzIHdpbGwgYmUgbG9zdCwKPiA+IGFuZCBieSBhZGRpbmcgdGhlIC1y
IG9wdGlvbiwgdGhlIGVzY2FwZWQgY2hhcmFjdGVycyB3aWxsIGJlIGtlcHQgYXMKPiA+IHRoZXkg
YXJlIHdpdGhvdXQgZXNjYXBpbmcKPiA+IFRoZSBlcnJvcnMgYXJlIGFzIGZvbGxvd3M6Cj4gPiAv
b3B0L2x0cC90ZXN0Y2FzZXMvYmluL2NwdXNldF9mdW5jcy5zaDpsaW5lMTc4Ogo+ID4gL2Rldi9j
cHVzZXQvbWFjaGluZS5zbGljZS9tYWNoaW5lLQo+ID4gcWVtdXgyZDE1N3gyZHpoeDJkc3hmLnNj
b3BlL3ZjcHU3L3Rhc2tzOiBUaGUgZmlsZSBvciBkaXJlY3RvcnkgaXMKPiA+IG5vdCBhdmFpbGFi
bGUKPiA+IHJtZGlyOiBkZWxldGUgJy9kZXYvY3B1c2V0L21hY2hpbmUuc2xpY2UvbWFjaGluZS0K
PiA+IHFlbXV4MmQxNTd4MmR6aHgyZHN4Zi5zY29wZS92Y3B1NycgRmFpbHVyZTogVGhlIGZpbGUg
b3IgZGlyZWN0b3J5Cj4gPiBpcyBub3QgYXZhaWxhYmxlCj4gPiBjcHVzZXRfbWVtb3J5X3ByZXNz
dXJlIDEgVEZBSUw6IENvdWxkbid0IHJlbW92ZSBzdWJkaXIgLQo+ID4gL29wdC9sdHAvdGVzdGNh
c2VzL2Jpbi9jcHVzZXRfZnVuY3Muc2g6bGluZTE3ODoKPiA+IC9kZXYvY3B1c2V0L21hY2hpbmUu
c2xpY2UvbWFjaGluZS0KPiA+IHFlbXV4MmQxNTd4MmR6aHgyZHN4Zi5zY29wZS92Y3B1Ny90YXNr
czogVGhlIGZpbGUgb3IgZGlyZWN0b3J5IGlzCj4gPiBub3QgYXZhaWxhYmxlCj4gPiBybWRpcjog
ZGVsZXRlICcvZGV2L2NwdXNldC9tYWNoaW5lLnNsaWNlL21hY2hpbmUtCj4gPiBxZW11eDJkMTU3
eDJkemh4MmRzeGYuc2NvcGUvdmNwdTcnIEZhaWx1cmU6IFRoZSBmaWxlIG9yIGRpcmVjdG9yeQo+
ID4gaXMgbm90IGF2YWlsYWJsZQo+ID4gY3B1c2V0X21lbW9yeV9wcmVzc3VyZSAxIFRGQUlMOiBD
b3VsZG4ndCByZW1vdmUgc3ViZGlyIC0KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEhhbyBaZW5nIDx6
ZW5naGFvQGt5bGlub3MuY24+Cj4gPiAtLS0KPiA+IMKgdGVzdGNhc2VzL2tlcm5lbC9jb250cm9s
bGVycy9jcHVjdGxfZmovcnVuX2NwdWN0bF90ZXN0X2ZqLnNoIHwgMgo+ID4gKy0KPiA+IMKgdGVz
dGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jcHVzZXQvY3B1c2V0X2Z1bmNzLnNowqDCoMKgwqDC
oMKgwqDCoMKgIHwgMgo+ID4gKy0KPiA+IMKgdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRl
L3NjcmlwdHMvZ2VuZXJhdGUtbWFrZWZpbGVzLnNoIHwgMgo+ID4gKy0KPiA+IMKgMyBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gPiBkaWZmIC0tZ2l0
Cj4gPiBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY3B1Y3RsX2ZqL3J1bl9jcHVjdGxf
dGVzdF9mai5zaAo+ID4gYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2NwdWN0bF9mai9y
dW5fY3B1Y3RsX3Rlc3RfZmouc2gKPiA+IGluZGV4IGFiNzNjODAxYi4uNWNiNmJiNTY2IDEwMDc1
NQo+ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9jcHVjdGxfZmovcnVuX2Nw
dWN0bF90ZXN0X2ZqLnNoCj4gPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2Nw
dWN0bF9mai9ydW5fY3B1Y3RsX3Rlc3RfZmouc2gKPiA+IEBAIC02Myw3ICs2Myw3IEBAIGNsZWFu
dXAoKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMAo+ID4gwqDC
oMKgwqDCoMKgwqDCoH0KPiAKPiA+IC3CoMKgwqDCoMKgwqDCoGZpbmQgJENQVUNUTCAtdHlwZSBk
IHwgc29ydCB8IHNlZCAtbiAnMiwkcCcgfCB0YWMgfCB3aGlsZQo+ID4gcmVhZCB0bXBkaXIKPiA+
ICvCoMKgwqDCoMKgwqDCoGZpbmQgJENQVUNUTCAtdHlwZSBkIHwgc29ydCB8IHNlZCAtbiAnMiwk
cCcgfCB0YWMgfCB3aGlsZQo+ID4gcmVhZCAtciB0bXBkaXIKPiA+IMKgwqDCoMKgwqDCoMKgwqBk
bwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3aGlsZSByZWFkIHRtcHBpZAo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbwo+ID4gZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvY3B1c2V0L2NwdXNldF9mdW5jcy5zaAo+ID4gYi90
ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL2NwdXNldC9jcHVzZXRfZnVuY3Muc2gKPiA+IGlu
ZGV4IDg3YmE3ZGExZi4uMGNmYTBjMTdlIDEwMDc1NQo+ID4gLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9jb250cm9sbGVycy9jcHVzZXQvY3B1c2V0X2Z1bmNzLnNoCj4gPiArKysgYi90ZXN0Y2FzZXMv
a2VybmVsL2NvbnRyb2xsZXJzL2NwdXNldC9jcHVzZXRfZnVuY3Muc2gKPiA+IEBAIC0xODQsNyAr
MTg0LDcgQEAgY2xlYW51cCgpCj4gPiDCoMKgwqDCoMKgwqDCoMKgZWNobyAkQ0hJTERSRU5fVkFM
VUUgPiAkQ0xPTkVfQ0hJTERSRU4KPiA+IMKgwqDCoMKgwqDCoMKgwqBlY2hvICRTQ0hFRF9MQl9W
QUxVRSA+ICRTQ0hFRF9MQgo+IAo+ID4gLcKgwqDCoMKgwqDCoMKgZmluZCAiJENQVVNFVCIgLXR5
cGUgZCB8IHNvcnQgfCBzZWQgLW4gJzIsJHAnIHwgdGFjIHwgd2hpbGUKPiA+IHJlYWQgc3ViZGly
Cj4gPiArwqDCoMKgwqDCoMKgwqBmaW5kICIkQ1BVU0VUIiAtdHlwZSBkIHwgc29ydCB8IHNlZCAt
biAnMiwkcCcgfCB0YWMgfCB3aGlsZQo+ID4gcmVhZCAtciBzdWJkaXIKPiA+IMKgwqDCoMKgwqDC
oMKgwqBkbwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3aGlsZSByZWFkIHBp
ZAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbwo+ID4gZGlmZiAtLWdpdCBh
L3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zY3JpcHRzL2dlbmVyYXRlLQo+ID4gbWFr
ZWZpbGVzLnNoIGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvZ2VuZXJh
dGUtCj4gPiBtYWtlZmlsZXMuc2gKPiA+IGluZGV4IDA2NDljNDgwZi4uZjNhZjNjZWRlIDEwMDc1
NQo+ID4gLS0tIGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvZ2VuZXJh
dGUtbWFrZWZpbGVzLnNoCj4gPiArKysgYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUv
c2NyaXB0cy9nZW5lcmF0ZS1tYWtlZmlsZXMuc2gKPiA+IEBAIC0zMTIsNyArMzEyLDcgQEAgZ2Vu
ZXJhdGVfbG9jYXRlX3Rlc3RfbWFrZWZpbGUgYnVpbGRvbmx5ICcudGVzdCcKPiA+ICIkYnVpbGRv
bmx5X2NvbXBpbGVyX2FyZ3MiCj4gPiDCoGdlbmVyYXRlX2xvY2F0ZV90ZXN0X21ha2VmaWxlIHJ1
bm5hYmxlICcucnVuLXRlc3QnCj4gPiDCoGdlbmVyYXRlX2xvY2F0ZV90ZXN0X21ha2VmaWxlIHRl
c3QtdG9vbHMgJycKPiAKPiA+IC1maW5kIC4gLW5hbWUgTWFrZWZpbGUuMSAtZXhlYyBkaXJuYW1l
IHt9IFw7IHwgd2hpbGUgcmVhZCBkaXI7IGRvCj4gPiArZmluZCAuIC1uYW1lIE1ha2VmaWxlLjEg
LWV4ZWMgZGlybmFtZSB7fSBcOyB8IHdoaWxlIHJlYWQgLXIgZGlyOwo+ID4gZG8KPiA+IMKgwqDC
oMKgwqDCoMKgwqBpZiBbIC1mICIkZGlyL01ha2VmaWxlLjIiIF07IHRoZW4KPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2F0ICRkaXIvTWFrZWZpbGUuMSAkZGlyL01ha2VmaWxl
LjIgJGRpci9NYWtlZmlsZS4zCj4gPiA+ICRkaXIvTWFrZWZpbGUKPiA+IMKgwqDCoMKgwqDCoMKg
wqBmaQo+IAo+IEknZCByZW1vdmUgY2hhbmdlIGluIHRlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3Rz
dWl0ZS9zY3JpcHRzL2dlbmVyYXRlLQo+IG1ha2VmaWxlcy5zaAo+IElNSE8gcHJvYmxlbWF0aWMg
YXJlIG9ubHkgY29udHJvbGxlcnMgc2hlbGwgc2NyaXB0cy4gT25seSBjcHVzZXQgYXJlCj4gcmVs
ZXZhbnQKPiB0byBiZSBlc2NhcGVkLiBBbHNvLCB3ZSBjb3VsZCB1c2Ugc3lzdGVtZC1lc2NhcGU6
Cj4gCj4gc3lzdGVtZC1lc2NhcGUgLXUgJ21hY2hpbmUtcWVtdVx4MmQzXHgyZHpoXHgyZG5vZGUx
LnNjb3BlJyAtPgo+IG1hY2hpbmUvcWVtdS0zLXpoLW5vZGUxLnNjb3BlCj4gCj4gYnV0IHRoZXJl
IGFyZSBTVVQgd2l0aG91dCBzeXN0ZW1kLCB0aHVzIGxldCdzIGtlZXAgInJlYWQgLXIiLgo+IAo+
IChXZSBhbHJlYWR5IHRhbGtlZCBhYm91dCBpdCwgYnV0IHlvdSB3ZXJlbid0IHN1YnNjcmliZWQs
IHRodXMKPiBtZXNzYWdlcyBnb3QKPiBsb3N0LCBzZWUgdGhlIGRldGFpbHMgYmVsb3cuKQo+IAo+
IFJldmlld2VkLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPiAKPiAKPiBLaW5kIHJl
Z2FyZHMsCj4gUGV0cgo+IAo+ID4gRGVhciBQZXRyCj4gPiBUaGFuayB5b3UgZm9yIHRha2luZyB0
aGUgdGltZSB0byByZXBseSB0byBteSBlbWFpbC4gSSBhcHByZWNpYXRlCj4gPiB5b3VyIHByb21w
dAo+ID4gcmVzcG9uc2UgYW5kIHRoZSB2YWx1YWJsZSBpbmZvcm1hdGlvbiB5b3UgaGF2ZSBwcm92
aWRlZC4KPiAKPiA+IOWcqCAyMDIzLzQvNCAyMTozNiwgUGV0ciBWb3JlbCDlhpnpgZM6Cj4gPiA+
ID4gRm9yIGV4YW1wbGUsIGluIHRoZSBmaWxlCj4gPiA+ID4gdGVzdGNhc2VzL2tlcm5lbC9jb250
cm9sbGVycy9jcHVzZXQvY3B1c2V0X2Z1bmNzLnNoLCBpZiB0aGUKPiA+ID4gPiBwYXRoIGlzIG9i
dGFpbmVkIGJ5Cj4gPiA+ID4gZmluZCAiJENQVVNFVCIgLXR5cGUgZCB8IHNvcnQgfCBzZWQgLW4g
JzIsJHAnIHwgdGFjIHwgd2hpbGUKPiA+ID4gPiByZWFkIHN1YmRpciwgdGhlIGVzY2FwZWQgY2hh
cmFjdGVycyB3aWxsIGJlIGxvc3QsCj4gPiA+ID4gYW5kIGJ5IGFkZGluZyB0aGUgLXIgb3B0aW9u
LCB0aGUgZXNjYXBlZCBjaGFyYWN0ZXJzIHdpbGwgYmUKPiA+ID4gPiBrZXB0IGFzIHRoZXkgYXJl
IHdpdGhvdXQgZXNjYXBpbmcKPiA+ID4gPiBUaGUgZXJyb3JzIGFyZSBhcyBmb2xsb3dzOgo+ID4g
PiA+IC9vcHQvbHRwL3Rlc3RjYXNlcy9iaW4vY3B1c2V0X2Z1bmNzLnNoOmxpbmUxNzg6Cj4gPiA+
ID4gL2Rldi9jcHVzZXQvbWFjaGluZS5zbGljZS9tYWNoaW5lLQo+ID4gPiA+IHFlbXV4MmQxNTd4
MmR6aHgyZHN4Zi5zY29wZS92Y3B1Ny90YXNrczogVGhlIGZpbGUgb3IgZGlyZWN0b3J5Cj4gPiA+
ID4gaXMgbm90IGF2YWlsYWJsZQo+ID4gPiBDb3VsZCB5b3UgcHJpbnQgdGhlIHBhdGggaG93IGl0
IGxvb2tzIGxpa2Ugd2l0aCBsczoKPiAKPiA+ID4gbHMgLWwgL2Rldi9jcHVzZXQvbWFjaGluZS5z
bGljZS8KPiA+IGxzIC1sIC9kZXYvY3B1c2V0L21hY2hpbmUuc2xpY2UvCj4gPiAtcnctci0tci0t
IDEgcm9vdCByb290IDDCoCBBcHLCoCA1IDEzOjQ0wqAgY2dyb3VwLmNsb25lX2NoaWxkcmVuCj4g
PiAtcnctci0tci0tIDEgcm9vdCByb290IDDCoCBBcHLCoCA1IDEzOjQ0wqAgY2dyb3VwLnByb2Nz
Cj4gPiAtcnctci0tci0tIDEgcm9vdCByb290IDDCoCBBcHLCoCA1IDEzOjQ0wqAgY3B1c2V0LmNw
dV9leGNsdXNpdmUKPiA+IC1ydy1yLS1yLS0gMSByb290IHJvb3QgMMKgIEFwcsKgIDQgMTc6NDHC
oCBjcHVzZXQuY3B1cwo+ID4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCAwwqAgQXBywqAgNSAxMzo0
NMKgIGNwdXNldC5lZmZlY3RpdmVfY3B1cwo+ID4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCAwwqAg
QXBywqAgNSAxMzo0NMKgIGNwdXNldC5lZmZlY3RpdmVfbWVtcwo+ID4gLXJ3LXItLXItLSAxIHJv
b3Qgcm9vdCAwwqAgQXBywqAgNSAxMzo0NMKgIGNwdXNldC5tZW1fZXhjbHVzaXZlCj4gPiAtcnct
ci0tci0tIDEgcm9vdCByb290IDDCoCBBcHLCoCA1IDEzOjQ0wqAgY3B1c2V0Lm1lbV9oYXJkd2Fs
bAo+ID4gLXJ3LXItLXItLSAxIHJvb3Qgcm9vdCAwwqAgQXBywqAgNCAxNzo0McKgIGNwdXNldC5t
ZW1vcnlfbWlncmF0ZQo+ID4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCAwwqAgQXBywqAgNSAxMzo0
NMKgIGNwdXNldC5tZW1vcnlfcHJlc3N1cmUKPiA+IC1ydy1yLS1yLS0gMSByb290IHJvb3QgMMKg
IEFwcsKgIDUgMTM6NDTCoCBjcHVzZXQubWVtb3J5X3NwcmVhZF9wYWdlCj4gPiAtcnctci0tci0t
IDEgcm9vdCByb290IDDCoCBBcHLCoCA1IDEzOjQ0wqAgY3B1c2V0Lm1lbW9yeV9zcHJlYWRfc2xh
Ygo+ID4gLXJ3LXItLXItLSAxIHJvb3Qgcm9vdCAwwqAgQXBywqAgNCAxNzo0McKgIGNwdXNldC5t
ZW1zCj4gPiAtcnctci0tci0tIDEgcm9vdCByb290IDDCoCBBcHLCoCA1IDEzOjQ0wqAgY3B1c2V0
LnNjaGVkX2xvYWRfYmFsYW5jZQo+ID4gLXJ3LXItLXItLSAxIHJvb3Qgcm9vdCAwwqAgQXBywqAg
NSAxMzo0NAo+ID4gY3B1c2V0LnNjaGVkX3JlbGF4X2RvbWFpbl9sZXZlbAo+ID4gZHJ3eHIteHIt
eCA2IHJvb3Qgcm9vdCAwwqAgQXBywqAgNSAxMzo0NAo+ID4gJ21hY2hpbmUtcWVtdVx4MmQzXHgy
ZHpoXHgyZG5vZGUxLnNjb3BlJwo+ID4gLXJ3LXItLXItLSAxIHJvb3Qgcm9vdCAwwqAgQXBywqAg
NSAxMzo0NMKgIG5vdGlmeV9vbl9yZWxlYXNlCj4gPiAtcnctci0tci0tIDEgcm9vdCByb290IDDC
oCBBcHLCoCA1IDEzOjQ0wqAgdGFza3MKPiAKPiA+ID4gRllJIGNncm91cCB0ZXN0cyB3cml0dGVu
IGluIHNoZWxsIGFyZSBicm9rZW4gYnkgZGVzaWduLCB3ZSB3cml0ZQo+ID4gPiBuZXcgdGVzdHMg
aW4gQy4KPiA+ID4gTm90IHN1cmUgaWYgdGhlc2Ugb2xkIHRlc3RzIGFyZSByZWxldmFudCBlbm91
Z2ggdG8gYmUgcmV3cml0dGVuCj4gPiA+IGludG8gQy4KPiAKPiA+ID4gLi4uCj4gPiBnZXQgaXQK
PiA+ID4gPiArKysgYi90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvc2NyaXB0cy9nZW5l
cmF0ZS0KPiA+ID4gPiBtYWtlZmlsZXMuc2gKPiA+ID4gPiBAQCAtMzEyLDcgKzMxMiw3IEBAIGdl
bmVyYXRlX2xvY2F0ZV90ZXN0X21ha2VmaWxlIGJ1aWxkb25seQo+ID4gPiA+ICcudGVzdCcgIiRi
dWlsZG9ubHlfY29tcGlsZXJfYXJncyIKPiA+ID4gPiDCoCBnZW5lcmF0ZV9sb2NhdGVfdGVzdF9t
YWtlZmlsZSBydW5uYWJsZSAnLnJ1bi10ZXN0Jwo+ID4gPiA+IMKgIGdlbmVyYXRlX2xvY2F0ZV90
ZXN0X21ha2VmaWxlIHRlc3QtdG9vbHMgJycKPiA+ID4gPiAtZmluZCAuIC1uYW1lIE1ha2VmaWxl
LjEgLWV4ZWMgZGlybmFtZSB7fSBcOyB8IHdoaWxlIHJlYWQgZGlyOwo+ID4gPiA+IGRvCj4gPiA+
ID4gK2ZpbmQgLiAtbmFtZSBNYWtlZmlsZS4xIC1leGVjIGRpcm5hbWUge30gXDsgfCB3aGlsZSBy
ZWFkIC1yCj4gPiA+ID4gZGlyOyBkbwo+ID4gPiBJIGRvbid0IHRoaW5rIGl0J3MgbmVlZGVkIGZv
ciBvcGVuIHBvc2l4Lgo+ID4gSSBhZ3JlZSB3aXRoIHlvdXIgdmlld3BvaW50Lgo+IAo+ID4gPiBL
aW5kIHJlZ2FyZHMsCj4gPiA+IFBldHIKPiA+IEJlc3QgcmVnYXJkcwo+ID4gSGFvCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
