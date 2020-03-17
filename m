Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A3187961
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 06:53:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59D223C55CA
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 06:53:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D5B3E3C55C0
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 06:52:58 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0A234600BC4
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 06:52:55 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,563,1574092800"; d="scan'208";a="86448813"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 13:52:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 56ECD406AB15;
 Tue, 17 Mar 2020 13:42:45 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 13:52:48 +0800
Message-ID: <5E7065AE.8080900@cn.fujitsu.com>
Date: Tue, 17 Mar 2020 13:52:46 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Zouwei (Samuel)" <zou_wei@huawei.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
 <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
 <b9c6b8c9-987b-fc71-4a5c-0844ea63d7ff@cn.fujitsu.com>
 <C3CD0DF8AD11A84CB25A1426DE537C61E590FAF6@dggeml524-mbx.china.huawei.com>
In-Reply-To: <C3CD0DF8AD11A84CB25A1426DE537C61E590FAF6@dggeml524-mbx.china.huawei.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 56ECD406AB15.AADEF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?b?562U5aSNOiAgW1BBVENIXSBwdGhyZWFkX2NvbmRfaW5pdC9z?=
 =?utf-8?q?-c=2Ec=3A_Add_the_lose_ifndef_line?=
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjAyMC8zLzE3IDExOjA2LCBab3V3ZWkgKFNhbXVlbCkgd3JvdGU6Cj4gSGkgWHUKPgo+IFRo
YW5rcyBmb3IgeW91ciBhbnN3ZXJzIGFuZCByZXZpZXdzLgo+Cj4gV2hlbiBJIHVzZWQgdGhlIG9w
ZW4tcG9zaXggdGVzdHN1aXRlLCBJIG1vZGlmaWVkIG11bHRpcGxlIGZpbGVzIGJlZm9yZSBjb21w
aWxpbmcgc3VjY2Vzc2Z1bGx5Lgo+Cj4gSXQgaXMgaG9wZWQgdGhhdCBpbiBmdXR1cmUgTFRQIHJl
bGVhc2UgdmVyc2lvbnMsIG9wZW4tcG9zaXggY2FuIGJlIGF1dG9tYXRpY2FsbHkgZW5hYmxlZCBh
bmQgY2FuIGJlIHN1Y2Nlc3NmdWxseSBjb21waWxlZCB3aXRob3V0IG1vZGlmaWNhdGlvbi4KSGkg
Wm91LAoKWW91IGNhbiBzZW5kIHNvbWUgcGF0Y2hlcyB0byBmaXggdGhlbSBkaXJlY3RseS4KClRo
YW5rcywKWGlhbyBZYW5nCj4KPiBCVFcsIFRoZSBmaWxlcyBJIG1vZGlmaWVkIGFyZSBhcyBmb2xs
b3dzOgo+IGx0cC90ZXN0Y2FzZXMvTWFrZWZpbGUKPiBAQCAtMzAsOSArMzAsOSBAQCBpbmNsdWRl
ICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9lbnZfcHJlLm1rCj4gICAjICAgIHJ1bikuCj4gICBG
SUxURVJfT1VUX0RJUlMgICAgICAgICAgICAgICAgOj0ga2R1bXAKPgo+IC1pZm5lcSAoJChXSVRI
X09QRU5fUE9TSVhfVEVTVFNVSVRFKSx5ZXMpCj4gLUZJTFRFUl9PVVRfRElSUyAgICAgICAgICAg
ICAgICArPSBvcGVuX3Bvc2l4X3Rlc3RzdWl0ZQo+IC1lbmRpZgo+Cj4gICBpZm5lcSAoJChXSVRI
X1JFQUxUSU1FX1RFU1RTVUlURSkseWVzKQo+ICAgRklMVEVSX09VVF9ESVJTICAgICAgICAgICAg
ICAgICs9IHJlYWx0aW1lCj4KPiBsdHAvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL0xE
RkxBR1MKPiBAQCAtMCwwICsxIEBACj4gKy1scHRocmVhZCAtbHJ0IC1sbQo+Cj4gbHRwL3Rlc3Rj
YXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9mdW5jdGlvbmFsL01ha2VmaWxlCj4gQEAgLTUsNyAr
NSw3IEBACj4gICAjCj4KPiAgIGFsbCBjbGVhbiBpbnN0YWxsIHRlc3Q6Cj4gLQlAZm9yIGRpciBp
biBgbHMgLWQgKi9NYWtlZmlsZSAyPi9kZXYvbnVsbCB8IHNlZCAtZSAncywvTWFrZWZpbGUkJCws
ZydgOyBkbyBcCj4gKwlAZm9yIGRpciBpbiBgZmluZCAuIC1uYW1lICpNYWtlZmlsZSB8IGVncmVw
IC12ICdeLi9NYWtlZmlsZScgfCBzZWQgLWUgJ3MsL01ha2VmaWxlJCQsLGcnYDsgZG8gXAo+ICAg
CQkkKE1BS0UpIC1DICQkZGlyICRAOwkJCQkJCSAgIFwKPiAgIAlkb25lCj4KPiBsdHAvdGVzdGNh
c2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3NjcmlwdHMvbG9jYXRlLXRlc3QKPiBAQCAtOTIsNyAr
OTIsOCBAQCBydW5uYWJsZSkKPiAgIAkjIHdhbHR6IGRvd24gdGhlIHRvb2xzIGRpcmVjdG9yeSBh
bmQgdHJ5IGFuZCBidWlsZCB0MCAod2hpY2ggZG9lc24ndAo+ICAgCSMgbWFrZSBzZW5zZSBhcyBp
dCdzIGEgdG9vbCwgbm90IGEgdGVzdCkuIEJldHRlciBjcml0ZXJpb24gbmVlZHMgdG8KPiAgIAkj
IGJlIGVzdGFibGlzaGVkIGZvciB0aGlzIGZpbGUuCj4gLQlmaW5kICIkV0hFUkUvY29uZm9ybWFu
Y2UiICIkV0hFUkUvc3RyZXNzIiAtdHlwZSBmIC1uYW1lICcqWzAtOV0uYycgLW8gLW5hbWUgJ1sw
LTldKi1bMC05XSouc2gnIHwgZ3JlcCAtdiBidWlsZG9ubHkgfCBncmVwIC12ICdeLi90b29scycK
PiArCWZpbmQgIiRXSEVSRS9jb25mb3JtYW5jZSIgIiRXSEVSRS9zdHJlc3MiIC10eXBlIGYgLW5h
bWUgJypbMC05YS16XS5jJyAtbyAtbmFtZSAnWzAtOV0qLVswLTldKi5zaCcgfCBncmVwIC12IGJ1
aWxkb25seSB8IGdyZXAgLXYgJ14uL3Rvb2xzJyB8IGdyZXAgLXYgJ3Rlc3Rmcm13LmMkJwo+ICAg
CWZpbmQgIiRXSEVSRS9mdW5jdGlvbmFsIiAtdHlwZSBmIC1uYW1lICcqLmMnCj4gICAJOzsKPiAg
IHRlc3QtdG9vbHMpCj4KPiBsdHAvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3N0cmVz
cy9NYWtlZmlsZQo+IEBAIC01LDcgKzUsNyBAQAo+ICAgIwo+Cj4gICBhbGwgY2xlYW4gaW5zdGFs
bCB0ZXN0Ogo+IC0JQGZvciBkaXIgaW4gYGxzIC1kICovTWFrZWZpbGUgMj4vZGV2L251bGwgfCBz
ZWQgLWUgJ3MsL01ha2VmaWxlJCQsLGcnYDsgZG8gXAo+ICsJQGZvciBkaXIgaW4gYGZpbmQgLiAt
bmFtZSAqTWFrZWZpbGUgfCBlZ3JlcCAtdiAnXi4vTWFrZWZpbGUnIHwgc2VkIC1lICdzLC9NYWtl
ZmlsZSQkLCxnJ2A7IGRvIFwKPiAgIAkJJChNQUtFKSAtQyAkJGRpciAkQDsJCQkJCQkgIFwKPiAg
IAlkb25lCj4KPiBCZXN0IFJlZ2FyZHMKPiBab3UgV2VpCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0t
LQo+IOWPkeS7tuS6ujogWWFuZyBYdSBbbWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5j
b21dCj4g5Y+R6YCB5pe26Ze0OiAyMDIw5bm0M+aciDE35pelIDEwOjA4Cj4g5pS25Lu25Lq6OiBa
b3V3ZWkgKFNhbXVlbCk8em91X3dlaUBodWF3ZWkuY29tPgo+IOaKhOmAgTogbHRwQGxpc3RzLmxp
bnV4Lml0Cj4g5Li76aKYOiBSZTogW0xUUF0gW1BBVENIXSBwdGhyZWFkX2NvbmRfaW5pdC9zLWMu
YzogQWRkIHRoZSBsb3NlIGlmbmRlZiBsaW5lCj4KPiBIaSBab3UKPgo+IEV2ZW4gdGhpcyBjYXNl
IGRvZXMndCBjb21waWxlIG9yIHJ1biBvbiBsdHAgZGVmYXVsdCBlbnZyaW9ubWVudCwgSSB0aGlu
ayBpdCBpcyBhIGZyYW1ld29yayBwcm9ibGVtIGFib3V0IGx0cCBvcGVucG9zaXguIFRoaXMgZml4
IGlzIG9idmlvdXNseSBjb3JyZWN0IGFuZCBzaW1wbGUuCj4KPiBSZXZpZXdlZC1ieTogWWFuZyBY
dTx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+Cj4gU29tZW9uZSB3aG8gbWVyZ2luZyB0
aGlzIHBhdGNoIGNhbiBhZGQgZml4ZXMgdGFnLgo+Cj4gICAgRml4ZXM6IDMxMGM5ZWI2ZSAoIlJl
bW92ZSBleHBsaWNpdCAjZGVmaW5lJ3MgZm9yIGBfUE9TSVhfQ19TT1VSQ0VgIGFuZAo+IGBfWE9Q
RU5fU09VUkNFYCIpCj4KPiBCZXN0IFJlZ2FyZHMKPiBZYW5nIFh1Cj4KPj4gSGkgWm91Cj4+Cj4+
IEl0IHdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCAzMTBjOWViNmU2KCJSZW1vdmUgZXhwbGljaXQg
I2RlZmluZSdzIGZvcgo+PiBgX1BPU0lYX0NfU09VUkNFYCBhbmQgYF9YT1BFTl9TT1VSQ0VgIiku
Cj4+Cj4+IElNTywgd2UgY2FuIHJlbW92ZSB0aGlzIFdJVEhPVVRfWE9QRU4gbWFjcm8gZGlyZWN0
bHkgYmVjYXVzZSB3ZSBoYXZlCj4+IHNldHRlZCAtRF9QT1NJWF9DX1NPVVJDRT0yMDA4MDlMIC1E
X1hPUEVOX1NPVVJDRT03MDAgaW4KPj4gbHRwL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0
ZS9DRkxBR1MuCj4+Cj4+IEJlc3QgUmVnYXJkcwo+PiBZYW5nIFh1Cj4+PiBwdGhyZWFkX2NvbmRf
aW5pdC9zLWMuYyB0ZXN0Y2FzZSBsb3NlIGEgI2lmbmRlZiBsaW5lLCBmaXggaXQKPj4+Cj4+PiBS
ZXBvcnRlZC1ieTogWm91IFdlaTx6b3Vfd2VpQGh1YXdlaS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBab3UgV2VpPHpvdV93ZWlAaHVhd2VpLmNvbT4KPj4+IC0tLQo+Pj4KPj4+IHRlc3RjYXNlcy9v
cGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRfaW5pdC9zLWMu
Ywo+Pj4gfCAxICsKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4KPj4+
IGRpZmYgLS1naXQKPj4+IGEvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL3N0cmVzcy90
aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0L3MtYwo+Pj4gLmMKPj4+IGIvdGVzdGNhc2VzL29wZW5f
cG9zaXhfdGVzdHN1aXRlL3N0cmVzcy90aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0L3MtYwo+Pj4g
LmMKPj4+Cj4+PiBpbmRleCA2YTVjNzBhLi44ZDE4NDg0IDEwMDY0NAo+Pj4gLS0tCj4+PiBhL3Rl
c3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9zdHJlc3MvdGhyZWFkcy9wdGhyZWFkX2NvbmRf
aW5pdC9zLWMKPj4+IC5jCj4+PiArKysKPj4+IGIvdGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1
aXRlL3N0cmVzcy90aHJlYWRzL3B0aHJlYWRfY29uZF9pbml0L3MtYwo+Pj4gLmMKPj4+IEBAIC04
MCw2ICs4MCw3IEBACj4+PiAgICAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiog
ICAgVGVzdCBjYXNlCj4+PiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Ki8KPj4+Cj4+PiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioKPj4+ICoqKioqKioqKioqKioqKioqKioqKioqKi8KPj4+
Cj4+PiArI2lmbmRlZiBXSVRIT1VUX1hPUEVOCj4+PiAgICB0eXBlZGVmIHN0cnVjdCBfdGVzdHN0
cnVjdCB7Cj4+PiAgICAgICAgcHRocmVhZF9jb25kX3QgY25kWzEwICogU0NBTEFCSUxJVFlfRkFD
VE9SXTsKPj4+ICAgICAgICBwdGhyZWFkX2NvbmRhdHRyX3QgY2FbNF07Cj4+PiAtLQo+Pj4gMi42
LjIKPj4+Cj4+Pgo+Pgo+Pgo+Pgo+Cj4KPgoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
