Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89912F683
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 11:03:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4780F3C24E0
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jan 2020 11:03:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 574403C242A
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 11:03:36 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 88A91600857
 for <ltp@lists.linux.it>; Fri,  3 Jan 2020 11:03:34 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,390,1571673600"; d="scan'208";a="81268792"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 18:03:31 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A956F406AB15;
 Fri,  3 Jan 2020 17:54:33 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 18:03:29 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Li Wang <liwang@redhat.com>
References: <20200102015236.7400-1-liwang@redhat.com>
 <b2b1b91e-4813-a281-6f56-0924d21bb103@cn.fujitsu.com>
 <CAEemH2cPJnbNeLRNmHPoGDjh5y_i6YicYPOyM7Vu+AM9t09Kyg@mail.gmail.com>
 <94af8423-337a-8e96-8ab2-b818afb43a76@cn.fujitsu.com>
 <CAEemH2cCN7LwBEiitzU+=B=8YwR4pUX9Hg1rm-t7Ygc_HvSbHQ@mail.gmail.com>
 <90c16f7d-0850-3011-947a-eb42229d7169@cn.fujitsu.com>
Message-ID: <ee66d24f-f00c-e456-dde0-ad98de68ce4f@cn.fujitsu.com>
Date: Fri, 3 Jan 2020 18:03:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <90c16f7d-0850-3011-947a-eb42229d7169@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A956F406AB15.AC9E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading
 test block device stat file
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

CgpIaSBMaQo+IAo+IAo+IG9uIDIwMjAvMDEvMDMgMTU6MjUsIExpIFdhbmcgd3JvdGU6Cj4+Cj4+
Cj4+IE9uIFRodSwgSmFuIDIsIDIwMjAgYXQgMjo0NiBQTSBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5
QGNuLmZ1aml0c3UuY29tIAo+PiA8bWFpbHRvOnh1eWFuZzIwMTguanlAY24uZnVqaXRzdS5jb20+
PiB3cm90ZToKPj4KPj4KPj4KPj4gwqDCoMKgIG9uIDIwMjAvMDEvMDIgMTQ6MzEsIExpIFdhbmcg
d3JvdGU6Cj4+IMKgwqDCoMKgID4KPj4gwqDCoMKgwqAgPgo+PiDCoMKgwqDCoCA+IE9uIFRodSwg
SmFuIDIsIDIwMjAgYXQgMTA6MTAgQU0gWWFuZyBYdQo+PiDCoMKgwqAgPHh1eWFuZzIwMTguanlA
Y24uZnVqaXRzdS5jb20gPG1haWx0bzp4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPgo+PiDC
oMKgwqDCoCA+IDxtYWlsdG86eHV5YW5nMjAxOC5qeUBjbi5mdWppdHN1LmNvbQo+PiDCoMKgwqAg
PG1haWx0bzp4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29tPj4+IHdyb3RlOgo+PiDCoMKgwqDC
oCA+Cj4+IMKgwqDCoMKgID4KPj4gwqDCoMKgwqAgPgo+PiDCoMKgwqDCoCA+wqAgwqAgwqBIaSBM
aQo+PiDCoMKgwqDCoCA+wqAgwqAgwqAgPiBUbyBhdm9pZCBGUyBkZWZlcnJlZCBJTyBtZXRhZGF0
YS9jYWNoZSBpbnRlcmZlcmVzIHRlc3QKPj4gwqDCoMKgIHJlc3VsdCwgc28gd2UKPj4gwqDCoMKg
wqAgPsKgIMKgIMKgID4gZG8gc3luYyBzaW1wbHkgYmVmb3JlIHRoZSB0c3RfZGV2X2J5dGVzX3dy
aXR0ZW4gaW52b2NhdGlvbi4KPj4gwqDCoMKgwqAgPsKgIMKgIMKgID4KPj4gwqDCoMKgwqAgPsKg
IMKgIMKgTG9va3MgZ29vZCwgYWNrZWQuIEFsc28sIEkgdGhpbmsgd2UgY2FuIG1lbnRpb24gaXQg
aW4KPj4gwqDCoMKgwqAgPsKgIMKgIMKgZG9jL3Rlc3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dCB3
aGVuIHVzaW5nIHRoaXMgYXBpLgo+PiDCoMKgwqDCoCA+Cj4+IMKgwqDCoMKgID4KPj4gwqDCoMKg
wqAgPiBPaywgSSB3aWxsIGFwcGVuZCBvbmUgbGluZSBhczoKPj4gwqDCoMKgwqAgPiAtLS0gYS9k
b2MvdGVzdC13cml0aW5nLWd1aWRlbGluZXMudHh0Cj4+IMKgwqDCoMKgID4gKysrIGIvZG9jL3Rl
c3Qtd3JpdGluZy1ndWlkZWxpbmVzLnR4dAo+PiDCoMKgwqDCoCA+IEBAIC0xMDcyLDcgKzEwNzIs
OSBAQCB1bnNpZ25lZCBsb25nIHRzdF9kZXZfYnl0ZXNfd3JpdHRlbihjb25zdAo+PiDCoMKgwqAg
Y2hhciAqZGV2KTsKPj4gwqDCoMKgwqAgPiAgICAgIAo+PiDCoC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0gCj4+Cj4+IMKgwqDCoMKgID4KPj4gwqDCoMKgwqAgPsKgIMKgVGhpcyBmdW5jdGlvbiByZWFk
cyB0ZXN0IGJsb2NrIGRldmljZSBzdGF0IGZpbGUKPj4gwqDCoMKgwqAgPiAoL3N5cy9ibG9jay88
ZGV2aWNlPi9zdGF0KSBhbmQKPj4gwqDCoMKgwqAgPiAtcmV0dXJucyB0aGUgYnl0ZXMgd3JpdHRl
biBzaW5jZSB0aGUgbGFzdCBpbnZvY2F0aW9uIG9mIHRoaXMKPj4gwqDCoMKgIGZ1bmN0aW9uLgo+
PiDCoMKgwqDCoCA+ICtyZXR1cm5zIHRoZSBieXRlcyB3cml0dGVuIHNpbmNlIHRoZSBsYXN0IGlu
dm9jYXRpb24gb2YgdGhpcwo+PiDCoMKgwqAgZnVuY3Rpb24uCj4+IMKgwqDCoMKgID4gVG8gYXZv
aWQKPj4gwqDCoMKgwqAgPiArRlMgZGVmZXJyZWQgSU8gbWV0YWRhdGEvY2FjaGUgaW50ZXJmZXJl
cyB0aGUgdGVzdCByZXN1bHQsIHdlCj4+IMKgwqDCoCBzdWdnZXN0Cj4+IMKgwqDCoMKgID4gZG9p
bmcgc3luYygpCj4+IMKgwqDCoMKgID4gK2JlZm9yZSB0aGUgdHN0X2Rldl9ieXRlc193cml0dGVu
IGZpcnN0IGludm9jYXRpb24uCj4+IMKgwqDCoCBPSy4KPj4KPj4gwqDCoMKgIEkgYWxzbyBtZWV0
IGFub3RoZXIgcHJvYmxlbSB3aGVuIHVzaW5nIHRoaXMgYXBpIG9uIG9sZCBrZXJuZWwuCj4+Cj4+
IMKgwqDCoCB0c3RfZGV2aWNlLmM6Mzk1OiBDT05GOiBUZXN0IGRldmljZSBzdGF0IGZpbGU6IC9z
eXMvYmxvY2svbG9vcDAvc3RhdAo+PiDCoMKgwqAgYnJva2VuCj4+Cj4+IMKgwqDCoCAvc3lzL2Js
b2NrL2xvb3AwL3N0YXQgaXMgYWxsIDAgYW5kIGNhc2UgcmVwb3J0cyBUQ09ORi4gb24gbmV3IGtl
cm5lbCwKPj4gwqDCoMKgIHRoaXMgdmFsdWUgaXMgbm9ybWFsLiBUaGlzIGlzIGEgYmxvY2sgbGF5
ZXIgb3IgbG9vcCBkZXZpY2UgZHJpdmVyCj4+IMKgwqDCoCBtb2RpZml0aW9uIHNldmVyYWwgeWVh
cyBhZ28/Cj4+Cj4+Cj4+IEl0IHNvdW5kcyBsaWtlIGEga2VybmVsIGlzc3VlLCBjYW4geW91IHRl
bGwgd2hpY2gga2VybmVsIHZlcnNpb24geW91IAo+PiBkaWQgdGVzdD8KPj4KPiBJIHRlc3QgdGhp
cyBvbiAzLjEwLjAtMTEwMS5lbDcueDg2XzY0LiBJdCBhbHNvIHJlcG9ydHMgVENPTkYgb24gb2xk
IAo+IGZlZG9yYSBzdWNoIGFzIGZlZG9yYSAyMCwyMS4gSSBndWVzcyBsb29wIGRyaXZlciBtb2Rp
ZmljYXRpb24oSSBhbSAKPiB2ZXJpZnlpbmcgLi4uKSBjYXVzZXMgaXQuCkJlZm9yZSBrZXJuZWwg
Y29tbWl0IGI1ZGQyZjYwNDdjYVsxXSAoYmxvY2s6IGxvb3A6IGltcHJvdmUgcGVyZm9ybWFuY2Ug
CnZpYSBibGstbXEpLCB0aGlzIC9zeXMvYmxvY2svbG9vcDAvc3RhdCB2YWx1ZSBpcyBhbGwgMCBm
b3IgbG9vcCBkZXZpY2UgCmJlY2F1c2UgbG9vcCBkZXZpY2UgdXNlcyBpdHMgb3duIG1ha2UgcmVx
dWVzdGlvbiBmdW5jdGlvbiBidXQgbm90IGJsayAKZW5kIHJlcXVlc3QgKHNvIHRoZXNlIHZhbHVl
IGNhbiBub3QgYmUgY291bnRlZCkuIEFmdGVyIG9udmVyc2lvbiBvZiBsb29wIAp0byBibGstbXEs
IHRoaXMgdmFsdWUgaXMgbm9ybWFsLiBUaGlzIHBhdGNoIHdhcyBtZXJnZWQgaW50byB1cHN0cmVh
bSAKa2VybmVsIHNpbmNlIHY0LjAuICBXaGVuIHVzaW5nIHRzdF9kZXZfYnl0ZXNfd3JpdHRlbiBh
cGkodXNpbmcgbG9vcCAKZGV2aWNlIGFzIGJsb2NrIGRldmljZSkgb24gb2xkZXIga2VybmVsLCB0
aGlzIC9zeXMvYmxvY2svbG9vcDAvc3RhdCAKdmFsdWUgaXMgYWxsIDAgYW5kIHdlIHNob3VsZCBt
ZW50aW9uIHVzZXIgdG8gZXhwb3J0ICRMVFBfREVWIHRvIHRlc3QuIApBbHNvLCB3ZSBjYW4gZG8g
aXQgaW4gb3RoZXIgcGF0Y2guCgpbMV1odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZlcnMvYmxvY2svbG9v
cC5jP2lkPWI1ZGQyZjYwNDdjYTEwODAwMTMyOGFhYzBlODU4OGVkZDE1ZjE3NzgKCnBzOkkgZG9u
J3Qga25vdyBibG9jayBkZXZpY2UoYmlvLHJlcXVlc3QpIG9yIGxvb3AgZHJpdmVyIHZlcnkgbXVj
aC4gSWYgSSAKd2FzIHdyb25nLCBwbGVhc2UgZmVlbCBmcmVlIHRvIGNvcnJlY3QgbWUuCgpCZXN0
IFJlZ2FyZHMKWWFuZyBYdQo+Pgo+PiDCoMKgwqAgcHM6SSBrbm93IGx0cCB1c2VkIExPT1BfU0VU
X0ZEIHRvIG1ha2UgbG9vcCBkZXZpY2Ugc2ltdWxhdGUgb3RoZXIKPj4gwqDCoMKgIGZpbGVzeXN0
ZW1zLiBJIGFtIHRyeWluZyB0byBmaW5kIGEgZ2VuZXJpYyB3YXkgYWJvdXQgdGhpcyBhcGkuCj4+
Cj4+IMKgwqDCoCBCZXN0IFJlZ2FyZHMKPj4gwqDCoMKgIFlhbmcgWHUKPj4gwqDCoMKgwqAgPgo+
PiDCoMKgwqDCoCA+IC0tCj4+IMKgwqDCoMKgID4gUmVnYXJkcywKPj4gwqDCoMKgwqAgPiBMaSBX
YW5nCj4+Cj4+Cj4+Cj4+Cj4+IC0tIAo+PiBSZWdhcmRzLAo+PiBMaSBXYW5nCj4gCj4gCj4gCgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
